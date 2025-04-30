CREATE TABLE [edfi].[ExitWithdrawType] (
    [ExitWithdrawTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]          NVARCHAR (50)    NOT NULL,
    [Description]        NVARCHAR (1024)  NOT NULL,
    [ShortDescription]   NVARCHAR (450)   NOT NULL,
    [Id]                 UNIQUEIDENTIFIER CONSTRAINT [ExitWithdrawType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]   DATETIME         CONSTRAINT [ExitWithdrawType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]         DATETIME         CONSTRAINT [ExitWithdrawType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ExitWithdrawType] PRIMARY KEY CLUSTERED ([ExitWithdrawTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_ExitWithdrawType_ShortDescription]
    ON [edfi].[ExitWithdrawType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_ExitWithdrawType]
    ON [edfi].[ExitWithdrawType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The circumstances under which the student exited from membership in an educational institution.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ExitWithdrawType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for ExitWithdraw', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ExitWithdrawType', @level2type = N'COLUMN', @level2name = N'ExitWithdrawTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for ExitWithdraw type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ExitWithdrawType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Description for ExitWithdraw type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ExitWithdrawType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short description for exit withdraw type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'ExitWithdrawType', @level2type = N'COLUMN', @level2name = N'ShortDescription';

