CREATE TABLE [leadata].[StudentEducationOrganizationAssociationAZTribalAffiliation](
	[EducationOrganizationId] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[TribalAffiliationDescriptorId] [int] NOT NULL,
	[OtherAffiliation] [nvarchar](250) NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL CONSTRAINT [StudentEducationOrganizationAssociationAZTribalAffiliation_DF_LoadDate]  DEFAULT (GETUTCDATE()), 
	[HashValue] [binary](64) NOT NULL CONSTRAINT [StudentEducationOrganizationAssociationAZTribalAffiliation_DF_HashValue]  DEFAULT ((0)),
 CONSTRAINT [StudentEducationOrganizationAssociationAZTribalAffiliation_PK] PRIMARY KEY CLUSTERED 
(
	[EducationOrganizationId] ASC,
	[StudentUSI] ASC,
	[TribalAffiliationDescriptorId] ASC,
	[OtherAffiliation] ASC
)
) 
GO


ALTER TABLE [leadata].[StudentEducationOrganizationAssociationAZTribalAffiliation]
WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationAZTribalAffiliation_StudentEducationOrganizationAssociation]
FOREIGN KEY ([StudentUSI],[EducationOrganizationId] )
REFERENCES [leadata].[StudentEducationOrganizationAssociation] ([StudentUSI],[EducationOrganizationId])
ON DELETE CASCADE
GO