CREATE TABLE [edfi].[DiplomaType] (
    [DiplomaTypeId]    INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (50)    NOT NULL,
    [Description]      NVARCHAR (1024)  NOT NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [DiplomaType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [DiplomaType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [DiplomaType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DiplomaType] PRIMARY KEY CLUSTERED ([DiplomaTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_DiplomaType_ShortDescription]
    ON [edfi].[DiplomaType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_DiplomaType]
    ON [edfi].[DiplomaType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DiplomaType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Diploma', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DiplomaType', @level2type = N'COLUMN', @level2name = N'DiplomaTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for Diploma type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DiplomaType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DiplomaType', @level2type = N'COLUMN', @level2name = N'Description';

