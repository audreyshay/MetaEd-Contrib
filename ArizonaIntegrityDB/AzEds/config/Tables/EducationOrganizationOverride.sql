CREATE TABLE [config].[EducationOrganizationOverride](
	[EducationOrganizationId] [int] NOT NULL,
	[StateOrganizationId] [nvarchar](60) NOT NULL,
	[NameOfInstitution] [nvarchar](75) NOT NULL,
	[ShortNameOfInstitution] [nvarchar](75) NULL,
	[WebSite] [nvarchar](255) NULL,
	[OperationalStatusTypeId] [int] NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_EducationOrganizationOverride] PRIMARY KEY CLUSTERED 
(
	[EducationOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [config].[EducationOrganizationOverride] ADD  CONSTRAINT [EducationOrganizationOverride_DF_Id]  DEFAULT (newid()) FOR [Id]
GO

ALTER TABLE [config].[EducationOrganizationOverride] ADD  CONSTRAINT [EducationOrganizationOverride_DF_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [config].[EducationOrganizationOverride]  WITH CHECK ADD  CONSTRAINT [FK_EducationOrganizationOverride_FiscalYear] FOREIGN KEY([FiscalYear])
REFERENCES [config].[FiscalYear] ([FiscalYear])
GO

ALTER TABLE [config].[EducationOrganizationOverride] CHECK CONSTRAINT [FK_EducationOrganizationOverride_FiscalYear]
GO

ALTER TABLE [config].[EducationOrganizationOverride]  WITH CHECK ADD  CONSTRAINT [FK_EducationOrganizationOverride_OperationalStatusType_OperationalStatusTypeId] FOREIGN KEY([OperationalStatusTypeId])
REFERENCES [entity].[OperationalStatusType] ([OperationalStatusTypeId])
GO

ALTER TABLE [config].[EducationOrganizationOverride] CHECK CONSTRAINT [FK_EducationOrganizationOverride_OperationalStatusType_OperationalStatusTypeId]
GO