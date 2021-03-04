-- Table edfixcrdc.AlternativeStatusDescriptor --
CREATE TABLE edfixcrdc.AlternativeStatusDescriptor (
    AlternativeStatusDescriptorId INT NOT NULL,
    CONSTRAINT AlternativeStatusDescriptor_PK PRIMARY KEY (AlternativeStatusDescriptorId)
); 

-- Table edfixcrdc.ClassGroup --
CREATE TABLE edfixcrdc.ClassGroup (
    ClassGroupName VARCHAR(75) NOT NULL,
    CommunityProviderId INT NOT NULL,
    CommunityProviderLocationId INT NOT NULL,
    SpecialNeedsProvidedIndicator BOOLEAN NOT NULL,
    Capacity INT NULL,
    DaysAvailablePerWeek INT NULL,
    HoursAvailablePerDay DECIMAL(4, 2) NULL,
    ServiceDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT ClassGroup_PK PRIMARY KEY (ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator)
); 
ALTER TABLE edfixcrdc.ClassGroup ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixcrdc.ClassGroup ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixcrdc.ClassGroup ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixcrdc.ClassGroupCourse --
CREATE TABLE edfixcrdc.ClassGroupCourse (
    ClassGroupName VARCHAR(75) NOT NULL,
    CommunityProviderId INT NOT NULL,
    CommunityProviderLocationId INT NOT NULL,
    CourseCode VARCHAR(60) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    SpecialNeedsProvidedIndicator BOOLEAN NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ClassGroupCourse_PK PRIMARY KEY (ClassGroupName, CommunityProviderId, CommunityProviderLocationId, CourseCode, EducationOrganizationId, SpecialNeedsProvidedIndicator)
); 
ALTER TABLE edfixcrdc.ClassGroupCourse ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixcrdc.ClassGroupMeetingTime --
CREATE TABLE edfixcrdc.ClassGroupMeetingTime (
    ClassGroupName VARCHAR(75) NOT NULL,
    CommunityProviderId INT NOT NULL,
    CommunityProviderLocationId INT NOT NULL,
    MeetingDayDescriptorId INT NOT NULL,
    SpecialNeedsProvidedIndicator BOOLEAN NOT NULL,
    StartTime TIME NOT NULL,
    StopTime TIME NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ClassGroupMeetingTime_PK PRIMARY KEY (ClassGroupName, CommunityProviderId, CommunityProviderLocationId, MeetingDayDescriptorId, SpecialNeedsProvidedIndicator, StartTime, StopTime)
); 
ALTER TABLE edfixcrdc.ClassGroupMeetingTime ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixcrdc.CommunityProviderLocation --
CREATE TABLE edfixcrdc.CommunityProviderLocation (
    CommunityProviderId INT NOT NULL,
    CommunityProviderLocationId INT NOT NULL,
    AgeRangeDescription VARCHAR(75) NULL,
    YoungestAgeAccepted INT NULL,
    OldestAgeAccepted INT NULL,
    Capacity INT NULL,
    SpecialNeedsProvidedIndicator BOOLEAN NULL,
    TimeOpen TIME NULL,
    TimeClose TIME NULL,
    AddressTypeDescriptorId INT NULL,
    StreetNumberName VARCHAR(150) NULL,
    ApartmentRoomSuiteNumber VARCHAR(50) NULL,
    BuildingSiteNumber VARCHAR(20) NULL,
    City VARCHAR(30) NULL,
    StateAbbreviationDescriptorId INT NULL,
    PostalCode VARCHAR(17) NULL,
    NameOfCounty VARCHAR(30) NULL,
    CountyFIPSCode VARCHAR(5) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT CommunityProviderLocation_PK PRIMARY KEY (CommunityProviderId, CommunityProviderLocationId)
); 
ALTER TABLE edfixcrdc.CommunityProviderLocation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixcrdc.CommunityProviderLocation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixcrdc.CommunityProviderLocation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixcrdc.CommunityProviderLocationInstructionalCalendar --
CREATE TABLE edfixcrdc.CommunityProviderLocationInstructionalCalendar (
    CommunityProviderId INT NOT NULL,
    CommunityProviderLocationId INT NOT NULL,
    SchoolYear SMALLINT NOT NULL,
    BeginDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalInstructionalDaysPerYear INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT CommunityProviderLocationInstructionalCalendar_PK PRIMARY KEY (CommunityProviderId, CommunityProviderLocationId)
); 
ALTER TABLE edfixcrdc.CommunityProviderLocationInstructionalCalendar ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixcrdc.MeetingDayDescriptor --
CREATE TABLE edfixcrdc.MeetingDayDescriptor (
    MeetingDayDescriptorId INT NOT NULL,
    CONSTRAINT MeetingDayDescriptor_PK PRIMARY KEY (MeetingDayDescriptorId)
); 

-- Table edfixcrdc.ProgramCostDescriptor --
CREATE TABLE edfixcrdc.ProgramCostDescriptor (
    ProgramCostDescriptorId INT NOT NULL,
    CONSTRAINT ProgramCostDescriptor_PK PRIMARY KEY (ProgramCostDescriptorId)
); 

-- Table edfixcrdc.ProgramExtension --
CREATE TABLE edfixcrdc.ProgramExtension (
    EducationOrganizationId INT NOT NULL,
    ProgramName VARCHAR(60) NOT NULL,
    ProgramTypeDescriptorId INT NOT NULL,
    ProgramCostDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProgramExtension_PK PRIMARY KEY (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
); 
ALTER TABLE edfixcrdc.ProgramExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixcrdc.RestraintCategoryDescriptor --
CREATE TABLE edfixcrdc.RestraintCategoryDescriptor (
    RestraintCategoryDescriptorId INT NOT NULL,
    CONSTRAINT RestraintCategoryDescriptor_PK PRIMARY KEY (RestraintCategoryDescriptorId)
); 

-- Table edfixcrdc.RestraintEventRestraintCategory --
CREATE TABLE edfixcrdc.RestraintEventRestraintCategory (
    RestraintCategoryDescriptorId INT NOT NULL,
    RestraintEventIdentifier VARCHAR(20) NOT NULL,
    SchoolId INT NOT NULL,
    StudentUSI INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT RestraintEventRestraintCategory_PK PRIMARY KEY (RestraintCategoryDescriptorId, RestraintEventIdentifier, SchoolId, StudentUSI)
); 
ALTER TABLE edfixcrdc.RestraintEventRestraintCategory ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixcrdc.SchoolExtension --
CREATE TABLE edfixcrdc.SchoolExtension (
    SchoolId INT NOT NULL,
    AlternativeStatusDescriptorId INT NULL,
    UngradedDetailDescriptorId INT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SchoolExtension_PK PRIMARY KEY (SchoolId)
); 
ALTER TABLE edfixcrdc.SchoolExtension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixcrdc.SchoolTechnology --
CREATE TABLE edfixcrdc.SchoolTechnology (
    SchoolId INT NOT NULL,
    FiberOpticConnection BOOLEAN NOT NULL,
    AllClassroomsHaveWiFi BOOLEAN NOT NULL,
    StudentsTakeHomeDevice BOOLEAN NOT NULL,
    StudentsBringOwnDevice BOOLEAN NOT NULL,
    WiFiDeviceCount INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SchoolTechnology_PK PRIMARY KEY (SchoolId)
); 
ALTER TABLE edfixcrdc.SchoolTechnology ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixcrdc.StudentClassGroupAssociation --
CREATE TABLE edfixcrdc.StudentClassGroupAssociation (
    BeginDate DATE NOT NULL,
    ClassGroupName VARCHAR(75) NOT NULL,
    CommunityProviderId INT NOT NULL,
    CommunityProviderLocationId INT NOT NULL,
    SpecialNeedsProvidedIndicator BOOLEAN NOT NULL,
    StudentUSI INT NOT NULL,
    EndDate DATE NULL,
    ReasonExitedDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StudentClassGroupAssociation_PK PRIMARY KEY (BeginDate, ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator, StudentUSI)
); 
ALTER TABLE edfixcrdc.StudentClassGroupAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixcrdc.StudentClassGroupAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixcrdc.StudentClassGroupAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixcrdc.StudentCommunityProviderLocationAssociation --
CREATE TABLE edfixcrdc.StudentCommunityProviderLocationAssociation (
    BeginDate DATE NOT NULL,
    CommunityProviderId INT NOT NULL,
    CommunityProviderLocationId INT NOT NULL,
    StudentUSI INT NOT NULL,
    EndDate DATE NULL,
    ReasonExitedDescriptorId INT NULL,
    EnrollmentStatus VARCHAR(30) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT StudentCommunityProviderLocationAssociation_PK PRIMARY KEY (BeginDate, CommunityProviderId, CommunityProviderLocationId, StudentUSI)
); 
ALTER TABLE edfixcrdc.StudentCommunityProviderLocationAssociation ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixcrdc.StudentCommunityProviderLocationAssociation ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixcrdc.StudentCommunityProviderLocationAssociation ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixcrdc.UngradedDetailDescriptor --
CREATE TABLE edfixcrdc.UngradedDetailDescriptor (
    UngradedDetailDescriptorId INT NOT NULL,
    CONSTRAINT UngradedDetailDescriptor_PK PRIMARY KEY (UngradedDetailDescriptorId)
); 

