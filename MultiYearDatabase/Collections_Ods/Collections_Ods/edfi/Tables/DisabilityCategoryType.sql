CREATE TABLE [edfi].[DisabilityCategoryType] (
    [DisabilityCategoryTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [ShortDescription]         NVARCHAR (450)   NOT NULL,
    [CodeValue]                NVARCHAR (50)    NULL,
    [Description]              NVARCHAR (1024)  NULL,
    [Id]                       UNIQUEIDENTIFIER CONSTRAINT [DisabilityCategoryType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]         DATETIME         CONSTRAINT [DisabilityCategoryType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]               DATETIME         CONSTRAINT [DisabilityCategoryType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DisabilityCategoryType] PRIMARY KEY CLUSTERED ([DisabilityCategoryTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_DisabilityCategoryType_ShortDescription]
    ON [edfi].[DisabilityCategoryType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_DisabilityCategoryType]
    ON [edfi].[DisabilityCategoryType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the type of disability designation (e.g., IDEA, Section 504).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisabilityCategoryType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisabilityCategoryType', @level2type = N'COLUMN', @level2name = N'DisabilityCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisabilityCategoryType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

