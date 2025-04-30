CREATE TABLE [edfiV3].[StudentEducationOrganizationAssociationLanguage]
(	[ApiSchoolYear]	   SMALLINT NOT NULL,
    [EducationOrganizationId] INT      NOT NULL,
    [LanguageDescriptorId]    INT      NOT NULL,
    [StudentUSI]              INT      NOT NULL,
    [CreateDate]              DATETIME2 (7) NOT NULL,
    CONSTRAINT [V3_StudentEducationOrganizationAssociationLanguage_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [LanguageDescriptorId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationLanguage_LanguageDescriptor] FOREIGN KEY ([LanguageDescriptorId]) REFERENCES [edfiV3].[LanguageDescriptor] ([LanguageDescriptorId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationLanguage_StudentEducationOrganizationAssociation] FOREIGN KEY ([ApiSchoolYear],[EducationOrganizationId], [StudentUSI]) REFERENCES [edfiV3].[StudentEducationOrganizationAssociation] ([ApiSchoolYear],[EducationOrganizationId], [StudentUSI]) ON DELETE CASCADE
);