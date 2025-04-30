CREATE TABLE [edfiV3].[StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService] (
	[ApiSchoolYear]									SMALLINT NOT NULL,
    [BeginDate]                                     DATE          NOT NULL,
    [EducationOrganizationId]                       INT           NOT NULL,
    [LanguageInstructionProgramServiceDescriptorId] INT           NOT NULL,
    [ProgramEducationOrganizationId]                INT           NOT NULL,
    [ProgramName]                                   NVARCHAR (60) NOT NULL,
    [ProgramTypeDescriptorId]                       INT           NOT NULL,
    [StudentUSI]                                    INT           NOT NULL,
    [PrimaryIndicator]                              BIT           NULL,
    [ServiceBeginDate]                              DATE          NULL,
    [ServiceEndDate]                                DATE          NULL,
    [CreateDate]									DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [StudentUSI] ASC, [BeginDate] ASC, [LanguageInstructionProgramServiceDescriptorId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_LanguageInstructionProgramServiceDescriptor] FOREIGN KEY ([LanguageInstructionProgramServiceDescriptorId]) REFERENCES [edfiV3].[LanguageInstructionProgramServiceDescriptor] ([LanguageInstructionProgramServiceDescriptorId]),
    CONSTRAINT [V3_FK_StudentLanguageInstructionProgramAssociationLanguageInstructionProgramService_StudentLanguageInstructionProgramAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[StudentLanguageInstructionProgramAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) ON DELETE CASCADE
);