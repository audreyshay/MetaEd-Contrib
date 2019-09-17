
/****************************************************************************
**Function Name: [StudentAnalysis].[GetEdorglist]
**
**Author: Pratibha Kanyar
**
**Description:  Gets list of EDorgs based on comma separated list of Districts
**	
**Revision History:
**	Who			When		What
**  P Kanyar	02/16/2017  Initial Creation
**
****************************************************************************/
CREATE FUNCTION [StudentAnalysis].[GetEdorglist]
(
	@PermittedEdOrgIdList as NVARCHAR(MAX) = NULL,
	@FiscalYear int 
)
RETURNS 
 @PermittedEdOrgs TABLE 
(
EdOrgId int
)
AS
BEGIN

	-- split the @PermittedEdOrgIdList into a table so we can join it in the main query
	INSERT INTO @PermittedEdOrgs SELECT DISTINCT [Token] FROM [util].[Split](@PermittedEdOrgIdList, ',')
	
	-- If LEAId passed in is also in the @PermittedEdOrgs, then add all the schools under that LEA to permittedEdOrgs 
	-- Similary add all schools under the LEA if the PermittedEdOrgIdList contains 79275 (ADE State EntityId)
	-- And adding schools that are not part of their LEA but associated to it through extension.AlternateSchoolToEducationAgency table

	IF EXISTS (SELECT 1 FROM @PermittedEdOrgs WHERE EdOrgId IN(SELECT EdOrgId FROM @PermittedEdOrgs))
	BEGIN
				
		INSERT INTO @PermittedEdOrgs 
			SELECT SchoolId 
			FROM [entity].[vw_School] s
			INNER JOIN @PermittedEdOrgs pe 
				ON s.LocalEducationAgencyId = pe.EdOrgId
					AND s.FiscalYear = @FiscalYear

		  UNION 

			SELECT DependentEducationOrganizationId 
			FROM entity.AlternateEducationOrganizationRelationship  aeor
				INNER JOIN @PermittedEdOrgs PE 
					ON aeor.ParentEducationOrganizationId = PE.EdOrgId			
						AND AlternateEducationOrganizationRelationshipTypeId IN (1,4,5)		-- for JTED SAT, Private and Head Start schools
						AND FiscalYear = @FiscalYear
	END

	 IF EXISTS(SELECT 1 FROM @PermittedEdOrgs WHERE EdOrgId = 79275)
		BEGIN
			
			INSERT INTO @PermittedEdOrgs 
			SELECT SchoolId 
			FROM [entity].[vw_School] s
				INNER JOIN [entity].[vw_LocalEducationAgency] lea 
					ON s.localeducationAgencyid = lea.LocalEducationAgencyID
						AND s.FiscalYear = @FiscalYear
			--INNER JOIN @PermittedEdOrgs pe on lea.StateEducationAgencyID = pe.EdOrgId 
			

		  UNION 

			SELECT DependentEducationOrganizationId 
			FROM entity.AlternateEducationOrganizationRelationship  aeor
				INNER JOIN @PermittedEdOrgs pe 
					ON aeor.ParentEducationOrganizationId = pe.EdOrgId			
						AND AlternateEducationOrganizationRelationshipTypeId IN (1,4,5)		-- for JTED SAT, Private and Head 
						AND aeor.FiscalYear = @FiscalYear

		END

	RETURN 
END
