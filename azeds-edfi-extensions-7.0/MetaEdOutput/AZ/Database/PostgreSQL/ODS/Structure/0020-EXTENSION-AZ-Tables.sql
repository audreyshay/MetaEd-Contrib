-- Table az.AbsenceAmountDescriptor --
CREATE TABLE az.AbsenceAmountDescriptor (
    AbsenceAmountDescriptorId INT NOT NULL,
    CONSTRAINT AbsenceAmountDescriptor_PK PRIMARY KEY (AbsenceAmountDescriptorId)
); 

-- Table az.AssessmentOutcomesSummaryDescriptor --
CREATE TABLE az.AssessmentOutcomesSummaryDescriptor (
    AssessmentOutcomesSummaryDescriptorId INT NOT NULL,
    CONSTRAINT AssessmentOutcomesSummaryDescriptor_PK PRIMARY KEY (AssessmentOutcomesSummaryDescriptorId)
); 

-- Table az.CalendarExtension --
CREATE TABLE az.CalendarExtension (
    CalendarCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    TrackLocalEducationAgencyId INT NOT NULL,
    BeginDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalInstructionalDays INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CalendarExtension_PK PRIMARY KEY (CalendarCode, SchoolId, SchoolYear)
); 
ALTER TABLE az.CalendarExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.CourseEntryDescriptor --
CREATE TABLE az.CourseEntryDescriptor (
    CourseEntryDescriptorId INT NOT NULL,
    CONSTRAINT CourseEntryDescriptor_PK PRIMARY KEY (CourseEntryDescriptorId)
); 

-- Table az.CourseExitDescriptor --
CREATE TABLE az.CourseExitDescriptor (
    CourseExitDescriptorId INT NOT NULL,
    CONSTRAINT CourseExitDescriptor_PK PRIMARY KEY (CourseExitDescriptorId)
); 

-- Table az.CourseOfferingCourseSchedule --
CREATE TABLE az.CourseOfferingCourseSchedule (
    LocalCourseCode VARCHAR(60) NOT NULL,
    ScheduleDate DATE NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    InstructionalMinutesPlanned INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseOfferingCourseSchedule_PK PRIMARY KEY (LocalCourseCode, ScheduleDate, SchoolId, SchoolYear, SessionName)
); 
ALTER TABLE az.CourseOfferingCourseSchedule ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.CourseOfferingExtension --
CREATE TABLE az.CourseOfferingExtension (
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    EndOfCourseAssessmentCodeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseOfferingExtension_PK PRIMARY KEY (LocalCourseCode, SchoolId, SchoolYear, SessionName)
); 
ALTER TABLE az.CourseOfferingExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.CourseTranscriptExtension --
CREATE TABLE az.CourseTranscriptExtension (
    CourseAttemptResultDescriptorId INT NOT NULL,
    CourseCode VARCHAR(60) NOT NULL,
    CourseEducationOrganizationId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    StudentUSI INT NOT NULL,
    TermDescriptorId INT NOT NULL,
    FinalLetterGradeDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CourseTranscriptExtension_PK PRIMARY KEY (CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
); 
ALTER TABLE az.CourseTranscriptExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.EducationLevelDescriptor --
CREATE TABLE az.EducationLevelDescriptor (
    EducationLevelDescriptorId INT NOT NULL,
    CONSTRAINT EducationLevelDescriptor_PK PRIMARY KEY (EducationLevelDescriptorId)
); 

-- Table az.EndOfCourseAssessmentCodeDescriptor --
CREATE TABLE az.EndOfCourseAssessmentCodeDescriptor (
    EndOfCourseAssessmentCodeDescriptorId INT NOT NULL,
    CONSTRAINT EndOfCourseAssessmentCodeDescriptor_PK PRIMARY KEY (EndOfCourseAssessmentCodeDescriptorId)
); 

-- Table az.ExitWithdrawReasonDescriptor --
CREATE TABLE az.ExitWithdrawReasonDescriptor (
    ExitWithdrawReasonDescriptorId INT NOT NULL,
    CONSTRAINT ExitWithdrawReasonDescriptor_PK PRIMARY KEY (ExitWithdrawReasonDescriptorId)
); 

-- Table az.FinalLetterGradeDescriptor --
CREATE TABLE az.FinalLetterGradeDescriptor (
    FinalLetterGradeDescriptorId INT NOT NULL,
    CONSTRAINT FinalLetterGradeDescriptor_PK PRIMARY KEY (FinalLetterGradeDescriptorId)
); 

-- Table az.MembershipFTEDescriptor --
CREATE TABLE az.MembershipFTEDescriptor (
    MembershipFTEDescriptorId INT NOT NULL,
    CONSTRAINT MembershipFTEDescriptor_PK PRIMARY KEY (MembershipFTEDescriptorId)
); 

-- Table az.MembershipResponsibilityDescriptor --
CREATE TABLE az.MembershipResponsibilityDescriptor (
    MembershipResponsibilityDescriptorId INT NOT NULL,
    CONSTRAINT MembershipResponsibilityDescriptor_PK PRIMARY KEY (MembershipResponsibilityDescriptorId)
); 

-- Table az.MembershipTypeDescriptor --
CREATE TABLE az.MembershipTypeDescriptor (
    MembershipTypeDescriptorId INT NOT NULL,
    CONSTRAINT MembershipTypeDescriptor_PK PRIMARY KEY (MembershipTypeDescriptorId)
); 

-- Table az.MonthDescriptor --
CREATE TABLE az.MonthDescriptor (
    MonthDescriptorId INT NOT NULL,
    CONSTRAINT MonthDescriptor_PK PRIMARY KEY (MonthDescriptorId)
); 

-- Table az.NumberOfInstructionalDaysInWeekDescriptor --
CREATE TABLE az.NumberOfInstructionalDaysInWeekDescriptor (
    NumberOfInstructionalDaysInWeekDescriptorId INT NOT NULL,
    CONSTRAINT NumberOfInstructionalDaysInWeekDescriptor_PK PRIMARY KEY (NumberOfInstructionalDaysInWeekDescriptorId)
); 

-- Table az.PrimaryNightTimeResidenceDescriptor --
CREATE TABLE az.PrimaryNightTimeResidenceDescriptor (
    PrimaryNightTimeResidenceDescriptorId INT NOT NULL,
    CONSTRAINT PrimaryNightTimeResidenceDescriptor_PK PRIMARY KEY (PrimaryNightTimeResidenceDescriptorId)
); 

-- Table az.SectionExtension --
CREATE TABLE az.SectionExtension (
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    TimetableDayIdentifier VARCHAR(250) NULL,
    Note VARCHAR(250) NULL,
    MinutesPerWeek INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionExtension_PK PRIMARY KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE az.SectionExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.SectionExternalProviderTeacher --
CREATE TABLE az.SectionExternalProviderTeacher (
    ExternalProviderName VARCHAR(75) NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    ProviderTeacherFirstName VARCHAR(50) NOT NULL,
    ProviderTeacherLastName VARCHAR(50) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    ClassroomPositionDescriptorId INT NULL,
    BeginDate DATE NULL,
    EndDate DATE NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SectionExternalProviderTeacher_PK PRIMARY KEY (ExternalProviderName, LocalCourseCode, ProviderTeacherFirstName, ProviderTeacherLastName, SchoolId, SchoolYear, SectionIdentifier, SessionName)
); 
ALTER TABLE az.SectionExternalProviderTeacher ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.SpecialEnrollmentDescriptor --
CREATE TABLE az.SpecialEnrollmentDescriptor (
    SpecialEnrollmentDescriptorId INT NOT NULL,
    CONSTRAINT SpecialEnrollmentDescriptor_PK PRIMARY KEY (SpecialEnrollmentDescriptorId)
); 

-- Table az.StaffEducationOrganizationEmploymentAssociationExtension --
CREATE TABLE az.StaffEducationOrganizationEmploymentAssociationExtension (
    EducationOrganizationId INT NOT NULL,
    EmploymentStatusDescriptorId INT NOT NULL,
    HireDate DATE NOT NULL,
    StaffUSI INT NOT NULL,
    EducationLevelDescriptorId INT NULL,
    Benefits DECIMAL(5, 2) NULL,
    Salary MONEY NOT NULL,
    FullTimeEquivalencyOther DECIMAL(5, 4) NULL,
    PSP BOOLEAN NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StaffEducationOrganizationEmploymentAssociationExtension_PK PRIMARY KEY (EducationOrganizationId, EmploymentStatusDescriptorId, HireDate, StaffUSI)
); 
ALTER TABLE az.StaffEducationOrganizationEmploymentAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.StudentDropOutRecoveryProgramAssociation --
CREATE TABLE az.StudentDropOutRecoveryProgramAssociation (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    WrittenLearningPlanDate DATE NOT NULL,
    CONSTRAINT StudentDropOutRecoveryProgramAssociation_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 

-- Table az.StudentDropOutRecoveryProgramMonthlyUpdate --
CREATE TABLE az.StudentDropOutRecoveryProgramMonthlyUpdate (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    MonthDescriptorId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    RevisedWrittenLearningPlanDate DATE NULL,
    SatisfactoryProgress BOOLEAN NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StudentDropOutRecoveryProgramMonthlyUpdate_PK PRIMARY KEY (BeginDate, EducationOrganizationId, MonthDescriptorId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE az.StudentDropOutRecoveryProgramMonthlyUpdate ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE az.StudentDropOutRecoveryProgramMonthlyUpdate ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE az.StudentDropOutRecoveryProgramMonthlyUpdate ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table az.StudentEducationOrganizationAssociationAZTribalAffiliation --
CREATE TABLE az.StudentEducationOrganizationAssociationAZTribalAffiliation (
    EducationOrganizationId INT NOT NULL,
    StudentUSI INT NOT NULL,
    TribalAffiliationDescriptorId INT NOT NULL,
    OtherAffiliation VARCHAR(250) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentEducationOrganizationAssociationAZTribalAffiliation_PK PRIMARY KEY (EducationOrganizationId, StudentUSI, TribalAffiliationDescriptorId)
); 
ALTER TABLE az.StudentEducationOrganizationAssociationAZTribalAffiliation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.StudentNeed --
CREATE TABLE az.StudentNeed (
    EducationOrganizationId INT NOT NULL,
    StudentNeedDescriptorId INT NOT NULL,
    StudentNeedEntryDate DATE NOT NULL,
    StudentUSI INT NOT NULL,
    StudentNeedExitDate DATE NULL,
    PrimaryStudentNeedIndicator BOOLEAN NULL,
    PrimaryNightTimeResidenceDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StudentNeed_PK PRIMARY KEY (EducationOrganizationId, StudentNeedDescriptorId, StudentNeedEntryDate, StudentUSI)
); 
ALTER TABLE az.StudentNeed ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE az.StudentNeed ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE az.StudentNeed ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table az.StudentNeedCategoryDescriptor --
CREATE TABLE az.StudentNeedCategoryDescriptor (
    StudentNeedCategoryDescriptorId INT NOT NULL,
    CONSTRAINT StudentNeedCategoryDescriptor_PK PRIMARY KEY (StudentNeedCategoryDescriptorId)
); 

-- Table az.StudentNeedDescriptor --
CREATE TABLE az.StudentNeedDescriptor (
    StudentNeedDescriptorId INT NOT NULL,
    StudentNeedCategoryDescriptorId INT NOT NULL,
    CONSTRAINT StudentNeedDescriptor_PK PRIMARY KEY (StudentNeedDescriptorId)
); 

-- Table az.StudentProgramAttendanceEventTimeLog --
CREATE TABLE az.StudentProgramAttendanceEventTimeLog (
    AttendanceBeginTime TIME NOT NULL,
    AttendanceEventCategoryDescriptorId INT NOT NULL,
    EducationOrganizationId INT NOT NULL,
    EventDate DATE NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    AttendanceEndTime TIME NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentProgramAttendanceEventTimeLog_PK PRIMARY KEY (AttendanceBeginTime, AttendanceEventCategoryDescriptorId, EducationOrganizationId, EventDate, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE az.StudentProgramAttendanceEventTimeLog ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.StudentSchoolAssociationExtension --
CREATE TABLE az.StudentSchoolAssociationExtension (
    EntryDate DATE NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    ExitWithdrawReasonDescriptorId INT NULL,
    MembershipTypeDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAssociationExtension_PK PRIMARY KEY (EntryDate, SchoolId, StudentUSI)
); 
ALTER TABLE az.StudentSchoolAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.StudentSchoolAssociationLocalEducationAgency --
CREATE TABLE az.StudentSchoolAssociationLocalEducationAgency (
    EntryDate DATE NOT NULL,
    MembershipResponsibilityDescriptorId INT NOT NULL,
    SchoolId INT NOT NULL,
    StartDate DATE NOT NULL,
    StudentUSI INT NOT NULL,
    EndDate DATE NULL,
    LocalEducationAgencyId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAssociationLocalEducationAgency_PK PRIMARY KEY (EntryDate, MembershipResponsibilityDescriptorId, SchoolId, StartDate, StudentUSI)
); 
ALTER TABLE az.StudentSchoolAssociationLocalEducationAgency ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.StudentSchoolAssociationMembershipFTE --
CREATE TABLE az.StudentSchoolAssociationMembershipFTE (
    EntryDate DATE NOT NULL,
    FTEStartDate DATE NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    FTEEndDate DATE NULL,
    MembershipFTEDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAssociationMembershipFTE_PK PRIMARY KEY (EntryDate, FTEStartDate, SchoolId, StudentUSI)
); 
ALTER TABLE az.StudentSchoolAssociationMembershipFTE ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.StudentSchoolAssociationSpecialEnrollment --
CREATE TABLE az.StudentSchoolAssociationSpecialEnrollment (
    EntryDate DATE NOT NULL,
    SchoolId INT NOT NULL,
    SpecialEnrollmentStartDate DATE NOT NULL,
    StudentUSI INT NOT NULL,
    SpecialEnrollmentEndDate DATE NULL,
    SpecialEnrollmentDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAssociationSpecialEnrollment_PK PRIMARY KEY (EntryDate, SchoolId, SpecialEnrollmentStartDate, StudentUSI)
); 
ALTER TABLE az.StudentSchoolAssociationSpecialEnrollment ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.StudentSchoolAssociationTuitionPayer --
CREATE TABLE az.StudentSchoolAssociationTuitionPayer (
    EntryDate DATE NOT NULL,
    PayerStartDate DATE NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    PayerEndDate DATE NULL,
    TuitionPayerDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAssociationTuitionPayer_PK PRIMARY KEY (EntryDate, PayerStartDate, SchoolId, StudentUSI)
); 
ALTER TABLE az.StudentSchoolAssociationTuitionPayer ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.StudentSchoolAttendanceEventExtension --
CREATE TABLE az.StudentSchoolAttendanceEventExtension (
    AttendanceEventCategoryDescriptorId INT NOT NULL,
    EventDate DATE NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    StudentUSI INT NOT NULL,
    InstructionalMinutes INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSchoolAttendanceEventExtension_PK PRIMARY KEY (AttendanceEventCategoryDescriptorId, EventDate, SchoolId, SchoolYear, SessionName, StudentUSI)
); 
ALTER TABLE az.StudentSchoolAttendanceEventExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.StudentSectionAssociationExtension --
CREATE TABLE az.StudentSectionAssociationExtension (
    BeginDate DATE NOT NULL,
    LocalCourseCode VARCHAR(60) NOT NULL,
    SchoolId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    SectionIdentifier VARCHAR(255) NOT NULL,
    SessionName VARCHAR(60) NOT NULL,
    StudentUSI INT NOT NULL,
    Note VARCHAR(250) NULL,
    CourseEntryDescriptorId INT NULL,
    CourseExitDescriptorId INT NULL,
    DualCredit BOOLEAN NOT NULL,
    ConcurrentEnrollment BOOLEAN NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSectionAssociationExtension_PK PRIMARY KEY (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
); 
ALTER TABLE az.StudentSectionAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.StudentSpecialEducationProgramAssociationAssessmentOutcome --
CREATE TABLE az.StudentSpecialEducationProgramAssociationAssessmentOutcome (
    AssessmentCategoryDescriptorId INT NOT NULL,
    AssessmentPeriodDescriptorId INT NOT NULL,
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    AssessmentOutcomesSummaryDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSpecialEducationProgramAssociationAssessmentOutcome_PK PRIMARY KEY (AssessmentCategoryDescriptorId, AssessmentPeriodDescriptorId, BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE az.StudentSpecialEducationProgramAssociationAssessmentOutcome ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.StudentSpecialEducationProgramAssociationExtension --
CREATE TABLE az.StudentSpecialEducationProgramAssociationExtension (
    BeginDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    ProgramEducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    StudentUSI INT NOT NULL,
    MainSPEDSchool BOOLEAN NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT StudentSpecialEducationProgramAssociationExtension_PK PRIMARY KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
); 
ALTER TABLE az.StudentSpecialEducationProgramAssociationExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table az.TuitionPayerDescriptor --
CREATE TABLE az.TuitionPayerDescriptor (
    TuitionPayerDescriptorId INT NOT NULL,
    CONSTRAINT TuitionPayerDescriptor_PK PRIMARY KEY (TuitionPayerDescriptorId)
); 

