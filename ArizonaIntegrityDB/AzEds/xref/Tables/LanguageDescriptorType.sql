CREATE TABLE [xref].[LanguageDescriptorType](
	[LanguageTypeId] [int] NOT NULL,
	[LanguageDescriptorId] [int] NOT NULL,
 CONSTRAINT [PK_LanguageDescriptorType] PRIMARY KEY CLUSTERED 
(
	[LanguageTypeId] ASC,
	[LanguageDescriptorId] ASC
)
) 
GO