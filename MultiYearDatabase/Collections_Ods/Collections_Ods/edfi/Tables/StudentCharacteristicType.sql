CREATE TABLE [edfi].[StudentCharacteristicType] (
    [StudentCharacteristicTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                   NVARCHAR (50)    NOT NULL,
    [Description]                 NVARCHAR (1024)  NOT NULL,
    [ShortDescription]            NVARCHAR (450)   NOT NULL,
    [Id]                          UNIQUEIDENTIFIER CONSTRAINT [StudentCharacteristicType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]            DATETIME         CONSTRAINT [StudentCharacteristicType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                  DATETIME         CONSTRAINT [StudentCharacteristicType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_StudentCharacteristicsType] PRIMARY KEY CLUSTERED ([StudentCharacteristicTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_StudentCharacteristicType_ShortDescription]
    ON [edfi].[StudentCharacteristicType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_StudentCharacteristicType]
    ON [edfi].[StudentCharacteristicType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Enumeration items for the important characteristics of the student''s home situation: Displaced Homemaker, Homeless, Immigrant, Migratory, Military Parent, Pregnant Teen, Single Parent and Unaccompanied Youth.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCharacteristicType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for StudentCharacteristics', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCharacteristicType', @level2type = N'COLUMN', @level2name = N'StudentCharacteristicTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for StudentCharacteristics type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCharacteristicType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCharacteristicType', @level2type = N'COLUMN', @level2name = N'Description';

