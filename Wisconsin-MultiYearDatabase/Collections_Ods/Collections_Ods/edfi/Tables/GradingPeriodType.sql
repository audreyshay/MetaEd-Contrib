CREATE TABLE [edfi].[GradingPeriodType] (
    [GradingPeriodTypeId] INT              IDENTITY (1, 1) NOT NULL,
    [CodeValue]           NVARCHAR (50)    NOT NULL,
    [Description]         NVARCHAR (1024)  NOT NULL,
    [PeriodSequence]      INT              NULL,
    [ShortDescription]    NVARCHAR (450)   NOT NULL,
    [Id]                  UNIQUEIDENTIFIER CONSTRAINT [GradingPeriodType_DF_Id] DEFAULT (newid()) NOT NULL,
    [LastModifiedDate]    DATETIME         CONSTRAINT [GradingPeriodType_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
    [CreateDate]          DATETIME         CONSTRAINT [GradingPeriodType_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_GradingPeriodType] PRIMARY KEY CLUSTERED ([GradingPeriodTypeId] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the period for which grades are reported.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriodType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for GradingPeriod', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriodType', @level2type = N'COLUMN', @level2name = N'GradingPeriodTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Code for GradingPeriod type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriodType', @level2type = N'COLUMN', @level2name = N'CodeValue';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The description of the descriptor.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriodType', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The sequential order of this period relative to other periods.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriodType', @level2type = N'COLUMN', @level2name = N'PeriodSequence';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'A shortened description for the grading period type.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'GradingPeriodType', @level2type = N'COLUMN', @level2name = N'ShortDescription';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_GradingPeriodType_Id]
    ON [edfi].[GradingPeriodType]([Id] ASC) WITH (FILLFACTOR = 100, PAD_INDEX = ON);

