CREATE TABLE [edfi].[StudentLanguageUse] (
	[StudentUSI]           INT      NOT NULL,
	[LanguageDescriptorId] INT      NOT NULL,
	[LanguageUseTypeId]    INT      NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[CreateDate]           DATETIME CONSTRAINT [StudentLanguageUse_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	CONSTRAINT [PK_StudentLanguageUse] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [LanguageDescriptorId] ASC, [LanguageUseTypeId] ASC),
	CONSTRAINT [FK_StudentLanguageUse_LanguageUseType_LanguageUseTypeId] 
		FOREIGN KEY ([LanguageUseTypeId]) 
		REFERENCES [edfi].[LanguageUseType] ([LanguageUseTypeId]),
	CONSTRAINT [FK_StudentLanguageUse_StudentLanguages_StudentUSI] 
		FOREIGN KEY ([SchoolYear],[StudentUSI], [LanguageDescriptorId]) 
		REFERENCES [edfi].[StudentLanguage] ([SchoolYear], [StudentUSI], [LanguageDescriptorId]) 
		ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [FK_StudentLanguageUse_LanguageUseType_LanguageUseTypeId]
	ON [edfi].[StudentLanguageUse]([LanguageUseTypeId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_StudentLanguageUse_StudentLanguages_StudentUSI]
	ON [edfi].[StudentLanguageUse]([StudentUSI] ASC, [LanguageDescriptorId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A description of how the language is used (e.g. Home Language, Native Language, Spoken Language).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentLanguageUse';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentLanguageUse', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentLanguageUse', @level2type = N'COLUMN', @level2name = N'LanguageDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentLanguageUse', @level2type = N'COLUMN', @level2name = N'LanguageUseTypeId';

