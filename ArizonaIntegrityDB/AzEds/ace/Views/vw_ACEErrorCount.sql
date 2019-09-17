

/************************************************************************************************************************
**Procedure Name: [ace].[vw_ACEErrorCount]
**
**Author: Britto Augustine
**
**Description: view to get the ACE Error count by DOR, DOA and School. View is used by reconcilaition reports and dashboard
**	
**Revision History:
**	Who						When		What
**	Britto Augustine		08/19/2016	Initial Creation
**  Britto Augustine        05/02/2017  Removed the where condition ResponsibilityDescriptorId = 236, becuase the integrity load procs takes care of that.
**										 The ResposibilityDescriptorId changed for FY18 also, so the condtion would not work for FY18.
***************************************************************************************************************************/
CREATE VIEW [ace].[vw_ACEErrorCount]
	AS 
	
	WITH cteStudentEducationOrganizationAssociation as 
	(
		--cte to get funding DOR 
		SELECT DISTINCT seoa.FiscalYear, seoa.StudentUSI, seoa.SchoolId, lea.LocalEducationAgencyId as ResidentLocalEducationAgencyId
		FROM leadata.StudentSchoolAssociationLocalEducationAgency seoa WITH (NOLOCK)
		LEFT JOIN entity.LocalEducationAgency lea
			ON lea.FiscalYear = seoa.FiscalYear
		   AND lea.LocalEducationAgencyId = seoa.EducationOrganizationId
	)

	SELECT
		e.DataCaptureDateTime,
		e.ACEExecutionId,
		e.ADMIntegrityExecutionId,
		err.FiscalYear,
		s.LocalEducationAgencyId as AttendingLocalEducationAgencyId,
		dor.ResidentLocalEducationAgencyId,
		err.EducationOrganizationId as 'SchoolId',
		COUNT(DISTINCT err.StudentUSI)  as 'ACEErrorCount'
	FROM [process].[StudentEducationOrganizationErrorLog] err WITH(NOLOCK)
	JOIN [ace].[vw_ACEExecution] e
		ON e.ACEExecutionId = err.ExecutionId	
	JOIN entity.School s 
		ON s.FiscalYear = err.FiscalYear
       AND s.SchoolId = err.EducationOrganizationId  
	LEFT JOIN cteStudentEducationOrganizationAssociation dor
		ON dor.FiscalYear = err.FiscalYear
        AND dor.StudentUSI = err.StudentUSI
		AND dor.SchoolId = err.EducationOrganizationId
	GROUP BY e.DataCaptureDateTime,
			 e.ACEExecutionId,
			 e.ADMIntegrityExecutionId,
			 err.FiscalYear,
			 s.LocalEducationAgencyId,
			 dor.ResidentLocalEducationAgencyId,
			 err.EducationOrganizationId	

GO