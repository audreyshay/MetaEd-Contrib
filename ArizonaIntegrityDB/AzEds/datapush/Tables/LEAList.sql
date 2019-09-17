CREATE TABLE [datapush].[LEAList](
	[LEAID] [int] NULL,
	[SchoolId] [int] NULL,
	[ReportingPeriod] [int] NULL
) 
GO

CREATE CLUSTERED INDEX [IX_LEAList_LEAID_ReportingPeriod] ON [datapush].[LEAList] ([LEAID],[SchoolId],[ReportingPeriod])
