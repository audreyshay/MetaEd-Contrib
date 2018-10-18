-- Table [az].[AbsenceAmountDescriptor] --
CREATE TABLE [az].[AbsenceAmountDescriptor] (
    [AbsenceAmountDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AbsenceAmountDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AbsenceAmountDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[CalendarDateTrackEvent] --
CREATE TABLE [az].[CalendarDateTrackEvent] (
    [Date] [DATE] NOT NULL,
    [TrackEventDescriptorId] [INT] NOT NULL,
    [TrackLocalEducationAgencyId] [INT] NOT NULL,
    [TrackNumberDescriptorId] [INT] NOT NULL,
    [TrackSchoolId] [INT] NOT NULL,
    [EventDuration] [DECIMAL](3, 2) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CalendarDateTrackEvent_PK] PRIMARY KEY CLUSTERED (
        [Date] ASC,
        [TrackEventDescriptorId] ASC,
        [TrackLocalEducationAgencyId] ASC,
        [TrackNumberDescriptorId] ASC,
        [TrackSchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[CalendarDateTrackEvent] ADD CONSTRAINT [CalendarDateTrackEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [az].[CalendarDateTrackEvent] ADD CONSTRAINT [CalendarDateTrackEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [az].[CalendarDateTrackEvent] ADD CONSTRAINT [CalendarDateTrackEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
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
    [CreateDate] [DATETIME] NOT NULL,
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
    [EndOfCourseAssessmentCodeTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
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

-- Table [az].[EndOfCourseAssessmentCodeTypeDescriptor] --
CREATE TABLE [az].[EndOfCourseAssessmentCodeTypeDescriptor] (
    [EndOfCourseAssessmentCodeTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EndOfCourseAssessmentCodeTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EndOfCourseAssessmentCodeTypeDescriptorId] ASC
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

-- Table [az].[SectionCourseCharacteristic] --
CREATE TABLE [az].[SectionCourseCharacteristic] (
    [CourseLevelCharacteristicDescriptorId] [INT] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [SectionCourseCharacteristic_PK] PRIMARY KEY CLUSTERED (
        [CourseLevelCharacteristicDescriptorId] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[SectionCourseCharacteristic] ADD CONSTRAINT [SectionCourseCharacteristic_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
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
    [CreateDate] [DATETIME] NOT NULL,
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

-- Table [az].[SectionGradeLevel] --
CREATE TABLE [az].[SectionGradeLevel] (
    [GradeLevelDescriptorId] [INT] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [SectionGradeLevel_PK] PRIMARY KEY CLUSTERED (
        [GradeLevelDescriptorId] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[SectionGradeLevel] ADD CONSTRAINT [SectionGradeLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[SessionExtension] --
CREATE TABLE [az].[SessionExtension] (
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [SessionTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [SessionExtension_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[SessionExtension] ADD CONSTRAINT [SessionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [az].[SessionTypeDescriptor] --
CREATE TABLE [az].[SessionTypeDescriptor] (
    [SessionTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SessionTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SessionTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[SpecialEnrollmentDescriptor] --
CREATE TABLE [az].[SpecialEnrollmentDescriptor] (
    [SpecialEnrollmentDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEnrollmentDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEnrollmentDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
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

-- Table [az].[StudentExtension] --
CREATE TABLE [az].[StudentExtension] (
    [StudentUSI] [INT] NOT NULL,
    [TribalName] [NVARCHAR](75) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentExtension_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentExtension] ADD CONSTRAINT [StudentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
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
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
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
    [CreateDate] [DATETIME] NOT NULL,
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
    [TrackSchoolId] [INT] NULL,
    [TrackNumberDescriptorId] [INT] NULL,
    [TrackLocalEducationAgencyId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
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
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
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
ALTER TABLE [az].[StudentSchoolAssociationLocalEducationAgency] ADD CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [az].[StudentSchoolAssociationLocalEducationAgency] ADD CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [az].[StudentSchoolAssociationMembershipFTE] --
CREATE TABLE [az].[StudentSchoolAssociationMembershipFTE] (
    [FTEStartDate] [DATE] NOT NULL,
    [FTEEndDate] [DATE] NULL,
    [MembershipFTEDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationMembershipFTE_PK] PRIMARY KEY CLUSTERED (
        [FTEStartDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[StudentSchoolAssociationMembershipFTE] ADD CONSTRAINT [StudentSchoolAssociationMembershipFTE_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [az].[StudentSchoolAssociationMembershipFTE] ADD CONSTRAINT [StudentSchoolAssociationMembershipFTE_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [az].[StudentSchoolAssociationMembershipFTE] ADD CONSTRAINT [StudentSchoolAssociationMembershipFTE_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [az].[StudentSchoolAssociationSpecialEnrollment] --
CREATE TABLE [az].[StudentSchoolAssociationSpecialEnrollment] (
    [EntryDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SpecialEnrollmentStartDate] [DATE] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [SpecialEnrollmentEndDate] [DATE] NULL,
    [SpecialEnrollmentDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
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
ALTER TABLE [az].[StudentSchoolAssociationSpecialEnrollment] ADD CONSTRAINT [StudentSchoolAssociationSpecialEnrollment_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [az].[StudentSchoolAssociationSpecialEnrollment] ADD CONSTRAINT [StudentSchoolAssociationSpecialEnrollment_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [az].[StudentSchoolAssociationTuitionPayer] --
CREATE TABLE [az].[StudentSchoolAssociationTuitionPayer] (
    [EntryDate] [DATE] NOT NULL,
    [PayerStartDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [PayerEndDate] [DATE] NULL,
    [TuitionPayerDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
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
ALTER TABLE [az].[StudentSchoolAssociationTuitionPayer] ADD CONSTRAINT [StudentSchoolAssociationTuitionPayer_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [az].[StudentSchoolAssociationTuitionPayer] ADD CONSTRAINT [StudentSchoolAssociationTuitionPayer_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [az].[StudentSchoolAttendanceEventExtension] --
CREATE TABLE [az].[StudentSchoolAttendanceEventExtension] (
    [AttendanceEventCategoryDescriptorId] [INT] NOT NULL,
    [EventDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AbsenceAmountDescriptorId] [INT] NULL,
    [InstructionalMinutes] [INT] NULL,
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
    [DualCredit] [BIT] NULL,
    [ConcurrentEnrollment] [BIT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
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

-- Table [az].[Track] --
CREATE TABLE [az].[Track] (
    [TrackLocalEducationAgencyId] [INT] NOT NULL,
    [TrackNumberDescriptorId] [INT] NOT NULL,
    [TrackSchoolId] [INT] NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [EndDate] [DATE] NOT NULL,
    [TotalInstructionalDays] [INT] NOT NULL,
    [NumberOfInstructionalDaysInWeekDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [Track_PK] PRIMARY KEY CLUSTERED (
        [TrackLocalEducationAgencyId] ASC,
        [TrackNumberDescriptorId] ASC,
        [TrackSchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [az].[Track] ADD CONSTRAINT [Track_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [az].[Track] ADD CONSTRAINT [Track_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [az].[Track] ADD CONSTRAINT [Track_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [az].[TrackEventDescriptor] --
CREATE TABLE [az].[TrackEventDescriptor] (
    [TrackEventDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TrackEventDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TrackEventDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[TrackNumberDescriptor] --
CREATE TABLE [az].[TrackNumberDescriptor] (
    [TrackNumberDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TrackNumberDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TrackNumberDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [az].[TuitionPayerDescriptor] --
CREATE TABLE [az].[TuitionPayerDescriptor] (
    [TuitionPayerDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TuitionPayerDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TuitionPayerDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

