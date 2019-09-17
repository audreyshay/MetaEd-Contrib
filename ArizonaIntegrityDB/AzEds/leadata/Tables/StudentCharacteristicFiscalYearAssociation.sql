CREATE TABLE [leadata].[StudentCharacteristicFiscalYearAssociation](
	[FiscalYear] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[StudentCharacteristicDescriptorId] [int] NOT NULL,
	[EducationOrganizationid] [int] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifieddate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue] [binary](64) NOT NULL,
 CONSTRAINT [PK_StudentCharacteristicFiscalYearAssociation] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[StudentUSI] ASC,
	[StudentCharacteristicDescriptorId] ASC,
	[EducationOrganizationid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[StudentCharacteristicFiscalYearAssociation] ADD  CONSTRAINT [StudentCharacteristicFiscalYearAssociation_DF_EducationOrganizationid]  DEFAULT ((79275)) FOR [EducationOrganizationid]
GO

ALTER TABLE [leadata].[StudentCharacteristicFiscalYearAssociation] ADD  CONSTRAINT [StudentCharacteristicFiscalYearAssociation_DF_LoadDate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[StudentCharacteristicFiscalYearAssociation] ADD  CONSTRAINT [StudentCharacteristicFiscalYearAssociation_DF_HashValue]  DEFAULT ((0)) FOR [HashValue]
GO


