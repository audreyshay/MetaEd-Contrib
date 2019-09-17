/**********************************************************************************
**Procedure Name:
**      [report].[SPED72_GetReportSPED72]
**
**Author:
**		Amit Verma
**
**Description:  
**	Get SPED72 REPORT Data
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
**	Amit Verma	08/17/2016	Initial Creation 
**  Amit Verma  10/18/2016  Used the View vw_FormattedEducationorganizationCTDS to get
**                          formatted CTDS
**  Amit Verma  11/01/2016  Fixed the Bug for SPED 72 reports (FERPA Security)
**  Amit Verma  11/02/2016  Added the filter on DOR
**  Amit Verma  12/19/2016  Added the AlternateEducationOrganizationRelationship 
**							table to check for JTED 
**  Amit Verma  04/19/2017  Added the logic to check StudentProgramNeedAssociation once only
**  Vinoth	    03/30/2018  Fix for BUG 205810 -Student are not get pulled for DOR and Related schools.
**	Pratibha K	05/30/2019	Modified to implement new requirements, added logic with new view StudentEnrollmentNeedAssociationwithDOR 
**							to bring Grade & DOR for students who have only Need and removed unnecessary joins 
**
****************************************************************************************************************************************/
CREATE PROCEDURE [report].[SPED72_GetReportSPED72]  
	@LocalEducationAgencyId INT,
	@SchoolsList AS NVARCHAR(MAX),  
	@FiscalYear INT,
	@DistrictOf NVARCHAR(10)
AS 
BEGIN 

/* test data
--fy 2018 -- lea=4260, school=5267,5268,5269,5270,5271,5272,5273,5274,5275, RESIDENCE
-- 4987,5190,7408,81113,89748,90875,91264,91270,1000059 --RESIDENCE --4252
-- fy2018--5190,7302,7318,7333,7356,7364,7408,79303,89748 --4252--Attendance */

/* NEW REQUIREMENTS :
  DOA report should have
  DOA = @LocalEducationAgencyId and DOR = Any district OUTSIDE @LocalEducationAgencyId 

  DOR report should have
  DOR = @LocalEducationAgencyId and DOA = Any district INCLUDING @LocalEducationAgencyId  */
  

    SET NOCOUNT ON;

    --storing list of Schools in table variable
    DECLARE @Schools TABLE ([SchoolId] INT)
    INSERT INTO @Schools SELECT DISTINCT [Token] FROM [util].[Split](@SchoolsList, ',' ) 


	CREATE TABLE #TempIntegrity
		(
			 IntegrityHistoryId BIGINT
			,FiscalYear INT
			,StudentUSI INT
			,SchoolId INT
			,SchoolEntryDate date
			,IntegrityRuleTypeId INT
			,IntegrityResultTypeId INT 
			,IntegrityRunDateTime DATETIME
			,LocalCourseCode VARCHAR(60)
			,TermTypeId INT
			,SchoolYear INT
			,StaffUSI INT
			,SectionBeginDate DATE
		)
	
	-- storing Integrity History & Need data for given Schools and Fiscal Year
	INSERT INTO #TempIntegrity
	SELECT * FROM report.GetLatestIntegrityHistoryIdList_SPED72 (@FiscalYear, @SchoolsList) 
	WHERE IntegrityRuleTypeId IN (6,8)

	SELECT * INTO #TempIntegrityForStateSPED
	FROM #TempIntegrity WHERE IntegrityRuleTypeId = 6   -- For State SPED = 6

	SELECT * INTO #TempIntegrityForFEDSPED
	FROM #TempIntegrity WHERE IntegrityRuleTypeId = 8   -- For FED SPED = 8

--======================================================================================================

	--storing StudentProgramNeedAssociation for a given list of schools & FiscalYear based on DOA or DOR rules 
   CREATE TABLE #StudentProgramNeed
		(
			FiscalYear INT, 
			StudentUSI INT,
			SchoolId INT,
			ProgramEducationOrganizationId INT,
			ProgramTypeId INT, 
			ProgramName NVARCHAR(60), 
			ProgramBeginDate DATE, 
			ProgramEndDate DATE,
			ExitCode NVARCHAR(50),
			ProgramCode NVARCHAR(50),		
			NeedDescriptorId INT, 
			NeedCode NVARCHAR(50),	
			NeedStartDate DATE,	 
			NeedEndDate DATE,	
			PrimaryStudentNeedIndicator BIT,	
			SPASourceId UNIQUEIDENTIFIER,	    
			SNSourceId UNIQUEIDENTIFIER
		)

	 IF @DistrictOf = 'Attendance'
        BEGIN 
			INSERT INTO #StudentProgramNeed
				SELECT SPNA.* 
				FROM leadata.StudentProgramNeedAssociation SPNA WITH(NOLOCK)
					JOIN @Schools VSCH ON SPNA.SchoolId = VSCH.SchoolId
					JOIN entity.School SC WITH(NOLOCK) ON SC.FiscalYear = SPNA.FiscalYear
						AND SC.SchoolId = SPNA.SchoolId
					LEFT JOIN leadata.StudentNeedDescriptor SND WITH(NOLOCK)
					   ON SPNA.NeedDescriptorId = SND.StudentNeedDescriptorId
				WHERE SPNA.FiscalYear = @FiscalYear
					AND (SPNA.ProgramTypeId = 6 OR SPNA.ProgramTypeId IS NULL)
						  AND (SND.StudentNeedCategoryTypeId = 1 OR SND.StudentNeedCategoryTypeId IS NULL)
					AND SC.LocalEducationAgencyId = @LocalEducationAgencyId
		END
	 ELSE 
		BEGIN
				INSERT INTO #StudentProgramNeed
				SELECT SPNA.* 
				FROM leadata.StudentProgramNeedAssociation SPNA WITH(NOLOCK)
					JOIN @Schools VSCH ON SPNA.SchoolId = VSCH.SchoolId
					LEFT JOIN leadata.StudentNeedDescriptor SND WITH(NOLOCK)
					   ON SPNA.NeedDescriptorId = SND.StudentNeedDescriptorId
				WHERE SPNA.FiscalYear = @FiscalYear
					AND (SPNA.ProgramTypeId = 6 OR SPNA.ProgramTypeId IS NULL)
						  AND (SND.StudentNeedCategoryTypeId = 1 OR SND.StudentNeedCategoryTypeId IS NULL)
		END
		

--======================================================================================================

	--storing StudentEnrollmentProgramAssociation data for a given list of schools based on DOA or DOR rules
   CREATE TABLE #StudentEnrollmentProgramAssociationDOR
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
			INSERT INTO #StudentEnrollmentProgramAssociationDOR
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
				FROM leadata.StudentEnrollmentProgramAssociationwithDOR SEPA WITH (NOLOCK)
				JOIN @Schools VSCH ON SEPA.SchoolId = VSCH.SchoolId  
				JOIN entity.School SC WITH (NOLOCK) ON SC.FiscalYear = SEPA.FiscalYear AND SC.SchoolId = SEPA.SchoolId
				WHERE SEPA.FiscalYear = @FiscalYear 	
					AND SEPA.DOR <> @LocalEducationAgencyId						-- DOR can be any district except DOA
					AND SC.LocalEducationAgencyId = @LocalEducationAgencyId		-- DOA has to be the district that is running the report
		END
	  ELSE 
        BEGIN 
			INSERT INTO #StudentEnrollmentProgramAssociationDOR
				SELECT 
					FiscalYear, 
					StudentUSI,
					ProgramTypeId, 
					ProgramName, 
					ProgramEducationOrganizationId, 
					ProgramBeginDate, 
					SEPA.SchoolId,
					DOR,
					[MainSPEDSchool],
					[EntryGradeLevelDescriptorId]
				FROM leadata.StudentEnrollmentProgramAssociationwithDOR SEPA  WITH (NOLOCK)
				JOIN @Schools VSCH ON SEPA.SchoolId = VSCH.SchoolId
				WHERE SEPA.FiscalYear = @FiscalYear 	
					AND SEPA.DOR = @LocalEducationAgencyId			-- DOR has to be the district that is running the report & DOA can be any district
		END

--==============================================================================================================================
	/* To bring Grade & DOR data for students that have only Need and no program association and show actual values instead of '*' on the report
	  storing StudentEnrollmentNeedAssociation data for a given list of schools based on DOA or DOR rules */

   CREATE TABLE #StudentEnrollmentNeedAssociationDOR
		(
			FiscalYear INT, 
			StudentUSI INT,
			NeedBeginDate DATE, 
			SchoolId INT,
			NeedEndDate DATE, 
			PrimaryStudentNeedIndicator BIT,
			StudentNeedDescriptorId INT,	
			NeedCode NVARCHAR(50),
			EnrollmentEntryDate DATE,								
			EnrollmentExitWithdrawDate DATE,								
			EntryGradeLevelDescriptorId INT,								
			DOR INT
		);

	 IF @DistrictOf = 'Attendance'
        BEGIN 
			INSERT INTO #StudentEnrollmentNeedAssociationDOR
				SELECT 
					SENA.FiscalYear, 
					StudentUSI,
					NeedBeginDate, 
					SENA.SchoolId,
					NeedEndDate, 
					PrimaryStudentNeedIndicator,
					StudentNeedDescriptorId,	
					NeedCode,
					EnrollmentEntryDate,								
					EnrollmentExitWithdrawDate,								
					EntryGradeLevelDescriptorId,								
					DOR 
				FROM leadata.StudentEnrollmentNeedAssociationwithDOR SENA WITH (NOLOCK)
				JOIN @Schools VSCH ON SENA.SchoolId = VSCH.SchoolId    
				JOIN entity.School SC WITH (NOLOCK) ON SC.FiscalYear = SENA.FiscalYear AND SC.SchoolId = SENA.SchoolId
				WHERE SENA.FiscalYear = @FiscalYear 	
					AND SENA.DOR <> @LocalEducationAgencyId						-- DOR can be any district except DOA
					AND SC.LocalEducationAgencyId = @LocalEducationAgencyId		-- DOA has to be the district that is running the report
		END
	  ELSE 
        BEGIN 
			INSERT INTO #StudentEnrollmentNeedAssociationDOR
				SELECT 
					SENA.FiscalYear, 
					StudentUSI,
					NeedBeginDate, 
					SENA.SchoolId,
					NeedEndDate, 
					PrimaryStudentNeedIndicator,
					StudentNeedDescriptorId,	
					NeedCode,
					EnrollmentEntryDate,								
					EnrollmentExitWithdrawDate,								
					EntryGradeLevelDescriptorId,								
					DOR 
				FROM leadata.StudentEnrollmentNeedAssociationwithDOR SENA  WITH (NOLOCK)
				JOIN @Schools VSCH ON SENA.SchoolId = VSCH.SchoolId
				WHERE SENA.FiscalYear = @FiscalYear 	
					AND SENA.DOR = @LocalEducationAgencyId			-- DOR has to be the district that is running the report & DOA can be any district
		END


--CREATE NONCLUSTERED INDEX oct1StudentEnrollmentProgram  --Added Index on Student #oct1StudentEnrollmentProgramAssociation 
--ON #oct1StudentEnrollmentProgramAssociation (FiscalYear) INCLUDE
--(StudentUSI,ProgramTypeId,ProgramName,ProgramEducationOrganizationId,ProgramBeginDate,SchoolId,DOR,[MainSPEDSchool],[EntryGradeLevelDescriptorId] )

--====================================================================================================================================

	SELECT DISTINCT 
			 EOCTDS.NameOfInstitution							AS 'SchoolName'
			,EOCTDS.FormattedCTDS								AS 'SchoolCTDS'
			,SIC.IdentificationCode								AS 'DistrictStudentID'
			,S.StudentUniqueId									AS 'StateStudentID'
			,SPED72.StudentUSI
			,S.LastSurname										AS 'LastName'
			,S.FirstName
			,SUBSTRING(S.MiddleName,1,1)						AS 'MiddleInitial'
			,CONVERT(NVARCHAR(10),S.BirthDate,1)				AS 'DOB'
			,CASE ST.CodeValue
				WHEN 'Female'	THEN 'F'
				WHEN 'Male'	THEN 'M'
				ELSE 'NP' END									AS 'Gender'
			,CASE WHEN S.HispanicLatinoEthnicity = 1 THEN 'H'
				ELSE 'Non-H'
				END												AS 'Ethnicity'
			,SR.CodeValue										AS 'Race'
			,SPED72.Grade
			,SPED72.DORCTDS
			,SPED72.DOR			
			,SPED72.NeedDescriptorId
			,SPED72.Need
			,SPED72.NeedStartDate
			,SPED72.NeedEndDate
			,SPED72.[FED Primary Need]
			,SPED72.ProgramCode									AS 'SVC Code'
			,SPED72.ProgramBeginDate
			,SPED72.ProgramEndDate
			,CASE WHEN CONVERT(NVARCHAR(10),SPED72.MainSPEDSchool) = 1 
					AND SPED72.ProgramCode IS NOT NULL
					THEN 'P'	
					WHEN CONVERT(NVARCHAR(10),SPED72.MainSPEDSchool) = 0 
					AND SPED72.ProgramCode IS NOT NULL
					THEN 'S'	
					WHEN SPED72.ProgramCode IS NULL 
					THEN '*'  END								AS 'Primary/Secondary School'
			,SPED72.[Exit Code]
			,CASE WHEN ISNULL((SELECT CASE WHEN COUNT(*)>=1 
										THEN 1 ELSE 0 END
								FROM leadata.StudentProgramAssociation SPAELL
								WHERE SPAELL.FiscalYear = SPED72.FiscalYear
									AND SPAELL.StudentUSI = SPED72.StudentUSI
									AND SPAELL.EducationOrganizationId = SPED72.SchoolId
									AND SPAELL.ProgramEducationOrganizationId = SPED72.ProgramEducationOrganizationId
									AND SPAELL.ProgramTypeId = 1),0) = 1 
					THEN 'Y'	
				ELSE 'N' END									AS 'ELL'
			,CASE WHEN TIFED.IntegrityRuleTypeId = 8 
						AND TIFED.IntegrityResultTypeId = 1 THEN 'PASS'	
					WHEN TIFED.IntegrityRuleTypeId = 8 
						AND TIFED.IntegrityResultTypeId = 2 THEN 'FAIL'	
					ELSE NULL 
			END															AS 'FED SPED Pass/Fail'
			,CASE WHEN TIState.IntegrityRuleTypeId = 6 
						AND TIState.IntegrityResultTypeId = 1 THEN 'PASS'	
					WHEN TIState.IntegrityRuleTypeId = 6 
						AND TIState.IntegrityResultTypeId = 2 THEN 'FAIL'	
					ELSE NULL 
			END															AS 'State SPED Pass/Fail'
		  ,SPED72.StudentNeedResourceID
		  ,SPED72.StudentProgramResourceID
	FROM 
	    ( 
			-- this will get DOR & Grade data for students who have Program association irrespective of Need
			SELECT DISTINCT 
					 SPNA.FiscalYear
					,SPNA.StudentUSI
					,SPNA.SchoolId
					,SPNA.ProgramEducationOrganizationId
					,GRD.CodeValue										AS 'Grade'
					,EDORGCTDS.FormattedCTDS 							AS 'DORCTDS'
					,EDORGCTDS.EducationOrganizationId					AS 'DOR'			
					,SPNA.NeedDescriptorId
					,CASE WHEN SPNA.NeedCode	IS NOT NULL
								AND SPNA.ProgramCode IS NULL THEN 
								SPNA.NeedCode + CHAR(179)		
						ELSE SPNA.NeedCode END							AS 'Need'
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
						END												AS 'FED Primary Need'
					,SPNA.ProgramCode									
					,CONVERT(NVARCHAR(10),SPNA.ProgramBeginDate,1)		AS 'ProgramBeginDate'
					,CONVERT(NVARCHAR(10),SPNA.ProgramEndDate,1)		AS 'ProgramEndDate'
					,SPNA.ExitCode										AS 'Exit Code'
					,SEPA.MainSPEDSchool
				    ,SPNA.SNSourceId									AS 'StudentNeedResourceID'
				    ,SPNA.SPASourceId									AS 'StudentProgramResourceID'
			FROM #StudentProgramNeed SPNA WITH(NOLOCK) 

			 LEFT JOIN #StudentEnrollmentProgramAssociationDOR SEPA WITH(NOLOCK)	-- Replaced StudentEnrollmentProgramAssociation with StudentEnrollmentProgramAssociationwithDOR
			   ON SPNA.FiscalYear = SEPA.FiscalYear
				  AND SPNA.StudentUSI = SEPA.StudentUSI
				  AND SPNA.SchoolId = SEPA.SchoolId
				  AND SPNA.ProgramTypeId = SEPA.ProgramTypeId
				  AND SPNA.ProgramName = SEPA.ProgramName
				  AND SPNA.ProgramEducationOrganizationId = SEPA.ProgramEducationOrganizationId
				  AND SPNA.ProgramBeginDate = SEPA.ProgramBeginDate

			 LEFT JOIN leadata.Descriptor GRD WITH(NOLOCK)
			   ON SEPA.FiscalYear = GRD.FiscalYear  
				  AND SEPA.EntryGradeLevelDescriptorId = GRD.DescriptorId   

			 LEFT JOIN report.vw_FormattedEducationorganizationCTDS EDORGCTDS WITH(NOLOCK)
			   ON SEPA.FiscalYear = EDORGCTDS.FiscalYear  
				  AND SEPA.DOR = EDORGCTDS.EducationOrganizationId

		UNION
				-- To get DOR & Grade data for students who have only Need but no program association
			SELECT DISTINCT 
				     SPNA.FiscalYear
				    ,SPNA.StudentUSI
					,SPNA.SchoolId
					,SPNA.ProgramEducationOrganizationId
				    ,GRD.CodeValue										AS 'Grade'
					,EDORGCTDS.FormattedCTDS 							AS 'DORCTDS'
				   	,EDORGCTDS.EducationOrganizationId					AS 'DOR'			
				   ,SPNA.NeedDescriptorId
				   ,CASE WHEN SPNA.NeedCode	IS NOT NULL
				              AND SPNA.ProgramCode IS NULL THEN 
							  SPNA.NeedCode + CHAR(179)		
					ELSE SPNA.NeedCode END								AS 'Need'
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
				   ,SPNA.ProgramCode											
				   ,CONVERT(NVARCHAR(10),SPNA.ProgramBeginDate,1)		AS 'ProgramBeginDate'
				   ,CONVERT(NVARCHAR(10),SPNA.ProgramEndDate,1)			AS 'ProgramEndDate'
				   ,SPNA.ExitCode										AS 'Exit Code'
				   ,NULL AS MainSPEDSchool
				   ,SPNA.SNSourceId										AS 'StudentNeedResourceID'
				   ,SPNA.SPASourceId									AS 'StudentProgramResourceID'
			FROM #StudentProgramNeed SPNA WITH(NOLOCK) 

			 LEFT JOIN #StudentEnrollmentNeedAssociationDOR SENA WITH(NOLOCK)	
			   ON SPNA.FiscalYear = SENA.FiscalYear
				  AND SPNA.StudentUSI = SENA.StudentUSI
				  AND SPNA.SchoolId = SENA.SchoolId
				  AND SPNA.[NeedDescriptorId] = SENA.[StudentNeedDescriptorId]
				  AND SPNA.[NeedStartDate] = SENA.[NeedBeginDate]
				  AND SPNA.[PrimaryStudentNeedIndicator] = SENA.[PrimaryStudentNeedIndicator]

			 LEFT JOIN leadata.Descriptor GRD WITH(NOLOCK)
			   ON SENA.FiscalYear = GRD.FiscalYear  
				  AND SENA.EntryGradeLevelDescriptorId = GRD.DescriptorId   

			 LEFT JOIN report.vw_FormattedEducationorganizationCTDS EDORGCTDS WITH(NOLOCK)
			   ON SENA.FiscalYear = EDORGCTDS.FiscalYear  
				  AND SENA.DOR = EDORGCTDS.EducationOrganizationId
			WHERE SPNA.ProgramBeginDate IS NULL  -- have to filter, because "NULL AS MainSPEDSchool" gives duplicate record

		)SPED72

			 JOIN leadata.Student S WITH(NOLOCK) 
			   ON SPED72.StudentUSI = S.StudentUSI

			 LEFT JOIN report.vw_FormattedEducationorganizationCTDS EOCTDS WITH(NOLOCK)
			   ON SPED72.FiscalYear = EOCTDS.FiscalYear  
				  AND SPED72.SchoolId = EOCTDS.EducationOrganizationId

			 LEFT JOIN leadata.SexType ST WITH(NOLOCK)
			   ON S.SexTypeId = ST.SexTypeId

			 LEFT JOIN report.StudentRace SR WITH(NOLOCK)
			   ON S.StudentUSI = SR.StudentUSI

			 LEFT JOIN leadata.StudentIdentificationCode SIC WITH(NOLOCK) 
			   ON S.StudentUSI = SIC.StudentUSI
				  AND SIC.StudentIdentificationSystemTypeId = 2		
				  AND CONVERT(VARCHAR(60),SIC.AssigningOrganizationIdentificationCode) = CONVERT(VARCHAR(60),@LocalEducationAgencyId) --REMOVED SCH.LocalEducationAgencyId as the StudentIdentificationCode assigned by @LocalEducationAgencyId should be shown on the report

			 LEFT JOIN #TempIntegrityForStateSPED TIState
			   ON SPED72.FiscalYear = TIState.FiscalYear
				  AND SPED72.StudentUSI = TIState.StudentUSI
				  AND SPED72.SchoolId = TIState.SchoolId

			 LEFT JOIN #TempIntegrityForFEDSPED TIFED
			   ON SPED72.FiscalYear = TIFED.FiscalYear
				  AND SPED72.StudentUSI = TIFED.StudentUSI
				  AND SPED72.SchoolId = TIFED.SchoolId

		WHERE SPED72.DOR IS NOT NULL  
		ORDER BY SchoolName
				,LastName
				,FirstName
				,MiddleInitial
				,StateStudentID
				,ProgramBeginDate
				,[SVC Code]
				,Need

		DROP TABLE #TempIntegrityForStateSPED
		DROP TABLE #TempIntegrityForFEDSPED
		DROP TABLE #TempIntegrity
		DROP TABLE #StudentProgramNeed
		DROP TABLE #StudentEnrollmentProgramAssociationDOR
		DROP TABLE #StudentEnrollmentNeedAssociationDOR

END