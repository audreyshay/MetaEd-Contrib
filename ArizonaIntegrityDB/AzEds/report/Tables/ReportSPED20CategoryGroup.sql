CREATE TABLE [report].[ReportSPED20CategoryGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[ProgramServiceDescriptorId] [int] NOT NULL,
	[IsSelfContained] [bit] NULL,
	[ReportingPeriodId] [int] NOT NULL,
	[Groups] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[FiscalYear] ASC,
	[ProgramServiceDescriptorId] ASC,
	[ReportingPeriodId] ASC,
	[Groups] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]