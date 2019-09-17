CREATE TABLE [config].[ProgramOverride](
	[FiscalYear] [int] NOT NULL,
	[ProgramTypeId] [int] NOT NULL,
	[ProgramName] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_ProgramOverride] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[ProgramTypeId] ASC,
	[ProgramName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]