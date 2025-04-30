CREATE TABLE [edfi].[LanguageDescriptor] (
    [LanguageDescriptorId] INT NOT NULL,
    [LanguageTypeId]       INT NULL,
    CONSTRAINT [PK_LanguageDescriptor] PRIMARY KEY CLUSTERED ([LanguageDescriptorId] ASC),
    CONSTRAINT [FK_LanguageDescriptor_Descriptor_DescriptorId] FOREIGN KEY ([LanguageDescriptorId]) REFERENCES [edfi].[Descriptor] ([DescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_LanguageDescriptor_LanguagesType_LanguageTypeId] FOREIGN KEY ([LanguageTypeId]) REFERENCES [edfi].[LanguageType] ([LanguageTypeId])
);


GO
CREATE NONCLUSTERED INDEX [FK_LanguageDescriptor_Descriptor_DescriptorId]
    ON [edfi].[LanguageDescriptor]([LanguageDescriptorId] ASC);


GO
CREATE NONCLUSTERED INDEX [FK_LanguageDescriptor_LanguagesType_LanguageTypeId]
    ON [edfi].[LanguageDescriptor]([LanguageTypeId] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the language(s) that are spoken or written.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LanguageDescriptor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LanguageDescriptor', @level2type = N'COLUMN', @level2name = N'LanguageDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Language(s) the individual uses to communicate', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LanguageDescriptor', @level2type = N'COLUMN', @level2name = N'LanguageTypeId';

