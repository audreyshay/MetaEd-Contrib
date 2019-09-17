
CREATE PROCEDURE [datapush].[GetMembershipSummaryByExecution]
	@ExecutionId int
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
	SET NOCOUNT ON;

Create table #temp (
	ExecutionId int
	, SubmittedByLocalEducationAgencyId int
	, SubmittedByLocalEducationAgencyDesc varchar(100)
	, SubmittedByLocalEducationAgencyCTDS varchar(10)
	, SchoolId int
	, SchoolDesc varchar(100)
	, SchoolCTDS varchar(10)
	, SchoolIdOwnerLeaId int
	, SchoolIdOwnerDesc varchar(100)
	--, GradeLevelTypeId int
	--, GradeLevelTypeDesc varchar(10)
	, ADMTypeId int
	, LAdmSum decimal(38,4)
	)

-- Start with just reporting Period 1
INSERT INTO #temp (ExecutionId
	, SubmittedByLocalEducationAgencyId
	, SubmittedByLocalEducationAgencyDesc
	, SubmittedByLocalEducationAgencyCTDS
	, SchoolId
	, SchoolDesc
	, SchoolCTDS
	, SchoolIdOwnerLeaId
	, SchoolIdOwnerDesc
	--, GradeLevelTypeId
	--, GradeLevelTypeDesc
	, ADMTypeId
	, LAdmSum
	)
	SELECT ms.ExecutionId
	, SubmittedByEducationOrganizationId AS SubmittedByLocalEducationAgencyId
	, subeo.NameOfInstitution AS SubmittedByLocalEducationAgencyDesc
	, subeo.CTDS AS SubmittedByLocalEducationAgencyCTDS
	, ms.SchoolId
	, seo.NameOfInstitution AS SchoolDesc
	, seo.CTDS AS SchoolCTDS
	, s.LocalEducationAgencyId AS SchoolIdOwnerLeaId
	, schoolLea.NameOfInstitution AS SchoolIdOwnerDesc
	--, ms.GradeLevelTypeId
	--, glt.CodeValue AS GradeLevelTypeDesc
	,  ADMTypeId
	, Sum(LimitedAverageDailyMembership)

	  FROM [AzEds].[ace].[MembershipSummary] (nolock) ms
		JOIN AzEds.entity.EducationOrganization subeo (nolock)
			ON ms.SubmittedByEducationOrganizationId = subeo.EducationOrganizationId
			and ms.FiscalYear = subeo.FiscalYear

		JOIN AzEds.entity.EducationOrganization seo (nolock)
			ON ms.SchoolId = seo.EducationOrganizationId
			and ms.FiscalYear = seo.FiscalYear

		JOIN AzEds.[entity].[GradeLevelType] glt (nolock)
			ON ms.GradeLevelTypeId = glt.GradeLevelTypeId

		JOIN AzEds.[entity].[School] s (nolock)
			ON ms.SchoolId = s.SchoolId
			AND ms.FiscalYear = s.FiscalYear
			
		JOIN AzEds.entity.EducationOrganization schoolLea (nolock)
			ON s.LocalEducationAgencyId = schoolLea.EducationOrganizationId
			AND s.FiscalYear = schoolLea.FiscalYear

		WHERE ms.executionid = @ExecutionId AND ReportingPeriodId = 1
		GROUP BY 
			ms.ExecutionId
			, SubmittedByEducationOrganizationId
			, subeo.NameOfInstitution
			, subeo.CTDS
			, ms.SchoolId
			, seo.NameOfInstitution
			, seo.CTDS
			, s.LocalEducationAgencyId
			, schoolLea.NameOfInstitution
			--, ms.GradeLevelTypeId
			--, glt.CodeValue
			, ADMTypeId

-- Add the highest reporting period; currently 5.  Might include 6 someday.
INSERT INTO #temp (ExecutionId
	, SubmittedByLocalEducationAgencyId
	, SubmittedByLocalEducationAgencyDesc
	, SubmittedByLocalEducationAgencyCTDS
	, SchoolId
	, SchoolDesc
	, SchoolCTDS
	, SchoolIdOwnerLeaId
	, SchoolIdOwnerDesc
	--, GradeLevelTypeId
	--, GradeLevelTypeDesc
	, ADMTypeId
	, LAdmSum
	)
	SELECT ms.ExecutionId
	, SubmittedByEducationOrganizationId AS SubmittedByLocalEducationAgencyId
	, subeo.NameOfInstitution AS SubmittedByLocalEducationAgencyDesc
	, subeo.CTDS AS SubmittedByLocalEducationAgencyCTDS
	, ms.SchoolId
	, seo.NameOfInstitution AS SchoolDesc
	, seo.CTDS AS SchoolCTDS
	, s.LocalEducationAgencyId  AS SchoolIdOwnerLeaId
	, schoolLea.NameOfInstitution AS SchoolIdOwnerDesc
	--, ms.GradeLevelTypeId
	--, glt.CodeValue AS GradeLevelTypeDesc
	,  ADMTypeId + 3
	--, ADMTypeId
	, Sum(LimitedAverageDailyMembership)

	  FROM [AzEds].[ace].[MembershipSummary] (nolock) ms
		JOIN AzEds.entity.EducationOrganization subeo (nolock)
			ON ms.SubmittedByEducationOrganizationId = subeo.EducationOrganizationId
			and ms.FiscalYear = subeo.FiscalYear

		JOIN AzEds.entity.EducationOrganization seo (nolock)
			ON ms.SchoolId = seo.EducationOrganizationId
			and ms.FiscalYear = seo.FiscalYear

		JOIN AzEds.[entity].[GradeLevelType] glt
			ON ms.GradeLevelTypeId = glt.GradeLevelTypeId

		JOIN AzEds.[entity].[School] s (nolock)
			ON ms.SchoolId = s.SchoolId
			AND ms.FiscalYear = s.FiscalYear
			
		JOIN AzEds.entity.EducationOrganization schoolLea (nolock)
			ON s.LocalEducationAgencyId = schoolLea.EducationOrganizationId
			AND s.FiscalYear = schoolLea.FiscalYear

		WHERE ms.executionid = @ExecutionId 
			AND ReportingPeriodId = 5
		GROUP BY 
			ms.ExecutionId
			, SubmittedByEducationOrganizationId
			, subeo.NameOfInstitution
			, subeo.CTDS
			, ms.SchoolId
			, seo.NameOfInstitution
			, seo.CTDS
			, s.LocalEducationAgencyId
			, schoolLea.NameOfInstitution
			--, ms.GradeLevelTypeId
			--, glt.CodeValue
			,  ADMTypeId


SELECT 
	ExecutionId
	, SubmittedByLocalEducationAgencyId
	, SubmittedByLocalEducationAgencyDesc
	, SubmittedByLocalEducationAgencyCTDS
	, SchoolId
	, SchoolDesc
	, SchoolCTDS
	, SchoolIdOwnerLeaId
	, SchoolIdOwnerDesc
	--, GradeLevelTypeId
	--, GradeLevelTypeDesc
	, [1] AS AdmCount40
	, [2] AS SpedCount40
	, [3] AS EllCount40
	, [4] AS AdmCountMax
	, [5] AS SpedCountMax
	, [6] AS EllCountMax
 FROM #temp 
	PIVOT (
		SUM(LAdmSum)
		FOR ADMTypeId IN ([1], [2], [3], [4], [5], [6])
	) piv
	where SubmittedByLocalEducationAgencyId > 0  --and SubmittedByLocalEducationAgencyId in( 4403, 4507, 4499, 4287)
ORDER BY SubmittedByLocalEducationAgencyDesc, SchoolId--, GradeLevelTypeId


DROP TABLE #temp

 END


GO


