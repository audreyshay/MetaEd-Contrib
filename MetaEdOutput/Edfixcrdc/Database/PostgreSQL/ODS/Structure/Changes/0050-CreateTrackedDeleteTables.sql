CREATE TABLE tracked_deletes_edfixcrdc.AlternativeStatusDescriptor
(
       AlternativeStatusDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AlternativeStatusDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixcrdc.ClassGroup
(
       ClassGroupName VARCHAR(75) NOT NULL,
       CommunityProviderId INT NOT NULL,
       CommunityProviderLocationId INT NOT NULL,
       SpecialNeedsProvidedIndicator BOOLEAN NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ClassGroup_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixcrdc.CommunityProviderLocation
(
       CommunityProviderId INT NOT NULL,
       CommunityProviderLocationId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CommunityProviderLocation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixcrdc.MeetingDayDescriptor
(
       MeetingDayDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT MeetingDayDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixcrdc.ProgramCostDescriptor
(
       ProgramCostDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ProgramCostDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixcrdc.RestraintCategoryDescriptor
(
       RestraintCategoryDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT RestraintCategoryDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixcrdc.StudentClassGroupAssociation
(
       BeginDate DATE NOT NULL,
       ClassGroupName VARCHAR(75) NOT NULL,
       CommunityProviderId INT NOT NULL,
       CommunityProviderLocationId INT NOT NULL,
       SpecialNeedsProvidedIndicator BOOLEAN NOT NULL,
       StudentUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StudentClassGroupAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixcrdc.StudentCommunityProviderLocationAssociation
(
       BeginDate DATE NOT NULL,
       CommunityProviderId INT NOT NULL,
       CommunityProviderLocationId INT NOT NULL,
       StudentUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StudentCommunityProviderLocationAssociation_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixcrdc.UngradedDetailDescriptor
(
       UngradedDetailDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT UngradedDetailDescriptor_PK PRIMARY KEY (ChangeVersion)
);

