CREATE TABLE tracked_deletes_edfixlearningmodality.ModalityTimeTypeDescriptor
(
       ModalityTimeTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ModalityTimeTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixlearningmodality.ModalityTypeDescriptor
(
       ModalityTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ModalityTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

