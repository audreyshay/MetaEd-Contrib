CREATE TABLE [config].[SchoolOverrideExtension](
	[SchoolId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[SectorTypeId] [int] NOT NULL,
	[IsOutOfState] [bit] NULL,
	[IsVirtual] [bit] NULL,
	[IsHeadStart] [bit] NULL,
	[ResidentialCenter] [bit] NULL,
	[IsAlternative] [bit] NULL,
	[IsJuvenile] [bit] NULL,
	[IsExceptional] [bit] NULL,
	[IsSecureCare] [bit] NULL,
	[IsPrivateDaySchool] [bit] NOT NULL,
 CONSTRAINT [PK_SchoolOverrideExtension] PRIMARY KEY CLUSTERED 
(
	[SchoolId] ASC,
	[FiscalYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [config].[SchoolOverrideExtension] ADD  DEFAULT ((0)) FOR [IsPrivateDaySchool]
GO

ALTER TABLE [config].[SchoolOverrideExtension]  WITH CHECK ADD  CONSTRAINT [FK_SchoolOverrideExtension_FiscalYear] FOREIGN KEY([FiscalYear])
REFERENCES [config].[FiscalYear] ([FiscalYear])
GO

ALTER TABLE [config].[SchoolOverrideExtension] CHECK CONSTRAINT [FK_SchoolOverrideExtension_FiscalYear]
GO

ALTER TABLE [config].[SchoolOverrideExtension]  WITH NOCHECK ADD  CONSTRAINT [FK_SchoolOverrideExtension_SectorType] FOREIGN KEY([SectorTypeId])
REFERENCES [entity].[SectorType] ([SectorTypeId])
GO

ALTER TABLE [config].[SchoolOverrideExtension] CHECK CONSTRAINT [FK_SchoolOverrideExtension_SectorType]
GO