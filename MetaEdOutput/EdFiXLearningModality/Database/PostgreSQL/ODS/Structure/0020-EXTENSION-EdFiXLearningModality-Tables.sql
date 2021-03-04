-- Table edfixlearningmodality.ModalityTimeTypeDescriptor --
CREATE TABLE edfixlearningmodality.ModalityTimeTypeDescriptor (
    ModalityTimeTypeDescriptorId INT NOT NULL,
    CONSTRAINT ModalityTimeTypeDescriptor_PK PRIMARY KEY (ModalityTimeTypeDescriptorId)
); 

-- Table edfixlearningmodality.ModalityTypeDescriptor --
CREATE TABLE edfixlearningmodality.ModalityTypeDescriptor (
    ModalityTypeDescriptorId INT NOT NULL,
    CONSTRAINT ModalityTypeDescriptor_PK PRIMARY KEY (ModalityTypeDescriptorId)
); 

-- Table edfixlearningmodality.ProgramLearningModality --
CREATE TABLE edfixlearningmodality.ProgramLearningModality (
    EducationOrganizationId INT NOT NULL,
    ModalityTypeDescriptorId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    ModalityTime DECIMAL(8, 2) NOT NULL,
    ModalityTimeTypeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProgramLearningModality_PK PRIMARY KEY (EducationOrganizationId, ModalityTypeDescriptorId, ProgramName, ProgramTypeDescriptorId)
); 
ALTER TABLE edfixlearningmodality.ProgramLearningModality ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

