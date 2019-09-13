CREATE TABLE [edfiV3].[StudentEducationOrganizationAssociationDisabilityDesignation] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [DisabilityDescriptorId]            INT      NOT NULL,
    [DisabilityDesignationDescriptorId] INT      NOT NULL,
    [EducationOrganizationId]           INT      NOT NULL,
    [StudentUSI]                        INT      NOT NULL,
    [CreateDate]                        DATETIME2 (7) NOT NULL,
    CONSTRAINT [V3_StudentEducationOrganizationAssociationDisabilityDesignation_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [DisabilityDescriptorId] ASC, [DisabilityDesignationDescriptorId] ASC, [EducationOrganizationId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationDisabilityDesignation_DisabilityDesignationDescriptor] FOREIGN KEY ([DisabilityDesignationDescriptorId]) REFERENCES [edfiV3].[DisabilityDesignationDescriptor] ([DisabilityDesignationDescriptorId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationDisabilityDesignation_StudentEducationOrganizationAssociationDisability] FOREIGN KEY ([ApiSchoolYear], [DisabilityDescriptorId], [EducationOrganizationId], [StudentUSI]) REFERENCES [edfiV3].[StudentEducationOrganizationAssociationDisability] ([ApiSchoolYear], [DisabilityDescriptorId], [EducationOrganizationId], [StudentUSI]) ON DELETE CASCADE
);

