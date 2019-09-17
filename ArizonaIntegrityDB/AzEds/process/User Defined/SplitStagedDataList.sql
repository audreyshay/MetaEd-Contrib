CREATE TYPE [process].[SplitStagedDataList] AS TABLE(
	[SplitDetailId] [int] NOT NULL,
	[SourceId] [uniqueidentifier] NOT NULL,
	[IsSelected] [bit] NULL
)
