/********************************************************************************************
**Procedure Name:
**      report.GetPermittedSchoolListforDOR
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Lists of Schools based on User Permissions for AzEDS Portal & AggegationExecution ID
**   
**Input:
**  @LocalEducationAgencyId
**  @PermittedEdOrgIdList
**  @FiscalYear
**	@AggregationExecutionID 
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
**	P Kanyar		08/04/2016	Initial Creation
**	Harsha Kankanala 11/28/2018 Customised the stored proc for ADM15A	
**	Harsha Kankanala 12/05/2018 FIXED THE ISSUE OF SCHOOLS NOT FILTERING
*********************************************************************************************/
CREATE PROC [report].[GetPermittedSchoolListforADM20A]
	@LocalEducationAgencyId int,
	@FiscalYear int,
	@PermittedEdOrgIdList nvarchar(max) = null,
	@AggregationExecutionID int
AS
BEGIN

DECLARE @PermittedEdOrgs TABLE ([EdOrgId] int, [FiscalYear] int) 
INSERT INTO @PermittedEdOrgs SELECT DISTINCT [Token], @FiscalYear FROM [util].[Split](@PermittedEdOrgIdList, ',') 	
	
	-- If LEAId passed in is in the @PermittedEdOrgs, then add all the schools under that LEA as DOR from ace.MembershipInterval table 
	-- to permittedEdOrgs 
	-- Similary add all schools under the LEA(@LocalEducationAgencyId) as DOR if the PermittedEdOrgIdList contains 79275 (ADE State EntityId)



	
	
		DELETE FROM @PermittedEdOrgs
		INSERT INTO @PermittedEdOrgs
			SELECT DISTINCT SchoolId, FiscalYear
			FROM ace.MembershipInterval WITH(NOLOCK)
			WHERE AttendingLocalEducationAgencyId = @LocalEducationAgencyId 
					AND FiscalYear = @FiscalYear
					AND ExecutionId = @AggregationExecutionID
	


	SELECT 
		 SchoolId
		,sc.FiscalYear
		,SchoolName + ' (' + CONVERT(nvarchar(20),SchoolId) + ')'	AS SchoolName
		,SchoolCTDS
	FROM [entity].[vw_School] sc
		JOIN
	@PermittedEdOrgs ped ON ped.EdOrgId = sc.SchoolId AND ped.FiscalYear = sc.FiscalYear
	WHERE 
		OperationalStatusTypeId IN (1,2,3,8,9)											--Active, Added, Changed Agency, New & Reopened status 
	ORDER BY 
		SchoolId
END

/* END report.GetPermittedSchoolListforDOR */




GO

