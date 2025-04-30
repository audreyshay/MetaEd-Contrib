CREATE TABLE [wiV3].[StudentCTEProgramAssociationExtension] (
	[ApiSchoolYear]				 SMALLINT		NOT NULL,
	[BeginDate]                                            DATE          NOT NULL,
    [EducationOrganizationId]                              INT           NOT NULL,
    [ProgramEducationOrganizationId]                       INT           NOT NULL,
    [ProgramName]                                          NVARCHAR (60) NOT NULL,
    [ProgramTypeDescriptorId]                              INT           NOT NULL,
    [StudentUSI]                                           INT           NOT NULL,
    [CertificatedProgramStatusDescriptorId]                INT           NULL,
    [StateEndorsedRegionalCareerPathwayStatusDescriptorId] INT           NULL,
    [CreateDate]                                           DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_StudentCTEProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [StudentUSI] ASC, [BeginDate] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentCTEProgramAssociationExtension_CertificatedProgramStatusDescriptor] FOREIGN KEY ([CertificatedProgramStatusDescriptorId]) REFERENCES [wiV3].[CertificatedProgramStatusDescriptor] ([CertificatedProgramStatusDescriptorId]),
    CONSTRAINT [V3_FK_StudentCTEProgramAssociationExtension_StateEndorsedRegionalCareerPathwayStatusDescriptor] FOREIGN KEY ([StateEndorsedRegionalCareerPathwayStatusDescriptorId]) REFERENCES [wiV3].[StateEndorsedRegionalCareerPathwayStatusDescriptor] ([StateEndorsedRegionalCareerPathwayStatusDescriptorId]),
    CONSTRAINT [V3_FK_StudentCTEProgramAssociationExtension_StudentCTEProgramAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[StudentCTEProgramAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) ON DELETE CASCADE
);

