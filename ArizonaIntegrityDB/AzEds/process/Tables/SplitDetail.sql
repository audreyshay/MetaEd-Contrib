CREATE TABLE process.SplitDetail(
	SplitDetailId INT IDENTITY(1,1) NOT NULL,
	SplitMergeDetailId INT, 
	IsStaged BIT,
	SourceSplitId INT NOT NULL,
	TargetSplitId INT NULL,
	[ProcessStartDate] [datetime] NULL,
	[ProcessCompleteDate] [datetime] NULL,
 CONSTRAINT [PK_SplitDetail] PRIMARY KEY ([SplitDetailId]),
 CONSTRAINT [FK_SplitDetail_SplitMergeDetail] FOREIGN KEY(SplitMergeDetailId) REFERENCES [process].[SplitMergeDetail] (SplitMergeDetailId)

 );

