CREATE TABLE [edfi].[CharterStatusType] (
    [CharterStatusTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]           NVARCHAR (50)    NOT NULL,
    [Description]         NVARCHAR (1024)  NOT NULL,
    [ShortDescription]    NVARCHAR (450)   NOT NULL,
    [Id]                  UNIQUEIDENTIFIER CONSTRAINT [CharterStatusType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]    DATETIME         CONSTRAINT [CharterStatusType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]          DATETIME         CONSTRAINT [CharterStatusType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CharterStatusType] PRIMARY KEY CLUSTERED ([CharterStatusTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_CharterStatusType_ShortDescription]
    ON [edfi].[CharterStatusType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_CharterStatusType]
    ON [edfi].[CharterStatusType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The category of charter school (e.g., School Charter or Open Enrollment Charter).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CharterStatusType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for CharterStatus', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CharterStatusType', @level2type = N'COLUMN', @level2name = N'CharterStatusTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for CharterStatus type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CharterStatusType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'CharterStatusType', @level2type = N'COLUMN', @level2name = N'Description';

