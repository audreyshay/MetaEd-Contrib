/****************************************************************************************************************
**Function Name:
**      report.StudentNeedListDOR
**
**Author:
**      Amit Verma
**
**Description:  
**  returns the StudentNeed List By DOR.
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
CREATE FUNCTION [report].[StudentNeedListDOR]
(@LocalEducationAgencyId INT)
RETURNS TABLE
AS 
RETURN(
	   SELECT		sDOR.FiscalYear,
	                sDOR.StudentUSI,
					sDOR.StudentUniqueId,
                    sDOR.SchoolId,
                    SN.StudentNeedDescriptorId,
					SN.StudentNeedEntryDate,
					SN.SourceId
		FROM [report].[StudentsByDORFunc](@LocalEducationAgencyId) sDOR
			 JOIN leadata.StudentNeed SN 
			   ON SN.ReportingEducationOrganizationId = sDOR.SchoolId 
				  AND SN.StudentUSI = sDOR.StudentUSI
				  AND SN.FiscalYear = sDOR.FiscalYear
			 JOIN leadata.RecordOwnership SNRO 
			   ON SN.SourceId = SNRO.ResourceId
				  AND SN.FiscalYear = SNRO.FiscalYear
				  AND SNRO.RecordOwnershipTypeId = 3	   -- For StudentNeed 
		  -- Get students submitted by LEA or attending the LEA
		WHERE sDOR.DORLocalEducationAgencyId = @LocalEducationAgencyId 
			  AND ( SNRO.SubmittedByEducationOrganizationId = sDOR.DORLocalEducationAgencyId  OR SNRO.SubmittedByEducationOrganizationId = sDOR.DOALocalEducationAgencyId
					OR SNRO.SubmittedByEducationOrganizationId = sDOR.SEOSubmittedByEducationOrganizationId )
	)
