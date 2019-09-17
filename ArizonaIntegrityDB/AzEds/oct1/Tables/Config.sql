CREATE TABLE [oct1].[Config](
	[FiscalYear] [int] NOT NULL,
	[ExtractStartDate] [date] NOT NULL,
	[ExtractEndDate] [date] NOT NULL,
	[SnapshotDate] [date] NULL,
	CONSTRAINT [FiscalYear_PK] PRIMARY KEY CLUSTERED ([FiscalYear] ASC)
) 