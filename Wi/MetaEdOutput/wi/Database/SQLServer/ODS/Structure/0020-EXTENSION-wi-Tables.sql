-- Table [wi].[CertificatedProgramStatusDescriptor] --
CREATE TABLE [wi].[CertificatedProgramStatusDescriptor] (
    [CertificatedProgramStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CertificatedProgramStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CertificatedProgramStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [wi].[CountDateNameDescriptor] --
CREATE TABLE [wi].[CountDateNameDescriptor] (
    [CountDateNameDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CountDateNameDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CountDateNameDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [wi].[CountDateReceivingServiceDescriptor] --
CREATE TABLE [wi].[CountDateReceivingServiceDescriptor] (
    [CountDateReceivingServiceDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CountDateReceivingServiceDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CountDateReceivingServiceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [wi].[CteProgramAreaDescriptor] --
CREATE TABLE [wi].[CteProgramAreaDescriptor] (
    [CteProgramAreaDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CteProgramAreaDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CteProgramAreaDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [wi].[DisciplineActionExtension] --
CREATE TABLE [wi].[DisciplineActionExtension] (
    [DisciplineActionIdentifier] [NVARCHAR](20) NOT NULL,
    [DisciplineDate] [DATE] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ModifiedTermDescriptorId] [INT] NULL,
    [EarlyReinstatementCondition] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [DisciplineActionExtension_PK] PRIMARY KEY CLUSTERED (
        [DisciplineActionIdentifier] ASC,
        [DisciplineDate] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [wi].[DisciplineActionExtension] ADD CONSTRAINT [DisciplineActionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [wi].[IacCodeDescriptor] --
CREATE TABLE [wi].[IacCodeDescriptor] (
    [IacCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IacCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IacCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [wi].[ModifiedTermDescriptor] --
CREATE TABLE [wi].[ModifiedTermDescriptor] (
    [ModifiedTermDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ModifiedTermDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ModifiedTermDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [wi].[StateEndorsedRegionalCareerPathwayStatusDescriptor] --
CREATE TABLE [wi].[StateEndorsedRegionalCareerPathwayStatusDescriptor] (
    [StateEndorsedRegionalCareerPathwayStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StateEndorsedRegionalCareerPathwayStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StateEndorsedRegionalCareerPathwayStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [wi].[StudentCTEProgramAssociationCTEConcentrationCteProgramArea] --
CREATE TABLE [wi].[StudentCTEProgramAssociationCTEConcentrationCteProgramArea] (
    [BeginDate] [DATE] NOT NULL,
    [CteProgramAreaDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentCTEProgramAssociationCTEConcentrationCteProgramArea_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [CteProgramAreaDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [wi].[StudentCTEProgramAssociationCTEConcentrationCteProgramArea] ADD CONSTRAINT [StudentCTEProgramAssociationCTEConcentrationCteProgramArea_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [wi].[StudentCTEProgramAssociationExtension] --
CREATE TABLE [wi].[StudentCTEProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CertificatedProgramStatusDescriptorId] [INT] NULL,
    [StateEndorsedRegionalCareerPathwayStatusDescriptorId] [INT] NULL,
    [CTEConcentrationIacCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentCTEProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [wi].[StudentCTEProgramAssociationExtension] ADD CONSTRAINT [StudentCTEProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [wi].[StudentDisciplineIncidentAssociationExtension] --
CREATE TABLE [wi].[StudentDisciplineIncidentAssociationExtension] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [SeriousBodilyInjury] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentDisciplineIncidentAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [wi].[StudentDisciplineIncidentAssociationExtension] ADD CONSTRAINT [StudentDisciplineIncidentAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [wi].[StudentEducationOrganizationAssociationExtension] --
CREATE TABLE [wi].[StudentEducationOrganizationAssociationExtension] (
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ResidentLocalEducationAgencyId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [wi].[StudentEducationOrganizationAssociationExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [wi].[StudentSchoolAssociationExtension] --
CREATE TABLE [wi].[StudentSchoolAssociationExtension] (
    [EntryDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ParentPlacedPrivate] [BIT] NULL,
    [CompletedSchoolTerm] [BIT] NULL,
    [ExpectedTransferLocalEducationAgencyId] [INT] NULL,
    [ExpectedTransferSchoolId] [INT] NULL,
    [ActualDaysAttendance] [DECIMAL](4, 1) NULL,
    [PossibleDaysAttendance] [DECIMAL](4, 1) NULL,
    [PrivateSchoolChoiceProgramParticipant] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [wi].[StudentSchoolAssociationExtension] ADD CONSTRAINT [StudentSchoolAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [wi].[StudentSchoolAssociationReceivingService] --
CREATE TABLE [wi].[StudentSchoolAssociationReceivingService] (
    [CountDateNameDescriptorId] [INT] NOT NULL,
    [EntryDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CountDateReceivingServiceDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationReceivingService_PK] PRIMARY KEY CLUSTERED (
        [CountDateNameDescriptorId] ASC,
        [EntryDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [wi].[StudentSchoolAssociationReceivingService] ADD CONSTRAINT [StudentSchoolAssociationReceivingService_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [wi].[StudentSpecialEducationProgramAssociationExtension] --
CREATE TABLE [wi].[StudentSpecialEducationProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [FapeResponsibleSchoolId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentSpecialEducationProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [wi].[StudentSpecialEducationProgramAssociationExtension] ADD CONSTRAINT [StudentSpecialEducationProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

