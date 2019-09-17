CREATE TABLE [ace].[LimitedAverageDailyMembership]
(
	[LimitingByReportingPeriodId]			INT IDENTITY (1, 1) NOT NULL,
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
    CONSTRAINT [PK_LimitingByReportingPeriod] PRIMARY KEY CLUSTERED ([LimitingByReportingPeriodId] ASC),
	CONSTRAINT [FK_LimitingByReportingPeriod_MembershipInterval] FOREIGN KEY ([MembershipIntervalId]) REFERENCES [ace].[MembershipInterval] ([MembershipIntervalId]),
	CONSTRAINT [FK_LimitingByReportingPeriod_ReportingPeriod] FOREIGN KEY ([FiscalYear], [ReportingPeriodId]) REFERENCES [config].[ReportingPeriod] ([FiscalYear], [ReportingPeriodId]),
    CONSTRAINT [FK_LimitingByReportingPeriod_ReportingPeriodType] FOREIGN KEY ([ReportingPeriodTypeId]) REFERENCES [config].[ReportingPeriodType] ([ReportingPeriodTypeId]),
    CONSTRAINT [FK_LimitingByReportingPeriod_LimitingLevelType] FOREIGN KEY ([LimitingLevelTypeId]) REFERENCES [ace].[LimitingLevelType] ([LimitingLevelTypeId]),
)

GO

CREATE NONCLUSTERED INDEX [IX_LimitedAverageDailyMembership_MembershipIntervalId] ON [ace].[LimitedAverageDailyMembership]
(
	[MembershipIntervalId] ASC
)
INCLUDE ( 	[LimitingByReportingPeriodId],
	[FiscalYear],
	[ReportingPeriodTypeId],
	[ReportingPeriodId],
	[LimitingLevelTypeId],
	[LimitedMembershipDays],
	[LimitedAbsenceDays],
	[LimitedAverageDailyMembership],
	[LimitedAverageDailyAttendance],
	[LimitingFactor]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
