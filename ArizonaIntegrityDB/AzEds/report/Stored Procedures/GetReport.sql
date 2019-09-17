/****************************************************************************************
**Procedure Name:
**      report.GetReport
**
**Author:
**      Martez Killens
**
**Description:  
**  Returns a report that is associated with the given name
**   
**Input:
**  @reportName -  The name of the report
**
**Revision History:
**	M Killens		01/14/2016	Initial creation
**  Vinoth k		06/11/2018  Added the Server type assoication, now Sql server details will get pulled from DB instead of APP Config.
*****************************************************************************************/

CREATE PROCEDURE [report].[GetReport]
	@reportName nvarchar(50)
AS
	
	SELECT
		  r.ReportId as Id
		, r.IsActive
		, r.Name
		, r.DisplayName
		, r.Description
		, r.CanExportToPdf
		, r.CanExportToExcel
		, r.CanExportToWord
		, r.CanExportToCsv
		, sc.Name AS SubCategoryName
		, sc.Description AS SubCategoryDescription
		, c.CategoryId
		, c.Name AS CategoryName
		, c.Description AS CategoryDescription
		, rs.ReportPath
		, rs.ReportServer AS ReportServerPath
		, r.PermittedEdOrgIdParameterName
		, r.IsReportPathFiscalYearDependent
        , r.EffectiveFromFiscalYear
        , r.EffectiveToFiscalYear
        , r.QRGLink
		, rs.ReportServerService
	FROM [report].[Report] r
	JOIN [report].[SubCategoryReportAssociation] scra ON r.Id = scra.ReportId
	JOIN [report].[SubCategory] sc ON scra.SubCategoryId = sc.Id
	JOIN [report].[CategorySubCategoryAssociation] csca ON sc.Id = csca.SubCategoryId
	JOIN [report].[Category] c on csca.CategoryId = c.Id
	JOIN [report].[ReportReportServerTypeAssociation] rsta on rsta.ReportId = r.id 
	JOIN [report].[ReportServerType] rs on rs.ReportServerTypeId = rsta.ReportServerTypeId
	WHERE r.ReportId = @reportName

	SELECT 
		 r.ReportId
		,p.ReportPermission
	FROM [report].[Report] r
	JOIN [report].[ReportPermissionAssociation] rpa on r.Id = rpa.ReportId
	JOIN [report].[Permission] p on rpa.PermissionId = p.Id
	WHERE r.ReportId = @reportName