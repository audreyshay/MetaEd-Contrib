CREATE TABLE [edfiV3].[StudentSpecialEducationProgramAssociationDisabilityDesignation] (
	[ApiSchoolYear]	   SMALLINT NOT NULL,
    [BeginDate]                         DATE          NOT NULL,
    [DisabilityDescriptorId]            INT           NOT NULL,
    [DisabilityDesignationDescriptorId] INT           NOT NULL,
    [EducationOrganizationId]           INT           NOT NULL,
    [ProgramEducationOrganizationId]    INT           NOT NULL,
    [ProgramName]                       NVARCHAR (60) NOT NULL,
    [ProgramTypeDescriptorId]           INT           NOT NULL,
    [StudentUSI]                        INT           NOT NULL,
    [CreateDate]                        DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_StudentSpecialEducationProgramAssociationDisabilityDesignation_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] Asc, [EducationOrganizationId] ASC, [StudentUSI] ASC, [BeginDate] ASC, [DisabilityDescriptorId] ASC, [DisabilityDesignationDescriptorId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentSpecialEducationProgramAssociationDisabilityDesignation_DisabilityDesignationDescriptor] FOREIGN KEY ([DisabilityDesignationDescriptorId]) REFERENCES [edfiV3].[DisabilityDesignationDescriptor] ([DisabilityDesignationDescriptorId]),
    CONSTRAINT [V3_FK_StudentSpecialEducationProgramAssociationDisabilityDesignation_StudentSpecialEducationProgramAssociationDisability] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [DisabilityDescriptorId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[StudentSpecialEducationProgramAssociationDisability] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [DisabilityDescriptorId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) ON DELETE CASCADE
);

