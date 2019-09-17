CREATE TABLE [config].[DRPReportingPeriod]
(
	[DRPReportingPeriodId] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY, 
    [FiscalYear] INT NOT NULL, 
    [ReportingPeriodId] INT NOT NULL, 
    [StartDate] DATE NOT NULL, 
    [EndDate] DATE NOT NULL, 
    [DaysInReportingPeriod] INT NOT NULL

	CONSTRAINT [FK_DRPReportingPeriod_FiscalYear] FOREIGN KEY ([FiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear]),
	CONSTRAINT [FK_DRPReportingPeriod_ReportingPeriodId] FOREIGN KEY ([FiscalYear],[ReportingPeriodId]) REFERENCES [config].[ReportingPeriod] ([FiscalYear],[ReportingPeriodId])
)

