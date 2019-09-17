
CREATE PROCEDURE [915].[GetWhitelistDetail] 
	@RequestId bigint,
	@activeFilesOnly bit = NULL
AS
BEGIN
SELECT  wld.[RequestId]
		, [WhitelistDetailId]
		, wld.[FileDetailId]
		, wld.[StudentUniqueId]
		, wld.[SchoolId]
		, [PropertyLocator]
		, [OldValue]
		, [NewValue]
		, wld.[ResourceTypeId]
		, ISNULL(s.LastSurname, '') + ', ' + ISNULL(s.FirstName, '') + ' ' + ISNULL(s.MiddleName, '') AS StudentName
		, eo.NameOfInstitution
		, eo.CTDS
		, rt.[Resource] AS ResourceTypeDesc
FROM  [915].[WhitelistDetail] wld
	LEFT OUTER JOIN [leadata].[Student] s ON s.StudentUniqueId = wld.StudentUniqueId
	JOIN [915].[Request] r ON wld.RequestId = r.RequestId
	LEFT OUTER JOIN [entity].[EducationOrganization] eo ON eo.EducationOrganizationId = wld.SchoolId AND eo.FiscalYear = r.FiscalYear
	JOIN [config].[ResourceType] rt ON rt.ResourceTypeId = wld.ResourceTypeId
	JOIN [915].[FileDetail] fd ON fd.FileDetailId = wld.FileDetailId
WHERE	wld.RequestId = @RequestId
AND fd.IsActive = ISNULL(@activeFilesOnly, fd.IsActive)
END
