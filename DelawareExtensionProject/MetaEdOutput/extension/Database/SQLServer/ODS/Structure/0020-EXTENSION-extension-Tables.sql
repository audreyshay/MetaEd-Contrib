-- Table [extension].[AcceptanceStatusDescriptor] --
CREATE TABLE [extension].[AcceptanceStatusDescriptor] (
    [AcceptanceStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AcceptanceStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AcceptanceStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[AllegedBullyingVictim] --
CREATE TABLE [extension].[AllegedBullyingVictim] (
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
ALTER TABLE [extension].[AllegedBullyingVictim] ADD CONSTRAINT [AllegedBullyingVictim_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[AllegedBullyingVictim] ADD CONSTRAINT [AllegedBullyingVictim_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[AllegedBullyingVictim] ADD CONSTRAINT [AllegedBullyingVictim_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[AllegedBullyingVictimBullyingCategory] --
CREATE TABLE [extension].[AllegedBullyingVictimBullyingCategory] (
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
ALTER TABLE [extension].[AllegedBullyingVictimBullyingCategory] ADD CONSTRAINT [AllegedBullyingVictimBullyingCategory_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[APExamCodeDescriptor] --
CREATE TABLE [extension].[APExamCodeDescriptor] (
    [APExamCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [APExamCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [APExamCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[AttendanceConfigurationCategoryDescriptor] --
CREATE TABLE [extension].[AttendanceConfigurationCategoryDescriptor] (
    [AttendanceConfigurationCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AttendanceConfigurationCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AttendanceConfigurationCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[BullyingCategoryDescriptor] --
CREATE TABLE [extension].[BullyingCategoryDescriptor] (
    [BullyingCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [BullyingCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [BullyingCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[CalendarDateExtension] --
CREATE TABLE [extension].[CalendarDateExtension] (
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
ALTER TABLE [extension].[CalendarDateExtension] ADD CONSTRAINT [CalendarDateExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[CertificateCategoryDescriptor] --
CREATE TABLE [extension].[CertificateCategoryDescriptor] (
    [CertificateCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CertificateCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CertificateCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[CertificationDescriptor] --
CREATE TABLE [extension].[CertificationDescriptor] (
    [CertificationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CertificationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CertificationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[ChoiceCategoryDescriptor] --
CREATE TABLE [extension].[ChoiceCategoryDescriptor] (
    [ChoiceCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ChoiceCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ChoiceCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[CIPCourse] --
CREATE TABLE [extension].[CIPCourse] (
    [CIPCode] [NVARCHAR](120) NOT NULL,
    [Pathway] [INT] NULL,
    [FundingLevel] [INT] NULL,
    [Cluster] [INT] NULL,
    [CourseName] [NVARCHAR](255) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CIPCourse_PK] PRIMARY KEY CLUSTERED (
        [CIPCode] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CIPCourse] ADD CONSTRAINT [CIPCourse_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[CIPCourse] ADD CONSTRAINT [CIPCourse_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[CIPCourse] ADD CONSTRAINT [CIPCourse_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[ClassPeriodCycle] --
CREATE TABLE [extension].[ClassPeriodCycle] (
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
ALTER TABLE [extension].[ClassPeriodCycle] ADD CONSTRAINT [ClassPeriodCycle_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[ClassPeriodExtension] --
CREATE TABLE [extension].[ClassPeriodExtension] (
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
ALTER TABLE [extension].[ClassPeriodExtension] ADD CONSTRAINT [ClassPeriodExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[CoreSubjectDescriptor] --
CREATE TABLE [extension].[CoreSubjectDescriptor] (
    [CoreSubjectDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CoreSubjectDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CoreSubjectDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[CourseExtension] --
CREATE TABLE [extension].[CourseExtension] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [Active] [BIT] NULL,
    [APExamCodeDescriptorId] [INT] NULL,
    [AveragePassTimeMinutesPerWeek] [INT] NULL,
    [CoreSubjectDescriptorId] [INT] NULL,
    [FractionOfYearOffered] [DECIMAL](3, 2) NULL,
    [MinutesPerWeekAverage] [INT] NULL,
    [SecondaryStaffClassroomServiceStatusDescriptorId] [INT] NULL,
    [StaffCredentialFieldDescriptorId] [INT] NULL,
    [SecondaryStaffCredentialFieldDescriptorId] [INT] NULL,
    [SecondaryStaffRoleDescriptorId] [INT] NULL,
    [UnitCountExceptionSchoolId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [CourseExtension_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[CourseExtension] ADD CONSTRAINT [CourseExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[CycleDescriptor] --
CREATE TABLE [extension].[CycleDescriptor] (
    [CycleDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CycleDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CycleDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[DiplomaCertificateCategoryDescriptor] --
CREATE TABLE [extension].[DiplomaCertificateCategoryDescriptor] (
    [DiplomaCertificateCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DiplomaCertificateCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DiplomaCertificateCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[DisciplineDispositionDescriptor] --
CREATE TABLE [extension].[DisciplineDispositionDescriptor] (
    [DisciplineDispositionDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DisciplineDispositionDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DisciplineDispositionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[DisciplineIncidentCode] --
CREATE TABLE [extension].[DisciplineIncidentCode] (
    [BehaviorDescriptorId] [INT] NOT NULL,
    [Felony] [BIT] NULL,
    [VictimRequired] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [DisciplineIncidentCode_PK] PRIMARY KEY CLUSTERED (
        [BehaviorDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[DisciplineIncidentCode] ADD CONSTRAINT [DisciplineIncidentCode_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[DisciplineIncidentCode] ADD CONSTRAINT [DisciplineIncidentCode_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[DisciplineIncidentCode] ADD CONSTRAINT [DisciplineIncidentCode_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[DisciplineIncidentExtension] --
CREATE TABLE [extension].[DisciplineIncidentExtension] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [IncidentTimeFrameDescriptorId] [INT] NULL,
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
ALTER TABLE [extension].[DisciplineIncidentExtension] ADD CONSTRAINT [DisciplineIncidentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[DisciplineIncidentReason] --
CREATE TABLE [extension].[DisciplineIncidentReason] (
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
ALTER TABLE [extension].[DisciplineIncidentReason] ADD CONSTRAINT [DisciplineIncidentReason_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[DisciplineIncidentReferral] --
CREATE TABLE [extension].[DisciplineIncidentReferral] (
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
ALTER TABLE [extension].[DisciplineIncidentReferral] ADD CONSTRAINT [DisciplineIncidentReferral_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[DisciplineIssue] --
CREATE TABLE [extension].[DisciplineIssue] (
    [IssueIdentifier] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [IssueDate] [DATE] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [IssueIncidentLocationDescriptorId] [INT] NULL,
    [IssueCategoryDescriptorId] [INT] NULL,
    [IssueResolved] [BIT] NULL,
    [IssueSourceDescriptorId] [INT] NULL,
    [IssueSourceDetail] [NVARCHAR](255) NULL,
    [IssueStatusDescriptorId] [INT] NULL,
    [Comment] [NVARCHAR](1024) NULL,
    [CourseSession] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [DisciplineIssue_PK] PRIMARY KEY CLUSTERED (
        [IssueIdentifier] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[DisciplineIssue] ADD CONSTRAINT [DisciplineIssue_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[DisciplineIssue] ADD CONSTRAINT [DisciplineIssue_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[DisciplineIssue] ADD CONSTRAINT [DisciplineIssue_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[DisciplineIssueAction] --
CREATE TABLE [extension].[DisciplineIssueAction] (
    [EnteredSequence] [INT] NOT NULL,
    [IssueIdentifier] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [ActionEndDate] [DATE] NULL,
    [ActionStartDate] [DATE] NULL,
    [ActionCompleted] [BIT] NULL,
    [Comment] [NVARCHAR](1024) NULL,
    [IssueActionCategoryDescriptorId] [INT] NULL,
    [ParentsContacted] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [DisciplineIssueAction_PK] PRIMARY KEY CLUSTERED (
        [EnteredSequence] ASC,
        [IssueIdentifier] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[DisciplineIssueAction] ADD CONSTRAINT [DisciplineIssueAction_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[DisciplineIssueAction] ADD CONSTRAINT [DisciplineIssueAction_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[DisciplineIssueAction] ADD CONSTRAINT [DisciplineIssueAction_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[DisciplineIssueRefer] --
CREATE TABLE [extension].[DisciplineIssueRefer] (
    [IssueIdentifier] [INT] NOT NULL,
    [ReferDate] [DATE] NOT NULL,
    [ReferSequence] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [ReferIssueStatusDescriptorId] [INT] NULL,
    [Comment] [NVARCHAR](1024) NULL,
    [IncidentIdentifier] [NVARCHAR](20) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [DisciplineIssueRefer_PK] PRIMARY KEY CLUSTERED (
        [IssueIdentifier] ASC,
        [ReferDate] ASC,
        [ReferSequence] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[DisciplineIssueRefer] ADD CONSTRAINT [DisciplineIssueRefer_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[DisciplineIssueRefer] ADD CONSTRAINT [DisciplineIssueRefer_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[DisciplineIssueRefer] ADD CONSTRAINT [DisciplineIssueRefer_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[DisciplineIssueRelated] --
CREATE TABLE [extension].[DisciplineIssueRelated] (
    [IssueIdentifier] [INT] NOT NULL,
    [RelatedIssueIdentifier] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [RelatedLastModifiedDate] [DATETIME2](7) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [DisciplineIssueRelated_PK] PRIMARY KEY CLUSTERED (
        [IssueIdentifier] ASC,
        [RelatedIssueIdentifier] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[DisciplineIssueRelated] ADD CONSTRAINT [DisciplineIssueRelated_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[DisciplineIssueStudent] --
CREATE TABLE [extension].[DisciplineIssueStudent] (
    [IssueIdentifier] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [Comment] [NVARCHAR](1024) NULL,
    [AdminAssignedStudentParticipationCodeDescriptorId] [INT] NULL,
    [StudentParticipationCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [DisciplineIssueStudent_PK] PRIMARY KEY CLUSTERED (
        [IssueIdentifier] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[DisciplineIssueStudent] ADD CONSTRAINT [DisciplineIssueStudent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[DisciplineIssueStudent] ADD CONSTRAINT [DisciplineIssueStudent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[DisciplineIssueStudent] ADD CONSTRAINT [DisciplineIssueStudent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[FerpaOptOutDescriptor] --
CREATE TABLE [extension].[FerpaOptOutDescriptor] (
    [FerpaOptOutDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FerpaOptOutDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FerpaOptOutDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[FollowupCategoryDescriptor] --
CREATE TABLE [extension].[FollowupCategoryDescriptor] (
    [FollowupCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FollowupCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FollowupCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[FundingNeedsCategoryDescriptor] --
CREATE TABLE [extension].[FundingNeedsCategoryDescriptor] (
    [FundingNeedsCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FundingNeedsCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FundingNeedsCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[GradeTypeDetail] --
CREATE TABLE [extension].[GradeTypeDetail] (
    [GradeTypeDescriptorId] [INT] NOT NULL,
    [GradeTypeOrder] [INT] NULL,
    [GradeTypeWhenTakenDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [GradeTypeDetail_PK] PRIMARY KEY CLUSTERED (
        [GradeTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[GradeTypeDetail] ADD CONSTRAINT [GradeTypeDetail_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[GradeTypeDetail] ADD CONSTRAINT [GradeTypeDetail_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[GradeTypeDetail] ADD CONSTRAINT [GradeTypeDetail_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[GradeTypeWhenTakenDescriptor] --
CREATE TABLE [extension].[GradeTypeWhenTakenDescriptor] (
    [GradeTypeWhenTakenDescriptorId] [INT] NOT NULL,
    CONSTRAINT [GradeTypeWhenTakenDescriptor_PK] PRIMARY KEY CLUSTERED (
        [GradeTypeWhenTakenDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[GradingPeriodExtension] --
CREATE TABLE [extension].[GradingPeriodExtension] (
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
ALTER TABLE [extension].[GradingPeriodExtension] ADD CONSTRAINT [GradingPeriodExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[ImmunizationCodeDescriptor] --
CREATE TABLE [extension].[ImmunizationCodeDescriptor] (
    [ImmunizationCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ImmunizationCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ImmunizationCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IncidentRelatedToDescriptor] --
CREATE TABLE [extension].[IncidentRelatedToDescriptor] (
    [IncidentRelatedToDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IncidentRelatedToDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IncidentRelatedToDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IncidentTimeFrameDescriptor] --
CREATE TABLE [extension].[IncidentTimeFrameDescriptor] (
    [IncidentTimeFrameDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IncidentTimeFrameDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IncidentTimeFrameDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[InjuryDescriptor] --
CREATE TABLE [extension].[InjuryDescriptor] (
    [InjuryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [InjuryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [InjuryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IssueActionCategoryDescriptor] --
CREATE TABLE [extension].[IssueActionCategoryDescriptor] (
    [IssueActionCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IssueActionCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IssueActionCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IssueCategoryDescriptor] --
CREATE TABLE [extension].[IssueCategoryDescriptor] (
    [IssueCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IssueCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IssueCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IssueSourceDescriptor] --
CREATE TABLE [extension].[IssueSourceDescriptor] (
    [IssueSourceDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IssueSourceDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IssueSourceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[IssueStatusDescriptor] --
CREATE TABLE [extension].[IssueStatusDescriptor] (
    [IssueStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [IssueStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [IssueStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[LevelDetail] --
CREATE TABLE [extension].[LevelDetail] (
    [LevelNumber] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [LevelDescription] [NVARCHAR](1024) NULL,
    [PassingMark] [BIT] NULL,
    [PointValue] [DECIMAL](7, 4) NULL,
    [Mark] [NVARCHAR](3) NULL,
    [ReportCardPrintValue] [NVARCHAR](3) NULL,
    [TranscriptPrintValue] [NVARCHAR](3) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [LevelDetail_PK] PRIMARY KEY CLUSTERED (
        [LevelNumber] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[LevelDetail] ADD CONSTRAINT [LevelDetail_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[LevelDetail] ADD CONSTRAINT [LevelDetail_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[LevelDetail] ADD CONSTRAINT [LevelDetail_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[MedicalAlert] --
CREATE TABLE [extension].[MedicalAlert] (
    [MedicalAlertCategoryDescriptorId] [INT] NOT NULL,
    [Sensitive] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [MedicalAlert_PK] PRIMARY KEY CLUSTERED (
        [MedicalAlertCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[MedicalAlert] ADD CONSTRAINT [MedicalAlert_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[MedicalAlert] ADD CONSTRAINT [MedicalAlert_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[MedicalAlert] ADD CONSTRAINT [MedicalAlert_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[MedicalAlertCategoryDescriptor] --
CREATE TABLE [extension].[MedicalAlertCategoryDescriptor] (
    [MedicalAlertCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MedicalAlertCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MedicalAlertCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[MedicalDispositionDescriptor] --
CREATE TABLE [extension].[MedicalDispositionDescriptor] (
    [MedicalDispositionDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MedicalDispositionDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MedicalDispositionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[MedicalOfficeVisit] --
CREATE TABLE [extension].[MedicalOfficeVisit] (
    [OfficeInDate] [DATETIME2](7) NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [OfficeOutDate] [DATETIME2](7) NULL,
    [SchoolOfServiceSchoolId] [INT] NULL,
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
ALTER TABLE [extension].[MedicalOfficeVisit] ADD CONSTRAINT [MedicalOfficeVisit_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[MedicalOfficeVisit] ADD CONSTRAINT [MedicalOfficeVisit_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[MedicalOfficeVisit] ADD CONSTRAINT [MedicalOfficeVisit_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[MedicalOfficeVisitContactType] --
CREATE TABLE [extension].[MedicalOfficeVisitContactType] (
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
ALTER TABLE [extension].[MedicalOfficeVisitContactType] ADD CONSTRAINT [MedicalOfficeVisitContactType_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[MedicalOfficeVisitMedicalDisposition] --
CREATE TABLE [extension].[MedicalOfficeVisitMedicalDisposition] (
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
ALTER TABLE [extension].[MedicalOfficeVisitMedicalDisposition] ADD CONSTRAINT [MedicalOfficeVisitMedicalDisposition_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[MedicalOfficeVisitMedicalTreatmentCode] --
CREATE TABLE [extension].[MedicalOfficeVisitMedicalTreatmentCode] (
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
ALTER TABLE [extension].[MedicalOfficeVisitMedicalTreatmentCode] ADD CONSTRAINT [MedicalOfficeVisitMedicalTreatmentCode_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[MedicalOfficeVisitMedicalVisitReason] --
CREATE TABLE [extension].[MedicalOfficeVisitMedicalVisitReason] (
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
ALTER TABLE [extension].[MedicalOfficeVisitMedicalVisitReason] ADD CONSTRAINT [MedicalOfficeVisitMedicalVisitReason_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[MedicalReferralFollowUp] --
CREATE TABLE [extension].[MedicalReferralFollowUp] (
    [FollowupCategoryDescriptorId] [INT] NOT NULL,
    [MedicalTestCategoryDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [TestDate] [DATETIME2](7) NOT NULL,
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
ALTER TABLE [extension].[MedicalReferralFollowUp] ADD CONSTRAINT [MedicalReferralFollowUp_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[MedicalReferralFollowUp] ADD CONSTRAINT [MedicalReferralFollowUp_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[MedicalReferralFollowUp] ADD CONSTRAINT [MedicalReferralFollowUp_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[MedicalScreening] --
CREATE TABLE [extension].[MedicalScreening] (
    [MedicalTestCategoryDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [TestDate] [DATETIME2](7) NOT NULL,
    [AthleticStatus] [BIT] NULL,
    [GradeLevelDescriptorId] [INT] NULL,
    [SchoolOfServiceSchoolId] [INT] NULL,
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
ALTER TABLE [extension].[MedicalScreening] ADD CONSTRAINT [MedicalScreening_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[MedicalScreening] ADD CONSTRAINT [MedicalScreening_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[MedicalScreening] ADD CONSTRAINT [MedicalScreening_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[MedicalTestCategoryDescriptor] --
CREATE TABLE [extension].[MedicalTestCategoryDescriptor] (
    [MedicalTestCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MedicalTestCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MedicalTestCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[MedicalTreatmentCodeDescriptor] --
CREATE TABLE [extension].[MedicalTreatmentCodeDescriptor] (
    [MedicalTreatmentCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MedicalTreatmentCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MedicalTreatmentCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[MedicalVisitReasonDescriptor] --
CREATE TABLE [extension].[MedicalVisitReasonDescriptor] (
    [MedicalVisitReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MedicalVisitReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MedicalVisitReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[MedicationBox] --
CREATE TABLE [extension].[MedicationBox] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [MedicationBoxId] [INT] NOT NULL,
    [MedicationCode] [NVARCHAR](10) NULL,
    [MedicationDescription] [NVARCHAR](1024) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [MedicationBox_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC,
        [MedicationBoxId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[MedicationBox] ADD CONSTRAINT [MedicationBox_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[MedicationBox] ADD CONSTRAINT [MedicationBox_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[MedicationBox] ADD CONSTRAINT [MedicationBox_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[NonStudent] --
CREATE TABLE [extension].[NonStudent] (
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
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [NonStudent_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC,
        [NonStudentLocalId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[NonStudent] ADD CONSTRAINT [NonStudent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[NonStudent] ADD CONSTRAINT [NonStudent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[NonStudent] ADD CONSTRAINT [NonStudent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[NonStudentEthnicity] --
CREATE TABLE [extension].[NonStudentEthnicity] (
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
ALTER TABLE [extension].[NonStudentEthnicity] ADD CONSTRAINT [NonStudentEthnicity_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[NonStudentPersonalIdentificationDocument] --
CREATE TABLE [extension].[NonStudentPersonalIdentificationDocument] (
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
ALTER TABLE [extension].[NonStudentPersonalIdentificationDocument] ADD CONSTRAINT [NonStudentPersonalIdentificationDocument_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[NotificationMethodDescriptor] --
CREATE TABLE [extension].[NotificationMethodDescriptor] (
    [NotificationMethodDescriptorId] [INT] NOT NULL,
    CONSTRAINT [NotificationMethodDescriptor_PK] PRIMARY KEY CLUSTERED (
        [NotificationMethodDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[ParentAddressExtension] --
CREATE TABLE [extension].[ParentAddressExtension] (
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [ParentUSI] [INT] NOT NULL,
    [Complex] [NVARCHAR](255) NULL,
    [Development] [NVARCHAR](255) NULL,
    CONSTRAINT [ParentAddressExtension_PK] PRIMARY KEY CLUSTERED (
        [AddressTypeDescriptorId] ASC,
        [ParentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[ParticipationCodeDescriptor] --
CREATE TABLE [extension].[ParticipationCodeDescriptor] (
    [ParticipationCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ParticipationCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ParticipationCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[Person] --
CREATE TABLE [extension].[Person] (
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Person_PK] PRIMARY KEY CLUSTERED (
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[Person] ADD CONSTRAINT [Person_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[Person] ADD CONSTRAINT [Person_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[Person] ADD CONSTRAINT [Person_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[PersonCategoryDescriptor] --
CREATE TABLE [extension].[PersonCategoryDescriptor] (
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PersonCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PersonCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[PersonDisciplineAction] --
CREATE TABLE [extension].[PersonDisciplineAction] (
    [ActionIdentifier] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [ActionEndDate] [DATE] NULL,
    [ActionStartDate] [DATE] NULL,
    [ActualActionDuration] [DECIMAL](5, 2) NULL,
    [ScheduledActionDuration] [DECIMAL](5, 2) NULL,
    [DisciplineActionLengthDifferenceReasonDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PersonDisciplineAction_PK] PRIMARY KEY CLUSTERED (
        [ActionIdentifier] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[PersonDisciplineAction] ADD CONSTRAINT [PersonDisciplineAction_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[PersonDisciplineAction] ADD CONSTRAINT [PersonDisciplineAction_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[PersonDisciplineAction] ADD CONSTRAINT [PersonDisciplineAction_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[PersonDisciplineActionDiscipline] --
CREATE TABLE [extension].[PersonDisciplineActionDiscipline] (
    [ActionIdentifier] [INT] NOT NULL,
    [DisciplineDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [PersonDisciplineActionDiscipline_PK] PRIMARY KEY CLUSTERED (
        [ActionIdentifier] ASC,
        [DisciplineDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[PersonDisciplineActionDiscipline] ADD CONSTRAINT [PersonDisciplineActionDiscipline_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[PersonDisciplineActionDisciplineDisposition] --
CREATE TABLE [extension].[PersonDisciplineActionDisciplineDisposition] (
    [ActionIdentifier] [INT] NOT NULL,
    [DisciplineDispositionDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [PersonDisciplineActionDisciplineDisposition_PK] PRIMARY KEY CLUSTERED (
        [ActionIdentifier] ASC,
        [DisciplineDispositionDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[PersonDisciplineActionDisciplineDisposition] ADD CONSTRAINT [PersonDisciplineActionDisciplineDisposition_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[PersonDisciplineActionPersonDisciplineIncidentAssociation] --
CREATE TABLE [extension].[PersonDisciplineActionPersonDisciplineIncidentAssociation] (
    [ActionIdentifier] [INT] NOT NULL,
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [ParticipationCodeDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [PersonDisciplineActionPersonDisciplineIncidentAssociation_PK] PRIMARY KEY CLUSTERED (
        [ActionIdentifier] ASC,
        [IncidentIdentifier] ASC,
        [ParticipationCodeDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[PersonDisciplineActionPersonDisciplineIncidentAssociation] ADD CONSTRAINT [PersonDisciplineActionPersonDisciplineIncidentAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[PersonDisciplineIncidentAssociation] --
CREATE TABLE [extension].[PersonDisciplineIncidentAssociation] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [ParticipationCodeDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [VictimCategoryDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PersonDisciplineIncidentAssociation_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [ParticipationCodeDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[PersonDisciplineIncidentAssociation] ADD CONSTRAINT [PersonDisciplineIncidentAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[PersonDisciplineIncidentAssociation] ADD CONSTRAINT [PersonDisciplineIncidentAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[PersonDisciplineIncidentAssociation] ADD CONSTRAINT [PersonDisciplineIncidentAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[PersonDisciplineIncidentAssociationOffenderBehavior] --
CREATE TABLE [extension].[PersonDisciplineIncidentAssociationOffenderBehavior] (
    [BehaviorDescriptorId] [INT] NOT NULL,
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
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
        [ParticipationCodeDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[PersonDisciplineIncidentAssociationOffenderBehavior] ADD CONSTRAINT [PersonDisciplineIncidentAssociationOffenderBehavior_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[PersonDisciplineIncidentAssociationVictimInjury] --
CREATE TABLE [extension].[PersonDisciplineIncidentAssociationVictimInjury] (
    [IncidentIdentifier] [NVARCHAR](20) NOT NULL,
    [InjuryDescriptorId] [INT] NOT NULL,
    [ParticipationCodeDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [PersonDisciplineIncidentAssociationVictimInjury_PK] PRIMARY KEY CLUSTERED (
        [IncidentIdentifier] ASC,
        [InjuryDescriptorId] ASC,
        [ParticipationCodeDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[PersonDisciplineIncidentAssociationVictimInjury] ADD CONSTRAINT [PersonDisciplineIncidentAssociationVictimInjury_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[PersonImmunization] --
CREATE TABLE [extension].[PersonImmunization] (
    [ImmunizationCodeDescriptorId] [INT] NOT NULL,
    [ImmunizationDate] [DATE] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
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
ALTER TABLE [extension].[PersonImmunization] ADD CONSTRAINT [PersonImmunization_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[PersonImmunization] ADD CONSTRAINT [PersonImmunization_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[PersonImmunization] ADD CONSTRAINT [PersonImmunization_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[PersonMedicalAlert] --
CREATE TABLE [extension].[PersonMedicalAlert] (
    [MedicalAlertCategoryDescriptorId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [StartDate] [DATE] NOT NULL,
    [EndDate] [DATE] NULL,
    [Description] [NVARCHAR](1024) NULL,
    [Sequence] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [PersonMedicalAlert_PK] PRIMARY KEY CLUSTERED (
        [MedicalAlertCategoryDescriptorId] ASC,
        [PersonCategoryDescriptorId] ASC,
        [PersonId] ASC,
        [StartDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[PersonMedicalAlert] ADD CONSTRAINT [PersonMedicalAlert_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[PersonMedicalAlert] ADD CONSTRAINT [PersonMedicalAlert_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[PersonMedicalAlert] ADD CONSTRAINT [PersonMedicalAlert_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[PersonMedicationBoxAssociation] --
CREATE TABLE [extension].[PersonMedicationBoxAssociation] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [MedicationBoxId] [INT] NOT NULL,
    [PersonCategoryDescriptorId] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NOT NULL,
    [MedicationRequired] [BIT] NULL,
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
ALTER TABLE [extension].[PersonMedicationBoxAssociation] ADD CONSTRAINT [PersonMedicationBoxAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[PersonMedicationBoxAssociation] ADD CONSTRAINT [PersonMedicationBoxAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[PersonMedicationBoxAssociation] ADD CONSTRAINT [PersonMedicationBoxAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[PersonMedicationBoxAssociationIssue] --
CREATE TABLE [extension].[PersonMedicationBoxAssociationIssue] (
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
ALTER TABLE [extension].[PersonMedicationBoxAssociationIssue] ADD CONSTRAINT [PersonMedicationBoxAssociationIssue_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[PostSecondaryDetail] --
CREATE TABLE [extension].[PostSecondaryDetail] (
    [PostSecondaryEventCategoryDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ReasonNotApplied4PlusCollegeDescriptorId] [INT] NULL,
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
ALTER TABLE [extension].[PostSecondaryDetail] ADD CONSTRAINT [PostSecondaryDetail_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[PostSecondaryDetail] ADD CONSTRAINT [PostSecondaryDetail_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[PostSecondaryDetail] ADD CONSTRAINT [PostSecondaryDetail_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[PostSecondaryDetailInstitution] --
CREATE TABLE [extension].[PostSecondaryDetailInstitution] (
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
ALTER TABLE [extension].[PostSecondaryDetailInstitution] ADD CONSTRAINT [PostSecondaryDetailInstitution_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[ReasonNotApplied4PlusCollegeDescriptor] --
CREATE TABLE [extension].[ReasonNotApplied4PlusCollegeDescriptor] (
    [ReasonNotApplied4PlusCollegeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ReasonNotApplied4PlusCollegeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ReasonNotApplied4PlusCollegeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[ReferralDescriptor] --
CREATE TABLE [extension].[ReferralDescriptor] (
    [ReferralDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ReferralDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ReferralDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[Regulation619ComplianceReasonDescriptor] --
CREATE TABLE [extension].[Regulation619ComplianceReasonDescriptor] (
    [Regulation619ComplianceReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [Regulation619ComplianceReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [Regulation619ComplianceReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[RestraintEventCategoryDescriptor] --
CREATE TABLE [extension].[RestraintEventCategoryDescriptor] (
    [RestraintEventCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [RestraintEventCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [RestraintEventCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[RestraintSeclusion] --
CREATE TABLE [extension].[RestraintSeclusion] (
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
    [RestarintDuration] [NVARCHAR](30) NULL,
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
ALTER TABLE [extension].[RestraintSeclusion] ADD CONSTRAINT [RestraintSeclusion_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[RestraintSeclusion] ADD CONSTRAINT [RestraintSeclusion_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[RestraintSeclusion] ADD CONSTRAINT [RestraintSeclusion_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[RestraintSeclusionStaffProvidingRestraint] --
CREATE TABLE [extension].[RestraintSeclusionStaffProvidingRestraint] (
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
ALTER TABLE [extension].[RestraintSeclusionStaffProvidingRestraint] ADD CONSTRAINT [RestraintSeclusionStaffProvidingRestraint_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[SchoolExtension] --
CREATE TABLE [extension].[SchoolExtension] (
    [SchoolId] [INT] NOT NULL,
    [AttendanceConfigurationCategoryDescriptorId] [INT] NULL,
    [UnitCountException] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [SchoolExtension_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[SchoolExtension] ADD CONSTRAINT [SchoolExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[SectionExtension] --
CREATE TABLE [extension].[SectionExtension] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [Description] [NVARCHAR](1024) NULL,
    [CourseSchoolId] [INT] NULL,
    [CourseLevelNumber] [INT] NULL,
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
ALTER TABLE [extension].[SectionExtension] ADD CONSTRAINT [SectionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[SectionMarkingPeriod] --
CREATE TABLE [extension].[SectionMarkingPeriod] (
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
ALTER TABLE [extension].[SectionMarkingPeriod] ADD CONSTRAINT [SectionMarkingPeriod_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[SectionSubjectArea] --
CREATE TABLE [extension].[SectionSubjectArea] (
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
ALTER TABLE [extension].[SectionSubjectArea] ADD CONSTRAINT [SectionSubjectArea_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[ServiceStatusDescriptor] --
CREATE TABLE [extension].[ServiceStatusDescriptor] (
    [ServiceStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ServiceStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ServiceStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[StaffEducationOrganizationAssignmentAssociationExtension] --
CREATE TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] (
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
ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] ADD CONSTRAINT [StaffEducationOrganizationAssignmentAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StaffExtension] --
CREATE TABLE [extension].[StaffExtension] (
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
ALTER TABLE [extension].[StaffExtension] ADD CONSTRAINT [StaffExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StaffProgramAssociationExtension] --
CREATE TABLE [extension].[StaffProgramAssociationExtension] (
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
ALTER TABLE [extension].[StaffProgramAssociationExtension] ADD CONSTRAINT [StaffProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StaffRoleDescriptor] --
CREATE TABLE [extension].[StaffRoleDescriptor] (
    [StaffRoleDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StaffRoleDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StaffRoleDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[Student504ProgramAssociation] --
CREATE TABLE [extension].[Student504ProgramAssociation] (
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

-- Table [extension].[StudentCTEProgramAssociationCTEProgramExtension] --
CREATE TABLE [extension].[StudentCTEProgramAssociationCTEProgramExtension] (
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

-- Table [extension].[StudentEarlyChildhoodProgramAssociation] --
CREATE TABLE [extension].[StudentEarlyChildhoodProgramAssociation] (
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
    [Regulation619ComplianceReasonDescriptorId] [INT] NULL,
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

-- Table [extension].[StudentEducationOrganizationAssociationAddressExtension] --
CREATE TABLE [extension].[StudentEducationOrganizationAssociationAddressExtension] (
    [AddressTypeDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [Complex] [NVARCHAR](255) NULL,
    [Development] [NVARCHAR](255) NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationAddressExtension_PK] PRIMARY KEY CLUSTERED (
        [AddressTypeDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[StudentEducationOrganizationAssociationEthnicity] --
CREATE TABLE [extension].[StudentEducationOrganizationAssociationEthnicity] (
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
ALTER TABLE [extension].[StudentEducationOrganizationAssociationEthnicity] ADD CONSTRAINT [StudentEducationOrganizationAssociationEthnicity_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StudentEducationOrganizationAssociationExtension] --
CREATE TABLE [extension].[StudentEducationOrganizationAssociationExtension] (
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
ALTER TABLE [extension].[StudentEducationOrganizationAssociationExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StudentEducationOrganizationAssociationMultiliteracy] --
CREATE TABLE [extension].[StudentEducationOrganizationAssociationMultiliteracy] (
    [AssessmentTitle] [NVARCHAR](60) NOT NULL,
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
ALTER TABLE [extension].[StudentEducationOrganizationAssociationMultiliteracy] ADD CONSTRAINT [StudentEducationOrganizationAssociationMultiliteracy_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StudentEducationOrganizationAssociationScholarship] --
CREATE TABLE [extension].[StudentEducationOrganizationAssociationScholarship] (
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
ALTER TABLE [extension].[StudentEducationOrganizationAssociationScholarship] ADD CONSTRAINT [StudentEducationOrganizationAssociationScholarship_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StudentEducationOrganizationResponsibilityAssociationTransfer] --
CREATE TABLE [extension].[StudentEducationOrganizationResponsibilityAssociationTransfer] (
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
ALTER TABLE [extension].[StudentEducationOrganizationResponsibilityAssociationTransfer] ADD CONSTRAINT [StudentEducationOrganizationResponsibilityAssociationTransfer_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StudentExtension] --
CREATE TABLE [extension].[StudentExtension] (
    [StudentUSI] [INT] NOT NULL,
    [PersonId] [NVARCHAR](60) NULL,
    [PersonCategoryDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentExtension_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[StudentExtension] ADD CONSTRAINT [StudentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] --
CREATE TABLE [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] (
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
ALTER TABLE [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] ADD CONSTRAINT [StudentLanguageInstructionProgramAssociationLanguageImmersion_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StudentParentAssociationExtension] --
CREATE TABLE [extension].[StudentParentAssociationExtension] (
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
ALTER TABLE [extension].[StudentParentAssociationExtension] ADD CONSTRAINT [StudentParentAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StudentSchoolAttendanceEventExtension] --
CREATE TABLE [extension].[StudentSchoolAttendanceEventExtension] (
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
ALTER TABLE [extension].[StudentSchoolAttendanceEventExtension] ADD CONSTRAINT [StudentSchoolAttendanceEventExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StudentSpecialEducationProgramAssociationExtension] --
CREATE TABLE [extension].[StudentSpecialEducationProgramAssociationExtension] (
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
    [PercentOutOfRegularClass] [DECIMAL](5, 4) NULL,
    [PPPSISPInitiationDate] [DATE] NULL,
    [PPPSMeetingDate] [DATE] NULL,
    [ServiceStatusDescriptorId] [INT] NULL,
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
ALTER TABLE [extension].[StudentSpecialEducationProgramAssociationExtension] ADD CONSTRAINT [StudentSpecialEducationProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [extension].[StudentTransportation] --
CREATE TABLE [extension].[StudentTransportation] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [TravelDayOfWeekDescriptorId] [INT] NOT NULL,
    [TravelDirectionDescriptorId] [INT] NOT NULL,
    [TravelSegment] [INT] NOT NULL,
    [TravelTrip] [INT] NOT NULL,
    [TravelCategoryDescriptorId] [INT] NOT NULL,
    [BusNumber] [NVARCHAR](10) NULL,
    [BusRouteNumber] [NVARCHAR](10) NULL,
    [ShuttleStop] [NVARCHAR](6) NULL,
    [StopDescription] [NVARCHAR](1024) NULL,
    [StopNumber] [NVARCHAR](10) NULL,
    [StopTime] [TIME](7) NULL,
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
ALTER TABLE [extension].[StudentTransportation] ADD CONSTRAINT [StudentTransportation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[StudentTransportation] ADD CONSTRAINT [StudentTransportation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[StudentTransportation] ADD CONSTRAINT [StudentTransportation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[SubjectAreaCode] --
CREATE TABLE [extension].[SubjectAreaCode] (
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [PerfPlusCode] [NVARCHAR](50) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [SubjectAreaCode_PK] PRIMARY KEY CLUSTERED (
        [AcademicSubjectDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [extension].[SubjectAreaCode] ADD CONSTRAINT [SubjectAreaCode_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [extension].[SubjectAreaCode] ADD CONSTRAINT [SubjectAreaCode_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [extension].[SubjectAreaCode] ADD CONSTRAINT [SubjectAreaCode_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [extension].[SupportPlanChangeDescriptor] --
CREATE TABLE [extension].[SupportPlanChangeDescriptor] (
    [SupportPlanChangeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SupportPlanChangeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SupportPlanChangeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[TravelCategoryDescriptor] --
CREATE TABLE [extension].[TravelCategoryDescriptor] (
    [TravelCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TravelCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TravelCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[TravelDayOfWeekDescriptor] --
CREATE TABLE [extension].[TravelDayOfWeekDescriptor] (
    [TravelDayOfWeekDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TravelDayOfWeekDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TravelDayOfWeekDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[TravelDirectionDescriptor] --
CREATE TABLE [extension].[TravelDirectionDescriptor] (
    [TravelDirectionDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TravelDirectionDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TravelDirectionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[TreatmentDescriptor] --
CREATE TABLE [extension].[TreatmentDescriptor] (
    [TreatmentDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TreatmentDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TreatmentDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [extension].[VictimCategoryDescriptor] --
CREATE TABLE [extension].[VictimCategoryDescriptor] (
    [VictimCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [VictimCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [VictimCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

