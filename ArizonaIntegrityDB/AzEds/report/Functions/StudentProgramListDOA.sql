/****************************************************************************************************************
**Function Name:
**      report.StudentProgramListDOA
**
**Author:
**      Amit Verma
**
**Description:  
**  returns the StudentProgram List By DOA.
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
CREATE FUNCTION [report].[StudentProgramListDOA]
(@LocalEducationAgencyId INT)
RETURNS TABLE
AS 
RETURN(
	    SELECT		sDOA.FiscalYear,
	                sDOA.StudentUSI,
					sDOA.StudentUniqueId ,
                    sDOA.SchoolId,
                    SPA.ProgramEducationOrganizationId,
					SPA.ProgramTypeId,
					SPA.ProgramName,
					SPA.BeginDate,
					SPA.SourceId
		FROM [report].[StudentsByDOAFunc](@LocalEducationAgencyId) sDOA
			 JOIN leadata.StudentProgramAssociation SPA 
			   ON SPA.EducationOrganizationId = sDOA.SchoolId 
				  AND SPA.StudentUSI = sDOA.StudentUSI
				  AND SPA.FiscalYear = sDOA.FiscalYear
			 JOIN leadata.RecordOwnership SPARO 
			   ON SPA.SourceId = SPARO.ResourceId
				  AND SPA.FiscalYear = SPARO.FiscalYear
				  AND SPARO.RecordOwnershipTypeId = 4	   -- For StudentProgram 
		  -- Get students submitted by LEA or attending the LEA
		WHERE SPARO.SubmittedByEducationOrganizationId = @LocalEducationAgencyId 
			  OR sDOA.DOALocalEducationAgencyId = @LocalEducationAgencyId
	)
