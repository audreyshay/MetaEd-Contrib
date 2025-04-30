CREATE TABLE [edfi].[EntryGradeLevelReasonType] (
    [EntryGradeLevelReasonTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                   NVARCHAR (50)    NOT NULL,
    [Description]                 NVARCHAR (1024)  NULL,
    [ShortDescription]            NVARCHAR (450)   NOT NULL,
    [Id]                          UNIQUEIDENTIFIER CONSTRAINT [EntryGradeLevelReasonType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]            DATETIME         CONSTRAINT [EntryGradeLevelReasonType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                  DATETIME         CONSTRAINT [EntryGradeLevelReasonType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_EntryGradeLevelReasonType] PRIMARY KEY CLUSTERED ([EntryGradeLevelReasonTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_EntryGradeLevelReasonType_ShortDescription]
    ON [edfi].[EntryGradeLevelReasonType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_EntryGradeLevelReasonType]
    ON [edfi].[EntryGradeLevelReasonType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The set of reasons as to why a staff member determined that a student should be promoted or not (or be demoted) at the end of a given school term.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EntryGradeLevelReasonType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EntryGradeLevelReasonType', @level2type = N'COLUMN', @level2name = N'EntryGradeLevelReasonTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A code or abbreviation that is used to refer to the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EntryGradeLevelReasonType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EntryGradeLevelReasonType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EntryGradeLevelReasonType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

