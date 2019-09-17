/****************************************************************************************************************
**Function Name:
**      report.StudentProgramListDOR
**
**Author:
**      Amit Verma
**
**Description:  
**  returns the StudentProgram List By DOR.
**   
**Input:
**  @LocalEducationAgencyId -  LEAID to filter upon
**
**Output:

**
**Returns:
**	@@Error
**
**Implementation:
**	Called from Integrity report (SPED72) Stored procs 
**
**	Notes:
**	Changed a table valued function in to this stored proc
**
**Revision History:
**	Amit Verma	10/06/2016	Initial creation
**  Amit Verma  12/21/2016  Converted the UniqueIdentifier to NVARCHAR(50) for ResourceId
**
*******************************************************************************************************************/
CREATE FUNCTION [report].[StudentProgramListDOR]
(@LocalEducationAgencyId INT)
RETURNS TABLE
AS 
RETURN(
	   SELECT		sDOR.FiscalYear,
	                sDOR.StudentUSI,
					sDOR.StudentUniqueId,
                    sDOR.SchoolId,
                    SPA.ProgramEducationOrganizationId,
					SPA.ProgramTypeId,
					SPA.ProgramName,
					SPA.BeginDate,
					SPA.SourceId
		FROM [report].[StudentsByDORFunc](@LocalEducationAgencyId) sDOR
			 JOIN leadata.StudentProgramAssociation SPA 
			   ON SPA.EducationOrganizationId = sDOR.SchoolId 
				  AND SPA.StudentUSI = sDOR.StudentUSI
				  AND SPA.FiscalYear = sDOR.FiscalYear
			 JOIN leadata.StudentEnrollmentProgramAssociation SEPA
			   ON SPA.FiscalYear = SEPA.FiscalYear
			      AND SPA.StudentUSI = SEPA.StudentUSI
			      AND SPA.ProgramTypeId = SEPA.ProgramTypeId
			      AND SPA.ProgramName = SEPA.ProgramName
			      AND SPA.ProgramEducationOrganizationId = SEPA.ProgramEducationOrganizationId
			      AND SPA.BeginDate = SEPA.ProgramBeginDate
			      AND SPA.EducationOrganizationId = SEPA.SchoolId
			      AND sDOR.EntryDate = SEPA.EnrollmentEntryDate
			 JOIN leadata.RecordOwnership SPARO 
			   ON SPA.SourceId = SPARO.ResourceId
				  AND SPA.FiscalYear = SPARO.FiscalYear
				  AND SPARO.RecordOwnershipTypeId = 4	   -- For StudentProgram 
		  -- Get students submitted by LEA or attending the LEA
		WHERE sDOR.DORLocalEducationAgencyId = @LocalEducationAgencyId 
			  AND ( SPARO.SubmittedByEducationOrganizationId = sDOR.DORLocalEducationAgencyId  OR SPARO.SubmittedByEducationOrganizationId = sDOR.DOALocalEducationAgencyId
					OR SPARO.SubmittedByEducationOrganizationId = sDOR.SEOSubmittedByEducationOrganizationId )
	)