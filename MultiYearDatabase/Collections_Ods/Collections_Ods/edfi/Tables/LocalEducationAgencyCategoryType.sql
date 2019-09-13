CREATE TABLE [edfi].[LocalEducationAgencyCategoryType] (
    [LocalEducationAgencyCategoryTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                          NVARCHAR (50)    NOT NULL,
    [Description]                        NVARCHAR (1024)  NOT NULL,
    [ShortDescription]                   NVARCHAR (450)   NOT NULL,
    [Id]                                 UNIQUEIDENTIFIER CONSTRAINT [LocalEducationAgencyCategoryType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                   DATETIME         CONSTRAINT [LocalEducationAgencyCategoryType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                         DATETIME         CONSTRAINT [LocalEducationAgencyCategoryType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_LEACategoryType] PRIMARY KEY CLUSTERED ([LocalEducationAgencyCategoryTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_LocalEducationAgencyCategoryType_ShortDescription]
    ON [edfi].[LocalEducationAgencyCategoryType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_LocalEducationAgencyCategoryType]
    ON [edfi].[LocalEducationAgencyCategoryType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The category of LEA/District (e.g., Independent or Charter).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgencyCategoryType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for LEACategory', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgencyCategoryType', @level2type = N'COLUMN', @level2name = N'LocalEducationAgencyCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for LEACategory type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgencyCategoryType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'LocalEducationAgencyCategoryType', @level2type = N'COLUMN', @level2name = N'Description';

