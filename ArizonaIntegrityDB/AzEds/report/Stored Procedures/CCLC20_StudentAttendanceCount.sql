/************************************************************************************************************************
**Procedure Name:
**      report.[CCLC20_StudentAttendanceCount]
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
**	Called from CCLC20_StudentAttendanceCount report
**
**Revision History:
**	Pratibha Kanyar		09/20/2018	Initial Creation
**	Pratibha Kanyar		10/12/2018	Fixed the data security logic of only DOA can see the data, changed the SSA join to left
**	Pratibha Kanyar		10/16/2018	Moved COUNT(*) outside subquery by adding distinct & Eventdate in the select to fix the isssue of (count)
**									NumberOfDaysAttended getting multiplied by the number of enrollments due to SSA join
**
*************************************************************************************************************************/
CREATE PROC [report].[CCLC20_StudentAttendanceCount]	
	 @FiscalYear INT,
	 @LocalEducationAgencyId INT, 
	 @SchoolList NVARCHAR(MAX)

AS
BEGIN

--DECLARE @FiscalYear INT = 2019,
--	 @LocalEducationAgencyId INT = 4221 ,--4153  4242, 
--	 @SchoolList NVARCHAR(MAX) = '4893'


SET NOCOUNT ON;
	
	SELECT 
		 sq.FiscalYear			
		,sq.SchoolId
		,sq.SchoolCTDS					
		,sq.SchoolName 
		,sq.ProgramName
		,sq.StudentUSI
		,sq.DistrictStudentID
		,sq.StateStudentID
		,sq.LastName
		,sq.FirstName									 
		,sq.MiddleName									 
		,sq.Grade
		,COUNT(*)	AS 'TotalNumberOfDaysAttended'
	FROM 
		(							 
			SELECT DISTINCT
				 spae.FiscalYear			
				,spae.EducationOrganizationId					 AS 'SchoolId'
				,sc.FormattedSchoolCTDS							 AS 'SchoolCTDS'					
				,sc.SchoolName 
					+ ' ('+ CAST(spae.EducationOrganizationId AS NVARCHAR(20)) + ')' AS 'SchoolName'
				,spae.ProgramName
				,spae.StudentUSI
				,spae.EventDate
				,ISNULL(sic.IdentificationCode,'')				 AS 'DistrictStudentID'
				,ast.StudentUniqueId							 AS 'StateStudentID'
				,ast.LastSurname								 AS 'LastName'
				,ast.FirstName									 
				,ast.MiddleName									 
				,glt.CodeValue									 AS 'Grade'
				----,COUNT(*)									AS 'TotalNumberOfDaysAttended'
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
					AND sc.LocalEducationAgencyId = @LocalEducationAgencyId 						--	Only the DOA can see the report data
				
			INNER JOIN integrity.IntegrityNeed iin (NOLOCK)
				ON iin.FiscalYear = spae.FiscalYear 
					AND iin.StudentUSI = spae.StudentUSI
					AND iin.SchoolId = spae.EducationOrganizationId
					AND iin.IntegrityRuleTypeId = 14												-- Support Program Integrity	
					/*AND (--iin.SubmittedByEducationOrganizationId = @LocalEducationAgencyId	OR		-- (Submittedby has been removed)
								iin.SubmittedByEducationOrganizationId = sc.LocalEducationAgencyId ) */

			INNER JOIN integrity.IntegrityHistory ih (NOLOCK)
				ON ih.FiscalYear = iin.FiscalYear
					AND ih.IntegrityNeedId = iin.IntegrityNeedId
					AND ih.IntegrityResultTypeId = 1												-- only Support Program Integrity Passed data		
			
			INNER JOIN leadata.Student ast
				ON ast.StudentUSI = spae.StudentUSI 
			
			LEFT JOIN leadata.StudentSchoolAssociation ssa  
				ON ssa.FiscalYear = spae.FiscalYear
					AND ssa.StudentUSI = spae.StudentUSI	
					AND ssa.SchoolId = spae.EducationOrganizationId  /* changed the SSA join to left as Support integrity will pass students with CCLC program 
																		even without Enrollment record. And if a student has multiple enrollment records at same school, the count is
																		getting multiplied by the number of enrollments. For eg., if a student has 2 enrs & 16 attendance events, the total count was getting 32 because of SSA join */

			LEFT JOIN entity.GradeLevelType glt
				ON glt.GradeLevelDescriptorId = ssa.EntryGradeLevelDescriptorId
			
			LEFT JOIN leadata.StudentIdentificationCode sic 
				ON ast.StudentUSI = sic.StudentUSI 
					AND sic.StudentIdentificationSystemTypeId = 2														-- for District Student Id
					AND sic.AssigningOrganizationIdentificationCode =  CONVERT(nvarchar(60),@LocalEducationAgencyId)	-- District Student Id assigned by the LEA running the report 

		 )sq
	GROUP BY sq.FiscalYear
			,sq.SchoolId 	
			,sq.SchoolCTDS		
			,sq.SchoolName 	
			,sq.ProgramName																				
			,sq.StudentUSI
			,sq.DistrictStudentID
			,sq.StateStudentID		
			,sq.LastName				
			,sq.FirstName
			,sq.MiddleName
			,sq.Grade	

	ORDER BY 
			 sq.SchoolName 								
			,sq.ProgramName	
			,sq.LastName			
			,sq.FirstName
			,sq.MiddleName
			,sq.StateStudentID


END 

/* End of [report].[CCLC20_StudentAttendanceCount] */