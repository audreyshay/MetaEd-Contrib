CREATE TABLE [edfiV3].[StudentEducationOrganizationAssociationLanguageUse]
(	[ApiSchoolYear]	   SMALLINT NOT NULL,
    [EducationOrganizationId] INT      NOT NULL,
    [LanguageDescriptorId]    INT      NOT NULL,
    [LanguageUseDescriptorId] INT      NOT NULL,
    [StudentUSI]              INT      NOT NULL,
    [CreateDate]              DATETIME2 (7) NOT NULL,
    CONSTRAINT [V3_StudentEducationOrganizationAssociationLanguageUse_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [LanguageDescriptorId] ASC, [LanguageUseDescriptorId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationLanguageUse_LanguageUseDescriptor] FOREIGN KEY ([LanguageUseDescriptorId]) REFERENCES [edfiV3].[LanguageUseDescriptor] ([LanguageUseDescriptorId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationLanguageUse_StudentEducationOrganizationAssociationLanguage] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [LanguageDescriptorId], [StudentUSI]) REFERENCES [edfiV3].[StudentEducationOrganizationAssociationLanguage] ([ApiSchoolYear], [EducationOrganizationId], [LanguageDescriptorId], [StudentUSI]) ON DELETE CASCADE
);
