CREATE TABLE [edfi].[DiplomaLevelType] (
    [DiplomaLevelTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]          NVARCHAR (50)    NOT NULL,
    [Description]        NVARCHAR (1024)  NOT NULL,
    [ShortDescription]   NVARCHAR (450)   NOT NULL,
    [Id]                 UNIQUEIDENTIFIER CONSTRAINT [DiplomaLevelType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]   DATETIME         CONSTRAINT [DiplomaLevelType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]         DATETIME         CONSTRAINT [DiplomaLevelType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DiplomaLevelType] PRIMARY KEY CLUSTERED ([DiplomaLevelTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_DiplomaLevelType_ShortDescription]
    ON [edfi].[DiplomaLevelType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_DiplomaLevelType]
    ON [edfi].[DiplomaLevelType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The level of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DiplomaLevelType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for DiplomaLevel', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DiplomaLevelType', @level2type = N'COLUMN', @level2name = N'DiplomaLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for DiplomaLevel type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DiplomaLevelType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DiplomaLevelType', @level2type = N'COLUMN', @level2name = N'Description';

