CREATE TABLE [ace].[ApprovedMembershipInterval](
	[ApprovedMembershipIntervalId] [bigint] IDENTITY(1,1) NOT NULL,
	[MembershipIntervalId] [bigint] NOT NULL,
	[DataPushHistorySchoolLevelDetailId] [int] NOT NULL,
 CONSTRAINT [PK_ApprovedMembershipInterval] PRIMARY KEY CLUSTERED 
(
	[ApprovedMembershipIntervalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE NONCLUSTERED INDEX IX_ApprovedMembershipInterval_MIId_DPHSLDId
     ON [ace].[ApprovedMembershipInterval] ([MembershipIntervalId],[DataPushHistorySchoolLevelDetailId])

GO

ALTER TABLE [ace].[ApprovedMembershipInterval]  WITH CHECK ADD  CONSTRAINT [FK_ApprovedMembershipInterval_ApprovedMembershipInterval] FOREIGN KEY([DataPushHistorySchoolLevelDetailId])
REFERENCES [datapush].[DataPushHistorySchoolLevelDetail] ([DataPushHistorySchoolLevelDetailId])
GO

ALTER TABLE [ace].[ApprovedMembershipInterval] CHECK CONSTRAINT [FK_ApprovedMembershipInterval_ApprovedMembershipInterval]
GO

ALTER TABLE [ace].[ApprovedMembershipInterval]  WITH CHECK ADD  CONSTRAINT [FK_ApprovedMembershipInterval_MembershipInterval] FOREIGN KEY([MembershipIntervalId])
REFERENCES [ace].[MembershipInterval] ([MembershipIntervalId])
GO

ALTER TABLE [ace].[ApprovedMembershipInterval] CHECK CONSTRAINT [FK_ApprovedMembershipInterval_MembershipInterval]
GO