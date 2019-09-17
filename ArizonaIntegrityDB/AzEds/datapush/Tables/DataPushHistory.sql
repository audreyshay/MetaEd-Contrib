CREATE TABLE [datapush].[DataPushHistory](
	[DataPushHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProcessId] [int] NOT NULL,
	[ExecutionId] [int] NOT NULL,
	[InitiatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_DataPushHistory] PRIMARY KEY CLUSTERED 
(
	[DataPushHistoryId] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [datapush].[DataPushHistory]  WITH CHECK ADD  CONSTRAINT [FK_DataPushHistory_Execution] FOREIGN KEY([ExecutionId])
REFERENCES [process].[Execution] ([ExecutionId])
GO

ALTER TABLE [datapush].[DataPushHistory] CHECK CONSTRAINT [FK_DataPushHistory_Execution]
GO

CREATE NONCLUSTERED INDEX [IX_DataPushHistory_ProcessId_ExecutionId] ON [datapush].[DataPushHistory]
(   [ProcessId] ASC,
	[ExecutionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO