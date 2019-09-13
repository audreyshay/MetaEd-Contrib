CREATE TABLE [edfiV3].[StudentSpecialEducationProgramAssociationDisability] (
	[ApiSchoolYear]	   SMALLINT NOT NULL,
    [BeginDate]                                     DATE          NOT NULL,
    [DisabilityDescriptorId]                        INT           NOT NULL,
    [EducationOrganizationId]                       INT           NOT NULL,
    [ProgramEducationOrganizationId]                INT           NOT NULL,
    [ProgramName]                                   NVARCHAR (60) NOT NULL,
    [ProgramTypeDescriptorId]                       INT           NOT NULL,
    [StudentUSI]                                    INT           NOT NULL,
    [DisabilityDiagnosis]                           NVARCHAR (80) NULL,
    [OrderOfDisability]                             INT           NULL,
    [DisabilityDeterminationSourceTypeDescriptorId] INT           NULL,
    [CreateDate]                                    DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_StudentSpecialEducationProgramAssociationDisability_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] Asc, [EducationOrganizationId] ASC, [StudentUSI] ASC, [BeginDate] ASC, [DisabilityDescriptorId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentSpecialEducationProgramAssociationDisability_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId]) REFERENCES [edfiV3].[DisabilityDescriptor] ([DisabilityDescriptorId]),
    CONSTRAINT [V3_FK_StudentSpecialEducationProgramAssociationDisability_DisabilityDeterminationSourceTypeDescriptor] FOREIGN KEY ([DisabilityDeterminationSourceTypeDescriptorId]) REFERENCES [edfiV3].[DisabilityDeterminationSourceTypeDescriptor] ([DisabilityDeterminationSourceTypeDescriptorId]),
    CONSTRAINT [V3_FK_StudentSpecialEducationProgramAssociationDisability_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[StudentSpecialEducationProgramAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) ON DELETE CASCADE
);
