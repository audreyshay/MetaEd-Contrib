CREATE TABLE [edfiV3].[StudentEducationOrganizationAssociationDisability] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [DisabilityDescriptorId]                        INT           NOT NULL,
    [EducationOrganizationId]                       INT           NOT NULL,
    [StudentUSI]                                    INT           NOT NULL,
    [DisabilityDiagnosis]                           NVARCHAR (80) NULL,
    [OrderOfDisability]                             INT           NULL,
    [DisabilityDeterminationSourceTypeDescriptorId] INT           NULL,
    [CreateDate]                                    DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_StudentEducationOrganizationAssociationDisability_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [DisabilityDescriptorId] ASC, [EducationOrganizationId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationDisability_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId]) REFERENCES [edfiV3].[DisabilityDescriptor] ([DisabilityDescriptorId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationDisability_DisabilityDeterminationSourceTypeDescriptor] FOREIGN KEY ([DisabilityDeterminationSourceTypeDescriptorId]) REFERENCES [edfiV3].[DisabilityDeterminationSourceTypeDescriptor] ([DisabilityDeterminationSourceTypeDescriptorId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationDisability_StudentEducationOrganizationAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI]) REFERENCES [edfiV3].[StudentEducationOrganizationAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI]) ON DELETE CASCADE
);




GO