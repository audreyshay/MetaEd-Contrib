CREATE TABLE [process].[MessageLog](
	[ExecutionId] [int] NOT NULL,
	[MessageId] [nvarchar](36) NOT NULL,
	[SubmittedRecordCount] [int] NULL,
	[PassedRecordCount] [int] NULL,
	[FailedRecordCount] [int] NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	CONSTRAINT [PK_MessageLog] PRIMARY KEY CLUSTERED 
	(
		[ExecutionID] ASC,
		[MessageID] ASC
	), 
	CONSTRAINT [FK_MessageLog_Execution] FOREIGN KEY([ExecutionID])
		REFERENCES [process].[Execution] ([ExecutionId])
); 

GO
