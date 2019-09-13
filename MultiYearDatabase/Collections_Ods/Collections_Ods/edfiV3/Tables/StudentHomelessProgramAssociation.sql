CREATE TABLE [edfiV3].[StudentHomelessProgramAssociation] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [BeginDate]                                     DATE          NOT NULL,
    [EducationOrganizationId]                       INT           NOT NULL,
    [ProgramEducationOrganizationId]                INT           NOT NULL,
    [ProgramName]                                   NVARCHAR (60) NOT NULL,
    [ProgramTypeDescriptorId]                       INT           NOT NULL,
    [StudentUSI]                                    INT           NOT NULL,
    [HomelessPrimaryNighttimeResidenceDescriptorId] INT           NULL,
    [AwaitingFosterCare]                            BIT           NULL,
    [HomelessUnaccompaniedYouth]                    BIT           NULL,
    CONSTRAINT [V3_StudentHomelessProgramAssociation_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] Asc, [EducationOrganizationId] ASC, [StudentUSI] ASC, [BeginDate] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentHomelessProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[GeneralStudentProgramAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_StudentHomelessProgramAssociation_HomelessPrimaryNighttimeResidenceDescriptor] FOREIGN KEY ([HomelessPrimaryNighttimeResidenceDescriptorId]) REFERENCES [edfiV3].[HomelessPrimaryNighttimeResidenceDescriptor] ([HomelessPrimaryNighttimeResidenceDescriptorId])
);
