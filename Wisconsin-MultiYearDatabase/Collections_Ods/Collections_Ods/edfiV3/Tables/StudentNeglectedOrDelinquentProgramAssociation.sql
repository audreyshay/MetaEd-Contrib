CREATE TABLE [edfiV3].[StudentNeglectedOrDelinquentProgramAssociation] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [BeginDate]                                DATE          NOT NULL,
    [EducationOrganizationId]                  INT           NOT NULL,
    [ProgramEducationOrganizationId]           INT           NOT NULL,
    [ProgramName]                              NVARCHAR (60) NOT NULL,
    [ProgramTypeDescriptorId]                  INT           NOT NULL,
    [StudentUSI]                               INT           NOT NULL,
    [NeglectedOrDelinquentProgramDescriptorId] INT           NULL,
    [ELAProgressLevelDescriptorId]             INT           NULL,
    [MathematicsProgressLevelDescriptorId]     INT           NULL,
    CONSTRAINT [V3_StudentNeglectedOrDelinquentProgramAssociation_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] Asc, [EducationOrganizationId] ASC, [StudentUSI] ASC, [BeginDate] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentNeglectedOrDelinquentProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[GeneralStudentProgramAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_StudentNeglectedOrDelinquentProgramAssociation_NeglectedOrDelinquentProgramDescriptor] FOREIGN KEY ([NeglectedOrDelinquentProgramDescriptorId]) REFERENCES [edfiV3].[NeglectedOrDelinquentProgramDescriptor] ([NeglectedOrDelinquentProgramDescriptorId]),
    CONSTRAINT [V3_FK_StudentNeglectedOrDelinquentProgramAssociation_ProgressLevelDescriptor] FOREIGN KEY ([ELAProgressLevelDescriptorId]) REFERENCES [edfiV3].[ProgressLevelDescriptor] ([ProgressLevelDescriptorId]),
    CONSTRAINT [V3_FK_StudentNeglectedOrDelinquentProgramAssociation_ProgressLevelDescriptor1] FOREIGN KEY ([MathematicsProgressLevelDescriptorId]) REFERENCES [edfiV3].[ProgressLevelDescriptor] ([ProgressLevelDescriptorId])
);
