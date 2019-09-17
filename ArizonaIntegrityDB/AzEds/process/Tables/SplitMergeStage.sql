CREATE TABLE [process].[SplitMergeStage]
(
    [SplitMergeStageId] INT IDENTITY(1,1) NOT NULL,
    [SplitMergeTypeId] INT NOT NULL,
    [CodeValue] NVARCHAR(25),
    [Description] NVARCHAR(25),
    CONSTRAINT [PK_SplitMergeStage] PRIMARY KEY CLUSTERED ([SplitMergeStageId] ASC),
    CONSTRAINT [FK_SplitMergeStage_SplitlMergeType] FOREIGN KEY ([SplitMergeTypeId]) REFERENCES [process].[SplitMergeType]([SplitMergeTypeId]),
)