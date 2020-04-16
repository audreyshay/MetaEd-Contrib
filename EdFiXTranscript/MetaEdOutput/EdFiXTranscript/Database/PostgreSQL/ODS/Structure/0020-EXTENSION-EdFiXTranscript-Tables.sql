-- Table edfixtranscript.CourseTranscript --
CREATE TABLE edfixtranscript.CourseTranscript (
    CourseAttemptResultDescriptorId INT NOT NULL,
    CourseIdentificationCode VARCHAR(60) NOT NULL,
    CourseIdentificationSystemDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AttemptedCredits DECIMAL(9, 3) NULL,
    AttemptedCreditTypeDescriptorId INT NULL,
    AttemptedCreditConversion DECIMAL(9, 2) NULL,
    EarnedCredits DECIMAL(9, 3) NOT NULL,
    EarnedCreditTypeDescriptorId INT NULL,
    EarnedCreditConversion DECIMAL(9, 2) NULL,
    WhenTakenGradeLevelDescriptorId INT NULL,
    MethodCreditEarnedDescriptorId INT NULL,
    FinalLetterGradeEarned VARCHAR(20) NULL,
    FinalNumericGradeEarned DECIMAL(9, 2) NULL,
    CourseRepeatCodeDescriptorId INT NULL,
    CourseTitle VARCHAR(60) NULL,
    AlternativeCourseTitle VARCHAR(60) NULL,
    ExternalEducationOrganizationId INT NULL,
    AssigningOrganizationIdentificationCode VARCHAR(60) NULL,
    CourseCatalogURL VARCHAR(255) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT CourseTranscript_PK PRIMARY KEY (CourseAttemptResultDescriptorId, CourseIdentificationCode, CourseIdentificationSystemDescriptorId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.CourseTranscript ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixtranscript.CourseTranscript ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixtranscript.CourseTranscript ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixtranscript.CourseTranscriptAcademicSubject --
CREATE TABLE edfixtranscript.CourseTranscriptAcademicSubject (
    AcademicSubjectDescriptorId INT NOT NULL,
    CourseAttemptResultDescriptorId INT NOT NULL,
    CourseIdentificationCode VARCHAR(60) NOT NULL,
    CourseIdentificationSystemDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseTranscriptAcademicSubject_PK PRIMARY KEY (AcademicSubjectDescriptorId, CourseAttemptResultDescriptorId, CourseIdentificationCode, CourseIdentificationSystemDescriptorId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.CourseTranscriptAcademicSubject ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode --
CREATE TABLE edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode (
    AlternativeCourseIdentificationSystemDescriptorId INT NOT NULL,
    CourseAttemptResultDescriptorId INT NOT NULL,
    CourseIdentificationCode VARCHAR(60) NOT NULL,
    CourseIdentificationSystemDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AlternativeIdentificationCode VARCHAR(60) NOT NULL,
    AlternativeAssigningOrganizationIdentificationCode VARCHAR(60) NULL,
    AlternativeCourseCatalogURL VARCHAR(255) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseTranscriptAlternativeCourseIdentificationCode_PK PRIMARY KEY (AlternativeCourseIdentificationSystemDescriptorId, CourseAttemptResultDescriptorId, CourseIdentificationCode, CourseIdentificationSystemDescriptorId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixtranscript.CourseTranscriptCourse --
CREATE TABLE edfixtranscript.CourseTranscriptCourse (
    CourseAttemptResultDescriptorId INT NOT NULL,
    CourseCode VARCHAR(60) NOT NULL,
    CourseEducationOrganizationId INT NOT NULL,
    CourseIdentificationCode VARCHAR(60) NOT NULL,
    CourseIdentificationSystemDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseTranscriptCourse_PK PRIMARY KEY (CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, CourseIdentificationCode, CourseIdentificationSystemDescriptorId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.CourseTranscriptCourse ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixtranscript.CourseTranscriptCreditCategory --
CREATE TABLE edfixtranscript.CourseTranscriptCreditCategory (
    CourseAttemptResultDescriptorId INT NOT NULL,
    CourseIdentificationCode VARCHAR(60) NOT NULL,
    CourseIdentificationSystemDescriptorId INT NOT NULL,
    CreditCategoryDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseTranscriptCreditCategory_PK PRIMARY KEY (CourseAttemptResultDescriptorId, CourseIdentificationCode, CourseIdentificationSystemDescriptorId, CreditCategoryDescriptorId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.CourseTranscriptCreditCategory ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixtranscript.CourseTranscriptEarnedAdditionalCredits --
CREATE TABLE edfixtranscript.CourseTranscriptEarnedAdditionalCredits (
    AdditionalCreditTypeDescriptorId INT NOT NULL,
    CourseAttemptResultDescriptorId INT NOT NULL,
    CourseIdentificationCode VARCHAR(60) NOT NULL,
    CourseIdentificationSystemDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    Credits DECIMAL(9, 3) NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseTranscriptEarnedAdditionalCredits_PK PRIMARY KEY (AdditionalCreditTypeDescriptorId, CourseAttemptResultDescriptorId, CourseIdentificationCode, CourseIdentificationSystemDescriptorId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.CourseTranscriptEarnedAdditionalCredits ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixtranscript.StudentAcademicRecord --
CREATE TABLE edfixtranscript.StudentAcademicRecord (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    CumulativeEarnedCredits DECIMAL(9, 3) NULL,
    CumulativeEarnedCreditTypeDescriptorId INT NULL,
    CumulativeEarnedCreditConversion DECIMAL(9, 2) NULL,
    CumulativeAttemptedCredits DECIMAL(9, 3) NULL,
    CumulativeAttemptedCreditTypeDescriptorId INT NULL,
    CumulativeAttemptedCreditConversion DECIMAL(9, 2) NULL,
    ProjectedGraduationDate DATE NULL,
    SessionEarnedCredits DECIMAL(9, 3) NULL,
    SessionEarnedCreditTypeDescriptorId INT NULL,
    SessionEarnedCreditConversion DECIMAL(9, 2) NULL,
    SessionAttemptedCredits DECIMAL(9, 3) NULL,
    SessionAttemptedCreditTypeDescriptorId INT NULL,
    SessionAttemptedCreditConversion DECIMAL(9, 2) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StudentAcademicRecord_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.StudentAcademicRecord ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixtranscript.StudentAcademicRecord ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixtranscript.StudentAcademicRecord ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixtranscript.StudentAcademicRecordAcademicHonor --
CREATE TABLE edfixtranscript.StudentAcademicRecordAcademicHonor (
    AcademicHonorCategoryDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    HonorDescription VARCHAR(80) NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AchievementTitle VARCHAR(60) NULL,
    AchievementCategoryDescriptorId INT NULL,
    AchievementCategorySystem VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    IssuerOriginURL VARCHAR(255) NULL,
    Criteria VARCHAR(150) NULL,
    CriteriaURL VARCHAR(255) NULL,
    EvidenceStatement VARCHAR(150) NULL,
    ImageURL VARCHAR(255) NULL,
    HonorAwardDate DATE NULL,
    HonorAwardExpiresDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentAcademicRecordAcademicHonor_PK PRIMARY KEY (AcademicHonorCategoryDescriptorId, EducationOrganizationId, HonorDescription, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.StudentAcademicRecordAcademicHonor ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixtranscript.StudentAcademicRecordClassRanking --
CREATE TABLE edfixtranscript.StudentAcademicRecordClassRanking (
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    ClassRank INT NOT NULL,
    TotalNumberInClass INT NOT NULL,
    PercentageRanking INT NULL,
    ClassRankingDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentAcademicRecordClassRanking_PK PRIMARY KEY (EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.StudentAcademicRecordClassRanking ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixtranscript.StudentAcademicRecordDiploma --
CREATE TABLE edfixtranscript.StudentAcademicRecordDiploma (
    DiplomaAwardDate DATE NOT NULL,
    DiplomaTypeDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AchievementTitle VARCHAR(60) NULL,
    AchievementCategoryDescriptorId INT NULL,
    AchievementCategorySystem VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    IssuerOriginURL VARCHAR(255) NULL,
    Criteria VARCHAR(150) NULL,
    CriteriaURL VARCHAR(255) NULL,
    EvidenceStatement VARCHAR(150) NULL,
    ImageURL VARCHAR(255) NULL,
    DiplomaLevelDescriptorId INT NULL,
    CTECompleter BOOLEAN NULL,
    DiplomaDescription VARCHAR(80) NULL,
    DiplomaAwardExpiresDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentAcademicRecordDiploma_PK PRIMARY KEY (DiplomaAwardDate, DiplomaTypeDescriptorId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.StudentAcademicRecordDiploma ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixtranscript.StudentAcademicRecordGradePointAverage --
CREATE TABLE edfixtranscript.StudentAcademicRecordGradePointAverage (
    EducationOrganizationId INT NOT NULL,
    GradePointAverageTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    IsCumulative BOOLEAN NULL,
    GradePointAverageValue DECIMAL(18, 4) NOT NULL,
    MaxGradePointAverageValue DECIMAL(18, 4) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentAcademicRecordGradePointAverage_PK PRIMARY KEY (EducationOrganizationId, GradePointAverageTypeDescriptorId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.StudentAcademicRecordGradePointAverage ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixtranscript.StudentAcademicRecordRecognition --
CREATE TABLE edfixtranscript.StudentAcademicRecordRecognition (
    EducationOrganizationId INT NOT NULL,
    RecognitionTypeDescriptorId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    AchievementTitle VARCHAR(60) NULL,
    AchievementCategoryDescriptorId INT NULL,
    AchievementCategorySystem VARCHAR(60) NULL,
    IssuerName VARCHAR(150) NULL,
    IssuerOriginURL VARCHAR(255) NULL,
    Criteria VARCHAR(150) NULL,
    CriteriaURL VARCHAR(255) NULL,
    EvidenceStatement VARCHAR(150) NULL,
    ImageURL VARCHAR(255) NULL,
    RecognitionDescription VARCHAR(80) NULL,
    RecognitionAwardDate DATE NULL,
    RecognitionAwardExpiresDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentAcademicRecordRecognition_PK PRIMARY KEY (EducationOrganizationId, RecognitionTypeDescriptorId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE edfixtranscript.StudentAcademicRecordRecognition ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

