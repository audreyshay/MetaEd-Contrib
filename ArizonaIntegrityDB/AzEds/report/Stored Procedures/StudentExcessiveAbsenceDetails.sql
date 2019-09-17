/****************************************************************************************
**Procedure Name:
**      report.StudentExcessiveAbsenceDetails
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Returns information regarding consecutive Unexcused absences of 10 days or more 
**  totals for Students at the district,and Schools requested.
**  Additionally, it is filtered by Fiscal Year. 
**   
**Input:
**  @SchoolsList -  SchoolId to filter upon
**	@FiscalYear - fiscalyear to filter upon
**	@LocalEducationAgencyId - LEAId the report is executed for
**
**Output:
**  None
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from StudentExcessiveAbsence report
**
**Revision History:
**	P Kanyar		12/16/2015	Initial creation
**	P Kanyar		02/29/2016	Concatenated School ID with the School Name field
**  Amit Verma      05/31/2016  Updated the logic to calculate the number of consecutive absences
**  Amit Verma      06/01/2016  Updated the logic to count absence against Calendar
**	Amit Verma		01/06/2017	Fixed the STUD74 - Student Excessive Absence Report - First 
**								and Last Name column headers don't match the data in the columns 
**  Britto Augustine	05/02/2017  Removed where condition to check for ResposibilityDescriptorId = 236 because it is taken of by 
**									integrity load procs. The ResposibilityDescriptorId changed for FY18 also, so the condtion would not work for FY18.
**	P Kanyar			01/22/2018	Fixed the #TempStudentCal logic to fix prod issue- Bug 201653 Excessive Absences not showing on STUD74 Report,
**									calling the base proc & removed the embedded base proc logic since it is different for FY2018 & later
**	P Kanyar			03/04/2019	AZEDS 5.0 changes - Added CalendarCode in the join with CalendarDateTrackEvent, removed hard coding for FY enddate
**									replaced entity.EducationOrganization with a view to bring formatted CTDS, School Name
** Sucharita           06/12/2019   Added join with [AzEds].[entity].[TrackEventType] table to consider all TrackeventTypeId having IsInstructional =1 in the calculation of 10 consecutive absences 
**                                  Commented the join on TrackEventTypeId = 1 as we are joining with TrackEventType table
** Sucharita           07/02/2019   Commented CDCE.TrackEventTypeId = 1 from where clause and added TEVE.IsInstructional =1 in the where clause
** Sucharita           07/02/2019   Fix typo (removed extra TEVE from TEVE.TEVE.IsInstructional =1) 
*********************************************************************************************************************************************************************************************************/
--declare     @LEAId INT = 4153,	@FiscalYear INT = 2020, @SchoolsList NVARCHAR(MAX) = '4517,4711'

CREATE PROC [report].[StudentExcessiveAbsenceDetails]
    @LEAId INT,
	@FiscalYear INT,
	@SchoolsList NVARCHAR(MAX)

AS
BEGIN


DECLARE @FYEndDate DATE
SELECT @FYEndDate = EndDate FROM config.FiscalYear where FiscalYear = @FiscalYear


	CREATE TABLE #ReportStudents (StudentUSI							  INT
								  ,StudentUniqueId						  NVARCHAR(32)
								  ,FirstName							  NVARCHAR(75)
								  ,LastSurname							  NVARCHAR(75)
								  ,MiddleName							  NVARCHAR(75)
								  ,BirthDate							  DATE
								  ,SchoolId								  INT
								  ,EntryDate							  DATE
								  ,ExitWithdrawDate						  DATE
								  ,EntryGradeLevelDescriptorId			  INT
								  ,TrackEducationOrganizationId			  INT
								  ,TrackNumber							  INT
								  ,CalendarCode							  NVARCHAR(60)		--ADDED FOR AZEDS 5.0
								  ,FiscalYear							  INT
								  ,SSASubmittedByEducationOrganizationId  INT
								  ,SSAESubmittedByEducationOrganizationId INT
								  ,DOALocalEducationAgencyId			  INT
								  ,DORLocalEducationAgencyId			  INT 
								  ,DORStartDate							  date
								  ,SSAResourceId						  UNIQUEIDENTIFIER
								  ,SSAEResourceId						  UNIQUEIDENTIFIER
								  ,SEOResourceId						  UNIQUEIDENTIFIER 
								  ,AbsenceDate							  DATE
								  ,AttendanceMinutes					  INT
								  ,AbsenceAmount						  NVARCHAR(50)
								  ,AttendanceEventCategoryDescriptorId    INT 
								  )


	-- calling the base proc 
	-- to bring both excused and unexcused absences data with FERPA security implemented 
	INSERT INTO #ReportStudents
	EXEC report.GetReportStudentAbsenceList @SchoolsList, @LEAId, 0, @FiscalYear		-- 0 for unspecified report

	
		-- storing distinct rows of only unexcused absences  
		CREATE TABLE #DISReportStudents ( StudentUSI							  INT
										  ,StudentUniqueId						  NVARCHAR(32)
										  ,FirstName							  NVARCHAR(75)
										  ,LastSurname							  NVARCHAR(75)
										  ,MiddleName							  NVARCHAR(75)
										  ,BirthDate							  DATE
										  ,SchoolId								  INT
										  ,EntryDate							  DATE
										  ,ExitWithdrawDate						  DATE
										  ,EntryGradeLevelDescriptorId			  INT
										  ,TrackEducationOrganizationId			  INT
										  ,TrackNumber							  INT
										  ,CalendarCode							  NVARCHAR(60)		--ADDED FOR AZEDS 5.0
										  ,FiscalYear							  INT
										  ,SSASubmittedByEducationOrganizationId  INT
										  ,AbsenceDate							  DATE
										  ,AbsenceAmount						  NVARCHAR(50)
										  ,AttendanceEventCategoryDescriptorId    INT )

		 --Bringing  distinct rows of only unexcused absences  
		INSERT INTO #DISReportStudents								  
		SELECT DISTINCT 
					 RS.StudentUSI
					,RS.StudentUniqueId			 
					,RS.FirstName							 
					,RS.LastSurname							
					,RS.MiddleName							 
					,RS.BirthDate							 
					,RS.SchoolId								
					,RS.EntryDate	
					,RS.ExitWithdrawDate						  						 
					,RS.EntryGradeLevelDescriptorId			 
					,RS.TrackEducationOrganizationId			 
					,RS.TrackNumber	
					,RS.CalendarCode			--ADDED FOR AZEDS 5.0					 
					,RS.FiscalYear							 
					,RS.SSASubmittedByEducationOrganizationId 
					,RS.AbsenceDate				 
					,RS.AbsenceAmount						  
					,RS.AttendanceEventCategoryDescriptorId  
		FROM #ReportStudents RS
			 LEFT JOIN leadata.StudentSchoolAssociationMembershipFTE SSAFTE WITH (NOLOCK) 
					ON SSAFTE.StudentUSI = RS.StudentUSI
					   AND SSAFTE.SchoolId = RS.SchoolId
					   AND SSAFTE.EntryDate = RS.EntryDate
					   AND SSAFTE.FiscalYear = RS.FiscalYear
					   AND RS.AbsenceDate >= SSAFTE.FTEStartDate 
					   AND RS.AbsenceDate <= ISNULL(SSAFTE.FTEEndDate, @FYEndDate)							--CAST('06-30-' + CAST(@FiscalYear AS VARCHAR(4)) AS DATE)
		WHERE AttendanceEventCategoryDescriptorId = 10499													-- UNEXCUSED ABSENCES
			  AND RS.AbsenceDate >= RS.EntryDate 
			  AND ( RS.AbsenceDate <= ISNULL(RS.ExitWithdrawDate, @FYEndDate))
			  AND AbsenceAmount >= ( CASE SSAFTE.MembershipFTEDescriptorId WHEN 10224 THEN '1'				-- checking Absence amount >= fte amount
																		   WHEN 10223 THEN '0.75'
																		   WHEN 10222 THEN '0.5'
																		   WHEN 10221 THEN '0.25'
									 END 
									)
			


		/* Load the Calendar with Absence in a Temp Table */
		CREATE TABLE #TempStudentCal (
									   ID INT IDENTITY(1,1)
									  ,StudentUSI					INT
									  ,StudentUniqueId				NVARCHAR(32)
									  ,SchoolId						INT
									  ,FirstName					NVARCHAR(75)
									  ,LastSurname					NVARCHAR(75)
									  ,MiddleName					NVARCHAR(75)
									  ,EntryGradeLevelDescriptorId	INT
									  ,FiscalYear					INT
									  ,CalendarDate					DATE
									  ,AbsenceDate					DATE
									  ,FLAG                         BIT
									  )
    
		INSERT INTO #TempStudentCal (StudentUSI						
									,StudentUniqueId				
									,SchoolId						
									,FirstName						
									,LastSurname					
									,MiddleName						
									,EntryGradeLevelDescriptorId	
									,FiscalYear						
									,CalendarDate					
									,AbsenceDate
									,FLAG)
		SELECT DISTINCT 
						RS.StudentUSI
					   ,RS.StudentUniqueId
					   ,RS.SchoolId
					   ,RS.FirstName
					   ,RS.LastSurname
					   ,RS.MiddleName
					   ,RS.EntryGradeLevelDescriptorId
					   ,RS.FiscalYear		 
					   ,CDCE.Date								AS CalendarDate
					   ,RSS.AbsenceDate							AS AbsenceDate
					   ,CASE WHEN CDCE.Date = RSS.AbsenceDate 
							 THEN 1 ELSE 0 END					AS FLAG
		FROM entity.[CalendarDateTrackEvent] CDCE WITH (NOLOCK)
			 LEFT JOIN #DISReportStudents RS	 
				   ON CDCE.CalendarCode = RS.CalendarCode				--ADDED FOR AZEDS 5.0
					  AND CDCE.TrackLocalEducationAgencyId = RS.TrackEducationOrganizationId
					  AND CDCE.EducationOrganizationId = RS.SchoolId
		 			  AND CDCE.FiscalYear = RS.FiscalYear
		 			  AND CDCE.TrackNumber = RS.TrackNumber
		 			 -- AND CDCE.TrackEventTypeId = 1                        -----Commented the join as we are joining with TrackEventType table

			  LEFT JOIN entity.TrackEventType TEVE                            -----Added the join to consider all TrackeventTypeId having IsInstructional =1
			     ON CDCE.TrackEventTypeId = TEVE.TrackEventTypeId
				 AND TEVE.IsInstructional =1

			  LEFT JOIN #DISReportStudents RSS
					ON RS.StudentUSI = RSS.StudentUSI
						AND RS.StudentUniqueId = RSS.StudentUniqueId
						AND RS.SchoolId = RSS.SchoolId
						AND RS.EntryGradeLevelDescriptorId = RSS.EntryGradeLevelDescriptorId
						AND RS.FiscalYear = RSS.FiscalYear
						AND CDCE.Date = RSS.AbsenceDate
				WHERE TEVE.IsInstructional =1           
				      --CDCE.TrackEventTypeId = 1           
					  AND CDCE.FiscalYear = @FiscalYear
					  AND CDCE.TrackNumber = RS.TrackNumber
					  AND CDCE.CalendarCode = RS.CalendarCode			--ADDED FOR AZEDS 5.0

	
	-- Declare the number to get consecutive absence 
	DECLARE @CNT INT
	SELECT @CNT = 10
	
	SELECT  --SQ.*
		 EO.CTDS
		,EO.FormattedCTDS					AS 'SchoolCTDS'												
		,EO.NameOfInstitution				AS 'SchoolName'
		,ISNULL(SIC.IdentificationCode,'')	AS 'DistrictStudentID'
		,StateStudentID						
		,LastSurname						AS 'LastName'
		,FirstName							
		,MiddleName							
		,XGL.GradeLevel						AS 'Grade'
		,StartDate							AS 'AbsenceStartDate'
		,EndDate							AS 'AbsenceEndDate'
	FROM
		(
		   SELECT 
			      StudentUSI
			     ,StudentUniqueId				AS StateStudentID
			     ,SchoolId
			     ,LastSurname
			     ,FirstName
			     ,MiddleName
			     ,EntryGradeLevelDescriptorId
			     ,FiscalYear
			     ,MIN(CalendarDate)				AS StartDate		 
			     ,MAX(CalendarDate)				AS EndDate
			     ,COUNT(groupCnt)				AS Total 
		   FROM
			     (
			        /* Getting List of Student who has 10 or more consecutive Absences */
					SELECT
			               StudentUSI
			              ,StudentUniqueId
			              ,SchoolId
			              ,LastSurname
			              ,FirstName
			              ,MiddleName
			              ,EntryGradeLevelDescriptorId
			              ,FiscalYear
			              ,CalendarDate
			              ,AbsenceDate
			              ,FLAG
						  ,COUNT(*) OVER (PARTITION BY SchoolId,StudentUSI,Flag, groupID) AS groupCnt      
					FROM
			              (
							SELECT
								   StudentUSI
								  ,StudentUniqueId
								  ,SchoolId
								  ,LastSurname
								  ,FirstName
								  ,MiddleName
								  ,EntryGradeLevelDescriptorId
								  ,FiscalYear
								  ,CalendarDate
								  ,AbsenceDate
								  ,FLAG
								  ,ROW_NUMBER() OVER (PARTITION BY SchoolId,StudentUSI ORDER BY CalendarDate)
								   - ROW_NUMBER() OVER (PARTITION BY SchoolId,StudentUSI,Flag ORDER BY CalendarDate) AS groupID
							FROM #TempStudentCal 
			              ) T1		
			     ) T2
			WHERE T2.FLAG = 1 
			      AND T2.groupCnt >= @CNT
			GROUP BY
			         StudentUSI
			        ,StudentUniqueId					
			        ,SchoolId
			        ,LastSurname
			        ,FirstName
			        ,MiddleName
			        ,EntryGradeLevelDescriptorId
			        ,FiscalYear		
					
	    ) SQ
		JOIN [report].[vw_FormattedEducationorganizationCTDS] EO WITH (NOLOCK) --replaced entity.EducationOrganization
		  ON EO.EducationOrganizationId = SQ.SchoolId
			 AND EO.FiscalYear = SQ.FiscalYear

		JOIN leadata.Descriptor D WITH (NOLOCK) 
		  ON SQ.EntryGradeLevelDescriptorId = D.DescriptorId 
			 AND SQ.FiscalYear = D.FiscalYear

		LEFT JOIN leadata.StudentIdentificationCode SIC WITH (NOLOCK) 
		  ON SQ.StudentUSI = SIC.StudentUSI 
			 AND SIC.StudentIdentificationSystemTypeId = 2														-- District Student Id
			 AND SIC.AssigningOrganizationIdentificationCode = CONVERT(NVARCHAR(60), @LEAId)					-- District Id Assigned by the LEA runnig the report	

		LEFT JOIN report.XrefGradeLevelSortOrder XGL WITH (NOLOCK) 
		  ON XGL.GradeLevel = D.CodeValue	
	ORDER BY
		   EO.CTDS
		  ,LastName 
		  ,FirstName
		  ,StateStudentID 

    
	DROP TABLE #ReportStudents
	DROP TABLE #DISReportStudents
	DROP TABLE #TempStudentCal

END

/* END report.StudentExcessiveAbsenceDetails */
