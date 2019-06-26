-- Table [de].[AcceptanceStatusDescriptor] --
CREATE TABLE [de].[AcceptanceStatusDescriptor] (
    [AcceptanceStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AcceptanceStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AcceptanceStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[AllegedBullyingVictim] --
CREATE TABLE [de].[AllegedBullyingVictim] (
    [AllegedIncidentDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [FollowupComment] [NVARCHAR](1024) NULL,
    [IncidentDescription] [NVARCHAR](1024) NULL,
    [IncidentLocationDescriptorId] [INT] NULL,
    [MultiplePriorEvent] [BIT] NULL,
    [ReasonIncidentRelatedToDescriptorId] [INT] NOT NULL,
    [ReportDate] [DATE] NOT NULL,
    [ReportedBy] [NVARCHAR](50) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [AllegedBullyingVictim_PK] PRIMARY KEY CLUSTERED (
        [AllegedIncidentDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[AllegedBullyingVictim] ADD CONSTRAINT [AllegedBullyingVictim_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[AllegedBullyingVictim] ADD CONSTRAINT [AllegedBullyingVictim_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[AllegedBullyingVictim] ADD CONSTRAINT [AllegedBullyingVictim_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[AllegedBullyingVictimBullyingCategory] --
CREATE TABLE [de].[AllegedBullyingVictimBullyingCategory] (
    [AllegedIncidentDate] [DATE] NOT NULL,
    [BullyingCategoryDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [AllegedBullyingVictimBullyingCategory_PK] PRIMARY KEY CLUSTERED (
        [AllegedIncidentDate] ASC,
        [BullyingCategoryDescriptorId] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[AllegedBullyingVictimBullyingCategory] ADD CONSTRAINT [AllegedBullyingVictimBullyingCategory_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[APExamCodeDescriptor] --
CREATE TABLE [de].[APExamCodeDescriptor] (
    [APExamCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [APExamCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [APExamCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[AttendanceConfigurationCategoryDescriptor] --
CREATE TABLE [de].[AttendanceConfigurationCategoryDescriptor] (
    [AttendanceConfigurationCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AttendanceConfigurationCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AttendanceConfigurationCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[BullyingCategoryDescriptor] --
CREATE TABLE [de].[BullyingCategoryDescriptor] (
    [BullyingCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [BullyingCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [BullyingCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[CalendarDateExtension] --
CREATE TABLE [de].[CalendarDateExtension] (
    [CalendarCode] [NVARCHAR](60) NOT NULL,
    [Date] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [CycleDescriptorId] [INT] NULL,
    [MembershipDayValue] [DECIMAL](4, 3) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [CalendarDateExtension_PK] PRIMARY KEY CLUSTERED (
        [CalendarCode] ASC,
        [Date] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[CalendarDateExtension] ADD CONSTRAINT [CalendarDateExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[CertificateCategoryDescriptor] --
CREATE TABLE [de].[CertificateCategoryDescriptor] (
    [CertificateCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CertificateCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CertificateCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[CertificationDescriptor] --
CREATE TABLE [de].[CertificationDescriptor] (
    [CertificationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CertificationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CertificationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[ChoiceCategoryDescriptor] --
CREATE TABLE [de].[ChoiceCategoryDescriptor] (
    [ChoiceCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ChoiceCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ChoiceCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[CIPCourse] --
CREATE TABLE [de].[CIPCourse] (
    [CIPCode] [NVARCHAR](120) NOT NULL,
    [LocalEducationAgencyId] [INT] NOT NULL,
    [Pathway] [INT] NULL,
    [FundingLevel] [INT] NULL,
    [Cluster] [INT] NULL,
    [CourseName] [NVARCHAR](255) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CIPCourse_PK] PRIMARY KEY CLUSTERED (
        [CIPCode] ASC,
        [LocalEducationAgencyId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[CIPCourse] ADD CONSTRAINT [CIPCourse_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[CIPCourse] ADD CONSTRAINT [CIPCourse_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[CIPCourse] ADD CONSTRAINT [CIPCourse_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[ClassPeriodCycle] --
CREATE TABLE [de].[ClassPeriodCycle] (
    [ClassPeriodName] [NVARCHAR](60) NOT NULL,
    [CycleDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [Timeslot] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [ClassPeriodCycle_PK] PRIMARY KEY CLUSTERED (
        [ClassPeriodName] ASC,
        [CycleDescriptorId] ASC,
        [SchoolId] ASC,
        [Timeslot] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[ClassPeriodCycle] ADD CONSTRAINT [ClassPeriodCycle_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[ClassPeriodExtension] --
CREATE TABLE [de].[ClassPeriodExtension] (
    [ClassPeriodName] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [AttendancePeriodOrder] [INT] NULL,
    [Description] [NVARCHAR](1024) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [ClassPeriodExtension_PK] PRIMARY KEY CLUSTERED (
        [ClassPeriodName] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[ClassPeriodExtension] ADD CONSTRAINT [ClassPeriodExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[CoreSubjectDescriptor] --
CREATE TABLE [de].[CoreSubjectDescriptor] (
    [CoreSubjectDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CoreSubjectDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CoreSubjectDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[CourseExtension] --
CREATE TABLE [de].[CourseExtension] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [Active] [BIT] NULL,
    [APExamCodeDescriptorId] [INT] NULL,
    [AveragePassTimeMinutesPerWeek] [NVARCHAR](20) NULL,
    [CoreSubjectDescriptorId] [INT] NULL,
    [FractionOfYearOffered] [NVARCHAR](20) NULL,
    [MinutesPerWeekAverage] [NVARCHAR](20) NULL,
    [SecondaryStaffClassroomServiceStatusDescriptorId] [INT] NULL,
    [StaffCredentialFieldDescriptorId] [INT] NULL,
    [SecondaryStaffCredentialFieldDescriptorId] [INT] NULL,
    [SecondaryStaffRoleDescriptorId] [INT] NULL,
    [UnitCountExceptionSchoolId] [INT] NULL,
    [LevelNumer] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [CourseExtension_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[CourseExtension] ADD CONSTRAINT [CourseExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[CycleDescriptor] --
CREATE TABLE [de].[CycleDescriptor] (
    [CycleDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CycleDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CycleDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[DiplomaCertificateCategoryDescriptor] --
CREATE TABLE [de].[DiplomaCertificateCategoryDescriptor] (
    [DiplomaCertificateCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DiplomaCertificateCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DiplomaCertificateCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[DisciplineDispositionDescriptor] --
CREATE TABLE [de].[DisciplineDispositionDescriptor] (
    [DisciplineDispositionDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DisciplineDispositionDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DisciplineDispositionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[DisciplineIncidentCode] --
CREATE TABLE [de].[DisciplineIncidentCode] (
    [BehaviorDescriptorId] [INT] NOT NULL,
    [Felony] [BIT] NULL,
    [VictimRequired] [BIT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [DisciplineIncidentCode_PK] PRIMARY KEY CLUSTERED (
        [BehaviorDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[DisciplineIncidentCode] ADD CONSTRAINT [DisciplineIncidentCode_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[DisciplineIncidentCode] ADD CONSTRAINT [DisciplineIncidentCode_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[DisciplineIncidentCode] ADD CONSTRAINT [DisciplineIncidentCode_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[DisciplineIncidentExtension] --
CREATE TABLE [de].[DisciplineIncidentExtension] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [LawEnforcementBadgeNumber] [NVARCHAR](10) NULL,
    [LawEnforcementDepartment] [NVARCHAR](255) NULL,
    [LawEnforcementNotifyDate] [DATE] NULL,
    [LawEnforcementOfficerName] [NVARCHAR](100) NULL,
    [DisciplineIncidentLastModifiedDate] [DATETIME2](7) NULL,
    [DisciplineIncidentChangeUID] [NVARCHAR](20) NULL,
    [DisciplineIncidentCreationUID] [NVARCHAR](20) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [DisciplineIncidentExtension_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[DisciplineIncidentExtension] ADD CONSTRAINT [DisciplineIncidentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[DisciplineIncidentReason] --
CREATE TABLE [de].[DisciplineIncidentReason] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [IncidentRelatedToDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [IncidentRelatedToChangeUID] [NVARCHAR](20) NULL,
    [IncidentRelatedToLastModifiedDate] [DATETIME2](7) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [DisciplineIncidentReason_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [IncidentRelatedToDescriptorId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[DisciplineIncidentReason] ADD CONSTRAINT [DisciplineIncidentReason_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[DisciplineIncidentReferral] --
CREATE TABLE [de].[DisciplineIncidentReferral] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [ReferralDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [DisciplineIncidentReferral_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [ReferralDescriptorId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[DisciplineIncidentReferral] ADD CONSTRAINT [DisciplineIncidentReferral_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[EnrollmentTypeDescriptor] --
CREATE TABLE [de].[EnrollmentTypeDescriptor] (
    [EnrollmentTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EnrollmentTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EnrollmentTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[FerpaOptOutDescriptor] --
CREATE TABLE [de].[FerpaOptOutDescriptor] (
    [FerpaOptOutDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FerpaOptOutDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FerpaOptOutDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[FollowupCategoryDescriptor] --
CREATE TABLE [de].[FollowupCategoryDescriptor] (
    [FollowupCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FollowupCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FollowupCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[FundingNeedsCategoryDescriptor] --
CREATE TABLE [de].[FundingNeedsCategoryDescriptor] (
    [FundingNeedsCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FundingNeedsCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FundingNeedsCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[GradeTypeDetail] --
CREATE TABLE [de].[GradeTypeDetail] (
    [GradeTypeDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [GradeTypeOrder] [INT] NULL,
    [GradeTypeWhenTakenDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [GradeTypeDetail_PK] PRIMARY KEY CLUSTERED (
        [GradeTypeDescriptorId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[GradeTypeDetail] ADD CONSTRAINT [GradeTypeDetail_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[GradeTypeDetail] ADD CONSTRAINT [GradeTypeDetail_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[GradeTypeDetail] ADD CONSTRAINT [GradeTypeDetail_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[GradeTypeWhenTakenDescriptor] --
CREATE TABLE [de].[GradeTypeWhenTakenDescriptor] (
    [GradeTypeWhenTakenDescriptorId] [INT] NOT NULL,
    CONSTRAINT [GradeTypeWhenTakenDescriptor_PK] PRIMARY KEY CLUSTERED (
        [GradeTypeWhenTakenDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[GradingPeriodExtension] --
CREATE TABLE [de].[GradingPeriodExtension] (
    [GradingPeriodDescriptorId] [INT] NOT NULL,
    [PeriodSequence] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [EndWeek] [INT] NULL,
    [StartWeek] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [GradingPeriodExtension_PK] PRIMARY KEY CLUSTERED (
        [GradingPeriodDescriptorId] ASC,
        [PeriodSequence] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[GradingPeriodExtension] ADD CONSTRAINT [GradingPeriodExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[ImmunizationCodeDescriptor] --
CREATE TABLE [de].[ImmunizationCodeDescriptor] (
    [ImmunizationCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ImmunizationCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ImmunizationCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[IncidentRelatedToDescriptor] --
CREATE TABLE [de].[IncidentRelatedToDescriptor] (
    [IncidentRelatedToDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IncidentRelatedToDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IncidentRelatedToDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[InjuryDescriptor] --
CREATE TABLE [de].[InjuryDescriptor] (
    [InjuryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [InjuryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [InjuryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[LevelDetail] --
CREATE TABLE [de].[LevelDetail] (
    [LevelNumber] [INT] NOT NULL,
    [Mark] [NVARCHAR](3) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [LevelDescription] [NVARCHAR](1024) NULL,
    [PassingMark] [BIT] NULL,
    [PointValue] [DECIMAL](7, 4) NULL,
    [ReportCardPrintValue] [NVARCHAR](3) NULL,
    [TranscriptPrintValue] [NVARCHAR](3) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [LevelDetail_PK] PRIMARY KEY CLUSTERED (
        [LevelNumber] ASC,
        [Mark] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[LevelDetail] ADD CONSTRAINT [LevelDetail_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[LevelDetail] ADD CONSTRAINT [LevelDetail_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[LevelDetail] ADD CONSTRAINT [LevelDetail_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[MedicalAlert] --
CREATE TABLE [de].[MedicalAlert] (
    [MedicalAlertCategoryDescriptorId] [INT] NOT NULL,
    [Sensitive] [BIT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [MedicalAlert_PK] PRIMARY KEY CLUSTERED (
        [MedicalAlertCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[MedicalAlert] ADD CONSTRAINT [MedicalAlert_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[MedicalAlert] ADD CONSTRAINT [MedicalAlert_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[MedicalAlert] ADD CONSTRAINT [MedicalAlert_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[MedicalAlertCategoryDescriptor] --
CREATE TABLE [de].[MedicalAlertCategoryDescriptor] (
    [MedicalAlertCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MedicalAlertCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MedicalAlertCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[MedicalDispositionDescriptor] --
CREATE TABLE [de].[MedicalDispositionDescriptor] (
    [MedicalDispositionDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MedicalDispositionDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MedicalDispositionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[MedicalOfficeVisit] --
CREATE TABLE [de].[MedicalOfficeVisit] (
    [OfficeInDate] [DATETIME2](7) NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [OfficeOutDate] [DATETIME2](7) NULL,
    [SchoolOfServiceSchoolId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [MedicalOfficeVisit_PK] PRIMARY KEY CLUSTERED (
        [OfficeInDate] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[MedicalOfficeVisit] ADD CONSTRAINT [MedicalOfficeVisit_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[MedicalOfficeVisit] ADD CONSTRAINT [MedicalOfficeVisit_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[MedicalOfficeVisit] ADD CONSTRAINT [MedicalOfficeVisit_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[MedicalOfficeVisitContactType] --
CREATE TABLE [de].[MedicalOfficeVisitContactType] (
    [ContactTypeDescriptorId] [INT] NOT NULL,
    [OfficeInDate] [DATETIME2](7) NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [MedicalOfficeVisitContactType_PK] PRIMARY KEY CLUSTERED (
        [ContactTypeDescriptorId] ASC,
        [OfficeInDate] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[MedicalOfficeVisitContactType] ADD CONSTRAINT [MedicalOfficeVisitContactType_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[MedicalOfficeVisitMedicalDisposition] --
CREATE TABLE [de].[MedicalOfficeVisitMedicalDisposition] (
    [MedicalDispositionDescriptorId] [INT] NOT NULL,
    [OfficeInDate] [DATETIME2](7) NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [MedicalOfficeVisitMedicalDisposition_PK] PRIMARY KEY CLUSTERED (
        [MedicalDispositionDescriptorId] ASC,
        [OfficeInDate] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[MedicalOfficeVisitMedicalDisposition] ADD CONSTRAINT [MedicalOfficeVisitMedicalDisposition_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[MedicalOfficeVisitMedicalTreatmentCode] --
CREATE TABLE [de].[MedicalOfficeVisitMedicalTreatmentCode] (
    [MedicalTreatmentCodeDescriptorId] [INT] NOT NULL,
    [OfficeInDate] [DATETIME2](7) NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [MedicalOfficeVisitMedicalTreatmentCode_PK] PRIMARY KEY CLUSTERED (
        [MedicalTreatmentCodeDescriptorId] ASC,
        [OfficeInDate] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[MedicalOfficeVisitMedicalTreatmentCode] ADD CONSTRAINT [MedicalOfficeVisitMedicalTreatmentCode_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[MedicalOfficeVisitMedicalVisitReason] --
CREATE TABLE [de].[MedicalOfficeVisitMedicalVisitReason] (
    [MedicalVisitReasonDescriptorId] [INT] NOT NULL,
    [OfficeInDate] [DATETIME2](7) NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [MedicalOfficeVisitMedicalVisitReason_PK] PRIMARY KEY CLUSTERED (
        [MedicalVisitReasonDescriptorId] ASC,
        [OfficeInDate] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[MedicalOfficeVisitMedicalVisitReason] ADD CONSTRAINT [MedicalOfficeVisitMedicalVisitReason_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[MedicalReferralFollowUp] --
CREATE TABLE [de].[MedicalReferralFollowUp] (
    [FollowupCategoryDescriptorId] [INT] NOT NULL,
    [MedicalTestCategoryDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [TestDate] [DATETIME2](7) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [MedicalReferralFollowUp_PK] PRIMARY KEY CLUSTERED (
        [FollowupCategoryDescriptorId] ASC,
        [MedicalTestCategoryDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [TestDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[MedicalReferralFollowUp] ADD CONSTRAINT [MedicalReferralFollowUp_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[MedicalReferralFollowUp] ADD CONSTRAINT [MedicalReferralFollowUp_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[MedicalReferralFollowUp] ADD CONSTRAINT [MedicalReferralFollowUp_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[MedicalScreening] --
CREATE TABLE [de].[MedicalScreening] (
    [MedicalTestCategoryDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [TestDate] [DATETIME2](7) NOT NULL,
    [AthleticStatus] [BIT] NULL,
    [GradeLevelDescriptorId] [INT] NULL,
    [SchoolOfServiceSchoolId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [MedicalScreening_PK] PRIMARY KEY CLUSTERED (
        [MedicalTestCategoryDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [TestDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[MedicalScreening] ADD CONSTRAINT [MedicalScreening_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[MedicalScreening] ADD CONSTRAINT [MedicalScreening_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[MedicalScreening] ADD CONSTRAINT [MedicalScreening_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[MedicalTestCategoryDescriptor] --
CREATE TABLE [de].[MedicalTestCategoryDescriptor] (
    [MedicalTestCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MedicalTestCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MedicalTestCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[MedicalTreatmentCodeDescriptor] --
CREATE TABLE [de].[MedicalTreatmentCodeDescriptor] (
    [MedicalTreatmentCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MedicalTreatmentCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MedicalTreatmentCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[MedicalVisitReasonDescriptor] --
CREATE TABLE [de].[MedicalVisitReasonDescriptor] (
    [MedicalVisitReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MedicalVisitReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MedicalVisitReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[MedicationBox] --
CREATE TABLE [de].[MedicationBox] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [MedicationBoxId] [INT] NOT NULL,
    [MedicationCode] [NVARCHAR](10) NULL,
    [MedicationDescription] [NVARCHAR](1024) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [MedicationBox_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC,
        [MedicationBoxId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[MedicationBox] ADD CONSTRAINT [MedicationBox_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[MedicationBox] ADD CONSTRAINT [MedicationBox_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[MedicationBox] ADD CONSTRAINT [MedicationBox_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[NonStudent] --
CREATE TABLE [de].[NonStudent] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [NonStudentLocalId] [NVARCHAR](60) NOT NULL,
    [PersonalTitlePrefix] [NVARCHAR](30) NULL,
    [FirstName] [NVARCHAR](75) NULL,
    [MiddleName] [NVARCHAR](75) NULL,
    [LastSurname] [NVARCHAR](75) NULL,
    [GenerationCodeSuffix] [NVARCHAR](10) NULL,
    [MaidenName] [NVARCHAR](75) NULL,
    [BirthDate] [DATE] NULL,
    [BirthCity] [NVARCHAR](30) NULL,
    [BirthStateAbbreviationDescriptorId] [INT] NULL,
    [BirthInternationalProvince] [NVARCHAR](150) NULL,
    [BirthCountryDescriptorId] [INT] NULL,
    [DateEnteredUS] [DATE] NULL,
    [MultipleBirthStatus] [BIT] NULL,
    [BirthSexDescriptorId] [INT] NULL,
    [HispanicLatinoEthnicity] [BIT] NULL,
    [SexDescriptorId] [INT] NULL,
    [SchoolId] [INT] NULL,
    [PersonId] [NVARCHAR](60) NULL,
    [PersonCategoryDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [NonStudent_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC,
        [NonStudentLocalId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[NonStudent] ADD CONSTRAINT [NonStudent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[NonStudent] ADD CONSTRAINT [NonStudent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[NonStudent] ADD CONSTRAINT [NonStudent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[NonStudentEthnicity] --
CREATE TABLE [de].[NonStudentEthnicity] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [NonStudentLocalId] [NVARCHAR](60) NOT NULL,
    [RaceDescriptorId] [INT] NOT NULL,
    [RaceOrder] [INT] NULL,
    [RacePercentage] [INT] NULL,
    [FederalRaceDescriptorId] [INT] NULL,
    [EthnicityLastModifiedDate] [DATETIME2](7) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [NonStudentEthnicity_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC,
        [NonStudentLocalId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[NonStudentEthnicity] ADD CONSTRAINT [NonStudentEthnicity_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[NonStudentPersonalIdentificationDocument] --
CREATE TABLE [de].[NonStudentPersonalIdentificationDocument] (
    [IdentificationDocumentUseDescriptorId] [INT] NOT NULL,
    [LocalEducationAgencyId] [INT] NOT NULL,
    [NonStudentLocalId] [NVARCHAR](60) NOT NULL,
    [PersonalInformationVerificationDescriptorId] [INT] NOT NULL,
    [DocumentTitle] [NVARCHAR](60) NULL,
    [DocumentExpirationDate] [DATE] NULL,
    [IssuerDocumentIdentificationCode] [NVARCHAR](60) NULL,
    [IssuerName] [NVARCHAR](150) NULL,
    [IssuerCountryDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [NonStudentPersonalIdentificationDocument_PK] PRIMARY KEY CLUSTERED (
        [IdentificationDocumentUseDescriptorId] ASC,
        [LocalEducationAgencyId] ASC,
        [NonStudentLocalId] ASC,
        [PersonalInformationVerificationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[NonStudentPersonalIdentificationDocument] ADD CONSTRAINT [NonStudentPersonalIdentificationDocument_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[NotificationMethodDescriptor] --
CREATE TABLE [de].[NotificationMethodDescriptor] (
    [NotificationMethodDescriptorId] [INT] NOT NULL,
    CONSTRAINT [NotificationMethodDescriptor_PK] PRIMARY KEY CLUSTERED (
        [NotificationMethodDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[ParentAddressExtension] --
CREATE TABLE [de].[ParentAddressExtension] (
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [ParentUSI] [INT] NOT NULL,
    [Complex] [NVARCHAR](255) NULL,
    [Development] [NVARCHAR](255) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [ParentAddressExtension_PK] PRIMARY KEY CLUSTERED (
        [AddressTypeDescriptorId] ASC,
        [ParentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[ParentAddressExtension] ADD CONSTRAINT [ParentAddressExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[ParticipationCodeDescriptor] --
CREATE TABLE [de].[ParticipationCodeDescriptor] (
    [ParticipationCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ParticipationCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ParticipationCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[Person] --
CREATE TABLE [de].[Person] (
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Person_PK] PRIMARY KEY CLUSTERED (
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[Person] ADD CONSTRAINT [Person_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[Person] ADD CONSTRAINT [Person_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[Person] ADD CONSTRAINT [Person_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[PersonCategoryDescriptor] --
CREATE TABLE [de].[PersonCategoryDescriptor] (
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PersonCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PersonCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[PersonDisciplineAction] --
CREATE TABLE [de].[PersonDisciplineAction] (
    [ActionIdentifier] [INT] NOT NULL,
    [ActionStartDate] [DATE] NOT NULL,
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [ActionEndDate] [DATE] NULL,
    [ActualActionDuration] [DECIMAL](5, 2) NULL,
    [ScheduledActionDuration] [DECIMAL](5, 2) NULL,
    [DisciplineActionLengthDifferenceReasonDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PersonDisciplineAction_PK] PRIMARY KEY CLUSTERED (
        [ActionIdentifier] ASC,
        [ActionStartDate] ASC,
        [IncidentIdentifier] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PersonDisciplineAction] ADD CONSTRAINT [PersonDisciplineAction_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[PersonDisciplineAction] ADD CONSTRAINT [PersonDisciplineAction_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[PersonDisciplineAction] ADD CONSTRAINT [PersonDisciplineAction_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[PersonDisciplineActionDiscipline] --
CREATE TABLE [de].[PersonDisciplineActionDiscipline] (
    [ActionIdentifier] [INT] NOT NULL,
    [ActionStartDate] [DATE] NOT NULL,
    [DisciplineDescriptorId] [INT] NOT NULL,
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [PersonDisciplineActionDiscipline_PK] PRIMARY KEY CLUSTERED (
        [ActionIdentifier] ASC,
        [ActionStartDate] ASC,
        [DisciplineDescriptorId] ASC,
        [IncidentIdentifier] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PersonDisciplineActionDiscipline] ADD CONSTRAINT [PersonDisciplineActionDiscipline_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[PersonDisciplineActionDisciplineDisposition] --
CREATE TABLE [de].[PersonDisciplineActionDisciplineDisposition] (
    [ActionIdentifier] [INT] NOT NULL,
    [ActionStartDate] [DATE] NOT NULL,
    [DisciplineDispositionDescriptorId] [INT] NOT NULL,
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [PersonDisciplineActionDisciplineDisposition_PK] PRIMARY KEY CLUSTERED (
        [ActionIdentifier] ASC,
        [ActionStartDate] ASC,
        [DisciplineDispositionDescriptorId] ASC,
        [IncidentIdentifier] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PersonDisciplineActionDisciplineDisposition] ADD CONSTRAINT [PersonDisciplineActionDisciplineDisposition_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[PersonDisciplineIncidentAssociation] --
CREATE TABLE [de].[PersonDisciplineIncidentAssociation] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [ParticipantNumber] [INT] NOT NULL,
    [ParticipationCodeDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [VictimCategoryDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PersonDisciplineIncidentAssociation_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [ParticipantNumber] ASC,
        [ParticipationCodeDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PersonDisciplineIncidentAssociation] ADD CONSTRAINT [PersonDisciplineIncidentAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[PersonDisciplineIncidentAssociation] ADD CONSTRAINT [PersonDisciplineIncidentAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[PersonDisciplineIncidentAssociation] ADD CONSTRAINT [PersonDisciplineIncidentAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[PersonDisciplineIncidentAssociationOffenderBehavior] --
CREATE TABLE [de].[PersonDisciplineIncidentAssociationOffenderBehavior] (
    [BehaviorDescriptorId] [INT] NOT NULL,
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [ParticipantNumber] [INT] NOT NULL,
    [ParticipationCodeDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [BehaviorDetailDescription] [NVARCHAR](1024) NULL,
    [OffenseNumber] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [PersonDisciplineIncidentAssociationOffenderBehavior_PK] PRIMARY KEY CLUSTERED (
        [BehaviorDescriptorId] ASC,
        [IncidentIdentifier] ASC,
        [ParticipantNumber] ASC,
        [ParticipationCodeDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PersonDisciplineIncidentAssociationOffenderBehavior] ADD CONSTRAINT [PersonDisciplineIncidentAssociationOffenderBehavior_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[PersonDisciplineIncidentAssociationVictimInjury] --
CREATE TABLE [de].[PersonDisciplineIncidentAssociationVictimInjury] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [InjuryDescriptorId] [INT] NOT NULL,
    [ParticipantNumber] [INT] NOT NULL,
    [ParticipationCodeDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [PersonDisciplineIncidentAssociationVictimInjury_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [InjuryDescriptorId] ASC,
        [ParticipantNumber] ASC,
        [ParticipationCodeDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PersonDisciplineIncidentAssociationVictimInjury] ADD CONSTRAINT [PersonDisciplineIncidentAssociationVictimInjury_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[PersonImmunization] --
CREATE TABLE [de].[PersonImmunization] (
    [ImmunizationCodeDescriptorId] [INT] NOT NULL,
    [ImmunizationDate] [DATE] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PersonImmunization_PK] PRIMARY KEY CLUSTERED (
        [ImmunizationCodeDescriptorId] ASC,
        [ImmunizationDate] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PersonImmunization] ADD CONSTRAINT [PersonImmunization_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[PersonImmunization] ADD CONSTRAINT [PersonImmunization_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[PersonImmunization] ADD CONSTRAINT [PersonImmunization_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[PersonMedicalAlert] --
CREATE TABLE [de].[PersonMedicalAlert] (
    [MedicalAlertCategoryDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [Sequence] [INT] NOT NULL,
    [StartDate] [DATE] NOT NULL,
    [EndDate] [DATE] NULL,
    [Description] [NVARCHAR](1024) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PersonMedicalAlert_PK] PRIMARY KEY CLUSTERED (
        [MedicalAlertCategoryDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [Sequence] ASC,
        [StartDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PersonMedicalAlert] ADD CONSTRAINT [PersonMedicalAlert_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[PersonMedicalAlert] ADD CONSTRAINT [PersonMedicalAlert_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[PersonMedicalAlert] ADD CONSTRAINT [PersonMedicalAlert_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[PersonMedicationBoxAssociation] --
CREATE TABLE [de].[PersonMedicationBoxAssociation] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [MedicationBoxId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [MedicationRequired] [BIT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PersonMedicationBoxAssociation_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC,
        [MedicationBoxId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PersonMedicationBoxAssociation] ADD CONSTRAINT [PersonMedicationBoxAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[PersonMedicationBoxAssociation] ADD CONSTRAINT [PersonMedicationBoxAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[PersonMedicationBoxAssociation] ADD CONSTRAINT [PersonMedicationBoxAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[PersonMedicationBoxAssociationIssue] --
CREATE TABLE [de].[PersonMedicationBoxAssociationIssue] (
    [IssueDate] [DATETIME2](7) NOT NULL,
    [LocalEducationAgencyId] [INT] NOT NULL,
    [MedicationBoxId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [PersonMedicationBoxAssociationIssue_PK] PRIMARY KEY CLUSTERED (
        [IssueDate] ASC,
        [LocalEducationAgencyId] ASC,
        [MedicationBoxId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PersonMedicationBoxAssociationIssue] ADD CONSTRAINT [PersonMedicationBoxAssociationIssue_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[PostSecondaryDetail] --
CREATE TABLE [de].[PostSecondaryDetail] (
    [PostSecondaryEventCategoryDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ReasonNotApplied4PlusCollegeDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PostSecondaryDetail_PK] PRIMARY KEY CLUSTERED (
        [PostSecondaryEventCategoryDescriptorId] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PostSecondaryDetail] ADD CONSTRAINT [PostSecondaryDetail_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[PostSecondaryDetail] ADD CONSTRAINT [PostSecondaryDetail_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[PostSecondaryDetail] ADD CONSTRAINT [PostSecondaryDetail_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[PostSecondaryDetailInstitution] --
CREATE TABLE [de].[PostSecondaryDetailInstitution] (
    [PostSecondaryEventCategoryDescriptorId] [INT] NOT NULL,
    [PostSecondaryInstitutionId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AcceptanceStatusDescriptorId] [INT] NULL,
    [DateTranscriptMailed] [DATE] NULL,
    [PlansToAttend] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [PostSecondaryDetailInstitution_PK] PRIMARY KEY CLUSTERED (
        [PostSecondaryEventCategoryDescriptorId] ASC,
        [PostSecondaryInstitutionId] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[PostSecondaryDetailInstitution] ADD CONSTRAINT [PostSecondaryDetailInstitution_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[ReasonNotApplied4PlusCollegeDescriptor] --
CREATE TABLE [de].[ReasonNotApplied4PlusCollegeDescriptor] (
    [ReasonNotApplied4PlusCollegeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ReasonNotApplied4PlusCollegeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ReasonNotApplied4PlusCollegeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[ReferralDescriptor] --
CREATE TABLE [de].[ReferralDescriptor] (
    [ReferralDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ReferralDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ReferralDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[RestraintEventCategoryDescriptor] --
CREATE TABLE [de].[RestraintEventCategoryDescriptor] (
    [RestraintEventCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [RestraintEventCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [RestraintEventCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[RestraintSeclusion] --
CREATE TABLE [de].[RestraintSeclusion] (
    [EventDate] [DATE] NOT NULL,
    [EventTime] [TIME](7) NOT NULL,
    [RestraintEventCategoryDescriptorId] [INT] NOT NULL,
    [RestraintEventReasonDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AdditionalDetail] [NVARCHAR](255) NULL,
    [BehaviorDuringRestraintDetail] [NVARCHAR](255) NOT NULL,
    [ChangeDescription] [NVARCHAR](1024) NULL,
    [DeescalationTechniqueDetail] [NVARCHAR](255) NOT NULL,
    [IncidentLocationDescriptorId] [INT] NULL,
    [RestraintReportDate] [DATE] NULL,
    [RestraintDuration] [NVARCHAR](30) NULL,
    [ConsecutiveRestraintCount] [INT] NULL,
    [NotificationMethodDescriptorId] [INT] NOT NULL,
    [NonViolentTechniqueDetail] [NVARCHAR](255) NOT NULL,
    [ParentGuardianNotified] [BIT] NULL,
    [ParentGuardianNotifiedDate] [DATE] NOT NULL,
    [ParentGuardianNotifiedTime] [TIME](7) NOT NULL,
    [PolicyChangeDetail] [NVARCHAR](255) NULL,
    [PriorToEventDetail] [NVARCHAR](255) NOT NULL,
    [StaffInjured] [BIT] NULL,
    [StaffTreatmentDescriptorId] [INT] NULL,
    [StaffTrainingDetail] [NVARCHAR](255) NULL,
    [StudentInjured] [BIT] NULL,
    [StudentTreatmentDescriptorId] [INT] NULL,
    [StudentInterviewDetail] [NVARCHAR](255) NULL,
    [SupportPlanChangeDescriptorId] [INT] NOT NULL,
    [UsedCrisisResponseTeam] [BIT] NULL,
    [WitnessInterviewDetail] [NVARCHAR](255) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [RestraintSeclusion_PK] PRIMARY KEY CLUSTERED (
        [EventDate] ASC,
        [EventTime] ASC,
        [RestraintEventCategoryDescriptorId] ASC,
        [RestraintEventReasonDescriptorId] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[RestraintSeclusion] ADD CONSTRAINT [RestraintSeclusion_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[RestraintSeclusion] ADD CONSTRAINT [RestraintSeclusion_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[RestraintSeclusion] ADD CONSTRAINT [RestraintSeclusion_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[RestraintSeclusionStaffProvidingRestraint] --
CREATE TABLE [de].[RestraintSeclusionStaffProvidingRestraint] (
    [EventDate] [DATE] NOT NULL,
    [EventTime] [TIME](7) NOT NULL,
    [RestraintEventCategoryDescriptorId] [INT] NOT NULL,
    [RestraintEventReasonDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [TrainedActionTechnique] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [RestraintSeclusionStaffProvidingRestraint_PK] PRIMARY KEY CLUSTERED (
        [EventDate] ASC,
        [EventTime] ASC,
        [RestraintEventCategoryDescriptorId] ASC,
        [RestraintEventReasonDescriptorId] ASC,
        [SchoolId] ASC,
        [StaffUSI] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[RestraintSeclusionStaffProvidingRestraint] ADD CONSTRAINT [RestraintSeclusionStaffProvidingRestraint_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[SchoolExtension] --
CREATE TABLE [de].[SchoolExtension] (
    [SchoolId] [INT] NOT NULL,
    [AttendanceConfigurationCategoryDescriptorId] [INT] NULL,
    [UnitCountException] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [SchoolExtension_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[SchoolExtension] ADD CONSTRAINT [SchoolExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[SectionExtension] --
CREATE TABLE [de].[SectionExtension] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [Description] [NVARCHAR](1024) NULL,
    [LevelDetail] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [SectionExtension_PK] PRIMARY KEY CLUSTERED (
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[SectionExtension] ADD CONSTRAINT [SectionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[SectionMarkingPeriod] --
CREATE TABLE [de].[SectionMarkingPeriod] (
    [GradingPeriodDescriptorId] [INT] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [UsedSeat] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [SectionMarkingPeriod_PK] PRIMARY KEY CLUSTERED (
        [GradingPeriodDescriptorId] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[SectionMarkingPeriod] ADD CONSTRAINT [SectionMarkingPeriod_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[SectionSubjectArea] --
CREATE TABLE [de].[SectionSubjectArea] (
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [SubjectOrder] [INT] NULL,
    [SubjectAreaLastModifiedDate] [DATETIME2](7) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [SectionSubjectArea_PK] PRIMARY KEY CLUSTERED (
        [AcademicSubjectDescriptorId] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[SectionSubjectArea] ADD CONSTRAINT [SectionSubjectArea_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[ServiceStatusDescriptor] --
CREATE TABLE [de].[ServiceStatusDescriptor] (
    [ServiceStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ServiceStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ServiceStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[StaffEducationOrganizationAssignmentAssociationExtension] --
CREATE TABLE [de].[StaffEducationOrganizationAssignmentAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StaffClassificationDescriptorId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [Active] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StaffEducationOrganizationAssignmentAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [StaffClassificationDescriptorId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StaffEducationOrganizationAssignmentAssociationExtension] ADD CONSTRAINT [StaffEducationOrganizationAssignmentAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StaffExtension] --
CREATE TABLE [de].[StaffExtension] (
    [StaffUSI] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NULL,
    [PersonCategoryDescriptorId] [INT] NULL,
    [FederalRaceDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StaffExtension_PK] PRIMARY KEY CLUSTERED (
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StaffExtension] ADD CONSTRAINT [StaffExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StaffProgramAssociationExtension] --
CREATE TABLE [de].[StaffProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [ImmersionLanguageDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StaffProgramAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StaffProgramAssociationExtension] ADD CONSTRAINT [StaffProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StaffRoleDescriptor] --
CREATE TABLE [de].[StaffRoleDescriptor] (
    [StaffRoleDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StaffRoleDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StaffRoleDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[Student504ProgramAssociation] --
CREATE TABLE [de].[Student504ProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AccommodatioPlan] [BIT] NULL,
    [DisabilityDescriptorId] [INT] NULL,
    [InitialDNQDate] [DATE] NULL,
    [LastEvaluationDate] [DATE] NULL,
    [MeetingDate] [DATE] NULL,
    CONSTRAINT [Student504ProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[StudentCTEProgramAssociationCTEProgramExtension] --
CREATE TABLE [de].[StudentCTEProgramAssociationCTEProgramExtension] (
    [BeginDate] [DATE] NOT NULL,
    [CareerPathwayDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [PathwayConcentrator] [BIT] NULL,
    [EndOfPathwayTechnicalSkillsAssessmentDescriptorId] [INT] NULL,
    [FirstCertificationDescriptorId] [INT] NULL,
    [SecondCertificationDescriptorId] [INT] NULL,
    [ThirdCertificationDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentCTEProgramAssociationCTEProgramExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [CareerPathwayDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentCTEProgramAssociationCTEProgramExtension] ADD CONSTRAINT [StudentCTEProgramAssociationCTEProgramExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentEarlyChildhoodProgramAssociation] --
CREATE TABLE [de].[StudentEarlyChildhoodProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AverageDaysPerWeek] [NVARCHAR](1) NULL,
    [AverageHoursPerDay] [NVARCHAR](2) NULL,
    [OtherEarlyChildhoodProgram] [BIT] NULL,
    [HomeBased] [BIT] NULL,
    [Regulation619DeterminedEligible] [BIT] NULL,
    [Regulation619PartCReferralDate] [DATE] NULL,
    [Regulation619ReferralDate] [DATE] NULL,
    [Regulation619TransitionConferenceDate] [DATE] NULL,
    [ProgramCharacteristicDescriptorId] [INT] NULL,
    CONSTRAINT [StudentEarlyChildhoodProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[StudentEducationOrganizationAssociationAddressExtension] --
CREATE TABLE [de].[StudentEducationOrganizationAssociationAddressExtension] (
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [Complex] [NVARCHAR](255) NULL,
    [Development] [NVARCHAR](255) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationAddressExtension_PK] PRIMARY KEY CLUSTERED (
        [AddressTypeDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentEducationOrganizationAssociationAddressExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationAddressExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentEducationOrganizationAssociationEthnicity] --
CREATE TABLE [de].[StudentEducationOrganizationAssociationEthnicity] (
    [EducationOrganizationId] [INT] NOT NULL,
    [RaceDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [RaceOrder] [INT] NULL,
    [RacePercentage] [INT] NULL,
    [FederalRaceDescriptorId] [INT] NULL,
    [EthnicityLastModifiedDate] [DATETIME2](7) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationEthnicity_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [RaceDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentEducationOrganizationAssociationEthnicity] ADD CONSTRAINT [StudentEducationOrganizationAssociationEthnicity_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentEducationOrganizationAssociationExtension] --
CREATE TABLE [de].[StudentEducationOrganizationAssociationExtension] (
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ChoiceCategoryDescriptorId] [INT] NULL,
    [FerpaName] [BIT] NULL,
    [FerpaAddress] [BIT] NULL,
    [FerpaPhone] [BIT] NULL,
    [FerpaPhoto] [BIT] NULL,
    [FerpaOptOutDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentEducationOrganizationAssociationExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentEducationOrganizationAssociationMultiliteracy] --
CREATE TABLE [de].[StudentEducationOrganizationAssociationMultiliteracy] (
    [AssessmentTitle] [NVARCHAR](100) NOT NULL,
    [CertificateCategoryDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [LanguageDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CertificateIssueConfirm] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationMultiliteracy_PK] PRIMARY KEY CLUSTERED (
        [AssessmentTitle] ASC,
        [CertificateCategoryDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [LanguageDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentEducationOrganizationAssociationMultiliteracy] ADD CONSTRAINT [StudentEducationOrganizationAssociationMultiliteracy_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentEducationOrganizationAssociationScholarship] --
CREATE TABLE [de].[StudentEducationOrganizationAssociationScholarship] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ScholarshipAmount] [INT] NOT NULL,
    [ScholarshipName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationScholarship_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ScholarshipAmount] ASC,
        [ScholarshipName] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentEducationOrganizationAssociationScholarship] ADD CONSTRAINT [StudentEducationOrganizationAssociationScholarship_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentEducationOrganizationResponsibilityAssociationTransfer] --
CREATE TABLE [de].[StudentEducationOrganizationResponsibilityAssociationTransfer] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ExternalEducationOrganizationName] [NVARCHAR](75) NOT NULL,
    [ResponsibilityDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [GradeLevelDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationResponsibilityAssociationTransfer_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ExternalEducationOrganizationName] ASC,
        [ResponsibilityDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentEducationOrganizationResponsibilityAssociationTransfer] ADD CONSTRAINT [StudentEducationOrganizationResponsibilityAssociationTransfer_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentExtension] --
CREATE TABLE [de].[StudentExtension] (
    [StudentUSI] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NULL,
    [PersonCategoryDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentExtension_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentExtension] ADD CONSTRAINT [StudentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentLanguageInstructionProgramAssociationLanguageImmersion] --
CREATE TABLE [de].[StudentLanguageInstructionProgramAssociationLanguageImmersion] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ImmersionLanguageDescriptorId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [Comment] [NVARCHAR](1024) NULL,
    [GradeLevelDescriptorId] [INT] NULL,
    [SchoolYear] [SMALLINT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentLanguageInstructionProgramAssociationLanguageImmersion_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ImmersionLanguageDescriptorId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentLanguageInstructionProgramAssociationLanguageImmersion] ADD CONSTRAINT [StudentLanguageInstructionProgramAssociationLanguageImmersion_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentParentAssociationExtension] --
CREATE TABLE [de].[StudentParentAssociationExtension] (
    [ParentUSI] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ContactTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentParentAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [ParentUSI] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentParentAssociationExtension] ADD CONSTRAINT [StudentParentAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentSchoolAssociationExtension] --
CREATE TABLE [de].[StudentSchoolAssociationExtension] (
    [EntryDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [EnrollmentTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentSchoolAssociationExtension] ADD CONSTRAINT [StudentSchoolAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentSchoolAttendanceEventExtension] --
CREATE TABLE [de].[StudentSchoolAttendanceEventExtension] (
    [AttendanceEventCategoryDescriptorId] [INT] NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AbsentTime] [INT] NULL,
    [ScheduledTime] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentSchoolAttendanceEventExtension_PK] PRIMARY KEY CLUSTERED (
        [AttendanceEventCategoryDescriptorId] ASC,
        [EventDate] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SessionName] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentSchoolAttendanceEventExtension] ADD CONSTRAINT [StudentSchoolAttendanceEventExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentSectionClassPeriodAttendanceEvent] --
CREATE TABLE [de].[StudentSectionClassPeriodAttendanceEvent] (
    [AttendanceEventCategoryDescriptorId] [INT] NOT NULL,
    [ClassPeriodName] [NVARCHAR](60) NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AttendanceEventReason] [NVARCHAR](40) NULL,
    [EducationalEnvironmentDescriptorId] [INT] NULL,
    [EventDuration] [DECIMAL](3, 2) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentSectionClassPeriodAttendanceEvent_PK] PRIMARY KEY CLUSTERED (
        [AttendanceEventCategoryDescriptorId] ASC,
        [ClassPeriodName] ASC,
        [EventDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentSectionClassPeriodAttendanceEvent] ADD CONSTRAINT [StudentSectionClassPeriodAttendanceEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[StudentSectionClassPeriodAttendanceEvent] ADD CONSTRAINT [StudentSectionClassPeriodAttendanceEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[StudentSectionClassPeriodAttendanceEvent] ADD CONSTRAINT [StudentSectionClassPeriodAttendanceEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[StudentSpecialEducationProgramAssociationExtension] --
CREATE TABLE [de].[StudentSpecialEducationProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DiplomaCertificateCategoryDescriptorId] [INT] NULL,
    [SpecialEducationFundingCountException] [BIT] NULL,
    [DSTPAccommodation] [BIT] NULL,
    [EligbleNotReceivingService] [BIT] NULL,
    [EvaluatedNoDisability] [BIT] NULL,
    [FundingNeedsCategoryDescriptorId] [INT] NULL,
    [InitialConsentToEvaluateDate] [DATE] NULL,
    [InitialEvaluationDate] [DATE] NULL,
    [LastSpecialistEvaluationDate] [DATE] NULL,
    [PercentOutOfRegularClass] [DECIMAL](5, 2) NULL,
    [PPPSISPInitiationDate] [DATE] NULL,
    [PPPSMeetingDate] [DATE] NULL,
    [ServiceStatusDescriptorId] [INT] NULL,
    [PrivateSchoolId] [INT] NULL,
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
ALTER TABLE [de].[StudentSpecialEducationProgramAssociationExtension] ADD CONSTRAINT [StudentSpecialEducationProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [de].[StudentTransportation] --
CREATE TABLE [de].[StudentTransportation] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [TravelDayOfWeekDescriptorId] [INT] NOT NULL,
    [TravelDirectionDescriptorId] [INT] NOT NULL,
    [TravelSegment] [INT] NOT NULL,
    [TravelTrip] [INT] NOT NULL,
    [BusNumber] [NVARCHAR](10) NULL,
    [BusRouteNumber] [NVARCHAR](10) NULL,
    [ShuttleStop] [NVARCHAR](6) NULL,
    [StopDescription] [NVARCHAR](1024) NULL,
    [StopNumber] [NVARCHAR](10) NULL,
    [StopTime] [TIME](7) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentTransportation_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC,
        [StudentUSI] ASC,
        [TravelDayOfWeekDescriptorId] ASC,
        [TravelDirectionDescriptorId] ASC,
        [TravelSegment] ASC,
        [TravelTrip] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [de].[StudentTransportation] ADD CONSTRAINT [StudentTransportation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [de].[StudentTransportation] ADD CONSTRAINT [StudentTransportation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [de].[StudentTransportation] ADD CONSTRAINT [StudentTransportation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [de].[SupportPlanChangeDescriptor] --
CREATE TABLE [de].[SupportPlanChangeDescriptor] (
    [SupportPlanChangeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SupportPlanChangeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SupportPlanChangeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[TravelDayOfWeekDescriptor] --
CREATE TABLE [de].[TravelDayOfWeekDescriptor] (
    [TravelDayOfWeekDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TravelDayOfWeekDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TravelDayOfWeekDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[TravelDirectionDescriptor] --
CREATE TABLE [de].[TravelDirectionDescriptor] (
    [TravelDirectionDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TravelDirectionDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TravelDirectionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[TreatmentDescriptor] --
CREATE TABLE [de].[TreatmentDescriptor] (
    [TreatmentDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TreatmentDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TreatmentDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [de].[VictimCategoryDescriptor] --
CREATE TABLE [de].[VictimCategoryDescriptor] (
    [VictimCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [VictimCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [VictimCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

