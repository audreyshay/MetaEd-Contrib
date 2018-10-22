-- Table [arizona].[AbsenceAmountDescriptor] --
CREATE TABLE [arizona].[AbsenceAmountDescriptor] (
    [AbsenceAmountDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AbsenceAmountDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AbsenceAmountDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[CalendarDateTrackEvent] --
CREATE TABLE [arizona].[CalendarDateTrackEvent] (
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
ALTER TABLE [arizona].[CalendarDateTrackEvent] ADD CONSTRAINT [CalendarDateTrackEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [arizona].[CalendarDateTrackEvent] ADD CONSTRAINT [CalendarDateTrackEvent_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [arizona].[CalendarDateTrackEvent] ADD CONSTRAINT [CalendarDateTrackEvent_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [arizona].[CourseEntryDescriptor] --
CREATE TABLE [arizona].[CourseEntryDescriptor] (
    [CourseEntryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CourseEntryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CourseEntryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[CourseExitDescriptor] --
CREATE TABLE [arizona].[CourseExitDescriptor] (
    [CourseExitDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CourseExitDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CourseExitDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[CourseOfferingCourseSchedule] --
CREATE TABLE [arizona].[CourseOfferingCourseSchedule] (
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
ALTER TABLE [arizona].[CourseOfferingCourseSchedule] ADD CONSTRAINT [CourseOfferingCourseSchedule_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[CourseOfferingExtension] --
CREATE TABLE [arizona].[CourseOfferingExtension] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [EndOfCourseAssessmentCodeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [CourseOfferingExtension_PK] PRIMARY KEY CLUSTERED (
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [arizona].[CourseOfferingExtension] ADD CONSTRAINT [CourseOfferingExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[EndOfCourseAssessmentCodeDescriptor] --
CREATE TABLE [arizona].[EndOfCourseAssessmentCodeDescriptor] (
    [EndOfCourseAssessmentCodeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EndOfCourseAssessmentCodeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EndOfCourseAssessmentCodeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[ExitWithdrawReasonDescriptor] --
CREATE TABLE [arizona].[ExitWithdrawReasonDescriptor] (
    [ExitWithdrawReasonDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ExitWithdrawReasonDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ExitWithdrawReasonDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[MembershipFTEDescriptor] --
CREATE TABLE [arizona].[MembershipFTEDescriptor] (
    [MembershipFTEDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MembershipFTEDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MembershipFTEDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[MembershipResponsibilityDescriptor] --
CREATE TABLE [arizona].[MembershipResponsibilityDescriptor] (
    [MembershipResponsibilityDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MembershipResponsibilityDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MembershipResponsibilityDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[MembershipTypeDescriptor] --
CREATE TABLE [arizona].[MembershipTypeDescriptor] (
    [MembershipTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MembershipTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MembershipTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[MonthDescriptor] --
CREATE TABLE [arizona].[MonthDescriptor] (
    [MonthDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MonthDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MonthDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[NumberOfInstructionalDaysInWeekDescriptor] --
CREATE TABLE [arizona].[NumberOfInstructionalDaysInWeekDescriptor] (
    [NumberOfInstructionalDaysInWeekDescriptorId] [INT] NOT NULL,
    CONSTRAINT [NumberOfInstructionalDaysInWeekDescriptor_PK] PRIMARY KEY CLUSTERED (
        [NumberOfInstructionalDaysInWeekDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[PrimaryNightTimeResidenceDescriptor] --
CREATE TABLE [arizona].[PrimaryNightTimeResidenceDescriptor] (
    [PrimaryNightTimeResidenceDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PrimaryNightTimeResidenceDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PrimaryNightTimeResidenceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[SectionCourseCharacteristic] --
CREATE TABLE [arizona].[SectionCourseCharacteristic] (
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
ALTER TABLE [arizona].[SectionCourseCharacteristic] ADD CONSTRAINT [SectionCourseCharacteristic_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[SectionExtension] --
CREATE TABLE [arizona].[SectionExtension] (
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
ALTER TABLE [arizona].[SectionExtension] ADD CONSTRAINT [SectionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[SectionExternalProviderTeacher] --
CREATE TABLE [arizona].[SectionExternalProviderTeacher] (
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
ALTER TABLE [arizona].[SectionExternalProviderTeacher] ADD CONSTRAINT [SectionExternalProviderTeacher_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[SectionGradeLevel] --
CREATE TABLE [arizona].[SectionGradeLevel] (
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
ALTER TABLE [arizona].[SectionGradeLevel] ADD CONSTRAINT [SectionGradeLevel_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[SessionExtension] --
CREATE TABLE [arizona].[SessionExtension] (
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
ALTER TABLE [arizona].[SessionExtension] ADD CONSTRAINT [SessionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[SessionTypeDescriptor] --
CREATE TABLE [arizona].[SessionTypeDescriptor] (
    [SessionTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SessionTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SessionTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[SpecialEnrollmentDescriptor] --
CREATE TABLE [arizona].[SpecialEnrollmentDescriptor] (
    [SpecialEnrollmentDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEnrollmentDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEnrollmentDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[StudentDropOutRecoveryProgramAssociation] --
CREATE TABLE [arizona].[StudentDropOutRecoveryProgramAssociation] (
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

-- Table [arizona].[StudentDropOutRecoveryProgramMonthlyUpdate] --
CREATE TABLE [arizona].[StudentDropOutRecoveryProgramMonthlyUpdate] (
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
ALTER TABLE [arizona].[StudentDropOutRecoveryProgramMonthlyUpdate] ADD CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [arizona].[StudentDropOutRecoveryProgramMonthlyUpdate] ADD CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [arizona].[StudentDropOutRecoveryProgramMonthlyUpdate] ADD CONSTRAINT [StudentDropOutRecoveryProgramMonthlyUpdate_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [arizona].[StudentExtension] --
CREATE TABLE [arizona].[StudentExtension] (
    [StudentUSI] [INT] NOT NULL,
    [TribalName] [NVARCHAR](75) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentExtension_PK] PRIMARY KEY CLUSTERED (
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [arizona].[StudentExtension] ADD CONSTRAINT [StudentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[StudentNeed] --
CREATE TABLE [arizona].[StudentNeed] (
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
ALTER TABLE [arizona].[StudentNeed] ADD CONSTRAINT [StudentNeed_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [arizona].[StudentNeed] ADD CONSTRAINT [StudentNeed_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [arizona].[StudentNeed] ADD CONSTRAINT [StudentNeed_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [arizona].[StudentNeedCategoryDescriptor] --
CREATE TABLE [arizona].[StudentNeedCategoryDescriptor] (
    [StudentNeedCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StudentNeedCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StudentNeedCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[StudentNeedDescriptor] --
CREATE TABLE [arizona].[StudentNeedDescriptor] (
    [StudentNeedDescriptorId] [INT] NOT NULL,
    [StudentNeedCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StudentNeedDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StudentNeedDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[StudentProgramAttendanceEventTimeLog] --
CREATE TABLE [arizona].[StudentProgramAttendanceEventTimeLog] (
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
ALTER TABLE [arizona].[StudentProgramAttendanceEventTimeLog] ADD CONSTRAINT [StudentProgramAttendanceEventTimeLog_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[StudentSchoolAssociationExtension] --
CREATE TABLE [arizona].[StudentSchoolAssociationExtension] (
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
ALTER TABLE [arizona].[StudentSchoolAssociationExtension] ADD CONSTRAINT [StudentSchoolAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[StudentSchoolAssociationLocalEducationAgency] --
CREATE TABLE [arizona].[StudentSchoolAssociationLocalEducationAgency] (
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
ALTER TABLE [arizona].[StudentSchoolAssociationLocalEducationAgency] ADD CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [arizona].[StudentSchoolAssociationLocalEducationAgency] ADD CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [arizona].[StudentSchoolAssociationLocalEducationAgency] ADD CONSTRAINT [StudentSchoolAssociationLocalEducationAgency_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [arizona].[StudentSchoolAssociationMembershipFTE] --
CREATE TABLE [arizona].[StudentSchoolAssociationMembershipFTE] (
    [EntryDate] [DATE] NOT NULL,
    [FTEStartDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [FTEEndDate] [DATE] NULL,
    [MembershipFTEDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationMembershipFTE_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [FTEStartDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [arizona].[StudentSchoolAssociationMembershipFTE] ADD CONSTRAINT [StudentSchoolAssociationMembershipFTE_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [arizona].[StudentSchoolAssociationMembershipFTE] ADD CONSTRAINT [StudentSchoolAssociationMembershipFTE_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [arizona].[StudentSchoolAssociationMembershipFTE] ADD CONSTRAINT [StudentSchoolAssociationMembershipFTE_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [arizona].[StudentSchoolAssociationSpecialEnrollment] --
CREATE TABLE [arizona].[StudentSchoolAssociationSpecialEnrollment] (
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
ALTER TABLE [arizona].[StudentSchoolAssociationSpecialEnrollment] ADD CONSTRAINT [StudentSchoolAssociationSpecialEnrollment_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [arizona].[StudentSchoolAssociationSpecialEnrollment] ADD CONSTRAINT [StudentSchoolAssociationSpecialEnrollment_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [arizona].[StudentSchoolAssociationSpecialEnrollment] ADD CONSTRAINT [StudentSchoolAssociationSpecialEnrollment_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [arizona].[StudentSchoolAssociationTuitionPayer] --
CREATE TABLE [arizona].[StudentSchoolAssociationTuitionPayer] (
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
ALTER TABLE [arizona].[StudentSchoolAssociationTuitionPayer] ADD CONSTRAINT [StudentSchoolAssociationTuitionPayer_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [arizona].[StudentSchoolAssociationTuitionPayer] ADD CONSTRAINT [StudentSchoolAssociationTuitionPayer_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [arizona].[StudentSchoolAssociationTuitionPayer] ADD CONSTRAINT [StudentSchoolAssociationTuitionPayer_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [arizona].[StudentSchoolAttendanceEventExtension] --
CREATE TABLE [arizona].[StudentSchoolAttendanceEventExtension] (
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
ALTER TABLE [arizona].[StudentSchoolAttendanceEventExtension] ADD CONSTRAINT [StudentSchoolAttendanceEventExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[StudentSectionAssociationExtension] --
CREATE TABLE [arizona].[StudentSectionAssociationExtension] (
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
ALTER TABLE [arizona].[StudentSectionAssociationExtension] ADD CONSTRAINT [StudentSectionAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [arizona].[Track] --
CREATE TABLE [arizona].[Track] (
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
ALTER TABLE [arizona].[Track] ADD CONSTRAINT [Track_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [arizona].[Track] ADD CONSTRAINT [Track_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [arizona].[Track] ADD CONSTRAINT [Track_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [arizona].[TrackEventDescriptor] --
CREATE TABLE [arizona].[TrackEventDescriptor] (
    [TrackEventDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TrackEventDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TrackEventDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[TrackNumberDescriptor] --
CREATE TABLE [arizona].[TrackNumberDescriptor] (
    [TrackNumberDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TrackNumberDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TrackNumberDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [arizona].[TuitionPayerDescriptor] --
CREATE TABLE [arizona].[TuitionPayerDescriptor] (
    [TuitionPayerDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TuitionPayerDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TuitionPayerDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

