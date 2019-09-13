CREATE TABLE [edfi].[OperationalStatusType] (
    [OperationalStatusTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]               NVARCHAR (50)    NOT NULL,
    [Description]             NVARCHAR (1024)  NOT NULL,
    [ShortDescription]        NVARCHAR (450)   NOT NULL,
    [Id]                      UNIQUEIDENTIFIER CONSTRAINT [OperationalStatusType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]        DATETIME         CONSTRAINT [OperationalStatusType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]              DATETIME         CONSTRAINT [OperationalStatusType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_OperationalStatusType] PRIMARY KEY CLUSTERED ([OperationalStatusTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_OperationalStatusType_ShortDescription]
    ON [edfi].[OperationalStatusType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_OperationalStatusType]
    ON [edfi].[OperationalStatusType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The current operational status of the education organization (e.g., active or inactive).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OperationalStatusType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for OperationalStatus', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OperationalStatusType', @level2type = N'COLUMN', @level2name = N'OperationalStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for OperationalStatus type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OperationalStatusType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OperationalStatusType', @level2type = N'COLUMN', @level2name = N'Description';

