CREATE TABLE process.SplitStage(
	SplitStageId INT IDENTITY(1,1) NOT NULL,
	SplitDetailId INT, 
	SourceTable NVARCHAR(100) NOT NULL,
	ParentTable NVARCHAR(100) NULL,
	SourceId UNIQUEIDENTIFIER NOT NULL,
	IsSelected BIT,
	Entity INT NOT NULL CONSTRAINT [DF_SplitStage_Entity]  DEFAULT ((0)),

 CONSTRAINT [PK_SplitStage] PRIMARY KEY ([SplitStageId]),
 CONSTRAINT [FK_SplitStage_SplitDetail] FOREIGN KEY(SplitDetailId) REFERENCES [process].[SplitDetail] (SplitDetailId)


 );

