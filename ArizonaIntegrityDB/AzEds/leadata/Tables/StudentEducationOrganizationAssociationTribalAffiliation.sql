
CREATE TABLE [leadata].[StudentEducationOrganizationAssociationTribalAffiliation]
(
	[EducationOrganizationId] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[TribalAffiliationDescriptorId] [int] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL CONSTRAINT [StudentEducationOrganizationAssociationTribalAffiliation_DF_LoadDate]  DEFAULT (getutcdate()),
	[HashValue]	[binary](64) CONSTRAINT [StudentEducationOrganizationAssociationTribalAffiliation_DF_HashValue] DEFAULT (00) NOT NULL,
 CONSTRAINT [StudentEducationOrganizationAssociationTribalAffiliation_PK] PRIMARY KEY CLUSTERED 
  (
	[EducationOrganizationId] ASC,
	[StudentUSI] ASC,
	[TribalAffiliationDescriptorId] ASC
  )
)
GO

ALTER TABLE [leadata].[StudentEducationOrganizationAssociationTribalAffiliation]
WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationTribalAffiliation_StudentEducationOrganizationAssociation]
FOREIGN KEY ([StudentUSI],[EducationOrganizationId] )
REFERENCES [leadata].[StudentEducationOrganizationAssociation] ([StudentUSI],[EducationOrganizationId])
ON DELETE CASCADE
GO