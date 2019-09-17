/****************************************************************************************************************
**Function Name:
**      report.StudentsByDOAFunc
**
**Author:
**      Amit Verma
**
**Description:  
**  returns the Student List By DOA.
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
**	Amit Verma			10/06/2016	Initial creation
**  Amit Verma			12/21/2016  Updated the logic to filter on DOA and DOR
**  Amit Verma			12/21/2016  Converted the UniqueIdentifier to NVARCHAR(50) for ResourceId
**  Britto Augustine	05/02/2017  Removed where condition to check for ResposibilityDescriptorId = 236 because it is taken of by 
**									integrity load procs. The ResposibilityDescriptorId changed for FY18 also, so the condtion would not work for FY18.
**									Added a join condition between StudentSchoolAssociation and StudentEducationOrganizationAssociation on EntryDate to support AzEDS 3.0 changes
*******************************************************************************************************************/
CREATE FUNCTION [report].[StudentsByDOAFunc]
(@LocalEducationAgencyId INT)
RETURNS TABLE
AS 

RETURN(
	SELECT S.StudentUSI, 
			S.StudentUniqueId,
			S.FirstName,
			S.LastSurname,
			S.MiddleName,
			S.BirthDate,	
			SSA.SchoolId, 
	 		SSA.EntryDate, 
			SSA.EntryGradeLevelDescriptorId,
			SSARO.SubmittedByEducationOrganizationId	AS SSASubmittedByEducationOrganizationId, 
			SCH.LocalEducationAgencyId					AS DOALocalEducationAgencyId, 
			SEO.EducationOrganizationId					AS DORLocalEducationAgencyId,
			SEO.StartDate								AS DORStartDate,
			SSA.FiscalYear,
			SSA.SourceId								AS SSAResourceId,
			SEO.SourceId								AS SEOResourceId
		FROM leadata.StudentSchoolAssociation SSA
			JOIN entity.School SCH
			  ON SCH.SchoolId = SSA.SchoolId
			     AND SCH.FiscalYear = SSA.FiscalYear
			JOIN leadata.Student S
			  ON S.StudentUSI = SSA.StudentUSI
			JOIN leadata.RecordOwnership SSARO
			  ON SSA.SourceId = SSARO.ResourceId
				 AND SSA.FiscalYear = SSARO.FiscalYear
				 AND SSARO.RecordOwnershipTypeId = 1
			LEFT JOIN  leadata.StudentSchoolAssociationLocalEducationAgency SEO  
			  ON	 SEO.FiscalYear = SSA.FiscalYear
				 AND SEO.StudentUSI = SSA.StudentUSI
				 AND SEO.SchoolId = SSA.SchoolId	
				 AND SEO.EntryDate = SSA.EntryDate
			LEFT JOIN leadata.RecordOwnership ROEDORG
			  ON ROEDORG.ResourceId = SEO.SourceId
				 AND ROEDORG.FiscalYear = SEO.FiscalYear
				 AND ROEDORG.RecordOwnershipTypeId = 7			--student DOR
		  WHERE (SSARO.SubmittedByEducationOrganizationId = @LocalEducationAgencyId OR SCH.LocalEducationAgencyId = @LocalEducationAgencyId ) -- Get students submitted by LEA or for attending the LEA
	)