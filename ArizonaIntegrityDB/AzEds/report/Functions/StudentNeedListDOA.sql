/****************************************************************************************************************
**Function Name:
**      report.StudentNeedListDOA
**
**Author:
**      Amit Verma
**
**Description:  
**  returns the StudentNeed List By DOA.
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
CREATE FUNCTION [report].[StudentNeedListDOA]
(@LocalEducationAgencyId INT)
RETURNS TABLE
AS 
RETURN(
	    SELECT		sDOA.FiscalYear,
	                sDOA.StudentUSI,
					sDOA.StudentUniqueId,
                    sDOA.SchoolId,
                    SN.StudentNeedDescriptorId,
					SN.StudentNeedEntryDate,
					SN.SourceId
		FROM [report].[StudentsByDOAFunc](@LocalEducationAgencyId) sDOA
			 JOIN leadata.StudentNeed SN 
			   ON SN.ReportingEducationOrganizationId = sDOA.SchoolId 
				  AND SN.StudentUSI = sDOA.StudentUSI
				  AND SN.FiscalYear = sDOA.FiscalYear
			 JOIN leadata.RecordOwnership SNRO 
			   ON SN.SourceId = SNRO.ResourceId
				  AND SN.FiscalYear = SNRO.FiscalYear
				  AND SNRO.RecordOwnershipTypeId = 3	   -- For StudentNeed 
		  -- Get students submitted by LEA or attending the LEA
		WHERE SNRO.SubmittedByEducationOrganizationId = @LocalEducationAgencyId 
			  OR sDOA.DOALocalEducationAgencyId = @LocalEducationAgencyId
	)
