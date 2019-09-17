CREATE TABLE [config].[SchoolOverride](
	[SchoolId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[LocalEducationAgencyId] [int] NULL,
	[SchoolTypeId] [int] NULL,
	[CharterStatusTypeId] [int] NULL,
	[TitleIPartASchoolDesignationTypeId] [int] NULL,
	[MagnetSpecialProgramEmphasisSchoolTypeId] [int] NULL,
	[AdministrativeFundingControlDescriptorId] [int] NULL,
	[InternetAccessTypeId] [int] NULL,
	[CharterApprovalAgencyTypeId] [int] NULL,
	[CharterApprovalSchoolYear] [smallint] NULL,
 CONSTRAINT [PK_SchoolOverride] PRIMARY KEY CLUSTERED 
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [config].[SchoolOverride]  WITH NOCHECK ADD  CONSTRAINT [FK_SchoolOverride_CharterStatusType_CharterStatusTypeId] FOREIGN KEY([CharterStatusTypeId])
REFERENCES [entity].[CharterStatusType] ([CharterStatusTypeId])
GO

ALTER TABLE [config].[SchoolOverride] CHECK CONSTRAINT [FK_SchoolOverride_CharterStatusType_CharterStatusTypeId]
GO

ALTER TABLE [config].[SchoolOverride]  WITH CHECK ADD  CONSTRAINT [FK_SchoolOverride_FiscalYear] FOREIGN KEY([FiscalYear])
REFERENCES [config].[FiscalYear] ([FiscalYear])
GO

ALTER TABLE [config].[SchoolOverride] CHECK CONSTRAINT [FK_SchoolOverride_FiscalYear]
GO

ALTER TABLE [config].[SchoolOverride]  WITH NOCHECK ADD  CONSTRAINT [FK_SchoolOverride_SchoolType_SchoolTypeId] FOREIGN KEY([SchoolTypeId])
REFERENCES [entity].[SchoolType] ([SchoolTypeId])
GO

ALTER TABLE [config].[SchoolOverride] CHECK CONSTRAINT [FK_SchoolOverride_SchoolType_SchoolTypeId]
GO
