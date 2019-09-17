CREATE TABLE [config].[ProgramServiceOverride](
	[FiscalYear] [int] NOT NULL,
	[ProgramTypeId] [int] NOT NULL,
	[ServiceDescriptorId] [int] NOT NULL,
	[ProgramServiceName] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_ProgramServiceOverride] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[ProgramTypeId] ASC,
	[ServiceDescriptorId] ASC,
	[ProgramServiceName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]