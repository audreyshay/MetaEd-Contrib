-- Table [edfixcrdc].[AlternativeStatusDescriptor] --
CREATE TABLE [edfixcrdc].[AlternativeStatusDescriptor] (
    [AlternativeStatusDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AlternativeStatusDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AlternativeStatusDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [edfixcrdc].[ClassGroup] --
CREATE TABLE [edfixcrdc].[ClassGroup] (
    [ClassGroupName] [NVARCHAR](75) NOT NULL,
    [CommunityProviderId] [INT] NOT NULL,
    [CommunityProviderLocationId] [INT] NOT NULL,
    [SpecialNeedsProvidedIndicator] [BIT] NOT NULL,
    [Capacity] [INT] NULL,
    [DaysAvailablePerWeek] [INT] NULL,
    [HoursAvailablePerDay] [DECIMAL](4, 2) NULL,
    [ServiceDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [ClassGroup_PK] PRIMARY KEY CLUSTERED (
        [ClassGroupName] ASC,
        [CommunityProviderId] ASC,
        [CommunityProviderLocationId] ASC,
        [SpecialNeedsProvidedIndicator] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixcrdc].[ClassGroup] ADD CONSTRAINT [ClassGroup_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixcrdc].[ClassGroup] ADD CONSTRAINT [ClassGroup_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixcrdc].[ClassGroup] ADD CONSTRAINT [ClassGroup_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixcrdc].[ClassGroupCourse] --
CREATE TABLE [edfixcrdc].[ClassGroupCourse] (
    [ClassGroupName] [NVARCHAR](75) NOT NULL,
    [CommunityProviderId] [INT] NOT NULL,
    [CommunityProviderLocationId] [INT] NOT NULL,
    [CourseCode] [NVARCHAR](60) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [SpecialNeedsProvidedIndicator] [BIT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ClassGroupCourse_PK] PRIMARY KEY CLUSTERED (
        [ClassGroupName] ASC,
        [CommunityProviderId] ASC,
        [CommunityProviderLocationId] ASC,
        [CourseCode] ASC,
        [EducationOrganizationId] ASC,
        [SpecialNeedsProvidedIndicator] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixcrdc].[ClassGroupCourse] ADD CONSTRAINT [ClassGroupCourse_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixcrdc].[ClassGroupMeetingTime] --
CREATE TABLE [edfixcrdc].[ClassGroupMeetingTime] (
    [ClassGroupName] [NVARCHAR](75) NOT NULL,
    [CommunityProviderId] [INT] NOT NULL,
    [CommunityProviderLocationId] [INT] NOT NULL,
    [MeetingDayDescriptorId] [INT] NOT NULL,
    [SpecialNeedsProvidedIndicator] [BIT] NOT NULL,
    [StartTime] [TIME](7) NOT NULL,
    [StopTime] [TIME](7) NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ClassGroupMeetingTime_PK] PRIMARY KEY CLUSTERED (
        [ClassGroupName] ASC,
        [CommunityProviderId] ASC,
        [CommunityProviderLocationId] ASC,
        [MeetingDayDescriptorId] ASC,
        [SpecialNeedsProvidedIndicator] ASC,
        [StartTime] ASC,
        [StopTime] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixcrdc].[ClassGroupMeetingTime] ADD CONSTRAINT [ClassGroupMeetingTime_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixcrdc].[CommunityProviderLocation] --
CREATE TABLE [edfixcrdc].[CommunityProviderLocation] (
    [CommunityProviderId] [INT] NOT NULL,
    [CommunityProviderLocationId] [INT] NOT NULL,
    [AgeRangeDescription] [NVARCHAR](75) NULL,
    [YoungestAgeAccepted] [INT] NULL,
    [OldestAgeAccepted] [INT] NULL,
    [Capacity] [INT] NULL,
    [SpecialNeedsProvidedIndicator] [BIT] NULL,
    [TimeOpen] [TIME](7) NULL,
    [TimeClose] [TIME](7) NULL,
    [AddressTypeDescriptorId] [INT] NULL,
    [StreetNumberName] [NVARCHAR](150) NULL,
    [ApartmentRoomSuiteNumber] [NVARCHAR](50) NULL,
    [BuildingSiteNumber] [NVARCHAR](20) NULL,
    [City] [NVARCHAR](30) NULL,
    [StateAbbreviationDescriptorId] [INT] NULL,
    [PostalCode] [NVARCHAR](17) NULL,
    [NameOfCounty] [NVARCHAR](30) NULL,
    [CountyFIPSCode] [NVARCHAR](5) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CommunityProviderLocation_PK] PRIMARY KEY CLUSTERED (
        [CommunityProviderId] ASC,
        [CommunityProviderLocationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixcrdc].[CommunityProviderLocation] ADD CONSTRAINT [CommunityProviderLocation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixcrdc].[CommunityProviderLocation] ADD CONSTRAINT [CommunityProviderLocation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixcrdc].[CommunityProviderLocation] ADD CONSTRAINT [CommunityProviderLocation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixcrdc].[CommunityProviderLocationInstructionalCalendar] --
CREATE TABLE [edfixcrdc].[CommunityProviderLocationInstructionalCalendar] (
    [CommunityProviderId] [INT] NOT NULL,
    [CommunityProviderLocationId] [INT] NOT NULL,
    [SchoolYear] [SMALLINT] NOT NULL,
    [BeginDate] [DATE] NOT NULL,
    [EndDate] [DATE] NOT NULL,
    [TotalInstructionalDaysPerYear] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [CommunityProviderLocationInstructionalCalendar_PK] PRIMARY KEY CLUSTERED (
        [CommunityProviderId] ASC,
        [CommunityProviderLocationId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixcrdc].[CommunityProviderLocationInstructionalCalendar] ADD CONSTRAINT [CommunityProviderLocationInstructionalCalendar_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixcrdc].[MeetingDayDescriptor] --
CREATE TABLE [edfixcrdc].[MeetingDayDescriptor] (
    [MeetingDayDescriptorId] [INT] NOT NULL,
    CONSTRAINT [MeetingDayDescriptor_PK] PRIMARY KEY CLUSTERED (
        [MeetingDayDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [edfixcrdc].[ProgramCostDescriptor] --
CREATE TABLE [edfixcrdc].[ProgramCostDescriptor] (
    [ProgramCostDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ProgramCostDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ProgramCostDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [edfixcrdc].[ProgramExtension] --
CREATE TABLE [edfixcrdc].[ProgramExtension] (
    [EducationOrganizationId] [INT] NOT NULL,
    [ProgramName] [NVARCHAR](60) NOT NULL,
    [ProgramTypeDescriptorId] [INT] NOT NULL,
    [ProgramCostDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [ProgramExtension_PK] PRIMARY KEY CLUSTERED (
        [EducationOrganizationId] ASC,
        [ProgramName] ASC,
        [ProgramTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixcrdc].[ProgramExtension] ADD CONSTRAINT [ProgramExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixcrdc].[RestraintCategoryDescriptor] --
CREATE TABLE [edfixcrdc].[RestraintCategoryDescriptor] (
    [RestraintCategoryDescriptorId] [INT] NOT NULL,
    CONSTRAINT [RestraintCategoryDescriptor_PK] PRIMARY KEY CLUSTERED (
        [RestraintCategoryDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [edfixcrdc].[RestraintEventRestraintCategory] --
CREATE TABLE [edfixcrdc].[RestraintEventRestraintCategory] (
    [RestraintCategoryDescriptorId] [INT] NOT NULL,
    [RestraintEventIdentifier] [NVARCHAR](20) NOT NULL,
    [SchoolId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [RestraintEventRestraintCategory_PK] PRIMARY KEY CLUSTERED (
        [RestraintCategoryDescriptorId] ASC,
        [RestraintEventIdentifier] ASC,
        [SchoolId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixcrdc].[RestraintEventRestraintCategory] ADD CONSTRAINT [RestraintEventRestraintCategory_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixcrdc].[SchoolExtension] --
CREATE TABLE [edfixcrdc].[SchoolExtension] (
    [SchoolId] [INT] NOT NULL,
    [AlternativeStatusDescriptorId] [INT] NULL,
    [UngradedDetailDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SchoolExtension_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixcrdc].[SchoolExtension] ADD CONSTRAINT [SchoolExtension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixcrdc].[SchoolTechnology] --
CREATE TABLE [edfixcrdc].[SchoolTechnology] (
    [SchoolId] [INT] NOT NULL,
    [FiberOpticConnection] [BIT] NOT NULL,
    [AllClassroomsHaveWiFi] [BIT] NOT NULL,
    [StudentsTakeHomeDevice] [BIT] NOT NULL,
    [StudentsBringOwnDevice] [BIT] NOT NULL,
    [WiFiDeviceCount] [INT] NOT NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    CONSTRAINT [SchoolTechnology_PK] PRIMARY KEY CLUSTERED (
        [SchoolId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixcrdc].[SchoolTechnology] ADD CONSTRAINT [SchoolTechnology_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixcrdc].[StudentClassGroupAssociation] --
CREATE TABLE [edfixcrdc].[StudentClassGroupAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [ClassGroupName] [NVARCHAR](75) NOT NULL,
    [CommunityProviderId] [INT] NOT NULL,
    [CommunityProviderLocationId] [INT] NOT NULL,
    [SpecialNeedsProvidedIndicator] [BIT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [EndDate] [DATE] NULL,
    [ReasonExitedDescriptorId] [INT] NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentClassGroupAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [ClassGroupName] ASC,
        [CommunityProviderId] ASC,
        [CommunityProviderLocationId] ASC,
        [SpecialNeedsProvidedIndicator] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixcrdc].[StudentClassGroupAssociation] ADD CONSTRAINT [StudentClassGroupAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixcrdc].[StudentClassGroupAssociation] ADD CONSTRAINT [StudentClassGroupAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixcrdc].[StudentClassGroupAssociation] ADD CONSTRAINT [StudentClassGroupAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixcrdc].[StudentCommunityProviderLocationAssociation] --
CREATE TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] (
    [BeginDate] [DATE] NOT NULL,
    [CommunityProviderId] [INT] NOT NULL,
    [CommunityProviderLocationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [EndDate] [DATE] NULL,
    [ReasonExitedDescriptorId] [INT] NULL,
    [EnrollmentStatus] [NVARCHAR](30) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME2] NOT NULL,
    [LastModifiedDate] [DATETIME2] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [StudentCommunityProviderLocationAssociation_PK] PRIMARY KEY CLUSTERED (
        [BeginDate] ASC,
        [CommunityProviderId] ASC,
        [CommunityProviderLocationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] ADD CONSTRAINT [StudentCommunityProviderLocationAssociation_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] ADD CONSTRAINT [StudentCommunityProviderLocationAssociation_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] ADD CONSTRAINT [StudentCommunityProviderLocationAssociation_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixcrdc].[UngradedDetailDescriptor] --
CREATE TABLE [edfixcrdc].[UngradedDetailDescriptor] (
    [UngradedDetailDescriptorId] [INT] NOT NULL,
    CONSTRAINT [UngradedDetailDescriptor_PK] PRIMARY KEY CLUSTERED (
        [UngradedDetailDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

