CREATE TABLE [datapush].[DataPushHistorySchoolLevelDetail](
	[DataPushHistorySchoolLevelDetailId] [int] IDENTITY(1,1) NOT NULL,
	[DataPushHistoryDetailId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
 CONSTRAINT [PK_DataPushHistorySchoolLevelDetailId] PRIMARY KEY CLUSTERED 
(
	[DataPushHistorySchoolLevelDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [datapush].[DataPushHistorySchoolLevelDetail]  WITH CHECK ADD  CONSTRAINT [FK_DataPushHistorySchoolLevelDetail_DataPushHistoryDetailId] FOREIGN KEY([DataPushHistoryDetailId])
REFERENCES [datapush].[DataPushHistoryDetail] ([DataPushHistoryDetailId])
GO

ALTER TABLE [datapush].[DataPushHistorySchoolLevelDetail] CHECK CONSTRAINT [FK_DataPushHistorySchoolLevelDetail_DataPushHistoryDetailId]
GO