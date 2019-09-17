CREATE TABLE [leadata].[StudentLanguage](
	[StudentUSI] [int] NOT NULL,
	[EducationOrganizationid] [int] CONSTRAINT [StudentLanguage_DF_EducationOrganizationid] DEFAULT 79275 NOT NULL,
	[LanguageDescriptorId] [int] NOT NULL,
	[LanguageTypeId] [int] null,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL CONSTRAINT [StudentLanguage_DF_LoadDate]  DEFAULT (getUTCdate())
 CONSTRAINT [PK_StudentLanguages] PRIMARY KEY CLUSTERED 
(
	[StudentUSI] ASC,
	[EducationOrganizationId] ASC,
	[LanguageDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[StudentLanguage]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentLanguages_LanguageType_LanguageTypeId] FOREIGN KEY([LanguageTypeId])
REFERENCES [leadata].[LanguageType] ([LanguageTypeId])
GO

ALTER TABLE [leadata].[StudentLanguage] CHECK CONSTRAINT [FK_StudentLanguages_LanguageType_LanguageTypeId]
GO

ALTER TABLE [leadata].[StudentLanguage]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentLanguages_Student_StudentUSI] FOREIGN KEY([StudentUSI])
REFERENCES [leadata].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentLanguage] CHECK CONSTRAINT [FK_StudentLanguages_Student_StudentUSI]
GO