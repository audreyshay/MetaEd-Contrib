CREATE TABLE [wiV3].[StudentCTEProgramAssociationCTEConcentrationCteProgramArea] (
	[ApiSchoolYear]				 SMALLINT		NOT NULL,
	[BeginDate]							DATE			NOT NULL,
    [CteProgramAreaDescriptorId]		INT				NOT NULL,
    [EducationOrganizationId]			INT				NOT NULL,
    [ProgramEducationOrganizationId]	INT				NOT NULL,
    [ProgramName]						NVARCHAR (60)	NOT NULL,
    [ProgramTypeDescriptorId]			INT				NOT NULL,
    [StudentUSI]						INT				NOT NULL,
    [CreateDate]						DATETIME2 (7)		NOT NULL,
    CONSTRAINT [V3_StudentCTEProgramAssociationCTEConcentrationCteProgramArea_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [BeginDate] ASC, [CteProgramAreaDescriptorId] ASC, [EducationOrganizationId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentCTEProgramAssociationCTEConcentrationCteProgramArea_CteProgramAreaDescriptor] FOREIGN KEY ([CteProgramAreaDescriptorId]) REFERENCES [wiV3].[CteProgramAreaDescriptor] ([CteProgramAreaDescriptorId]),
    CONSTRAINT [V3_FK_StudentCTEProgramAssociationCTEConcentrationCteProgramArea_StudentCTEProgramAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[StudentCTEProgramAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) ON DELETE CASCADE
);
