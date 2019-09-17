CREATE TABLE [leadata].[StudentLanguageUse]
(
	[StudentUSI] [int] NOT NULL,
	[EducationOrganizationid] [int] CONSTRAINT [StudentLanguageUse_DF_EducationOrganizationid] DEFAULT 79275 NOT NULL,
	[LanguageDescriptorId] [int] NOT NULL,
	[LanguageUseTypeId] [int] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL CONSTRAINT [StudentLanguageUse_DF_LoadDate]  DEFAULT (getutcdate()),
	CONSTRAINT [PK_StudentLanguageUse] PRIMARY KEY CLUSTERED ([StudentUSI] ASC, [EducationOrganizationId] ASC, [LanguageDescriptorId] ASC, [LanguageUseTypeId] ASC ),
	CONSTRAINT [FK_StudentLanguageUse_LanguageUseType_LanguageUseTypeId] FOREIGN KEY([LanguageUseTypeId]) REFERENCES [leadata].[LanguageUseType] ([LanguageUseTypeId])
 ) 
GO

ALTER TABLE [leadata].[StudentLanguageUse] CHECK CONSTRAINT [FK_StudentLanguageUse_LanguageUseType_LanguageUseTypeId]
GO

ALTER TABLE [leadata].[StudentLanguageUse]  WITH CHECK ADD  CONSTRAINT [FK_StudentLanguageUse_Student_StudentUSI] FOREIGN KEY([StudentUSI])
REFERENCES [leadata].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentLanguageUse] CHECK CONSTRAINT [FK_StudentLanguageUse_Student_StudentUSI]
GO