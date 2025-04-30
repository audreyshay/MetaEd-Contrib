CREATE TABLE [edfi].[ResidencyStatusType] (
    [ResidencyStatusTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]             NVARCHAR (50)    NOT NULL,
    [Description]           NVARCHAR (1024)  NOT NULL,
    [ShortDescription]      NVARCHAR (450)   NOT NULL,
    [Id]                    UNIQUEIDENTIFIER CONSTRAINT [ResidencyStatusType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]      DATETIME         CONSTRAINT [ResidencyStatusType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]            DATETIME         CONSTRAINT [ResidencyStatusType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ResidencyStatusType] PRIMARY KEY CLUSTERED ([ResidencyStatusTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ResidencyStatusType_ShortDescription]
    ON [edfi].[ResidencyStatusType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_ResidencyStatusType]
    ON [edfi].[ResidencyStatusType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of the location of a persons legal residence relative to (within or outside) the boundaries of the public school attended and its administrative unit.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResidencyStatusType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResidencyStatusType', @level2type = N'COLUMN', @level2name = N'ResidencyStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A code or abbreviation that is used to refer to the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResidencyStatusType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResidencyStatusType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ResidencyStatusType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

