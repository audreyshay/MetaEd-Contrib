CREATE TABLE [edfi].[TermType] (
    [TermTypeId]       INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (50)    NOT NULL,
    [Description]      NVARCHAR (1024)  NOT NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [TermType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [TermType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [TermType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_TermType] PRIMARY KEY CLUSTERED ([TermTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_TermType_ShortDescription]
    ON [edfi].[TermType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_TermType]
    ON [edfi].[TermType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the type of the session during the school year (e.g., Fall Semester).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TermType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Term', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TermType', @level2type = N'COLUMN', @level2name = N'TermTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for Term type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TermType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TermType', @level2type = N'COLUMN', @level2name = N'Description';

