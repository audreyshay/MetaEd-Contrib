CREATE TABLE [edfi].[DisciplineActionLengthDifferenceReasonType] (
    [DisciplineActionLengthDifferenceReasonTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]                                    NVARCHAR (50)    NOT NULL,
    [Description]                                  NVARCHAR (1024)  NOT NULL,
    [ShortDescription]                             NVARCHAR (450)   NOT NULL,
    [Id]                                           UNIQUEIDENTIFIER CONSTRAINT [DisciplineActionLengthDifferenceReasonType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]                             DATETIME         CONSTRAINT [DisciplineActionLengthDifferenceReasonType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]                                   DATETIME         CONSTRAINT [DisciplineActionLengthDifferenceReasonType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DisciplineActionLengthDifferenceReasonType] PRIMARY KEY CLUSTERED ([DisciplineActionLengthDifferenceReasonTypeId] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates the reason for the difference, if any, between the official and actual lengths of a student''s disciplinary assignment.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionLengthDifferenceReasonType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for DisciplineActionLengthDifferenceReason', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionLengthDifferenceReasonType', @level2type = N'COLUMN', @level2name = N'DisciplineActionLengthDifferenceReasonTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for DisciplineActionLengthDifferenceReason type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionLengthDifferenceReasonType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionLengthDifferenceReasonType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A shortened description for the discipline action length difference reason type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'DisciplineActionLengthDifferenceReasonType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_DisciplineActionLengthDifferenceReasonType_Id]
    ON [edfi].[DisciplineActionLengthDifferenceReasonType]([Id] ASC) WITH (FILLFACTOR = 100, PAD_INDEX = ON);

