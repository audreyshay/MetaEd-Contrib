CREATE TABLE [ace].[LimitedAverageDailyMembershipArchive]
(
	[LimitingByReportingPeriodId]			INT				NOT NULL,
    [FiscalYear]							INT             NOT NULL,
	[MembershipIntervalId]					BIGINT			NOT NULL,
	[ReportingPeriodTypeId]					INT             NOT NULL,
    [ReportingPeriodId]						INT             NOT NULL,
	[LimitingLevelTypeId]					INT				NOT NULL,
	[LimitedMembershipDays]					DECIMAL (10, 6) NOT NULL,
    [LimitedAbsenceDays]					DECIMAL (10, 6) NULL,
    [LimitedAverageDailyMembership]			DECIMAL (10, 4) NOT NULL,
	[LimitedAverageDailyAttendance]			DECIMAL (10, 4) NULL,
    [LimitingFactor]						DECIMAL (18, 12) NOT NULL,
    CONSTRAINT [PK_LimitedAverageDailyMembershipArchive] PRIMARY KEY CLUSTERED ([LimitingByReportingPeriodId] ASC)
)
