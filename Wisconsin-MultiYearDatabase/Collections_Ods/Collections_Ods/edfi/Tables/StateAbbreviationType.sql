CREATE TABLE [edfi].[StateAbbreviationType] (
    [StateAbbreviationTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]               NVARCHAR (50)    NOT NULL,
    [Description]             NVARCHAR (1024)  NOT NULL,
    [ShortDescription]        NVARCHAR (450)   NOT NULL,
    [Id]                      UNIQUEIDENTIFIER CONSTRAINT [StateAbbreviationType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]        DATETIME         CONSTRAINT [StateAbbreviationType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]              DATETIME         CONSTRAINT [StateAbbreviationType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_StateAbbreviationType] PRIMARY KEY CLUSTERED ([StateAbbreviationTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_StateAbbreviationType_ShortDescription]
    ON [edfi].[StateAbbreviationType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_StateAbbreviationType]
    ON [edfi].[StateAbbreviationType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The abbreviation for the state (within the United States) or outlying area in which an address is located.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StateAbbreviationType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for StateAbbreviationType', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StateAbbreviationType', @level2type = N'COLUMN', @level2name = N'StateAbbreviationTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for StateAbbreviationType type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StateAbbreviationType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StateAbbreviationType', @level2type = N'COLUMN', @level2name = N'Description';

