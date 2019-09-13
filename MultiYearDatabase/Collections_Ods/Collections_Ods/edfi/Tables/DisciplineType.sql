CREATE TABLE [edfi].[DisciplineType] (
    [DisciplineTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Description]      NVARCHAR (1024)  NULL,
    [CodeValue]        NVARCHAR (50)    NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [DisciplineType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [DisciplineType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [DisciplineType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DisciplineType] PRIMARY KEY CLUSTERED ([DisciplineTypeId] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The category of discipline action.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineType', @level2type = N'COLUMN', @level2name = N'DisciplineTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A shortened description for the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Code for discipline type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_DisciplineType_Id]
    ON [edfi].[DisciplineType]([Id] ASC) WITH (FILLFACTOR = 100, PAD_INDEX = ON);

