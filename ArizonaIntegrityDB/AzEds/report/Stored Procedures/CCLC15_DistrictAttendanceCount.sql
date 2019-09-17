/************************************************************************************************************************
**Procedure Name:
**      report.[CCLC15_DistrictAttendanceCount]
**
**Author:
**      Pratibha Kanyar
**
**Description: 
**    
**Input:
**  @FiscalYear - FiscalYear to filter upon
**  @SchoolsList - Id of School to filter upon
**	@LEAId - Id of LEA to filter upon
**
**Output:
**  None
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from CCLC15_DistrictAttendanceCount report
**
**Revision History:
**	Pratibha Kanyar		09/13/2018	Initial Creation
**	Pratibha Kanyar		10/12/2018	Fixed the data security logic of only DOA can see the data
**
*************************************************************************************************************************/
CREATE PROC [report].[CCLC15_DistrictAttendanceCount]	
	 @FiscalYear INT,
	 @LocalEducationAgencyId INT, 
	 @SchoolList NVARCHAR(MAX)

AS
BEGIN

--DECLARE 	 @FiscalYear INT = 2019,
--	 @LocalEducationAgencyId INT = 4516,--4153 4242  
--	 @SchoolList NVARCHAR(MAX) = '4711,7284'--


SET NOCOUNT ON;
							 

		SELECT 
			 spae.FiscalYear
			,spae.EducationOrganizationId	AS 'SchoolId'
			,sc.FormattedSchoolCTDS			AS 'SchoolCTDS'					
			,sc.SchoolName 					AS 'SchoolName'
			,COUNT(*)						AS 'AttendanceCount'
			,spae.StudentUSI
			,spae.ProgramName
		INTO #Temp_StudentProgramAttendanceEvent 
		FROM [leadata].[StudentProgramAttendanceEvent] spae (NOLOCK) 

		INNER JOIN util.Split(@SchoolList,',') us 
			ON us.Token = spae.EducationOrganizationId
				AND spae.FiscalYear = @FiscalYear
				AND spae.ProgramTypeId = 59
				AND spae.ProgramName LIKE '%21st Century Community%'
				AND spae.AttendanceEventCategoryDescriptorId = 10527							-- 'In Attendance'

		INNER JOIN entity.vw_School sc (NOLOCK)
			ON sc.SchoolId = spae.EducationOrganizationId
				AND sc.FiscalYear = spae.FiscalYear	
				AND sc.LocalEducationAgencyId = @LocalEducationAgencyId 	--	Only the DOA can see the report data
		
		INNER JOIN integrity.IntegrityNeed iin (NOLOCK)
			ON iin.FiscalYear = spae.FiscalYear 
				AND iin.StudentUSI = spae.StudentUSI
				AND iin.SchoolId = spae.EducationOrganizationId
				AND iin.IntegrityRuleTypeId = 14												-- Support Program Integrity	
				/*AND (iin.SubmittedByEducationOrganizationId = @LocalEducationAgencyId	OR		-- (Submittedby permission has been removed)
						 iin.SubmittedByEducationOrganizationId = sc.LocalEducationAgencyId ) */

		INNER JOIN integrity.IntegrityHistory ih (NOLOCK)
			ON ih.FiscalYear = iin.FiscalYear
				AND ih.IntegrityNeedId = iin.IntegrityNeedId
				AND ih.IntegrityResultTypeId = 1												-- only Support Program Integrity Passed data			
		
		GROUP BY spae.FiscalYear
				,spae.EducationOrganizationId 								
				,spae.StudentUSI
				,sc.FormattedSchoolCTDS															
				,sc.SchoolName
				,sc.SchoolId
				,spae.ProgramName
	

/*

 Supp Pgm Data							|					  | 	Program Attendance data
----------------------------------------------------------------------------------------------------
	DOA  SubmittingLEA(in Integ Need )  |  school     student | 	DOA			SubmittingLEA
--------------------------------------------------------------------------------------------------
	LEA1		LEA1					|	SCH1		STUD1  |	LEA1			NA (NOT AVAILABLE)  -- WILL WORK
	LEA1		LEA2					|	SCH1		STUD1  |	LEA1			NA					-- (iin.SubmittedByEducationOrganizationId = @LocalEducationAgencyId) or (iin.SubmittedByEducationOrganizationId = sc.LocalEducationAgencyId) WILL NOT WORK


*/


		-- Getting program level, School Level Counts for Report 
		  SELECT 
				FiscalYear
				,ProgramName
				,SchoolId
				,SchoolCTDS
				,SchoolName
				,(SELECT COUNT(*) FROM #Temp_StudentProgramAttendanceEvent
					WHERE AttendanceCount >= 30 AND AttendanceCount < 60 
						AND FiscalYear = tspae.FiscalYear 
						AND SchoolId = tspae.SchoolId 
						AND ProgramName = tspae.ProgramName )					AS '30DaysStudentCount'

				,(SELECT COUNT(*) FROM #Temp_StudentProgramAttendanceEvent
					WHERE AttendanceCount >= 60 AND AttendanceCount < 90 
						AND FiscalYear = tspae.FiscalYear 
						AND SchoolId = tspae.SchoolId 
						AND ProgramName = tspae.ProgramName )					AS '60DaysStudentCount'

				,(SELECT COUNT(*) FROM #Temp_StudentProgramAttendanceEvent
					WHERE AttendanceCount >= 90  
						AND FiscalYear = tspae.FiscalYear 
						AND SchoolId = tspae.SchoolId 						
						AND ProgramName = tspae.ProgramName )					AS '90DaysStudentCount'

				,(SELECT COUNT(*) FROM #Temp_StudentProgramAttendanceEvent
					WHERE AttendanceCount >= 30 
						AND FiscalYear = tspae.FiscalYear 
						AND SchoolId = tspae.SchoolId 
						AND ProgramName = tspae.ProgramName )					AS 'TotalRegularAttendees'

		  FROM #Temp_StudentProgramAttendanceEvent tspae
		  GROUP BY 
				 tspae.FiscalYear
				,tspae.ProgramName
				,tspae.SchoolId
				,tspae.SchoolCTDS
				,tspae.SchoolName
		 ORDER BY 
				 tspae.ProgramName			  
				,tspae.SchoolName

  DROP TABLE #Temp_StudentProgramAttendanceEvent

END 
/* End of [report].[CCLC15_DistrictAttendanceCount] */