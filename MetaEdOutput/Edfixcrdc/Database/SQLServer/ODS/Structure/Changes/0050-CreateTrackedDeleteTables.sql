CREATE TABLE [tracked_deletes_edfixcrdc].[AlternativeStatusDescriptor]
(
       AlternativeStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AlternativeStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixcrdc].[ClassGroup]
(
       ClassGroupName [NVARCHAR](75) NOT NULL,
       CommunityProviderId [INT] NOT NULL,
       CommunityProviderLocationId [INT] NOT NULL,
       SpecialNeedsProvidedIndicator [BIT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ClassGroup PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixcrdc].[CommunityProviderLocation]
(
       CommunityProviderId [INT] NOT NULL,
       CommunityProviderLocationId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CommunityProviderLocation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixcrdc].[MeetingDayDescriptor]
(
       MeetingDayDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_MeetingDayDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixcrdc].[ProgramCostDescriptor]
(
       ProgramCostDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgramCostDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixcrdc].[RestraintCategoryDescriptor]
(
       RestraintCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_RestraintCategoryDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixcrdc].[StudentClassGroupAssociation]
(
       BeginDate [DATE] NOT NULL,
       ClassGroupName [NVARCHAR](75) NOT NULL,
       CommunityProviderId [INT] NOT NULL,
       CommunityProviderLocationId [INT] NOT NULL,
       SpecialNeedsProvidedIndicator [BIT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentClassGroupAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixcrdc].[StudentCommunityProviderLocationAssociation]
(
       BeginDate [DATE] NOT NULL,
       CommunityProviderId [INT] NOT NULL,
       CommunityProviderLocationId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentCommunityProviderLocationAssociation PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixcrdc].[UngradedDetailDescriptor]
(
       UngradedDetailDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_UngradedDetailDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

