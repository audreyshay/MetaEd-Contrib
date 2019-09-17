/*****************************************************************************************************************
**Procedure Name:
**      report.GetPermittedSchoolList_Calendar
**
**Author:
**      Amit Verma
**
**Description:  
**  Lists of Schools based on User Permissions for AzEDS Portal 
**   
**Input:
**  @LocalEducationAgencyId
**  @PermittedEdOrgIdList
**  @FiscalYear
**  @SchoolTypeId
**
**Output:
**  List of Schools
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from AzEDS Portal UI
**
**Revision History:
**	Amit verma		09/08/2017	Initial Creation
**	Pratibha K		07/26/2018	Modified to pass multiple values for @SchoolType ( both 1,2 for private & public) instead of one value
**	Pratibha K		10/02/2018	Added new AlternateEducationOrganizationRelationshipTypeIds 6,7,8 to get 
**								the list of schools & to enable the LEAs to see their data (TFS-51488)
**		
****************************************************************************************************************/
CREATE PROC [report].[GetPermittedSchoolList_Calendar]
	@LocalEducationAgencyId int,
	@FiscalYear int,
	@PermittedEdOrgIdList nvarchar(max) = null,
	@SchoolType NVARCHAR(10) 				-- comma separated list of schooltype - 1,2 or 1 or 2

AS
BEGIN

DECLARE @PermittedEdOrgs TABLE ([EdOrgId] int, [FiscalYear] int) 
INSERT INTO @PermittedEdOrgs SELECT DISTINCT [Token], @FiscalYear FROM [util].[Split](@PermittedEdOrgIdList, ',') 	
	
	-- If LEAId passed in is also in the @PermittedEdOrgs, then add all the schools under that LEA to permittedEdOrgs 
	-- Similary add all schools under the LEA if the PermittedEdOrgIdList contains 79275 (ADE State EntityId)
	-- And adding schools that are not part of their LEA but associated to it through extension.AlternateSchoolToEducationAgency table

	IF EXISTS(SELECT 1 FROM @PermittedEdOrgs WHERE EdOrgId = @LocalEducationAgencyId OR EdOrgId = 79275)
	BEGIN
		DELETE FROM @PermittedEdOrgs
		INSERT INTO @PermittedEdOrgs
			SELECT SchoolId, FiscalYear
			FROM [entity].[vw_School]
			WHERE LocalEducationAgencyId = @LocalEducationAgencyId 
					AND FiscalYear = @FiscalYear

			UNION

			SELECT DependentEducationOrganizationId, FiscalYear
			FROM [entity].[AlternateEducationOrganizationRelationship] 
			WHERE ParentEducationOrganizationId = @LocalEducationAgencyId 
					AND FiscalYear = @FiscalYear
					AND AlternateEducationOrganizationRelationshipTypeId IN (1,4,5,6,7,8) -- JTED, PVT School, Head Start Schools,PublicOutOfState - LEA,LEA -CommunityCollege , LEA -ABOR University

	END


	SELECT 
		 SchoolId
		,sc.FiscalYear
		,SchoolName + ' (' + CONVERT(nvarchar(20),SchoolId) + ')'	AS SchoolName
		,SchoolCTDS
	FROM [entity].[vw_School] sc
		JOIN
	@PermittedEdOrgs ped ON ped.EdOrgId = sc.SchoolId AND ped.FiscalYear = sc.FiscalYear
		JOIN
	[util].[Split](@SchoolType, ',') us ON us.Token = sc.SectorTypeId					--SchoolType Public or Private or both
	WHERE 
		OperationalStatusTypeId IN (1,2,3,8,9)											--Active, Added, Changed Agency, New & Reopened status 
	ORDER BY 
		SchoolId
END