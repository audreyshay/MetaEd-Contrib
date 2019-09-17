CREATE TABLE [process].[SplitMergeType]
(
    [SplitMergeTypeId] INT NOT NULL IDENTITY, 
    [CodeValue] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(50) NOT NULL, 
    PRIMARY KEY ([SplitMergeTypeId])
)