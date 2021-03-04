-- Extended Properties [edfixlearningmodality].[ModalityTimeTypeDescriptor] --
COMMENT ON TABLE edfixlearningmodality.ModalityTimeTypeDescriptor IS 'Modality Time Type';
COMMENT ON COLUMN edfixlearningmodality.ModalityTimeTypeDescriptor.ModalityTimeTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [edfixlearningmodality].[ModalityTypeDescriptor] --
COMMENT ON TABLE edfixlearningmodality.ModalityTypeDescriptor IS 'Modality Type';
COMMENT ON COLUMN edfixlearningmodality.ModalityTypeDescriptor.ModalityTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [edfixlearningmodality].[ProgramLearningModality] --
COMMENT ON TABLE edfixlearningmodality.ProgramLearningModality IS 'Learning Modality';
COMMENT ON COLUMN edfixlearningmodality.ProgramLearningModality.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixlearningmodality.ProgramLearningModality.ModalityTypeDescriptorId IS 'The method by which the student is engaging in instruction.';
COMMENT ON COLUMN edfixlearningmodality.ProgramLearningModality.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN edfixlearningmodality.ProgramLearningModality.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN edfixlearningmodality.ProgramLearningModality.ModalityTime IS 'The duration the student engaged via the modality.';
COMMENT ON COLUMN edfixlearningmodality.ProgramLearningModality.ModalityTimeTypeDescriptorId IS 'The units or time dimension for hte duration.';

