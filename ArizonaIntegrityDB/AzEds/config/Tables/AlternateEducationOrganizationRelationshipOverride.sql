CREATE TABLE [config].[AlternateEducationOrganizationRelationshipOverride](
	[ParentEducationOrganizationId] [int] NOT NULL,
	[DependentEducationOrganizationId] [int] NOT NULL,
	[AlternateEducationOrganizationRelationshipTypeId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL
 CONSTRAINT [PK_AlternateEducationOrganizationRelationshipOverride] PRIMARY KEY CLUSTERED 
(
	[ParentEducationOrganizationId] ASC,
	[DependentEducationOrganizationId] ASC,
	[AlternateEducationOrganizationRelationshipTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [config].[AlternateEducationOrganizationRelationshipOverride]  WITH NOCHECK ADD  CONSTRAINT [FK_AlternateEducationOrganizationRelationshipOverride_AlternateEntityRelationshipType] FOREIGN KEY([AlternateEducationOrganizationRelationshipTypeId])
REFERENCES [entity].[AlternateEducationOrganizationRelationshipType] ([AlternateEducationOrganizationRelationshipTypeId])
GO

ALTER TABLE [config].[AlternateEducationOrganizationRelationshipOverride] CHECK CONSTRAINT [FK_AlternateEducationOrganizationRelationshipOverride_AlternateEntityRelationshipType]
GO


