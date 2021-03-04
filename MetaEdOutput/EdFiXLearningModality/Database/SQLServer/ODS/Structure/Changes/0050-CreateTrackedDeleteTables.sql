CREATE TABLE [tracked_deletes_edfixlearningmodality].[ModalityTimeTypeDescriptor]
(
       ModalityTimeTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ModalityTimeTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixlearningmodality].[ModalityTypeDescriptor]
(
       ModalityTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ModalityTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

