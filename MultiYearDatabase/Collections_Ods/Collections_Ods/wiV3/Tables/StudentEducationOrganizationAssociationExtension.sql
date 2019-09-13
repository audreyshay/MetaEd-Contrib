CREATE TABLE [wiV3].[StudentEducationOrganizationAssociationExtension] (
    [ApiSchoolYear]				 SMALLINT		NOT NULL,
	[EducationOrganizationId]         INT      NOT NULL,
    [StudentUSI]                      INT      NOT NULL,
    [ResidentLocalEducationAgencyId] INT      NULL,
    [CreateDate]                      DATETIME2 (7) NOT NULL,
    CONSTRAINT [V3_StudentEducationOrganizationAssociationExtension_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationExtension_LocalEducationAgency] FOREIGN KEY ([ApiSchoolYear], [ResidentLocalEducationAgencyId]) REFERENCES [edfiV3].[LocalEducationAgency] ([ApiSchoolYear], [LocalEducationAgencyId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationExtension_StudentEducationOrganizationAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI]) REFERENCES [edfiV3].[StudentEducationOrganizationAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI]) ON DELETE CASCADE
);


