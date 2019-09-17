/*
** CM  03/21/2017 table changes
** CM  03/28/2017 adding where clause (requestTypeId) to get only 915 records. this is only used by the 915 process.
*/
CREATE PROCEDURE [915].[LoadRequestsFromActiveYears] 
AS
BEGIN

	SELECT
		r.[RequestId]
		, r.[FiscalYear]
        , r.[LocalEducationAgencyId]
		, eo.[EducationOrganizationId]
		, eo.[CTDS]
		, eo.[NameOfInstitution]
 		, r.[LastModifiedDtm]
		, r.[RequestStatusId]
		, (SELECT COUNT(DISTINCT(SchoolId)) FROM [915].WhitelistDetail WHERE RequestId = r.RequestId AND 
				FileDetailId IN (SELECT FileDetailId FROM [915].[FileDetail] WHERE RequestId = r.RequestId AND IsActive = 1)) AS UniqueSchoolCount
		, (SELECT COUNT(DISTINCT(StudentUniqueId)) FROM [915].WhitelistDetail w WHERE RequestId = r.RequestId AND 
				FileDetailId IN (SELECT FileDetailId FROM [915].[FileDetail] WHERE RequestId = r.RequestId AND IsActive = 1)) AS UniqueStudentCount
		, fd.FileDetailId
		, fd.[RequestId]
		, fd.[FileName]
		, fd.[Comments]
		, fd.[IsActive]
	FROM [915].[Request] r 
	LEFT OUTER JOIN [915].[FileDetail] fd	 ON r.RequestId = fd.RequestId AND fd.IsActive = 1
	JOIN [config].[FiscalYear] f			 ON r.FiscalYear = f.FiscalYear
	JOIN [entity].[EducationOrganization] eo ON r.LocalEducationAgencyId = eo.EducationOrganizationId AND eo.FiscalYear = r.FiscalYear
	WHERE r.RequestTypeId = 1

END