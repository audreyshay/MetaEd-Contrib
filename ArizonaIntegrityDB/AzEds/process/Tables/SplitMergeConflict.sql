CREATE TABLE [process].[SplitMergeConflict]
(
    [SplitMergeConflictId] [int] IDENTITY(1,1) NOT NULL,
    [SplitMergeDetailId] INT NOT NULL,
    [ConflictData] NVARCHAR(MAX),
    CONSTRAINT [PK_SplitMergeConflict] PRIMARY KEY ([SplitMergeConflictId]),
    CONSTRAINT [FK_SplitMergeConflict_SplitMergeDetail] FOREIGN KEY ([SplitMergeDetailId]) REFERENCES [process].SplitMergeDetail([SplitMergeDetailId]),
);