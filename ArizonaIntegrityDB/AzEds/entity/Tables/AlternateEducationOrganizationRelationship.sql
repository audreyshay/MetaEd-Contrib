CREATE TABLE [entity].[AlternateEducationOrganizationRelationship](
    [FiscalYear]              INT            NOT NULL,
	[ParentEducationOrganizationId] [int] NOT NULL,
	[DependentEducationOrganizationId] [int] NOT NULL,
	[AlternateEducationOrganizationRelationshipTypeId]  [int] NOT NULL,
 CONSTRAINT [FK_AlternateEducationOrganizationRelationship_EducationOrganization1] FOREIGN KEY([ParentEducationOrganizationId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]),
 CONSTRAINT [FK_AlternateEducationOrganizationRelationship_EducationOrganization2] FOREIGN KEY([DependentEducationOrganizationId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]),
 CONSTRAINT [FK_AlternateEducationOrganizationRelationship_AlternateEntityRelationshipType] FOREIGN KEY([AlternateEducationOrganizationRelationshipTypeId])REFERENCES [entity].[AlternateEducationOrganizationRelationshipType] ([AlternateEducationOrganizationRelationshipTypeId]), 
    CONSTRAINT [PK_AlternateEducationOrganizationRelationship] PRIMARY KEY ([FiscalYear], [ParentEducationOrganizationId], [DependentEducationOrganizationId], [AlternateEducationOrganizationRelationshipTypeId] )
); 