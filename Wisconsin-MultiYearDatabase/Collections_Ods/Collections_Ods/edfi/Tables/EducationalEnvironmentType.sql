CREATE TABLE [edfi].[EducationalEnvironmentType] (
    [EducationalEnvironmentTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                    NVARCHAR (50)    NOT NULL,
    [Description]                  NVARCHAR (1024)  NOT NULL,
    [ShortDescription]             NVARCHAR (450)   NOT NULL,
    [Id]                           UNIQUEIDENTIFIER CONSTRAINT [EducationalEnvironmentType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]             DATETIME         CONSTRAINT [EducationalEnvironmentType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                   DATETIME         CONSTRAINT [EducationalEnvironmentType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_EducationalEnvironmentType] PRIMARY KEY CLUSTERED ([EducationalEnvironmentTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_EducationalEnvironmentType_ShortDescription]
    ON [edfi].[EducationalEnvironmentType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_EducationalEnvironmentType]
    ON [edfi].[EducationalEnvironmentType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The setting in which a child receives education and related services.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationalEnvironmentType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for EducationalEnvironment', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationalEnvironmentType', @level2type = N'COLUMN', @level2name = N'EducationalEnvironmentTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for EducationalEnvironment type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationalEnvironmentType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'EducationalEnvironmentType', @level2type = N'COLUMN', @level2name = N'Description';

