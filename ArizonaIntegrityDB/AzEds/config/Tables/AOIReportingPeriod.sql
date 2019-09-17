CREATE TABLE [config].[AOIReportingPeriod]
(
	[AOIReportingPeriodId] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY, 
    [FiscalYear] INT NOT NULL, 
    [ReportingPeriodId] INT NOT NULL, 
    [StartDate] DATE NOT NULL, 
    [EndDate] DATE NOT NULL, 
    [DaysInReportingPeriod] INT NOT NULL

	CONSTRAINT [FK_AOIReportingPeriod_FiscalYear] FOREIGN KEY ([FiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]),
	CONSTRAINT [FK_AOIReportingPeriod_ReportingPeriodId] FOREIGN KEY ([FiscalYear],[ReportingPeriodId]) REFERENCES [config].[ReportingPeriod] ([FiscalYear],[ReportingPeriodId])
)

