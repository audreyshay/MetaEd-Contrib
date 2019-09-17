CREATE TABLE [process].[SplitMergeData]
(
    [SplitMergeDetailId] INT NOT NULL, 
    [OldPersonUSI] INT NULL, 
    [OldPersonID] NVARCHAR(32) NOT NULL,
    [NewPersonUSI] INT NULL, 
    [NewPersonID] NVARCHAR(32) NOT NULL,
    [CompletedDate] [datetime] NOT NULL DEFAULT(GETUTCDATE()),
    CONSTRAINT [PK_SplitMergeData] PRIMARY KEY ([SplitMergeDetailId]),
    CONSTRAINT [FK_SplitMergeData_SplitMergeDetail] FOREIGN KEY ([SplitMergeDetailId]) REFERENCES [process].SplitMergeDetail([SplitMergeDetailId]),
    CONSTRAINT [FK_SplitMergeData_Student_Old] FOREIGN KEY ([OldPersonUSI]) REFERENCES [leadata].[Student]([StudentUSI]),
    CONSTRAINT [FK_SplitMergeData_Student_New] FOREIGN KEY ([NewPersonUSI]) REFERENCES [leadata].[Student]([StudentUSI])
);