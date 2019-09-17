CREATE TABLE [config].[LocalEducationAgencyOverride](
	[LocalEducationAgencyId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[ParentLocalEducationAgencyId] [int] NULL,
	[LocalEducationAgencyCategoryTypeId] [int] NOT NULL,
	[CharterStatusTypeId] [int] NULL,
	[EducationServiceCenterId] [int] NULL,
	[StateEducationAgencyId] [int] NULL,
 CONSTRAINT [PK_LocalEducationAgencyOverride] PRIMARY KEY CLUSTERED 
(
	[LocalEducationAgencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [config].[LocalEducationAgencyOverride]  WITH NOCHECK ADD  CONSTRAINT [FK_LocalEducationAgencyOverride_CharterStatusType_CharterStatusTypeId] FOREIGN KEY([CharterStatusTypeId])
REFERENCES [entity].[CharterStatusType] ([CharterStatusTypeId])
GO

ALTER TABLE [config].[LocalEducationAgencyOverride] CHECK CONSTRAINT [FK_LocalEducationAgencyOverride_CharterStatusType_CharterStatusTypeId]
GO

ALTER TABLE [config].[LocalEducationAgencyOverride]  WITH NOCHECK ADD  CONSTRAINT [FK_LocalEducationAgencyOverride_FiscalYear] FOREIGN KEY([FiscalYear])
REFERENCES [config].[FiscalYear] ([FiscalYear])
GO

ALTER TABLE [config].[LocalEducationAgencyOverride] CHECK CONSTRAINT [FK_LocalEducationAgencyOverride_FiscalYear]
GO

ALTER TABLE [config].[LocalEducationAgencyOverride]  WITH NOCHECK ADD  CONSTRAINT [FK_LocalEducationAgencyOverride_LocalEducationAgencyCategoryType_LocalEducationAgencyCategoryTypeId] FOREIGN KEY([LocalEducationAgencyCategoryTypeId])
REFERENCES [entity].[LocalEducationAgencyCategoryType] ([LocalEducationAgencyCategoryTypeId])
GO

ALTER TABLE [config].[LocalEducationAgencyOverride] CHECK CONSTRAINT [FK_LocalEducationAgencyOverride_LocalEducationAgencyCategoryType_LocalEducationAgencyCategoryTypeId]
GO
