
CREATE PROC [report].[StudentADMSummary]
	@LEAId INT , 
	@SchoolsList nvarchar(max), 
	@FiscalYear int,
	@GradesList nvarchar(50),		
	@ADMTypeList nvarchar(10),		
	@ReportingPeriodList nvarchar(10),	
	@DistrictOf nvarchar(20)	

AS
BEGIN

SET NOCOUNT ON;

	-- splitting comma separated value list and storing in table variables
	
	DECLARE @Schools TABLE ([SchoolId] int)
	INSERT INTO @Schools SELECT DISTINCT [Token] from [util].[Split](@SchoolsList, ',')

	DECLARE @Grades TABLE ([GradeLeveltypeId] int)
	INSERT INTO @Grades SELECT DISTINCT [Token] from [util].[Split](@GradesList, ',')

	DECLARE @ADMTypes TABLE ([ADMTypeId] smallint)
	INSERT INTO @ADMTypes SELECT DISTINCT [Token] from [util].[Split](@ADMTypeList, ',')

	DECLARE @ReportingPeriods TABLE ([ReportingPeriodId] smallint)
	INSERT INTO @ReportingPeriods SELECT DISTINCT [Token] from [util].[Split](@ReportingPeriodList, ',')



	DECLARE
		@ExecutionID	INT 
	  -- Gets the latest Statewide ExecutionID
	SELECT  
		@ExecutionID = MAX(ExecutionId)
	FROM 
		[AzEds].[process].[Execution] 
	WHERE 
		ProcessTypeId=2 AND 
		ExecutionTypeId=1 AND 
		StatusTypeId IN (5,6)  


	SELECT 
		 adm.Description AS ADMType
		--, [ResidentEducationOrganizationId] as DOR
		--, eoR.NameOfInstitution AS DOR_Name
		--, [AttendingLocalEducationAgencyId] AS DOA
		--, eoA.NameOfInstitution AS DOA_Name
		--, mi.[SchoolId]
		, eoS.NameOfInstitution + ' (' + CAST(mi.SchoolId AS nvarchar(20)) + ')'  AS SchoolName
		,SUBSTRING(LTRIM(eoS.CTDS), 1, 2) + '-' + SUBSTRING(LTRIM(eoS.CTDS), 3, 2) + '-' + SUBSTRING(LTRIM(eoS.CTDS), 5, 2) + '-' + SUBSTRING(LTRIM(eoS.CTDS), 7, 3) AS 'SchoolCTDS'
		--, at.Description AS AggregationTypeName
		,mi.GradeLevelTypeId
		,dGrade.CodeValue as Grade
		,rp.Description AS ReportingPeriodName
		,LimitedAverageDailyMembership
		,LimitedAverageDailyAttendance
		,LimitedMembershipDays
		,LimitedAbsenceDays
		,pd.CodeValue as PSDCodeValue
		,PD.Description as PSDDesription
		,scd.CodeValue as SCDCodeValue
		,scd.Description as SCDDescription
	FROM 
		[AzEds].[ace].[MembershipInterval] mi 
			JOIN 
		@Schools sc ON sc.SchoolId = mi.SchoolId
			JOIN
		@ADMTypes admt ON admt.ADMTypeId = mi.ADMTypeId
			JOIN
		@ReportingPeriods rpt ON rpt.ReportingPeriodId = mi.ReportingPeriodId
			JOIN
		@Grades gr ON gr.GradeLeveltypeId = mi.GradeLevelTypeId
			LEFT JOIN
		LEAData.descriptor pd ON pd.descriptorid = mi.programservicedescriptorid 
				AND mi.FiscalYear = pd.FiscalYear
			LEFT JOIN 
		leadata.Descriptor scd ON scd.FiscalYear = mi.FiscalYear 
				AND scd.DescriptorId = mi.ServiceCodeDescriptorId

		--LEFT OUTER JOIN entity.EducationOrganization eoR ON 
		--	(
		--		mi.ResidentEducationOrganizationId = eoR.EducationOrganizationId
		--		AND mi.FiscalYear = eoR.FiscalYear
		--	)
	  --	LEFT OUTER JOIN entity.EducationOrganization eoA ON 
			--(
			--	mi.AttendingLocalEducationAgencyId = eoA.EducationOrganizationId
			--	AND mi.FiscalYear = eoA.FiscalYear
			--)
			LEFT JOIN
		entity.EducationOrganization eoS ON mi.SchoolId = eoS.EducationOrganizationId
				AND mi.FiscalYear = eoS.FiscalYear
			LEFT JOIN 
		ace.ADMType adm ON mi.ADMTypeId = adm.ADMTypeId
			LEFT JOIN 
		entity.GradeLevelType dGrade ON mi.GradeLevelTypeId = dGrade.GradeLevelTypeId
			LEFT JOIN 
		ace.AggregationType at ON mi.AggregationTypeId = at.AggregationTypeId
			LEFT JOIN 
		config.ReportingPeriod rp ON mi.ReportingPeriodId = rp.ReportingPeriodId
				AND mi.FiscalYear = rp.FiscalYear
	WHERE 
		mi.ExecutionId = @ExecutionID 
			AND mi.ResidentEducationOrganizationId = @LEAId 
			--AND mi.FiscalYear = @fiscalyear
	ORDER BY 
		eoS.NameOfInstitution
		, mi.[GradeLevelTypeId]
		,mi.ADMTypeId
		, mi.[ReportingPeriodId] 
END