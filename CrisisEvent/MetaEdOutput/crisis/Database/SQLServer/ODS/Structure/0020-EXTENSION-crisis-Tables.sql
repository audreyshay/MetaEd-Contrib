-- Table [crisis].[CrisisDetails] --
CREATE TABLE [crisis].[CrisisDetails] (
    [CrisisEventDescriptorId] [INT] NOT NULL,
    [CrisisTypeDescriptorId] [INT] NOT NULL,
    [CrisisStartDate] [DATE] NOT NULL,
    [CrisisDesription] [NVARCHAR](1024) NULL,
    [Discriminator] [NVARCHAR](128) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [CrisisDetails_PK] PRIMARY KEY CLUSTERED (
        [CrisisEventDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [crisis].[CrisisDetails] ADD CONSTRAINT [CrisisDetails_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [crisis].[CrisisDetails] ADD CONSTRAINT [CrisisDetails_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [crisis].[CrisisDetails] ADD CONSTRAINT [CrisisDetails_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [crisis].[CrisisEventDescriptor] --
CREATE TABLE [crisis].[CrisisEventDescriptor] (
    [CrisisEventDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CrisisEventDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CrisisEventDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [crisis].[CrisisTypeDescriptor] --
CREATE TABLE [crisis].[CrisisTypeDescriptor] (
    [CrisisTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [CrisisTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [CrisisTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [crisis].[StudentEducationOrganizationAssociationStudentCrisisEvent] --
CREATE TABLE [crisis].[StudentEducationOrganizationAssociationStudentCrisisEvent] (
    [CrisisEventDescriptorId] [INT] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [StudentUSI] [INT] NOT NULL,
    [DisplacedStudentIndicator] [BIT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [StudentEducationOrganizationAssociationStudentCrisisEvent_PK] PRIMARY KEY CLUSTERED (
        [CrisisEventDescriptorId] ASC,
        [EducationOrganizationId] ASC,
        [StudentUSI] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [crisis].[StudentEducationOrganizationAssociationStudentCrisisEvent] ADD CONSTRAINT [StudentEducationOrganizationAssociationStudentCrisisEvent_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

