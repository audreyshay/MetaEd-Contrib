CREATE TABLE [edfi].[GraduationPlanType] (
    [GraduationPlanTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]            NVARCHAR (50)    NULL,
    [ShortDescription]     NVARCHAR (450)   NOT NULL,
    [Description]          NVARCHAR (1024)  NOT NULL,
    [Id]                   UNIQUEIDENTIFIER CONSTRAINT [GraduationPlanType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]     DATETIME         CONSTRAINT [GraduationPlanType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]           DATETIME         CONSTRAINT [GraduationPlanType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GraduationPlanType] PRIMARY KEY CLUSTERED ([GraduationPlanTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_GraduationPlanType_ShortDescription]
    ON [edfi].[GraduationPlanType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_GraduationPlanType]
    ON [edfi].[GraduationPlanType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of academic plan the student is following for graduation.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlanType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for graduation plan type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlanType', @level2type = N'COLUMN', @level2name = N'GraduationPlanTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for GraduationPlan type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlanType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlanType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GraduationPlanType', @level2type = N'COLUMN', @level2name = N'Description';

