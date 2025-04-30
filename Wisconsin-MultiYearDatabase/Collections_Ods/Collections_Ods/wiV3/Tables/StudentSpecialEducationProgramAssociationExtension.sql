CREATE TABLE [wiV3].[StudentSpecialEducationProgramAssociationExtension] (
	[ApiSchoolYear]				 SMALLINT		NOT NULL,
	[BeginDate]                      DATE          NOT NULL,
    [EducationOrganizationId]        INT           NOT NULL,
    [ProgramEducationOrganizationId] INT           NOT NULL,
    [ProgramName]                    NVARCHAR (60) NOT NULL,
    [ProgramTypeDescriptorId]        INT           NOT NULL,
    [StudentUSI]                     INT           NOT NULL,
    [FapeResponsibleSchoolId]        INT           NULL,
    [CreateDate]                     DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_StudentSpecialEducationProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [StudentUSI] ASC, [BeginDate] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentSpecialEducationProgramAssociationExtension_School] FOREIGN KEY ([ApiSchoolYear], [FapeResponsibleSchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolyear], [SchoolId]),
    CONSTRAINT [V3_FK_StudentSpecialEducationProgramAssociationExtension_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[StudentSpecialEducationProgramAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) ON DELETE CASCADE
);

