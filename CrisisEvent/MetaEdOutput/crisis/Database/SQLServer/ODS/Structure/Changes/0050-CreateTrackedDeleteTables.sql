CREATE TABLE [changes].[crisis_CrisisDetails_TrackedDelete]
(
       CrisisEventDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_crisis_CrisisDetails_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[crisis_CrisisEventDescriptor_TrackedDelete]
(
       CrisisEventDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_crisis_CrisisEventDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[crisis_CrisisTypeDescriptor_TrackedDelete]
(
       CrisisTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_crisis_CrisisTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

