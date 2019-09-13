CREATE TABLE [edfiV3].[StudentEducationOrganizationAssociationRace] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [EducationOrganizationId] INT      NOT NULL,
    [RaceDescriptorId]        INT      NOT NULL,
    [StudentUSI]              INT      NOT NULL,
    [CreateDate]              DATETIME2 (7) NOT NULL,
    CONSTRAINT [V3_StudentEducationOrganizationAssociationRace_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [RaceDescriptorId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationRace_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId]) REFERENCES [edfiV3].[RaceDescriptor] ([RaceDescriptorId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationRace_StudentEducationOrganizationAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI]) REFERENCES [edfiV3].[StudentEducationOrganizationAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI]) ON DELETE CASCADE
);

