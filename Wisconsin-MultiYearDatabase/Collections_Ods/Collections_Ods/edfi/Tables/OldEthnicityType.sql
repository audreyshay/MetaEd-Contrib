CREATE TABLE [edfi].[OldEthnicityType] (
    [OldEthnicityTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]          NVARCHAR (50)    NOT NULL,
    [Description]        NVARCHAR (1024)  NOT NULL,
    [ShortDescription]   NVARCHAR (450)   NOT NULL,
    [Id]                 UNIQUEIDENTIFIER CONSTRAINT [OldEthnicityType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]   DATETIME         CONSTRAINT [OldEthnicityType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]         DATETIME         CONSTRAINT [OldEthnicityType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_OldEthnicityType] PRIMARY KEY CLUSTERED ([OldEthnicityTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_OldEthnicityType_ShortDescription]
    ON [edfi].[OldEthnicityType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_OldEthnicityType]
    ON [edfi].[OldEthnicityType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Previous definition of Ethnicity combining Hispanic/Latino and Race.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OldEthnicityType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for OldEthnicity', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OldEthnicityType', @level2type = N'COLUMN', @level2name = N'OldEthnicityTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for OldEthnicity type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OldEthnicityType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'OldEthnicityType', @level2type = N'COLUMN', @level2name = N'Description';

