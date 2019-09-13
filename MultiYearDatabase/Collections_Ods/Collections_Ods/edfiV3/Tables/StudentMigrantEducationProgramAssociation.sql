CREATE TABLE [edfiV3].[StudentMigrantEducationProgramAssociation] (
	[ApiSchoolYear]	   SMALLINT NOT NULL,
    [BeginDate]                                DATE          NOT NULL,
    [EducationOrganizationId]                  INT           NOT NULL,
    [ProgramEducationOrganizationId]           INT           NOT NULL,
    [ProgramName]                              NVARCHAR (60) NOT NULL,
    [ProgramTypeDescriptorId]                  INT           NOT NULL,
    [StudentUSI]                               INT           NOT NULL,
    [PriorityForServices]                      BIT           NOT NULL,
    [LastQualifyingMove]                       DATE          NOT NULL,
    [ContinuationOfServicesReasonDescriptorId] INT           NULL,
    [USInitialEntry]                           DATE          NULL,
    [USMostRecentEntry]                        DATE          NULL,
    [USInitialSchoolEntry]                     DATE          NULL,
    [QualifyingArrivalDate]                    DATE          NULL,
    [StateResidencyDate]                       DATE          NULL,
    [EligibilityExpirationDate]                DATE          NULL,
    CONSTRAINT [V3_StudentMigrantEducationProgramAssociation_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] Asc, [EducationOrganizationId] ASC, [StudentUSI] ASC, [BeginDate] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC),
    CONSTRAINT [V3_FK_StudentMigrantEducationProgramAssociation_ContinuationOfServicesReasonDescriptor] FOREIGN KEY ([ContinuationOfServicesReasonDescriptorId]) REFERENCES [edfiV3].[ContinuationOfServicesReasonDescriptor] ([ContinuationOfServicesReasonDescriptorId]),
    CONSTRAINT [V3_FK_StudentMigrantEducationProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) REFERENCES [edfiV3].[GeneralStudentProgramAssociation] ([ApiSchoolYear], [EducationOrganizationId], [StudentUSI], [BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId]) ON DELETE CASCADE
);

