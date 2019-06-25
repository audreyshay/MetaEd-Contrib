CREATE TABLE [changes].[edfixcrdc_AlternativeStatusDescriptor_TrackedDelete]
(
       AlternativeStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixcrdc_AlternativeStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixcrdc_ClassGroup_TrackedDelete]
(
       ClassGroupName [NVARCHAR](75) NOT NULL,
       CommunityProviderId [INT] NOT NULL,
       CommunityProviderLocationId [INT] NOT NULL,
       SpecialNeedsProvidedIndicator [BIT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixcrdc_ClassGroup_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixcrdc_CommunityProviderLocation_TrackedDelete]
(
       CommunityProviderId [INT] NOT NULL,
       CommunityProviderLocationId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixcrdc_CommunityProviderLocation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixcrdc_MeetingDayDescriptor_TrackedDelete]
(
       MeetingDayDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixcrdc_MeetingDayDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixcrdc_ProgramCostDescriptor_TrackedDelete]
(
       ProgramCostDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixcrdc_ProgramCostDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixcrdc_RestraintCategoryDescriptor_TrackedDelete]
(
       RestraintCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixcrdc_RestraintCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixcrdc_StudentClassGroupAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       ClassGroupName [NVARCHAR](75) NOT NULL,
       CommunityProviderId [INT] NOT NULL,
       CommunityProviderLocationId [INT] NOT NULL,
       SpecialNeedsProvidedIndicator [BIT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixcrdc_StudentClassGroupAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixcrdc_StudentCommunityProviderLocationAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       CommunityProviderId [INT] NOT NULL,
       CommunityProviderLocationId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixcrdc_StudentCommunityProviderLocationAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixcrdc_UngradedDetailDescriptor_TrackedDelete]
(
       UngradedDetailDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixcrdc_UngradedDetailDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

