CREATE TABLE [datapush].[DataPushHistoryDetail](
	[DataPushHistoryDetailId] [int] IDENTITY(1,1) NOT NULL,
	[DataPushHistoryId] [int] NOT NULL,
	[LEAID] [int] NOT NULL,
	[CYFReportingPeriodID] [int] NOT NULL,
	[CYFReportingPeriodDesc] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DataPushHistoryDetail] PRIMARY KEY CLUSTERED 
(
	[DataPushHistoryDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO

ALTER TABLE [datapush].[DataPushHistoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_DataPushHistoryDetail_DataPushHistoryId] FOREIGN KEY([DataPushHistoryId])
REFERENCES [datapush].[DataPushHistory] ([DataPushHistoryId])
GO

ALTER TABLE [datapush].[DataPushHistoryDetail] CHECK CONSTRAINT [FK_DataPushHistoryDetail_DataPushHistoryId]
GO

CREATE NONCLUSTERED INDEX [IX_DataPushHistoryDetail_DataPushHistoryId_LEAID] ON [datapush].[DataPushHistoryDetail]
(   [DataPushHistoryId] ASC,
	[LEAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

