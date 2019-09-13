CREATE TABLE [edfi].[LimitedEnglishProficiencyType] (
    [LimitedEnglishProficiencyTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                       NVARCHAR (50)    NOT NULL,
    [Description]                     NVARCHAR (1024)  NOT NULL,
    [ShortDescription]                NVARCHAR (450)   NOT NULL,
    [Id]                              UNIQUEIDENTIFIER CONSTRAINT [LimitedEnglishProficiencyType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                DATETIME         CONSTRAINT [LimitedEnglishProficiencyType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                      DATETIME         CONSTRAINT [LimitedEnglishProficiencyType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LimitedEnglishProficiencyType] PRIMARY KEY CLUSTERED ([LimitedEnglishProficiencyTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_LimitedEnglishProficiencyType_ShortDescription]
    ON [edfi].[LimitedEnglishProficiencyType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_LimitedEnglishProficiencyType]
    ON [edfi].[LimitedEnglishProficiencyType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication that the student has been identified as Limited English Proficient or English Proficient by the Language Proficiency Assessment Committee (LPAC).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LimitedEnglishProficiencyType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for LimitedEnglishProficiency', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LimitedEnglishProficiencyType', @level2type = N'COLUMN', @level2name = N'LimitedEnglishProficiencyTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for LimitedEnglishProficiency type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LimitedEnglishProficiencyType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LimitedEnglishProficiencyType', @level2type = N'COLUMN', @level2name = N'Description';

