CREATE TABLE [changes].[wi_CertificatedProgramStatusDescriptor_TrackedDelete]
(
       CertificatedProgramStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_wi_CertificatedProgramStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[wi_CountDateNameDescriptor_TrackedDelete]
(
       CountDateNameDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_wi_CountDateNameDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[wi_CountDateReceivingServiceDescriptor_TrackedDelete]
(
       CountDateReceivingServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_wi_CountDateReceivingServiceDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[wi_CteProgramAreaDescriptor_TrackedDelete]
(
       CteProgramAreaDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_wi_CteProgramAreaDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[wi_IacCodeDescriptor_TrackedDelete]
(
       IacCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_wi_IacCodeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[wi_ModifiedTermDescriptor_TrackedDelete]
(
       ModifiedTermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_wi_ModifiedTermDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[wi_StateEndorsedRegionalCareerPathwayStatusDescriptor_TrackedDelete]
(
       StateEndorsedRegionalCareerPathwayStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_wi_StateEndorsedRegionalCareerPathwayStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

