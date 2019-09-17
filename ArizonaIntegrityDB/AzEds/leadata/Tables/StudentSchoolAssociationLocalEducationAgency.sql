CREATE TABLE [leadata].[StudentSchoolAssociationLocalEducationAgency](
	[FiscalYear] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[ResponsibilityDescriptorId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[EntryDate] [date] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[SourceId] [uniqueidentifier] NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue] [binary](64) NOT NULL,
 CONSTRAINT [PK_StudentSchoolAssociationLocalEducationAgency] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[StudentUSI] ASC,
	[EducationOrganizationId] ASC,
	[ResponsibilityDescriptorId] ASC,
	[SchoolId] ASC,
	[EntryDate] ASC,
	[StartDate] ASC
))
GO

ALTER TABLE [leadata].[StudentSchoolAssociationLocalEducationAgency] ADD  CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_DF_EntryDate]  DEFAULT (getutcdate()) FOR [EntryDate]
GO

ALTER TABLE [leadata].[StudentSchoolAssociationLocalEducationAgency] ADD  CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_DF_SourceCreateDate]  DEFAULT (getutcdate()) FOR [SourceCreateDate]
GO

ALTER TABLE [leadata].[StudentSchoolAssociationLocalEducationAgency] ADD  CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()) FOR [SourceLastModifiedDate]
GO

ALTER TABLE [leadata].[StudentSchoolAssociationLocalEducationAgency] ADD  CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_DF_Loaddate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[StudentSchoolAssociationLocalEducationAgency] ADD CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_DF_HashValue] DEFAULT ((0)) FOR [HashValue]
GO

ALTER TABLE [leadata].[StudentSchoolAssociationLocalEducationAgency]  WITH CHECK ADD  CONSTRAINT [FK_StudentSchoolAssociationLocalEducationAgency_EducationOrganization] FOREIGN KEY([EducationOrganizationId], [FiscalYear])
REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentSchoolAssociationLocalEducationAgency] CHECK CONSTRAINT [FK_StudentSchoolAssociationLocalEducationAgency_EducationOrganization]
GO

ALTER TABLE [leadata].[StudentSchoolAssociationLocalEducationAgency]  WITH CHECK ADD  CONSTRAINT [FK_StudentSchoolAssociationLocalEducationAgency_Student] FOREIGN KEY([StudentUSI])
REFERENCES [leadata].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentSchoolAssociationLocalEducationAgency] CHECK CONSTRAINT [FK_StudentSchoolAssociationLocalEducationAgency_Student]
GO



