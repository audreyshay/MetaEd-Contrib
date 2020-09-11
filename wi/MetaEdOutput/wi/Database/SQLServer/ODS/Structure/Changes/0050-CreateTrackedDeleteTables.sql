CREATE TABLE [tracked_deletes_wi].[CertificatedProgramStatusDescriptor]
(
       CertificatedProgramStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CertificatedProgramStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_wi].[CountDateNameDescriptor]
(
       CountDateNameDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CountDateNameDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_wi].[CountDateReceivingServiceDescriptor]
(
       CountDateReceivingServiceDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CountDateReceivingServiceDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_wi].[CteProgramAreaDescriptor]
(
       CteProgramAreaDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_CteProgramAreaDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_wi].[EnrollmentTypeDescriptor]
(
       EnrollmentTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_EnrollmentTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_wi].[IacCodeDescriptor]
(
       IacCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_IacCodeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_wi].[ModifiedTermDescriptor]
(
       ModifiedTermDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ModifiedTermDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_wi].[StateEndorsedRegionalCareerPathwayStatusDescriptor]
(
       StateEndorsedRegionalCareerPathwayStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StateEndorsedRegionalCareerPathwayStatusDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

