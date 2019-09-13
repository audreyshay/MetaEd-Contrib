CREATE TABLE [edfi].[GradeLevelType] (
    [GradeLevelTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (50)    NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Description]      NVARCHAR (1024)  NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [GradeLevelType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [GradeLevelType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [GradeLevelType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GradeLevelType] PRIMARY KEY CLUSTERED ([GradeLevelTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_GradeLevelType_ShortDescription]
    ON [edfi].[GradeLevelType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_GradeLevelType]
    ON [edfi].[GradeLevelType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The enumerated collection for specifying one or more grade levels.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeLevelType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for GradeLevel', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeLevelType', @level2type = N'COLUMN', @level2name = N'GradeLevelTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for GradeLevel type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeLevelType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short description for grade level type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeLevelType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Description for GradeLevel type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeLevelType', @level2type = N'COLUMN', @level2name = N'Description';

