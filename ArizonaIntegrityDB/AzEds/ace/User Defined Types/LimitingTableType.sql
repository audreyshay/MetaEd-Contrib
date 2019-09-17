CREATE TYPE [ace].[LimitingTableType] AS TABLE
(
	[FiscalYear] [int] NOT NULL,
	[ReportingPeriodTypeId] [int] NOT NULL,
	[ReportingPeriodId] [int] NOT NULL,
	[ExecutionId] [int] NOT NULL,
	[ADMTypeId] [int] NOT NULL,
	[AggregationTypeId] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[MembershipIntervalStartDate] [date] NOT NULL,
	[MembershipIntervalReportingPeriodId] [int] NOT NULL,
	[LimitedMembershipDays] [decimal](10, 6) NOT NULL,
	[LimitedAbsenceDays] [decimal](10, 6) NULL,
	[LimitedAverageDailyMembership] [decimal](10, 4) NOT NULL,
	[LimitedAverageDailyAttendance] [decimal](10, 6) NOT NULL,
	[LimitingFactor] [decimal](18, 12) NOT NULL,
	[LimitingLevelId] [int] NOT NULL
)
GO

