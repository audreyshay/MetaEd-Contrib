CREATE TABLE [edfi].[StudentLanguage] (
	[StudentUSI]           INT      NOT NULL,
	[LanguageDescriptorId] INT      NOT NULL,
	[CreateDate]           DATETIME CONSTRAINT [StudentLanguage_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear]                        SMALLINT      NOT NULL,
	CONSTRAINT [PK_StudentLanguages] PRIMARY KEY CLUSTERED 
		([SchoolYear], [StudentUSI] ASC, [LanguageDescriptorId] ASC),
	CONSTRAINT [FK_StudentLanguages_LanguageDescriptor_LanguageDescriptorId] 
		FOREIGN KEY ([LanguageDescriptorId]) 
		REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId]),
	CONSTRAINT [FK_StudentLanguages_Student_StudentUSI_SchoolYear] 
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI])
		ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [FK_StudentLanguages_LanguageDescriptor_LanguageDescriptorId]
	ON [edfi].[StudentLanguage]([LanguageDescriptorId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_StudentLanguages_Student_StudentUSI_SchoolYear]
	ON [edfi].[StudentLanguage]([SchoolYear],[StudentUSI] ASC);


GO
