CREATE TABLE [edfi].[TelephoneNumberType] (
    [TelephoneNumberTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]             NVARCHAR (50)    NOT NULL,
    [Description]           NVARCHAR (1024)  NOT NULL,
    [ShortDescription]      NVARCHAR (450)   NOT NULL,
    [Id]                    UNIQUEIDENTIFIER CONSTRAINT [TelephoneNumberType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]      DATETIME         CONSTRAINT [TelephoneNumberType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]            DATETIME         CONSTRAINT [TelephoneNumberType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_TelephoneNumberType] PRIMARY KEY CLUSTERED ([TelephoneNumberTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_TelephoneNumberType_ShortDescription]
    ON [edfi].[TelephoneNumberType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_TelephoneNumberType]
    ON [edfi].[TelephoneNumberType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The 10-digit telephone number, including the area code, for the person.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TelephoneNumberType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for TelephoneNumber', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TelephoneNumberType', @level2type = N'COLUMN', @level2name = N'TelephoneNumberTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for TelephoneNumber type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TelephoneNumberType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'TelephoneNumberType', @level2type = N'COLUMN', @level2name = N'Description';

