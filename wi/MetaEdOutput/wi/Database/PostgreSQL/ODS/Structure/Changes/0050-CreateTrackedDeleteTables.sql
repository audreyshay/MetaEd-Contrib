CREATE TABLE tracked_deletes_wi.CertificatedProgramStatusDescriptor
(
       CertificatedProgramStatusDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CertificatedProgramStatusDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_wi.CountDateNameDescriptor
(
       CountDateNameDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CountDateNameDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_wi.CountDateReceivingServiceDescriptor
(
       CountDateReceivingServiceDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CountDateReceivingServiceDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_wi.CteProgramAreaDescriptor
(
       CteProgramAreaDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT CteProgramAreaDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_wi.EnrollmentTypeDescriptor
(
       EnrollmentTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT EnrollmentTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_wi.IacCodeDescriptor
(
       IacCodeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT IacCodeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_wi.ModifiedTermDescriptor
(
       ModifiedTermDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ModifiedTermDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_wi.StateEndorsedRegionalCareerPathwayStatusDescriptor
(
       StateEndorsedRegionalCareerPathwayStatusDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StateEndorsedRegionalCareerPathwayStatusDescriptor_PK PRIMARY KEY (ChangeVersion)
);

