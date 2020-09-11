-- Table wi.CertificatedProgramStatusDescriptor --
CREATE TABLE wi.CertificatedProgramStatusDescriptor (
    CertificatedProgramStatusDescriptorId INT NOT NULL,
    CONSTRAINT CertificatedProgramStatusDescriptor_PK PRIMARY KEY (CertificatedProgramStatusDescriptorId)
); 

-- Table wi.CountDateNameDescriptor --
CREATE TABLE wi.CountDateNameDescriptor (
    CountDateNameDescriptorId INT NOT NULL,
    CONSTRAINT CountDateNameDescriptor_PK PRIMARY KEY (CountDateNameDescriptorId)
); 

-- Table wi.CountDateReceivingServiceDescriptor --
CREATE TABLE wi.CountDateReceivingServiceDescriptor (
    CountDateReceivingServiceDescriptorId INT NOT NULL,
    CONSTRAINT CountDateReceivingServiceDescriptor_PK PRIMARY KEY (CountDateReceivingServiceDescriptorId)
); 

-- Table wi.CourseOfferingCareerPathway --
CREATE TABLE wi.CourseOfferingCareerPathway (
    CareerPathwayDescriptorId INT NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseOfferingCareerPathway_PK PRIMARY KEY (CareerPathwayDescriptorId, LocalCourseCode, SchoolId, SchoolYear, SessionName)
); 
ALTER TABLE wi.CourseOfferingCareerPathway ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table wi.CteProgramAreaDescriptor --
CREATE TABLE wi.CteProgramAreaDescriptor (
    CteProgramAreaDescriptorId INT NOT NULL,
    CONSTRAINT CteProgramAreaDescriptor_PK PRIMARY KEY (CteProgramAreaDescriptorId)
); 

-- Table wi.DisciplineActionExtension --
CREATE TABLE wi.DisciplineActionExtension (
    DisciplineActionIdentifier VARCHAR(20) NOT NULL,
    DisciplineDate DATE NOT NULL,
    StudentUSI INT NOT NULL,
    ModifiedTermDescriptorId INT NULL,
    EarlyReinstatementCondition BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT DisciplineActionExtension_PK PRIMARY KEY (DisciplineActionIdentifier, DisciplineDate, StudentUSI)
); 
ALTER TABLE wi.DisciplineActionExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table wi.EnrollmentTypeDescriptor --
CREATE TABLE wi.EnrollmentTypeDescriptor (
    EnrollmentTypeDescriptorId INT NOT NULL,
    CONSTRAINT EnrollmentTypeDescriptor_PK PRIMARY KEY (EnrollmentTypeDescriptorId)
); 

-- Table wi.GradeExtension --
CREATE TABLE wi.GradeExtension (
    BeginDate DATE NOT NULL,
    GradeTypeDescriptorId INT NOT NULL,
    GradingPeriodDescriptorId INT NOT NULL,
    GradingPeriodSchoolYear SMALLINT NOT NULL,
    GradingPeriodSequence INT NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    StudentUSI INT NOT NULL,
    CertificatedProgramStatusDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT GradeExtension_PK PRIMARY KEY (BeginDate, GradeTypeDescriptorId, GradingPeriodDescriptorId, GradingPeriodSchoolYear, GradingPeriodSequence, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
); 
ALTER TABLE wi.GradeExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table wi.GraduationPlanExtension --
CREATE TABLE wi.GraduationPlanExtension (
    EducationOrganizationId INT NOT NULL,
    GraduationPlanTypeDescriptorId INT NOT NULL,
    GraduationSchoolYear SMALLINT NOT NULL,
    CommunityService DECIMAL(5, 2) NOT NULL,
    CivicsExam BOOLEAN NOT NULL,
    MiscellaneousRequiredCredits VARCHAR(900) NULL,
    NonHsHealthEducationCredits DECIMAL(9, 3) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT GraduationPlanExtension_PK PRIMARY KEY (EducationOrganizationId, GraduationPlanTypeDescriptorId, GraduationSchoolYear)
); 
ALTER TABLE wi.GraduationPlanExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table wi.IacCodeDescriptor --
CREATE TABLE wi.IacCodeDescriptor (
    IacCodeDescriptorId INT NOT NULL,
    CONSTRAINT IacCodeDescriptor_PK PRIMARY KEY (IacCodeDescriptorId)
); 

-- Table wi.ModifiedTermDescriptor --
CREATE TABLE wi.ModifiedTermDescriptor (
    ModifiedTermDescriptorId INT NOT NULL,
    CONSTRAINT ModifiedTermDescriptor_PK PRIMARY KEY (ModifiedTermDescriptorId)
); 

-- Table wi.StateEndorsedRegionalCareerPathwayStatusDescriptor --
CREATE TABLE wi.StateEndorsedRegionalCareerPathwayStatusDescriptor (
    StateEndorsedRegionalCareerPathwayStatusDescriptorId INT NOT NULL,
    CONSTRAINT StateEndorsedRegionalCareerPathwayStatusDescriptor_PK PRIMARY KEY (StateEndorsedRegionalCareerPathwayStatusDescriptorId)
); 

-- Table wi.StudentCTEProgramAssociationCTEConcentrationCteProgramArea --
CREATE TABLE wi.StudentCTEProgramAssociationCTEConcentrationCteProgramArea (
    BeginDate DATE NOT NULL,
    CteProgramAreaDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentCTEProgramAssociationCTEConcentrationCteProgramArea_PK PRIMARY KEY (BeginDate, CteProgramAreaDescriptorId, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE wi.StudentCTEProgramAssociationCTEConcentrationCteProgramArea ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table wi.StudentCTEProgramAssociationExtension --
CREATE TABLE wi.StudentCTEProgramAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    CertificatedProgramStatusDescriptorId INT NULL,
    StateEndorsedRegionalCareerPathwayStatusDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentCTEProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE wi.StudentCTEProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table wi.StudentDisciplineIncidentAssociationExtension --
CREATE TABLE wi.StudentDisciplineIncidentAssociationExtension (
    IncidentIdentifier VARCHAR(20) NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    SeriousBodilyInjury BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentDisciplineIncidentAssociationExtension_PK PRIMARY KEY (IncidentIdentifier, SchoolId, StudentUSI)
); 
ALTER TABLE wi.StudentDisciplineIncidentAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table wi.StudentEducationOrganizationAssociationExtension --
CREATE TABLE wi.StudentEducationOrganizationAssociationExtension (
    EducationOrganizationId INT NOT NULL,
    StudentUSI INT NOT NULL,
    ResidentLocalEducationAgencyId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentEducationOrganizationAssociationExtension_PK PRIMARY KEY (EducationOrganizationId, StudentUSI)
); 
ALTER TABLE wi.StudentEducationOrganizationAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table wi.StudentSchoolAssociationEnrollmentType --
CREATE TABLE wi.StudentSchoolAssociationEnrollmentType (
    EnrollmentTypeDescriptorId INT NOT NULL,
    EntryDate DATE NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAssociationEnrollmentType_PK PRIMARY KEY (EnrollmentTypeDescriptorId, EntryDate, SchoolId, StudentUSI)
); 
ALTER TABLE wi.StudentSchoolAssociationEnrollmentType ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table wi.StudentSchoolAssociationExtension --
CREATE TABLE wi.StudentSchoolAssociationExtension (
    EntryDate DATE NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    CompletedSchoolTerm BOOLEAN NULL,
    ExpectedTransferLocalEducationAgencyId INT NULL,
    ExpectedTransferSchoolId INT NULL,
    ActualDaysAttendance DECIMAL(4, 1) NULL,
    PossibleDaysAttendance DECIMAL(4, 1) NULL,
    PrivateSchoolChoiceProgramParticipant BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAssociationExtension_PK PRIMARY KEY (EntryDate, SchoolId, StudentUSI)
); 
ALTER TABLE wi.StudentSchoolAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table wi.StudentSchoolAssociationReceivingService --
CREATE TABLE wi.StudentSchoolAssociationReceivingService (
    CountDateNameDescriptorId INT NOT NULL,
    EntryDate DATE NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    CountDateReceivingServiceDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAssociationReceivingService_PK PRIMARY KEY (CountDateNameDescriptorId, EntryDate, SchoolId, StudentUSI)
); 
ALTER TABLE wi.StudentSchoolAssociationReceivingService ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table wi.StudentSpecialEducationProgramAssociationExtension --
CREATE TABLE wi.StudentSpecialEducationProgramAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    FapeResponsibleSchoolId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSpecialEducationProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE wi.StudentSpecialEducationProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

