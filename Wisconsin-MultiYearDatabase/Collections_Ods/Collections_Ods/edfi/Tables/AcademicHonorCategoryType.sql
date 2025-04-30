CREATE TABLE [edfi].[AcademicHonorCategoryType] (
    [AcademicHonorCategoryTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                   NVARCHAR (50)    NOT NULL,
    [Description]                 NVARCHAR (1024)  NOT NULL,
    [ShortDescription]            NVARCHAR (450)   NOT NULL,
    [Id]                          UNIQUEIDENTIFIER CONSTRAINT [AcademicHonorCategoryType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]            DATETIME         CONSTRAINT [AcademicHonorCategoryType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                  DATETIME         CONSTRAINT [AcademicHonorCategoryType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_AcademicHonorCategoryType] PRIMARY KEY CLUSTERED ([AcademicHonorCategoryTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_AcademicHonorCategoryType_ShortDescription]
    ON [edfi].[AcademicHonorCategoryType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_AcademicHonorCategoryType]
    ON [edfi].[AcademicHonorCategoryType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A designation of the type of academic distinctions earned by or awarded to the student.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonorCategoryType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for AcademicHonor', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonorCategoryType', @level2type = N'COLUMN', @level2name = N'AcademicHonorCategoryTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for academic honors type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonorCategoryType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'AcademicHonorCategoryType', @level2type = N'COLUMN', @level2name = N'Description';

