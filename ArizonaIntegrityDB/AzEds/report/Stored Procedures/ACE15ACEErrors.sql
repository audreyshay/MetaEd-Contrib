
/*****************************************************************************
**Procedure Name:
**      report.ACE15ACEErrors
**
**Author:
**      Pratibha Kanyar
**Description: 
**    
**Input:
**  @ExecutionId - Aggregation Execution ID to filter upon
**
**Output:
**  None
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from ACE15ACEErrors.rdl (ACE15 report)
**
**Revision History:
**	P Kanyar	05/12/2016	Initial Creation
**	P Kanyar	05/25/2016	Changed from UTC to AZ time for Data Capture Date
**
*****************************************************************************/

CREATE PROC [report].[ACE15ACEErrors]
	@ExecutionId int

AS
BEGIN

SET NOCOUNT ON;

	--DECLARE @ExecutionId INT = 2159

	SELECT 
		 e.ExecutionId									AS 'AggregationExecutionID'
		,CONVERT(varchar(8),e.InitiatedDateTime,1)		AS 'AggregationRunDate'
		,e.ReferenceExecutionId							AS 'IntegrityExecutionID'
		,CONVERT(varchar(8),DATEADD("hh", -7, pe.InitiatedDateTime),1) + ' ' + RIGHT(CONVERT(varchar(30),DATEADD("hh", -7, pe.InitiatedDateTime),100),7) AS 'DataCaptureDate'
		,leaeo.EducationOrganizationId					AS 'DistrictEntityID'
		,leaeo.NameOfInstitution						AS 'DistrictName'
		,leaeo.FormattedCTDS							AS 'DistrictCTDS'
	  	,scheo.EducationOrganizationId					AS 'SchoolID'
		,scheo.NameOfInstitution						AS 'SchoolName'
		,scheo.FormattedCTDS							AS 'SchoolCTDS'
		,s.StudentUSI
		,s.StudentUniqueId								AS 'StateStudentID'
		,s.FirstName									
		,s.LastSurname									AS 'LastName'
		,el.message										AS 'ErrorMessage'
	FROM 
		process.StudentEducationOrganizationErrorLog el WITH (NOLOCK) 
			INNER JOIN 
		leadata.Student s WITH (NOLOCK) ON el.StudentUSI = s.StudentUSI
			INNER JOIN 
		report.vw_FormattedEducationorganizationCTDS scheo WITH (NOLOCK) ON el.EducationOrganizationId = scheo.EducationOrganizationId
				AND el.FiscalYear = scheo.FiscalYear
			INNER JOIN 
		entity.School sch WITH (NOLOCK) ON  sch.SchoolId = scheo.EducationOrganizationId
				AND sch.FiscalYear = scheo.FiscalYear
			INNER JOIN 
		report.vw_FormattedEducationorganizationCTDS leaeo WITH (NOLOCK) ON sch.LocalEducationAgencyId = leaeo.EducationOrganizationId
				AND sch.FiscalYear = leaeo.FiscalYear
			INNER JOIN 
		process.Execution e WITH (NOLOCK) ON e.ExecutionId = el.ExecutionId
				AND e.FiscalYear = el.FiscalYear
			INNER JOIN 
		process.Execution pe WITH (NOLOCK)  ON pe.ExecutionId = e.ReferenceExecutionId
				AND pe.FiscalYear = e.FiscalYear

	WHERE 
		el.ExecutionId = @ExecutionId 
	ORDER BY 
		leaeo.NameOfInstitution
		,scheo.NameOfInstitution
		,s.LastSurname
		,s.FirstName
		,el.message
END

/* end report.ACE15ACEErrors */