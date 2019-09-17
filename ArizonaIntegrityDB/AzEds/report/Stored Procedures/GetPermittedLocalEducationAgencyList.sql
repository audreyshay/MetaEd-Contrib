
/***********************************************************************
**Procedure Name:
**      report.GetPermittedLocalEducationAgencyList
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Lists of LEAs based on User permissions for AzEDS Portal, Reports
**   
**Input:
**  @PermittedEdOrgIdList
**	@FiscalYear
**
**Output:
**  List of Local Education Agency Ids, Names, CTDS
**
**Implementation:
**	Called from AzEDS Portal UI
**
**Revision History:
**	P Kanyar		02/11/2016	Initial Creation		
**
***********************************************************************/
CREATE PROC [report].[GetPermittedLocalEducationAgencyList]
	@PermittedEdOrgList nvarchar(max),
	@FiscalYear int

AS
BEGIN


DECLARE @PermittedEdOrgs TABLE (EdOrgId int)
INSERT INTO @PermittedEdOrgs SELECT DISTINCT [Token] FROM [util].[Split](@permittedEdOrgList, ',')

	-- If PermittedEdOrgIdList contains 79275 (ADE State EntityId), then get all LEAs
	IF EXISTS (SELECT 1 FROM @PermittedEdOrgs WHERE EdOrgId = 79275)
	BEGIN
		DELETE FROM @PermittedEdOrgs
		
		INSERT INTO @PermittedEdOrgs 
			SELECT LocalEducationAgencyId 
			FROM [entity].[vw_LocalEducationAgency]	
			WHERE FiscalYear = @FiscalYear
	END

	-- get LEAs that the user is permitted for
	SELECT 
		LocalEducationAgencyId,            
		FiscalYear,      
		LocalEducationAgencyName + ' (' + CONVERT(nvarchar(20),LocalEducationAgencyId) + ')' AS LocalEducationAgencyName,
		LocalEducationAgencyCTDS
	FROM 
		[entity].[vw_LocalEducationAgency] lea
			JOIN
		@PermittedEdOrgs ped ON ped.EdOrgId = lea.LocalEducationAgencyId
	WHERE 
		OperationalStatusTypeId IN (1,2,3,8,9)
			AND FiscalYear = @FiscalYear  	

	UNION

	-- get LEAs that are owners of the schools the user is permitted for
	SELECT
		sc.LocalEducationAgencyId,            
		sc.FiscalYear,      
		sc.LocalEducationAgencyName+ ' (' + CONVERT(nvarchar(20),sc.LocalEducationAgencyId) + ')' AS LocalEducationAgencyName,
		sc.LocalEducationAgencyCTDS
	FROM 
		[entity].[vw_School] sc
			JOIN
		@PermittedEdOrgs ped ON ped.EdOrgId = sc.SchoolId
			JOIN
		[entity].[vw_LocalEducationAgency] lea ON lea.LocalEducationAgencyId = sc.LocalEducationAgencyId 
				AND lea.FiscalYear = sc.FiscalYear
	WHERE 
		sc.OperationalStatusTypeId IN (1,2,3,8,9)
			AND sc.FiscalYear = @FiscalYear 

	ORDER BY LocalEducationAgencyName
 END

 /* END [report].[GetPermittedLocalEducationAgencyList] */
