/**************************************************************************************************
**Procedure Name:
**      [report].[Oct1FedSPED_GetReportOCT1FedSPED]
**
**Author:
**		Amit Verma
**
**Description:  
**	Get OCT1 FED SPED Data
**            
**Input:
**	@LocalEducationAgency - District the report is executed for
**	@SchoolsList          - List of Schools 
**	@FiscalYear	          - FiscalYear to filter upon
**  @DistrictOf           - Attendance OR Residence
**
**Returns:
**
**Implementation:
** 
**Revision History:
**	Who			When		What
**	Amit Verma	11/29/2016	Initial Creation 
**  Amit Verma  12/07/2016  Added the logic to check for DOR from 
**							oct1.StudentEnrollmentProgramAssociation Table
**  Amit Verma  12/15/2016  Added new table Oct1SpedReason
**  Amit Verma  12/19/2016  Added the AlternateEducationOrganizationRelationship 
**							table to check for JTED 
**  Amit Verma  12/19/2016  172176-BUG:  OCT1 FED SPED - Reports  - Age October 1 
**							calculations are incorrect
**	Amit Verma  01/12/2017  172176-BUG Re-open: Age October 1 calculations are incorrect
**  Amit Verma	02/03/2017	Task - 174762 - Oct 1 Fed Sped has kids out of age range 
**  P Kanyar	08/15/2017	Task-179017 - Enhancement to not show students that have no program on OCT1
**  P Kanyar	11/08/2017	Fixed the logic to show, when student has one program up to Last_InstructionalDate_beforeOct1 
**							& another from First_InstructionalDate_afterOct1 when Oct 1 is non instructional (bug:200528)
**  Harsha K    12/12/2018  Changed the code to create Additional Temp tables and Indexes. Removed un necessary joins to eliminate the report timing out issue
**  Sucharita   02/19/2019  Fix(Commented the logic) for students not getting pulled for DOR when there is no sped program participation in the DOR
**  P Kanyar	05/06/2019	Re-written the logic as per the new reuirements, removed some unnecessary joins, logics that refer to the leadata schema tables 
**							,since they can change where as oct1 schema tables are static after oct1 extract end date 
**
*******************************************************************************************************************************************************/
CREATE PROCEDURE [report].[Oct1FedSPED_GetReportOCT1FedSPED]  
	@LocalEducationAgencyId INT,
	@SchoolsList AS NVARCHAR(MAX),
	@FiscalYear INT,
	@DistrictOf NVARCHAR(10) 
AS 
BEGIN 

-- test data
--declare @LocalEducationAgencyId INT = 4243 , -- 4153
--@SchoolsList AS NVARCHAR(MAX) = '5128,5129,5130,5131,5132,5133,7335,7356,7364,7373,7408,79632,80052,81111,81112,81113,84683,84684,87620,87621,88414,88415,88416,88417,89600,89604,89821,90053,90134,90400,91214,91260,91270,92190,92254,92298,92679,1000099', --4517,89607,4711,4710
--@FiscalYear INT = 2019, --2018
--@DistrictOf NVARCHAR(10) ='residence' --Attendance  
--5792,5793,5794,5795,5796,5797,5798,5799,5800,5801,5802,5803,5804,5805,5806,5807,5808,6055,12976,79282,79378,91755,91756
--5128,5129,5130,5131,5132,5133,79632,80052,81111,81112,81113,84683,84684,87620,87621,88414,88415,88416,88417,89600,89604,89821,90134

    SET NOCOUNT ON;

	/*
		The new requirement is as follows - 05/06/2019
		If for a student,
		1.DOA = DOR = Scottsdale , then he should show up on Scottsdale DOR report.
		2.DOA = Scottsdale , DOR = Phoenix, then he should show up on Scottsdale DOA report with Phoenix as DOR
		3.DOA = Ace pvt, DOR = Scottsdale, then he should show up on Scottsdale DOR report 

		ie., DOA report should have
		DOA = @LocalEducationAgencyId and DOR = Any district OUTSIDE @LocalEducationAgencyId

		DOR report should have
		DOR = @LocalEducationAgencyId and DOA = Any district INCLUDING @LocalEducationAgencyId

	*/

    CREATE TABLE #oct1StudentEnrollmentProgramAssociation
		(
			FiscalYear INT, 
			StudentUSI INT,
			ProgramTypeId INT, 
			ProgramName NVARCHAR(60), 
			ProgramEducationOrganizationId INT, 
			ProgramBeginDate DATE, 
			SchoolId INT,
			DOR INT,
			[MainSPEDSchool] BIT,
			[EntryGradeLevelDescriptorId] INT
		);
	 IF @DistrictOf = 'Attendance'
        BEGIN 
			INSERT INTO #oct1StudentEnrollmentProgramAssociation
				SELECT 
					SEPA.FiscalYear, 
					StudentUSI,
					ProgramTypeId, 
					ProgramName, 
					ProgramEducationOrganizationId, 
					ProgramBeginDate, 
					SEPA.SchoolId,
					DOR,
					[MainSPEDSchool],
					[EntryGradeLevelDescriptorId]
				FROM [oct1].[StudentEnrollmentProgramAssociation] SEPA WITH (NOLOCK)
				JOIN [util].[Split](@SchoolsList, ',' ) US ON SEPA.SchoolId = US.TOKEN
				JOIN entity.vw_School SC WITH (NOLOCK) ON SC.FiscalYear = SEPA.FiscalYear AND SC.SchoolId = SEPA.SchoolId
				WHERE SEPA.FiscalYear = @FiscalYear 	
					AND SEPA.DOR <> @LocalEducationAgencyId						-- DOR can be any district except DOA
					AND SC.LocalEducationAgencyId = @LocalEducationAgencyId		-- DOA has to be the district that is running the report
		END
	  ELSE 
        BEGIN 
			INSERT INTO #oct1StudentEnrollmentProgramAssociation
				SELECT 
					FiscalYear, 
					StudentUSI,
					ProgramTypeId, 
					ProgramName, 
					ProgramEducationOrganizationId, 
					ProgramBeginDate, 
					SchoolId,
					DOR,
					[MainSPEDSchool],
					[EntryGradeLevelDescriptorId]
				FROM [oct1].[StudentEnrollmentProgramAssociation] SEPA WITH (NOLOCK)
				JOIN  [util].[Split](@SchoolsList, ',' ) US ON SEPA.SchoolId = US.TOKEN
				WHERE SEPA.FiscalYear = @FiscalYear 	
					AND SEPA.DOR = @LocalEducationAgencyId			-- DOR has to be the district that is running the report & DOA can be any district
		END

CREATE NONCLUSTERED INDEX oct1StudentEnrollmentProgram  --Added Index on Student #oct1StudentEnrollmentProgramAssociation 
ON #oct1StudentEnrollmentProgramAssociation (FiscalYear) INCLUDE
(StudentUSI,ProgramTypeId,ProgramName,ProgramEducationOrganizationId,ProgramBeginDate,SchoolId,DOR,[MainSPEDSchool],[EntryGradeLevelDescriptorId] )


	CREATE TABLE #oct1StudentProgramNeedAssociation
		(
            FiscalYear INT,
			StudentUSI INT, 
			SchoolId INT, 
			ProgramEducationOrganizationId INT, 
			ProgramTypeId INT, 
			ProgramName NVARCHAR(60) , 
			ProgramBeginDate DATE, 
			ProgramEndDate DATE, 
			ExitCode NVARCHAR(50), 
			ProgramCode NVARCHAR(50), 
			NeedDescriptorId INT, 
			NeedCode NVARCHAR(50), 
			NeedStartDate DATE, 
			NeedEndDate DATE, 
			PrimaryStudentNeedIndicator BIT, 
			SPASourceId NVARCHAR(50), 
			SNSourceId NVARCHAR(50)
		)
		INSERT INTO #oct1StudentProgramNeedAssociation
		SELECT  FiscalYear,
				StudentUSI, 
				SchoolId, 
				ProgramEducationOrganizationId, 
				ProgramTypeId, 
				ProgramName, 
				ProgramBeginDate, 
				ProgramEndDate, 
				ExitCode, 
				ProgramCode, 
				NeedDescriptorId, 
				NeedCode, 
				NeedStartDate, 
				NeedEndDate, 
				PrimaryStudentNeedIndicator, 
				SPASourceId, 
				SNSourceId
		FROM [oct1].[StudentProgramNeedAssociation] SPNA
			JOIN  [util].[Split](@SchoolsList, ',' ) US ON SPNA.SchoolId = US.TOKEN

 			LEFT JOIN leadata.StudentNeedDescriptor SND WITH(NOLOCK)
			   ON SPNA.NeedDescriptorId = SND.StudentNeedDescriptorId

		WHERE SPNA.FiscalYear = @FiscalYear 
			AND (SPNA.ProgramTypeId = 6 OR SPNA.ProgramTypeId IS NULL)
			AND (SND.StudentNeedCategoryTypeId = 1 OR SND.StudentNeedCategoryTypeId IS NULL)     


	CREATE NONCLUSTERED INDEX Oct1ststudentprogramneed  --Added Index on #oct1StudentProgramNeedAssociation
	ON  #oct1StudentProgramNeedAssociation (FiscalYear) INCLUDE
	(StudentUSI,SchoolId,ProgramTypeId,ProgramName,ProgramEducationOrganizationId,ProgramBeginDate,ExitCode,ProgramCode,NeedDescriptorId,NeedStartDate,NeedEndDate,PrimaryStudentNeedIndicator,SPASourceId,SNSourceId)

		
	SELECT DISTINCT 
		   OCT.SchoolName
	      ,OCT.SchoolCTDS
		  ,OCT.DistrictStudentID
		  ,OCT.StudentUSI
		  ,OCT.StateStudentID
		  ,OCT.LastName
		  ,OCT.FirstName
		  ,OCT.MiddleInitial
		  ,OCT.DOB
		  ,OCT.[AGE October1]
		  ,OCT.Gender
		  ,OCT.Ethnicity
		  ,OCT.Race
		  ,OCT.Grade
		  ,OCT.DORCTDS
		  ,OCT.DOR -- ADDED FOR TESTING
		  ,OCT.NeedDescriptorId
		  ,OCT.Need
		  ,OCT.NeedStartDate
		  ,OCT.NeedEndDate
		  ,OCT.[FED Primary Need]
		  ,OCT.[SVC Code]
		  ,OCT.ProgramBeginDate
		  ,OCT.ProgramEndDate
		  ,OCT.[Primary/Secondary School]
		  ,OCT.[Exit Code]
		  ,OCT.ELL
		  ,OCT.Oct1SpedReasonId
		  ,OCT.ReasonDescription
		  ,OCT.StudentNeedResourceID
		  ,OCT.StudentProgramResourceID
	FROM 
	  (
		SELECT DISTINCT 
			 EOCTDS.NameOfInstitution							AS 'SchoolName'
			,EOCTDS.FormattedCTDS								AS 'SchoolCTDS'
			,SIC.IdentificationCode								AS 'DistrictStudentID'
			,S.StudentUSI
			,S.StudentUniqueId									AS 'StateStudentID'
			,S.LastSurname										AS 'LastName'
			,S.FirstName
			,SUBSTRING(S.MiddleName,1,1)						AS 'MiddleInitial'
			,CONVERT(NVARCHAR(10),S.BirthDate,1)				AS 'DOB'
			,[report].[AgeOctober1] (@FiscalYear,  S.BirthDate)	AS 'AGE October1' -- there is no much perfomance gain with Age function and the below logic
			/*--,DATEDIFF(yy, S.BirthDate, CONVERT(DATE, 
			--	(CONVERT(VARCHAR(4),@FiscalYear-1) + '-10-01'))) - 
			--	CASE 
			--	WHEN ( 
			--		MONTH(S.BirthDate) > MONTH(CONVERT(DATE, 
			--			(CONVERT(VARCHAR(4),@FiscalYear-1) + '-10-01'))) 
			--		) 
			--		OR 
			--		( 
			--		MONTH(S.BirthDate) = MONTH(CONVERT(DATE, 
			--			(CONVERT(VARCHAR(4),@FiscalYear-1) + '-10-01'))) 
			--		AND 
			--		DAY(S.BirthDate) > DAY(CONVERT(DATE,
			--			(CONVERT(VARCHAR(4),@FiscalYear-1) + '-10-01'))) 
			--		) 
			--		THEN 1 ELSE 0 END							AS 'AGE October1'	 */
			,CASE ST.CodeValue
				WHEN 'Female' THEN 'F'
				WHEN 'Male'   THEN 'M'
				ELSE 'NP' END									AS 'Gender'
			,CASE WHEN S.HispanicLatinoEthnicity = 1 THEN 'H'
					ELSE 'Non-H'
				END												AS 'Ethnicity'
			,SR.CodeValue										AS 'Race'
			,GRD.CodeValue										AS 'Grade'
			,EDORGCTDS.FormattedCTDS 							AS 'DORCTDS'
			,EDORGCTDS.EducationOrganizationId					AS 'DOR'		--ADDED FOR TESTING
			,SPNA.NeedDescriptorId
			,SPNA.NeedCode 										AS 'Need'
			,CONVERT(NVARCHAR(10),SPNA.NeedStartDate,1)			AS 'NeedStartDate'
			,CONVERT(NVARCHAR(10),SPNA.NeedEndDate,1)			AS 'NeedEndDate'
			,CASE WHEN CONVERT(NVARCHAR(10),
						SPNA.PrimaryStudentNeedIndicator) = '1' 
						AND SPNA.NeedCode IS NOT NULL THEN 'Y'	
					WHEN CONVERT(NVARCHAR(10),
						SPNA.PrimaryStudentNeedIndicator) = '0' 
						AND SPNA.NeedCode IS NOT NULL THEN 'N'	
					WHEN SPNA.NeedCode IS NULL
						THEN '**'  
			END													AS 'FED Primary Need'
			,SPNA.ProgramCode									AS 'SVC Code'
			,CONVERT(NVARCHAR(10),SPNA.ProgramBeginDate,1)		AS 'ProgramBeginDate'
			,CONVERT(NVARCHAR(10),SPNA.ProgramEndDate,1)		AS 'ProgramEndDate'
			,SPNA.ExitCode										AS 'Exit Code'
			
			,CASE WHEN CONVERT(NVARCHAR(10),SEPA.MainSPEDSchool) = 1 
					AND SPNA.ProgramCode IS NOT NULL
					THEN 'P'	
				  WHEN CONVERT(NVARCHAR(10),SEPA.MainSPEDSchool) = 0 
					AND SPNA.ProgramCode IS NOT NULL
					THEN 'S'	END								AS 'Primary/Secondary School'

			,CASE WHEN ISNULL((SELECT CASE WHEN COUNT(*)>=1 
										THEN 1 ELSE 0 END
								FROM [oct1].[StudentProgramNeedAssociation] SPAELL  --[leadata].[StudentProgramAssociation]  
								WHERE SPAELL.FiscalYear = SPNA.FiscalYear
									AND SPAELL.StudentUSI = SPNA.StudentUSI
									AND SPAELL.SchoolId = SPNA.SchoolId
									AND SPAELL.ProgramEducationOrganizationId = SPNA.ProgramEducationOrganizationId
									AND SPAELL.ProgramTypeId = 1),0) = 1 
					THEN 'Y'	
			 ELSE 'N' END										AS 'ELL' --New ELL logic
			,OCTR.Oct1SpedReasonId
			,OCTR.ReasonDescription
			,SPNA.SNSourceId									AS 'StudentNeedResourceID'
			,SPNA.SPASourceId									AS 'StudentProgramResourceID'
			,SPOE.IsOCT1Instructional
			,SPOE.First_InstructionalDate_afterOct1
			,SPOE.Last_InstructionalDate_beforeOct1
		FROM #oct1StudentProgramNeedAssociation SPNA WITH(NOLOCK) 
	     
			 JOIN leadata.Student S WITH(NOLOCK) 
			   ON SPNA.StudentUSI = S.StudentUSI
			
			 JOIN oct1.StudentSchoolOct1SpedEligibility OCTFED WITH(NOLOCK)
			   ON SPNA.FiscalYear = OCTFED.FiscalYear
				  AND SPNA.StudentUSI = OCTFED.StudentUSI
				  AND SPNA.SchoolId = OCTFED.SchoolId
		
			 JOIN oct1.Oct1SpedReason OCTR WITH (NOLOCK)
			   ON OCTFED.Oct1SpedReasonId = OCTR.Oct1SpedReasonId
		
			 LEFT JOIN report.vw_FormattedEducationorganizationCTDS EOCTDS WITH(NOLOCK)
			   ON SPNA.SchoolId = EOCTDS.EducationOrganizationId
				  AND SPNA.FiscalYear = EOCTDS.FiscalYear
		
			 LEFT JOIN  #oct1StudentEnrollmentProgramAssociation SEPA WITH(NOLOCK)
			   ON SPNA.StudentUSI = SEPA.StudentUSI
				  AND SPNA.ProgramTypeId = SEPA.ProgramTypeId
				  AND SPNA.ProgramName = SEPA.ProgramName
				  AND SPNA.ProgramEducationOrganizationId = SEPA.ProgramEducationOrganizationId
				  AND SPNA.ProgramBeginDate = SEPA.ProgramBeginDate
				  AND SPNA.SchoolId = SEPA.SchoolId
		
			 LEFT JOIN leadata.Descriptor GRD WITH(NOLOCK)
			   ON SEPA.EntryGradeLevelDescriptorId = GRD.DescriptorId
				  AND SEPA.FiscalYear = GRD.FiscalYear
	 
			 LEFT JOIN leadata.SexType ST WITH(NOLOCK)
			   ON S.SexTypeId = ST.SexTypeId
	
			 LEFT JOIN report.StudentRace SR WITH(NOLOCK)
			   ON S.StudentUSI = SR.StudentUSI
	
			 LEFT JOIN leadata.StudentIdentificationCode SIC WITH(NOLOCK) 
			   ON S.StudentUSI = SIC.StudentUSI
				  AND SIC.StudentIdentificationSystemTypeId = 2		
				  AND CONVERT(VARCHAR(60),SIC.AssigningOrganizationIdentificationCode) = CONVERT(VARCHAR(60),@LocalEducationAgencyId)
	
			 LEFT JOIN report.vw_FormattedEducationorganizationCTDS EDORGCTDS WITH(NOLOCK)
			   ON SEPA.DOR = EDORGCTDS.EducationOrganizationId
				  AND SEPA.FiscalYear = EDORGCTDS.FiscalYear

			 LEFT JOIN [oct1].[StudentProgramOct1SpedEligibility] SPOE WITH(NOLOCK)		
				ON SPOE.FiscalYear = OCTFED.FiscalYear
					AND SPOE.StudentUSI = OCTFED.StudentUSI
					AND SPOE.SchoolId = OCTFED.SchoolId
	
		WHERE -- added to not show students that do not have SPED program on OCT 1st when it is instructional or during OCT 1st when it is non-instructional
			  OCTR.Oct1SpedReasonId IN (0,1,3)
			  AND ( ( SPOE.IsOCT1Instructional = 0 AND SPNA.ProgramBeginDate <= SPOE.Last_InstructionalDate_beforeOct1				
						AND ( (SPOE.IsOct1SpedEligible = 1 AND SPNA.ProgramEndDate >= SPOE.Last_InstructionalDate_beforeOct1 OR SPNA.ProgramEndDate IS NULL)
								OR
							   (SPOE.IsOct1SpedEligible = 0 AND SPNA.ProgramEndDate  >= SPOE.First_InstructionalDate_afterOct1 OR SPNA.ProgramEndDate IS NULL)	
							)		
					) 
					OR
					 (SPOE.IsOCT1Instructional = 1 AND SPNA.ProgramBeginDate <= CONVERT(DATE,CONVERT(NVARCHAR(4),SPNA.FiscalYear-1 )+'-10-01') 
						AND (SPNA.ProgramEndDate >= CONVERT(DATE,CONVERT(NVARCHAR(4),SPNA.FiscalYear-1 )+'-10-01') OR SPNA.ProgramEndDate IS NULL)
					 ) 
				  )      
    ) OCT
 
    WHERE 
		   OCT.[AGE October1] BETWEEN 3 AND 21  -- Oct 1 Fed Sped has kids out of age range(3 AND 21)
		   AND OCT.DOR IS NOT NULL 		
	ORDER BY OCT.Oct1SpedReasonId
			,OCT.LastName
	        ,OCT.FirstName
			,OCT.MiddleInitial
			,OCT.StateStudentID
			,OCT.ProgramBeginDate
			,OCT.[SVC Code]
			,OCT.Need


	DROP TABLE #oct1StudentEnrollmentProgramAssociation
	DROP TABLE #oct1StudentProgramNeedAssociation

END