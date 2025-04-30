CREATE TABLE [edfi].[LanguageUseType] (
    [LanguageUseTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]         NVARCHAR (50)    NOT NULL,
    [Description]       NVARCHAR (1024)  NOT NULL,
    [ShortDescription]  NVARCHAR (450)   NOT NULL,
    [Id]                UNIQUEIDENTIFIER CONSTRAINT [LanguageUseType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]  DATETIME         CONSTRAINT [LanguageUseType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]        DATETIME         CONSTRAINT [LanguageUseType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LanguageUseType] PRIMARY KEY CLUSTERED ([LanguageUseTypeId] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The category denoting how a language is used.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LanguageUseType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LanguageUseType', @level2type = N'COLUMN', @level2name = N'LanguageUseTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A code or abbreviation that is used to refer to the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LanguageUseType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LanguageUseType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A shortened description for the language use type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LanguageUseType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

