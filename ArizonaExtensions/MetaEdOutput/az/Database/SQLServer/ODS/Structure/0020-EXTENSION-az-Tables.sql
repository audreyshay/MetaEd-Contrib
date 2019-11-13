-- Table [az].[AbsenceAmountDescriptor] --
CREATE TABLE [az].[AbsenceAmountDescriptor] (
    [AbsenceAmountDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AbsenceAmountDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AbsenceAmountDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[CalendarExtension] --
CREATE TABLE [az].[CalendarExtension] (
    [CalendarCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [TrackLocalEducationAgencyId] [INT] NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [EndDate] [DATE] NOT NULL,
    [TotalInstructionalDays] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CalendarExtension_PK] PRIMARY KEY CLUSTERED (
        [CalendarCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[CalendarExtension] ADD CONSTRAINT [CalendarExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[CourseEntryDescriptor] --
CREATE TABLE [az].[CourseEntryDescriptor] (
    [CourseEntryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CourseEntryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CourseEntryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[CourseExitDescriptor] --
CREATE TABLE [az].[CourseExitDescriptor] (
    [CourseExitDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CourseExitDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CourseExitDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[CourseOfferingCourseSchedule] --
CREATE TABLE [az].[CourseOfferingCourseSchedule] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [ScheduleDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [InstructionalMinutesPlanned] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseOfferingCourseSchedule_PK] PRIMARY KEY CLUSTERED (
        [LocalCourseCode] ASC,
        [ScheduleDate] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[CourseOfferingCourseSchedule] ADD CONSTRAINT [CourseOfferingCourseSchedule_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[CourseOfferingExtension] --
CREATE TABLE [az].[CourseOfferingExtension] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [EndOfCourseAssessmentCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseOfferingExtension_PK] PRIMARY KEY CLUSTERED (
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[CourseOfferingExtension] ADD CONSTRAINT [CourseOfferingExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[EducationLevelDescriptor] --
CREATE TABLE [az].[EducationLevelDescriptor] (
    [EducationLevelDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EducationLevelDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EducationLevelDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[EndOfCourseAssessmentCodeDescriptor] --
CREATE TABLE [az].[EndOfCourseAssessmentCodeDescriptor] (
    [EndOfCourseAssessmentCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EndOfCourseAssessmentCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EndOfCourseAssessmentCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[ExitWithdrawReasonDescriptor] --
CREATE TABLE [az].[ExitWithdrawReasonDescriptor] (
    [ExitWithdrawReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ExitWithdrawReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ExitWithdrawReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[MembershipFTEDescriptor] --
CREATE TABLE [az].[MembershipFTEDescriptor] (
    [MembershipFTEDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MembershipFTEDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MembershipFTEDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[MembershipResponsibilityDescriptor] --
CREATE TABLE [az].[MembershipResponsibilityDescriptor] (
    [MembershipResponsibilityDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MembershipResponsibilityDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MembershipResponsibilityDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[MembershipTypeDescriptor] --
CREATE TABLE [az].[MembershipTypeDescriptor] (
    [MembershipTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MembershipTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MembershipTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[MonthDescriptor] --
CREATE TABLE [az].[MonthDescriptor] (
    [MonthDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MonthDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MonthDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[NumberOfInstructionalDaysInWeekDescriptor] --
CREATE TABLE [az].[NumberOfInstructionalDaysInWeekDescriptor] (
    [NumberOfInstructionalDaysInWeekDescriptorId] [INT] NOT NULL,
    CONSTRAINT [NumberOfInstructionalDaysInWeekDescriptor_PK] PRIMARY KEY CLUSTERED (
        [NumberOfInstructionalDaysInWeekDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[PrimaryNightTimeResidenceDescriptor] --
CREATE TABLE [az].[PrimaryNightTimeResidenceDescriptor] (
    [PrimaryNightTimeResidenceDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PrimaryNightTimeResidenceDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PrimaryNightTimeResidenceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[SectionExtension] --
CREATE TABLE [az].[SectionExtension] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [TimetableDayIdentifier] [NVARCHAR](250) NULL,
    [Note] [NVARCHAR](250) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionExtension_PK] PRIMARY KEY CLUSTERED (
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[SectionExtension] ADD CONSTRAINT [SectionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[SectionExternalProviderTeacher] --
CREATE TABLE [az].[SectionExternalProviderTeacher] (
    [ExternalProviderName] [NVARCHAR](75) NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [ProviderTeacherFirstName] [NVARCHAR](50) NOT NULL,
    [ProviderTeacherLastName] [NVARCHAR](50) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ClassroomPositionDescriptorId] [INT] NULL,
    [BeginDate] [DATE] NULL,
    [EndDate] [DATE] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SectionExternalProviderTeacher_PK] PRIMARY KEY CLUSTERED (
        [ExternalProviderName] ASC,
        [LocalCourseCode] ASC,
        [ProviderTeacherFirstName] ASC,
        [ProviderTeacherLastName] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[SectionExternalProviderTeacher] ADD CONSTRAINT [SectionExternalProviderTeacher_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[SpecialEnrollmentDescriptor] --
CREATE TABLE [az].[SpecialEnrollmentDescriptor] (
    [SpecialEnrollmentDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEnrollmentDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEnrollmentDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[StaffEducationOrganizationEmploymentAssociationExtension] --
CREATE TABLE [az].[StaffEducationOrganizationEmploymentAssociationExtension] (
    [EducationOrganizationId] [INT] NOT NULL,
    [EmploymentStatusDescriptorId] [INT] NOT NULL,
    [HireDate] [DATE] NOT NULL,
    [StaffUSI] [INT] NOT NULL,
    [EducationLevelDescriptorId] [INT] NULL,
    [Benefits] [DECIMAL](5, 2) NULL,
    [Salary] [MONEY] NOT NULL,
    [FullTimeEquivalencyOther] [DECIMAL](5, 4) NULL,
    [PSP] [BIT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StaffEducationOrganizationEmploymentAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [EmploymentStatusDescriptorId] ASC,
        [HireDate] ASC,
        [StaffUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StaffEducationOrganizationEmploymentAssociationExtension] ADD CONSTRAINT [StaffEducationOrganizationEmploymentAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[StudentDropOutRecoveryProgramAssociation] --
CREATE TABLE [az].[StudentDropOutRecoveryProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [WrittenLearningPlanDate] [DATE] NOT NULL,
    CONSTRAINT [StudentDropOutRecoveryProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[StudentDropOutRecoveryProgramMonthlyUpdate] --
CREATE TABLE [az].[StudentDropOutRecoveryProgramMonthlyUpdate] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [MonthDescriptorId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [RevisedWrittenLearningPlanDate] [DATE] NULL,
    [SatisfactoryProgress] [BIT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [MonthDescriptorId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentDropOutRecoveryProgramMonthlyUpdate] ADD CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [az].[StudentDropOutRecoveryProgramMonthlyUpdate] ADD CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [az].[StudentDropOutRecoveryProgramMonthlyUpdate] ADD CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [az].[StudentEducationOrganizationAssociationAZTribalAffiliation] --
CREATE TABLE [az].[StudentEducationOrganizationAssociationAZTribalAffiliation] (
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [TribalAffiliationDescriptorId] [INT] NOT NULL,
    [OtherAffiliation] [NVARCHAR](250) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationAZTribalAffiliation_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC,
        [TribalAffiliationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentEducationOrganizationAssociationAZTribalAffiliation] ADD CONSTRAINT [StudentEducationOrganizationAssociationAZTribalAffiliation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[StudentNeed] --
CREATE TABLE [az].[StudentNeed] (
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentNeedDescriptorId] [INT] NOT NULL,
    [StudentNeedEntryDate] [DATE] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [StudentNeedExitDate] [DATE] NULL,
    [PrimaryStudentNeedIndicator] [BIT] NULL,
    [PrimaryNightTimeResidenceDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentNeed_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentNeedDescriptorId] ASC,
        [StudentNeedEntryDate] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentNeed] ADD CONSTRAINT [StudentNeed_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [az].[StudentNeed] ADD CONSTRAINT [StudentNeed_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [az].[StudentNeed] ADD CONSTRAINT [StudentNeed_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [az].[StudentNeedCategoryDescriptor] --
CREATE TABLE [az].[StudentNeedCategoryDescriptor] (
    [StudentNeedCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StudentNeedCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StudentNeedCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[StudentNeedDescriptor] --
CREATE TABLE [az].[StudentNeedDescriptor] (
    [StudentNeedDescriptorId] [INT] NOT NULL,
    [StudentNeedCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StudentNeedDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StudentNeedDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[StudentProgramAttendanceEventTimeLog] --
CREATE TABLE [az].[StudentProgramAttendanceEventTimeLog] (
    [AttendanceBeginTime] [TIME](7) NOT NULL,
    [AttendanceEventCategoryDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AttendanceEndTime] [TIME](7) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentProgramAttendanceEventTimeLog_PK] PRIMARY KEY CLUSTERED (
        [AttendanceBeginTime] ASC,
        [AttendanceEventCategoryDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [EventDate] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentProgramAttendanceEventTimeLog] ADD CONSTRAINT [StudentProgramAttendanceEventTimeLog_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[StudentSchoolAssociationExtension] --
CREATE TABLE [az].[StudentSchoolAssociationExtension] (
    [EntryDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ExitWithdrawReasonDescriptorId] [INT] NULL,
    [MembershipTypeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentSchoolAssociationExtension] ADD CONSTRAINT [StudentSchoolAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[StudentSchoolAssociationLocalEducationAgency] --
CREATE TABLE [az].[StudentSchoolAssociationLocalEducationAgency] (
    [EntryDate] [DATE] NOT NULL,
    [MembershipResponsibilityDescriptorId] [INT] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StartDate] [DATE] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [EndDate] [DATE] NULL,
    [LocalEducationAgencyId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [MembershipResponsibilityDescriptorId] ASC,
        [SchoolId] ASC,
        [StartDate] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentSchoolAssociationLocalEducationAgency] ADD CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[StudentSchoolAssociationMembershipFTE] --
CREATE TABLE [az].[StudentSchoolAssociationMembershipFTE] (
    [EntryDate] [DATE] NOT NULL,
    [FTEStartDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [FTEEndDate] [DATE] NULL,
    [MembershipFTEDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationMembershipFTE_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [FTEStartDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentSchoolAssociationMembershipFTE] ADD CONSTRAINT [StudentSchoolAssociationMembershipFTE_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[StudentSchoolAssociationSpecialEnrollment] --
CREATE TABLE [az].[StudentSchoolAssociationSpecialEnrollment] (
    [EntryDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SpecialEnrollmentStartDate] [DATE] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [SpecialEnrollmentEndDate] [DATE] NULL,
    [SpecialEnrollmentDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationSpecialEnrollment_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [SchoolId] ASC,
        [SpecialEnrollmentStartDate] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentSchoolAssociationSpecialEnrollment] ADD CONSTRAINT [StudentSchoolAssociationSpecialEnrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[StudentSchoolAssociationTuitionPayer] --
CREATE TABLE [az].[StudentSchoolAssociationTuitionPayer] (
    [EntryDate] [DATE] NOT NULL,
    [PayerStartDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [PayerEndDate] [DATE] NULL,
    [TuitionPayerDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationTuitionPayer_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [PayerStartDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentSchoolAssociationTuitionPayer] ADD CONSTRAINT [StudentSchoolAssociationTuitionPayer_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[StudentSchoolAttendanceEventExtension] --
CREATE TABLE [az].[StudentSchoolAttendanceEventExtension] (
    [AttendanceEventCategoryDescriptorId] [INT] NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [InstructionalMinutes] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
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
ALTER TABLE [az].[StudentSchoolAttendanceEventExtension] ADD CONSTRAINT [StudentSchoolAttendanceEventExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[StudentSectionAssociationExtension] --
CREATE TABLE [az].[StudentSectionAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [Note] [NVARCHAR](250) NULL,
    [CourseEntryDescriptorId] [INT] NULL,
    [CourseExitDescriptorId] [INT] NULL,
    [DualCredit] [BIT] NOT NULL,
    [ConcurrentEnrollment] [BIT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSectionAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentSectionAssociationExtension] ADD CONSTRAINT [StudentSectionAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[StudentSpecialEducationProgramAssociationExtension] --
CREATE TABLE [az].[StudentSpecialEducationProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [MainSPEDSchool] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
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
ALTER TABLE [az].[StudentSpecialEducationProgramAssociationExtension] ADD CONSTRAINT [StudentSpecialEducationProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[TuitionPayerDescriptor] --
CREATE TABLE [az].[TuitionPayerDescriptor] (
    [TuitionPayerDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TuitionPayerDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TuitionPayerDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

