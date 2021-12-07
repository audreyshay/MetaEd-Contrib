-- Table [mn].[AncestryEthnicOriginDescriptor] --
CREATE TABLE [mn].[AncestryEthnicOriginDescriptor] (
    [AncestryEthnicOriginDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AncestryEthnicOriginDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AncestryEthnicOriginDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[AssessmentCharacteristicDescriptor] --
CREATE TABLE [mn].[AssessmentCharacteristicDescriptor] (
    [AssessmentCharacteristicDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AssessmentCharacteristicDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AssessmentCharacteristicDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[AssessmentFormatDescriptor] --
CREATE TABLE [mn].[AssessmentFormatDescriptor] (
    [AssessmentFormatDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AssessmentFormatDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AssessmentFormatDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[AssessmentStatusDescriptor] --
CREATE TABLE [mn].[AssessmentStatusDescriptor] (
    [AssessmentStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AssessmentStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AssessmentStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[AssessmentTierDescriptor] --
CREATE TABLE [mn].[AssessmentTierDescriptor] (
    [AssessmentTierDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AssessmentTierDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AssessmentTierDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[AssessmentToolDescriptor] --
CREATE TABLE [mn].[AssessmentToolDescriptor] (
    [AssessmentToolDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AssessmentToolDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AssessmentToolDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[CalendarExtension] --
CREATE TABLE [mn].[CalendarExtension] (
    [CalendarCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [CalendarDescription] [NVARCHAR](100) NULL,
    [DaysInSession] [DECIMAL](5, 2) NULL,
    [InstructionalDays] [DECIMAL](5, 2) NULL,
    [KindergartenScheduleDescriptorId] [INT] NULL,
    [LengthOfDay] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CalendarExtension_PK] PRIMARY KEY CLUSTERED (
        [CalendarCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[CalendarExtension] ADD CONSTRAINT [CalendarExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[CareerClusterDescriptor] --
CREATE TABLE [mn].[CareerClusterDescriptor] (
    [CareerClusterDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CareerClusterDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CareerClusterDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[ClassPeriodExtension] --
CREATE TABLE [mn].[ClassPeriodExtension] (
    [ClassPeriodName] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [ClassPeriodDescription] [NVARCHAR](100) NULL,
    [ClassPeriodTypeDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ClassPeriodExtension_PK] PRIMARY KEY CLUSTERED (
        [ClassPeriodName] ASC,
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[ClassPeriodExtension] ADD CONSTRAINT [ClassPeriodExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[ClassPeriodTypeDescriptor] --
CREATE TABLE [mn].[ClassPeriodTypeDescriptor] (
    [ClassPeriodTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ClassPeriodTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ClassPeriodTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[ClassroomVolunteerDescriptor] --
CREATE TABLE [mn].[ClassroomVolunteerDescriptor] (
    [ClassroomVolunteerDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ClassroomVolunteerDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ClassroomVolunteerDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[CourseAssessmentTool] --
CREATE TABLE [mn].[CourseAssessmentTool] (
    [AssessmentToolDescriptorId] [INT] NOT NULL,
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ImplementationStatusDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseAssessmentTool_PK] PRIMARY KEY CLUSTERED (
        [AssessmentToolDescriptorId] ASC,
        [CourseCode] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[CourseAssessmentTool] ADD CONSTRAINT [CourseAssessmentTool_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[CourseCourseAssociation] --
CREATE TABLE [mn].[CourseCourseAssociation] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ToCourseCode] [NVARCHAR](60) NOT NULL,
    [ToCourseEducationOrganizationId] [INT] NOT NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CourseCourseAssociation_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [ToCourseCode] ASC,
        [ToCourseEducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[CourseCourseAssociation] ADD CONSTRAINT [CourseCourseAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [mn].[CourseCourseAssociation] ADD CONSTRAINT [CourseCourseAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [mn].[CourseCourseAssociation] ADD CONSTRAINT [CourseCourseAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [mn].[CourseCurriculumUsed] --
CREATE TABLE [mn].[CourseCurriculumUsed] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [CurriculumUsedDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ImplementationStatusDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseCurriculumUsed_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [CurriculumUsedDescriptorId] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[CourseCurriculumUsed] ADD CONSTRAINT [CourseCurriculumUsed_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[CourseExtension] --
CREATE TABLE [mn].[CourseExtension] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [EarlyEducationCourseLocationDescriptorId] [INT] NULL,
    [SequenceLimit] [INT] NULL,
    [StandardAddressedDescriptorId] [INT] NULL,
    [CareerClusterDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseExtension_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[CourseExtension] ADD CONSTRAINT [CourseExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[CourseLevelType] --
CREATE TABLE [mn].[CourseLevelType] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [CourseLevelTypeDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseLevelType_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [CourseLevelTypeDescriptorId] ASC,
        [EducationOrganizationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[CourseLevelType] ADD CONSTRAINT [CourseLevelType_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[CourseLevelTypeDescriptor] --
CREATE TABLE [mn].[CourseLevelTypeDescriptor] (
    [CourseLevelTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CourseLevelTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CourseLevelTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[CourseOfferingExtension] --
CREATE TABLE [mn].[CourseOfferingExtension] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [InstructionMinutesPerTerm] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseOfferingExtension_PK] PRIMARY KEY CLUSTERED (
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[CourseOfferingExtension] ADD CONSTRAINT [CourseOfferingExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[CourseOfferingInstructionalApproach] --
CREATE TABLE [mn].[CourseOfferingInstructionalApproach] (
    [InstructionalApproachDescriptorId] [INT] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [ImplementationStatusDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseOfferingInstructionalApproach_PK] PRIMARY KEY CLUSTERED (
        [InstructionalApproachDescriptorId] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[CourseOfferingInstructionalApproach] ADD CONSTRAINT [CourseOfferingInstructionalApproach_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[CourseOfferingSiteBasedInitiative] --
CREATE TABLE [mn].[CourseOfferingSiteBasedInitiative] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [SiteBasedInitiativeDescriptorId] [INT] NOT NULL,
    [ImplementationStatusDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseOfferingSiteBasedInitiative_PK] PRIMARY KEY CLUSTERED (
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SessionName] ASC,
        [SiteBasedInitiativeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[CourseOfferingSiteBasedInitiative] ADD CONSTRAINT [CourseOfferingSiteBasedInitiative_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[CourseProgram] --
CREATE TABLE [mn].[CourseProgram] (
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CourseProgram_PK] PRIMARY KEY CLUSTERED (
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[CourseProgram] ADD CONSTRAINT [CourseProgram_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[DistrictTypeDescriptor] --
CREATE TABLE [mn].[DistrictTypeDescriptor] (
    [DistrictTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [DistrictTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [DistrictTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[EarlyChildhoodScreenerDescriptor] --
CREATE TABLE [mn].[EarlyChildhoodScreenerDescriptor] (
    [EarlyChildhoodScreenerDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EarlyChildhoodScreenerDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EarlyChildhoodScreenerDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[EarlyChildhoodScreeningExitStatusDescriptor] --
CREATE TABLE [mn].[EarlyChildhoodScreeningExitStatusDescriptor] (
    [EarlyChildhoodScreeningExitStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EarlyChildhoodScreeningExitStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EarlyChildhoodScreeningExitStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[EarlyEducationCourseLocationDescriptor] --
CREATE TABLE [mn].[EarlyEducationCourseLocationDescriptor] (
    [EarlyEducationCourseLocationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EarlyEducationCourseLocationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EarlyEducationCourseLocationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[EdFiSubmissionAccessDescriptor] --
CREATE TABLE [mn].[EdFiSubmissionAccessDescriptor] (
    [EdFiSubmissionAccessDescriptorId] [INT] NOT NULL,
    CONSTRAINT [EdFiSubmissionAccessDescriptor_PK] PRIMARY KEY CLUSTERED (
        [EdFiSubmissionAccessDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[ExamReimbursementRequest] --
CREATE TABLE [mn].[ExamReimbursementRequest] (
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [TestedDate] [DATE] NOT NULL,
    [AssessmentCategoryDescriptorId] [INT] NOT NULL,
    [ReimbursementRequested] [BIT] NOT NULL,
    [UnableToPay] [BIT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [ExamReimbursementRequest_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC,
        [TestedDate] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[ExamReimbursementRequest] ADD CONSTRAINT [ExamReimbursementRequest_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [mn].[ExamReimbursementRequest] ADD CONSTRAINT [ExamReimbursementRequest_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [mn].[ExamReimbursementRequest] ADD CONSTRAINT [ExamReimbursementRequest_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [mn].[FundingSourceDescriptor] --
CREATE TABLE [mn].[FundingSourceDescriptor] (
    [FundingSourceDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FundingSourceDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FundingSourceDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[GeneralEnrollmentDescriptor] --
CREATE TABLE [mn].[GeneralEnrollmentDescriptor] (
    [GeneralEnrollmentDescriptorId] [INT] NOT NULL,
    CONSTRAINT [GeneralEnrollmentDescriptor_PK] PRIMARY KEY CLUSTERED (
        [GeneralEnrollmentDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[GiftedTalentedParticipationDescriptor] --
CREATE TABLE [mn].[GiftedTalentedParticipationDescriptor] (
    [GiftedTalentedParticipationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [GiftedTalentedParticipationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [GiftedTalentedParticipationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[GradeExtension] --
CREATE TABLE [mn].[GradeExtension] (
    [BeginDate] [DATE] NOT NULL,
    [GradeTypeDescriptorId] [INT] NOT NULL,
    [GradingPeriodDescriptorId] [INT] NOT NULL,
    [GradingPeriodSchoolYear] [SMALLINT] NOT NULL,
    [GradingPeriodSequence] [INT] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CollegeCreditEarned] [DECIMAL](7, 3) NULL,
    [CollegeGradeEarned] [NVARCHAR](16) NULL,
    [LocalCreditEarned] [DECIMAL](7, 3) NULL,
    [AcademicSubjectDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [GradeExtension_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [GradeTypeDescriptorId] ASC,
        [GradingPeriodDescriptorId] ASC,
        [GradingPeriodSchoolYear] ASC,
        [GradingPeriodSequence] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[GradeExtension] ADD CONSTRAINT [GradeExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[ImplementationStatusDescriptor] --
CREATE TABLE [mn].[ImplementationStatusDescriptor] (
    [ImplementationStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ImplementationStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ImplementationStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[InstructionalApproachDescriptor] --
CREATE TABLE [mn].[InstructionalApproachDescriptor] (
    [InstructionalApproachDescriptorId] [INT] NOT NULL,
    CONSTRAINT [InstructionalApproachDescriptor_PK] PRIMARY KEY CLUSTERED (
        [InstructionalApproachDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[InstructionalDeliveryModeDescriptor] --
CREATE TABLE [mn].[InstructionalDeliveryModeDescriptor] (
    [InstructionalDeliveryModeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [InstructionalDeliveryModeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [InstructionalDeliveryModeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[KindergartenScheduleDescriptor] --
CREATE TABLE [mn].[KindergartenScheduleDescriptor] (
    [KindergartenScheduleDescriptorId] [INT] NOT NULL,
    CONSTRAINT [KindergartenScheduleDescriptor_PK] PRIMARY KEY CLUSTERED (
        [KindergartenScheduleDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[LocalEducationAgencyExtension] --
CREATE TABLE [mn].[LocalEducationAgencyExtension] (
    [LocalEducationAgencyId] [INT] NOT NULL,
    [DistrictTypeDescriptorId] [INT] NULL,
    [EdFiSubmissionAccessDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [LocalEducationAgencyExtension_PK] PRIMARY KEY CLUSTERED (
        [LocalEducationAgencyId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[LocalEducationAgencyExtension] ADD CONSTRAINT [LocalEducationAgencyExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[MembershipAttendanceUnitDescriptor] --
CREATE TABLE [mn].[MembershipAttendanceUnitDescriptor] (
    [MembershipAttendanceUnitDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MembershipAttendanceUnitDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MembershipAttendanceUnitDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[OptOutIndicatorsDescriptor] --
CREATE TABLE [mn].[OptOutIndicatorsDescriptor] (
    [OptOutIndicatorsDescriptorId] [INT] NOT NULL,
    CONSTRAINT [OptOutIndicatorsDescriptor_PK] PRIMARY KEY CLUSTERED (
        [OptOutIndicatorsDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[ParentExtension] --
CREATE TABLE [mn].[ParentExtension] (
    [ParentUSI] [INT] NOT NULL,
    [BirthDate] [DATE] NULL,
    [ClassroomVolunteerDescriptorId] [INT] NULL,
    [HighestCompletedLevelOfEducationDescriptorId] [INT] NULL,
    [HouseholdIncome] [DECIMAL](11, 2) NULL,
    [HouseholdSize] [INT] NULL,
    [ReceivingInterpreterAssistance] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ParentExtension_PK] PRIMARY KEY CLUSTERED (
        [ParentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[ParentExtension] ADD CONSTRAINT [ParentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[ParentIdentificationCode] --
CREATE TABLE [mn].[ParentIdentificationCode] (
    [IdentificationCode] [NVARCHAR](60) NOT NULL,
    [ParentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ParentIdentificationCode_PK] PRIMARY KEY CLUSTERED (
        [IdentificationCode] ASC,
        [ParentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[ParentIdentificationCode] ADD CONSTRAINT [ParentIdentificationCode_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[PrecodeTypeDescriptor] --
CREATE TABLE [mn].[PrecodeTypeDescriptor] (
    [PrecodeTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [PrecodeTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [PrecodeTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[SchoolClassificationDescriptor] --
CREATE TABLE [mn].[SchoolClassificationDescriptor] (
    [SchoolClassificationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SchoolClassificationDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SchoolClassificationDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[SchoolExtension] --
CREATE TABLE [mn].[SchoolExtension] (
    [SchoolId] [INT] NOT NULL,
    [SchoolClassificationDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SchoolExtension_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[SchoolExtension] ADD CONSTRAINT [SchoolExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[SectionEnrollmentTypeDescriptor] --
CREATE TABLE [mn].[SectionEnrollmentTypeDescriptor] (
    [SectionEnrollmentTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SectionEnrollmentTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SectionEnrollmentTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[SectionExtension] --
CREATE TABLE [mn].[SectionExtension] (
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [InstructionalDeliveryModeDescriptorId] [INT] NULL,
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
ALTER TABLE [mn].[SectionExtension] ADD CONSTRAINT [SectionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[SessionExtension] --
CREATE TABLE [mn].[SessionExtension] (
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [DaysInSession] [DECIMAL](5, 2) NULL,
    [TermNumber] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SessionExtension_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SessionName] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[SessionExtension] ADD CONSTRAINT [SessionExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[ShippingInstructionDescriptor] --
CREATE TABLE [mn].[ShippingInstructionDescriptor] (
    [ShippingInstructionDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ShippingInstructionDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ShippingInstructionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[SiteBasedInitiativeDescriptor] --
CREATE TABLE [mn].[SiteBasedInitiativeDescriptor] (
    [SiteBasedInitiativeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SiteBasedInitiativeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SiteBasedInitiativeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[SpecialEducationEvaluationStatusDescriptor] --
CREATE TABLE [mn].[SpecialEducationEvaluationStatusDescriptor] (
    [SpecialEducationEvaluationStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [SpecialEducationEvaluationStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [SpecialEducationEvaluationStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StandardAddressedDescriptor] --
CREATE TABLE [mn].[StandardAddressedDescriptor] (
    [StandardAddressedDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StandardAddressedDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StandardAddressedDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StateAidCategoryDescriptor] --
CREATE TABLE [mn].[StateAidCategoryDescriptor] (
    [StateAidCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StateAidCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [StateAidCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[Student21stCenturyLearningCenterGrantProgramAssociation] --
CREATE TABLE [mn].[Student21stCenturyLearningCenterGrantProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AttendanceDays] [INT] NULL,
    [AttendanceHours] [DECIMAL](6, 2) NULL,
    CONSTRAINT [Student21stCenturyLearningCenterGrantProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StudentADSISProgramAssociation] --
CREATE TABLE [mn].[StudentADSISProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    CONSTRAINT [StudentADSISProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StudentAssessmentCharacteristic] --
CREATE TABLE [mn].[StudentAssessmentCharacteristic] (
    [AssessmentCharacteristicDescriptorId] [INT] NOT NULL,
    [AssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [Namespace] [NVARCHAR](255) NOT NULL,
    [StudentAssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAssessmentCharacteristic_PK] PRIMARY KEY CLUSTERED (
        [AssessmentCharacteristicDescriptorId] ASC,
        [AssessmentIdentifier] ASC,
        [Namespace] ASC,
        [StudentAssessmentIdentifier] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentAssessmentCharacteristic] ADD CONSTRAINT [StudentAssessmentCharacteristic_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentAssessmentExtension] --
CREATE TABLE [mn].[StudentAssessmentExtension] (
    [AssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [Namespace] [NVARCHAR](255) NOT NULL,
    [StudentAssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [AssessmentFormatDescriptorId] [INT] NULL,
    [SiteEducationOrganizationId] [INT] NULL,
    [AssessmentTierDescriptorId] [INT] NULL,
    [CatStudentTestId] [NVARCHAR](100) NULL,
    [GeneralEnrollmentDescriptorId] [INT] NULL,
    [LearningLocatorCode] [NVARCHAR](100) NULL,
    [TimeOnTest] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAssessmentExtension_PK] PRIMARY KEY CLUSTERED (
        [AssessmentIdentifier] ASC,
        [Namespace] ASC,
        [StudentAssessmentIdentifier] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentAssessmentExtension] ADD CONSTRAINT [StudentAssessmentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentAssessmentPrecode] --
CREATE TABLE [mn].[StudentAssessmentPrecode] (
    [EducationOrganizationId] [INT] NOT NULL,
    [PrecodeTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [SiteEducationOrganizationId] [INT] NULL,
    [SitePrecodeTypeDescriptorId] [INT] NULL,
    [AssessmentTitle] [NVARCHAR](100) NULL,
    [AssessedGradeLevelDescriptorId] [INT] NULL,
    [EnrolledGradeLevelDescriptorId] [INT] NULL,
    [GeneralEnrollmentDescriptorId] [INT] NULL,
    [CustomGroup] [NVARCHAR](100) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentAssessmentPrecode_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [PrecodeTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentAssessmentPrecode] ADD CONSTRAINT [StudentAssessmentPrecode_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [mn].[StudentAssessmentPrecode] ADD CONSTRAINT [StudentAssessmentPrecode_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [mn].[StudentAssessmentPrecode] ADD CONSTRAINT [StudentAssessmentPrecode_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [mn].[StudentAssessmentPrecodeAcademicSubject] --
CREATE TABLE [mn].[StudentAssessmentPrecodeAcademicSubject] (
    [AcademicSubjectDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [PrecodeTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAssessmentPrecodeAcademicSubject_PK] PRIMARY KEY CLUSTERED (
        [AcademicSubjectDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [PrecodeTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentAssessmentPrecodeAcademicSubject] ADD CONSTRAINT [StudentAssessmentPrecodeAcademicSubject_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentAssessmentPrecodeAccommodation] --
CREATE TABLE [mn].[StudentAssessmentPrecodeAccommodation] (
    [AccommodationDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [PrecodeTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAssessmentPrecodeAccommodation_PK] PRIMARY KEY CLUSTERED (
        [AccommodationDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [PrecodeTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentAssessmentPrecodeAccommodation] ADD CONSTRAINT [StudentAssessmentPrecodeAccommodation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentAssessmentPrecodeSite] --
CREATE TABLE [mn].[StudentAssessmentPrecodeSite] (
    [EducationOrganizationId] [INT] NOT NULL,
    [PrecodeTypeDescriptorId] [INT] NOT NULL,
    [ContactTitle] [NVARCHAR](75) NULL,
    [ContactElectronicMailAddress] [NVARCHAR](128) NULL,
    [ContactFirstName] [NVARCHAR](75) NULL,
    [ContactLastSurname] [NVARCHAR](75) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentAssessmentPrecodeSite_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [PrecodeTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentAssessmentPrecodeSite] ADD CONSTRAINT [StudentAssessmentPrecodeSite_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [mn].[StudentAssessmentPrecodeSite] ADD CONSTRAINT [StudentAssessmentPrecodeSite_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [mn].[StudentAssessmentPrecodeSite] ADD CONSTRAINT [StudentAssessmentPrecodeSite_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [mn].[StudentAssessmentPrecodeSiteContactTelephone] --
CREATE TABLE [mn].[StudentAssessmentPrecodeSiteContactTelephone] (
    [EducationOrganizationId] [INT] NOT NULL,
    [PrecodeTypeDescriptorId] [INT] NOT NULL,
    [TelephoneNumberTypeDescriptorId] [INT] NOT NULL,
    [TelephoneNumber] [NVARCHAR](24) NOT NULL,
    [OrderOfPriority] [INT] NULL,
    [TextMessageCapabilityIndicator] [BIT] NULL,
    [DoNotPublishIndicator] [BIT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAssessmentPrecodeSiteContactTelephone_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [PrecodeTypeDescriptorId] ASC,
        [TelephoneNumberTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentAssessmentPrecodeSiteContactTelephone] ADD CONSTRAINT [StudentAssessmentPrecodeSiteContactTelephone_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentAssessmentPrecodeSiteShippingInstruction] --
CREATE TABLE [mn].[StudentAssessmentPrecodeSiteShippingInstruction] (
    [EducationOrganizationId] [INT] NOT NULL,
    [PrecodeTypeDescriptorId] [INT] NOT NULL,
    [ShippingInstructionDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAssessmentPrecodeSiteShippingInstruction_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [PrecodeTypeDescriptorId] ASC,
        [ShippingInstructionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentAssessmentPrecodeSiteShippingInstruction] ADD CONSTRAINT [StudentAssessmentPrecodeSiteShippingInstruction_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] --
CREATE TABLE [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] (
    [AssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [IdentificationCode] [NVARCHAR](60) NOT NULL,
    [Namespace] [NVARCHAR](255) NOT NULL,
    [StudentAssessmentIdentifier] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ClusterGradeLevelDescriptorId] [INT] NULL,
    [AssessmentFormatDescriptorId] [INT] NULL,
    [AssessmentStatusDescriptorId] [INT] NULL,
    [AssessmentTierDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentAssessmentStudentObjectiveAssessmentExtension_PK] PRIMARY KEY CLUSTERED (
        [AssessmentIdentifier] ASC,
        [IdentificationCode] ASC,
        [Namespace] ASC,
        [StudentAssessmentIdentifier] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] ADD CONSTRAINT [StudentAssessmentStudentObjectiveAssessmentExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentCEISProgramAssociation] --
CREATE TABLE [mn].[StudentCEISProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    CONSTRAINT [StudentCEISProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StudentDistanceLearnerProgramAssociation] --
CREATE TABLE [mn].[StudentDistanceLearnerProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    CONSTRAINT [StudentDistanceLearnerProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StudentEarlyChildhoodScreeningProgramAssociation] --
CREATE TABLE [mn].[StudentEarlyChildhoodScreeningProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [EarlyChildhoodScreeningExitStatusDescriptorId] [INT] NULL,
    [EarlyChildhoodScreenerDescriptorId] [INT] NULL,
    CONSTRAINT [StudentEarlyChildhoodScreeningProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StudentEarlyEducationProgramAssociation] --
CREATE TABLE [mn].[StudentEarlyEducationProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ServiceAttendanceHours] [INT] NULL,
    [ServiceMembershipHours] [INT] NULL,
    CONSTRAINT [StudentEarlyEducationProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StudentEarlyEducationProgramAssociationFundingSource] --
CREATE TABLE [mn].[StudentEarlyEducationProgramAssociationFundingSource] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FundingSourceDescriptorId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEarlyEducationProgramAssociationFundingSource_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [FundingSourceDescriptorId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentEarlyEducationProgramAssociationFundingSource] ADD CONSTRAINT [StudentEarlyEducationProgramAssociationFundingSource_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentEducationOrganizationAssociationAncestryEthnicOrigin] --
CREATE TABLE [mn].[StudentEducationOrganizationAssociationAncestryEthnicOrigin] (
    [AncestryEthnicOriginDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationAncestryEthnicOrigin_PK] PRIMARY KEY CLUSTERED (
        [AncestryEthnicOriginDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentEducationOrganizationAssociationAncestryEthnicOrigin] ADD CONSTRAINT [StudentEducationOrganizationAssociationAncestryEthnicOrigin_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentEducationOrganizationAssociationExtension] --
CREATE TABLE [mn].[StudentEducationOrganizationAssociationExtension] (
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [FirstName] [NVARCHAR](75) NULL,
    [MiddleName] [NVARCHAR](75) NULL,
    [LastSurname] [NVARCHAR](75) NULL,
    [GenerationCodeSuffix] [NVARCHAR](10) NULL,
    [BirthDate] [DATE] NULL,
    [BirthCity] [NVARCHAR](30) NULL,
    [BirthStateAbbreviationDescriptorId] [INT] NULL,
    [BirthInternationalProvince] [NVARCHAR](150) NULL,
    [BirthCountryDescriptorId] [INT] NULL,
    [DateEnteredUS] [DATE] NULL,
    [MultipleBirthStatus] [BIT] NULL,
    [BirthSexDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentEducationOrganizationAssociationExtension] ADD CONSTRAINT [StudentEducationOrganizationAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentEducationOrganizationAssociationOptOutIndicators] --
CREATE TABLE [mn].[StudentEducationOrganizationAssociationOptOutIndicators] (
    [EducationOrganizationId] [INT] NOT NULL,
    [OptOutIndicatorsDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationOptOutIndicators_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [OptOutIndicatorsDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentEducationOrganizationAssociationOptOutIndicators] ADD CONSTRAINT [StudentEducationOrganizationAssociationOptOutIndicators_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentGiftedTalentedProgramAssociation] --
CREATE TABLE [mn].[StudentGiftedTalentedProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [GiftedTalentedParticipationDescriptorId] [INT] NOT NULL,
    CONSTRAINT [StudentGiftedTalentedProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StudentPSEOConcurrentProgramAssociation] --
CREATE TABLE [mn].[StudentPSEOConcurrentProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    CONSTRAINT [StudentPSEOConcurrentProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StudentPSEOProgramAssociation] --
CREATE TABLE [mn].[StudentPSEOProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [PSEOHighSchoolHours] [INT] NULL,
    CONSTRAINT [StudentPSEOProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StudentSAAPProgramAssociation] --
CREATE TABLE [mn].[StudentSAAPProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [IndependentStudyIndicator] [BIT] NOT NULL,
    [SAAPCredits] [DECIMAL](4, 2) NOT NULL,
    [SAAPConcurrentIndicator] [BIT] NOT NULL,
    CONSTRAINT [StudentSAAPProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StudentSchoolAssociationExtension] --
CREATE TABLE [mn].[StudentSchoolAssociationExtension] (
    [EntryDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [HomeboundServiceIndicator] [BIT] NULL,
    [SpecialEducationEvaluationStatusDescriptorId] [INT] NULL,
    [ResidentLocalEducationAgencyId] [INT] NULL,
    [SpecialPupilIndicator] [BIT] NULL,
    [StateAidCategoryDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationExtension_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentSchoolAssociationExtension] ADD CONSTRAINT [StudentSchoolAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentSchoolAssociationMembership] --
CREATE TABLE [mn].[StudentSchoolAssociationMembership] (
    [EntryDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [MembershipAttendanceUnitDescriptorId] [INT] NOT NULL,
    [Membership] [INT] NOT NULL,
    [Attendance] [DECIMAL](5, 1) NOT NULL,
    [PercentEnrolled] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationMembership_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentSchoolAssociationMembership] ADD CONSTRAINT [StudentSchoolAssociationMembership_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentSchoolAssociationTransportation] --
CREATE TABLE [mn].[StudentSchoolAssociationTransportation] (
    [EntryDate] [DATE] NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [TransportationCategoryDescriptorId] [INT] NOT NULL,
    [TransportingLocalEducationAgencyId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSchoolAssociationTransportation_PK] PRIMARY KEY CLUSTERED (
        [EntryDate] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentSchoolAssociationTransportation] ADD CONSTRAINT [StudentSchoolAssociationTransportation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentSection504PlanProgramAssociation] --
CREATE TABLE [mn].[StudentSection504PlanProgramAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    CONSTRAINT [StudentSection504PlanProgramAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [EducationOrganizationId] ASC,
        [ProgramEducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [mn].[StudentSectionAssociationExtension] --
CREATE TABLE [mn].[StudentSectionAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CollegeCourseCode] [NVARCHAR](60) NULL,
    [CollegeCourseEducationOrganizationId] [INT] NULL,
    [SectionEnrollmentTypeDescriptorId] [INT] NULL,
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
ALTER TABLE [mn].[StudentSectionAssociationExtension] ADD CONSTRAINT [StudentSectionAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentSectionAssociationInstructionalApproach] --
CREATE TABLE [mn].[StudentSectionAssociationInstructionalApproach] (
    [BeginDate] [DATE] NOT NULL,
    [InstructionalApproachDescriptorId] [INT] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ImplementationStatusDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSectionAssociationInstructionalApproach_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [InstructionalApproachDescriptorId] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentSectionAssociationInstructionalApproach] ADD CONSTRAINT [StudentSectionAssociationInstructionalApproach_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentSectionAssociationSiteBasedInitiative] --
CREATE TABLE [mn].[StudentSectionAssociationSiteBasedInitiative] (
    [BeginDate] [DATE] NOT NULL,
    [LocalCourseCode] [NVARCHAR](60) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [SectionIdentifier] [NVARCHAR](255) NOT NULL,
    [SessionName] [NVARCHAR](60) NOT NULL,
    [SiteBasedInitiativeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [ImplementationStatusDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [StudentSectionAssociationSiteBasedInitiative_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [LocalCourseCode] ASC,
        [SchoolId] ASC,
        [SchoolYear] ASC,
        [SectionIdentifier] ASC,
        [SessionName] ASC,
        [SiteBasedInitiativeDescriptorId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [mn].[StudentSectionAssociationSiteBasedInitiative] ADD CONSTRAINT [StudentSectionAssociationSiteBasedInitiative_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[StudentSpecialEducationProgramAssociationExtension] --
CREATE TABLE [mn].[StudentSpecialEducationProgramAssociationExtension] (
    [BeginDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramEducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [SpecialEducationServiceHours] [DECIMAL](5, 1) NULL,
    [PlacingLocalEducationAgencyId] [INT] NULL,
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
ALTER TABLE [mn].[StudentSpecialEducationProgramAssociationExtension] ADD CONSTRAINT [StudentSpecialEducationProgramAssociationExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [mn].[TransportationCategoryDescriptor] --
CREATE TABLE [mn].[TransportationCategoryDescriptor] (
    [TransportationCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [TransportationCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [TransportationCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

