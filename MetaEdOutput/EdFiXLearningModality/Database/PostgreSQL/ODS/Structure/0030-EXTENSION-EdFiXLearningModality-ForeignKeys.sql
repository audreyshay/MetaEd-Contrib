ALTER TABLE edfixlearningmodality.ModalityTimeTypeDescriptor ADD CONSTRAINT FK_55b0e8_Descriptor FOREIGN KEY (ModalityTimeTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE edfixlearningmodality.ModalityTypeDescriptor ADD CONSTRAINT FK_2f90fd_Descriptor FOREIGN KEY (ModalityTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE edfixlearningmodality.ProgramLearningModality ADD CONSTRAINT FK_33c0a2_ModalityTimeTypeDescriptor FOREIGN KEY (ModalityTimeTypeDescriptorId)
REFERENCES edfixlearningmodality.ModalityTimeTypeDescriptor (ModalityTimeTypeDescriptorId)
;

CREATE INDEX FK_33c0a2_ModalityTimeTypeDescriptor
ON edfixlearningmodality.ProgramLearningModality (ModalityTimeTypeDescriptorId ASC);

ALTER TABLE edfixlearningmodality.ProgramLearningModality ADD CONSTRAINT FK_33c0a2_ModalityTypeDescriptor FOREIGN KEY (ModalityTypeDescriptorId)
REFERENCES edfixlearningmodality.ModalityTypeDescriptor (ModalityTypeDescriptorId)
;

CREATE INDEX FK_33c0a2_ModalityTypeDescriptor
ON edfixlearningmodality.ProgramLearningModality (ModalityTypeDescriptorId ASC);

ALTER TABLE edfixlearningmodality.ProgramLearningModality ADD CONSTRAINT FK_33c0a2_Program FOREIGN KEY (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
REFERENCES edfi.Program (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
ON DELETE CASCADE
;

CREATE INDEX FK_33c0a2_Program
ON edfixlearningmodality.ProgramLearningModality (EducationOrganizationId ASC, ProgramName ASC, ProgramTypeDescriptorId ASC);

