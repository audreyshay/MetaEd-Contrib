CREATE TABLE [edfi].[GradeType] (
    [GradeTypeId]      INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]        NVARCHAR (50)    NOT NULL,
    [Description]      NVARCHAR (1024)  NOT NULL,
    [ShortDescription] NVARCHAR (450)   NOT NULL,
    [Id]               UNIQUEIDENTIFIER CONSTRAINT [GradeType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate] DATETIME         CONSTRAINT [GradeType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]       DATETIME         CONSTRAINT [GradeType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GradeType] PRIMARY KEY CLUSTERED ([GradeTypeId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AK_GradeType_ShortDescription]
    ON [edfi].[GradeType]([ShortDescription] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_GradeType]
    ON [edfi].[GradeType]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates the type of grade in a report card or transcript (e.g., Final, Exam, Grading Period)', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Grade', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeType', @level2type = N'COLUMN', @level2name = N'GradeTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for Grade type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradeType', @level2type = N'COLUMN', @level2name = N'Description';

