-- Table edfixfinance.AccountTypeDescriptor --
CREATE TABLE edfixfinance.AccountTypeDescriptor (
    AccountTypeDescriptorId INT NOT NULL,
    CONSTRAINT AccountTypeDescriptor_PK PRIMARY KEY (AccountTypeDescriptorId)
); 

-- Table edfixfinance.BalanceSheetDimension --
CREATE TABLE edfixfinance.BalanceSheetDimension (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    CodeName VARCHAR(100) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT BalanceSheetDimension_PK PRIMARY KEY (Code, FiscalYear)
); 
ALTER TABLE edfixfinance.BalanceSheetDimension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.BalanceSheetDimension ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.BalanceSheetDimension ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.BalanceSheetDimensionReportingTag --
CREATE TABLE edfixfinance.BalanceSheetDimensionReportingTag (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    ReportingTagDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT BalanceSheetDimensionReportingTag_PK PRIMARY KEY (Code, FiscalYear, ReportingTagDescriptorId)
); 
ALTER TABLE edfixfinance.BalanceSheetDimensionReportingTag ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixfinance.ChartOfAccount --
CREATE TABLE edfixfinance.ChartOfAccount (
    AccountIdentifier VARCHAR(50) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FiscalYear INT NOT NULL,
    AccountTypeDescriptorId INT NOT NULL,
    AccountName VARCHAR(100) NULL,
    BalanceSheetCode VARCHAR(16) NULL,
    FunctionCode VARCHAR(16) NULL,
    FundCode VARCHAR(16) NULL,
    ObjectCode VARCHAR(16) NULL,
    OperationalUnitCode VARCHAR(16) NULL,
    ProgramCode VARCHAR(16) NULL,
    ProjectCode VARCHAR(16) NULL,
    SourceCode VARCHAR(16) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT ChartOfAccount_PK PRIMARY KEY (AccountIdentifier, EducationOrganizationId, FiscalYear)
); 
ALTER TABLE edfixfinance.ChartOfAccount ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.ChartOfAccount ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.ChartOfAccount ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.ChartOfAccountReportingTag --
CREATE TABLE edfixfinance.ChartOfAccountReportingTag (
    AccountIdentifier VARCHAR(50) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FiscalYear INT NOT NULL,
    ReportingTagDescriptorId INT NOT NULL,
    TagValue VARCHAR(100) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ChartOfAccountReportingTag_PK PRIMARY KEY (AccountIdentifier, EducationOrganizationId, FiscalYear, ReportingTagDescriptorId)
); 
ALTER TABLE edfixfinance.ChartOfAccountReportingTag ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixfinance.FinancialCollectionDescriptor --
CREATE TABLE edfixfinance.FinancialCollectionDescriptor (
    FinancialCollectionDescriptorId INT NOT NULL,
    CONSTRAINT FinancialCollectionDescriptor_PK PRIMARY KEY (FinancialCollectionDescriptorId)
); 

-- Table edfixfinance.FunctionDimension --
CREATE TABLE edfixfinance.FunctionDimension (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    CodeName VARCHAR(100) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT FunctionDimension_PK PRIMARY KEY (Code, FiscalYear)
); 
ALTER TABLE edfixfinance.FunctionDimension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.FunctionDimension ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.FunctionDimension ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.FunctionDimensionReportingTag --
CREATE TABLE edfixfinance.FunctionDimensionReportingTag (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    ReportingTagDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT FunctionDimensionReportingTag_PK PRIMARY KEY (Code, FiscalYear, ReportingTagDescriptorId)
); 
ALTER TABLE edfixfinance.FunctionDimensionReportingTag ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixfinance.FundDimension --
CREATE TABLE edfixfinance.FundDimension (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    CodeName VARCHAR(100) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT FundDimension_PK PRIMARY KEY (Code, FiscalYear)
); 
ALTER TABLE edfixfinance.FundDimension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.FundDimension ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.FundDimension ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.FundDimensionReportingTag --
CREATE TABLE edfixfinance.FundDimensionReportingTag (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    ReportingTagDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT FundDimensionReportingTag_PK PRIMARY KEY (Code, FiscalYear, ReportingTagDescriptorId)
); 
ALTER TABLE edfixfinance.FundDimensionReportingTag ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixfinance.LocalAccount --
CREATE TABLE edfixfinance.LocalAccount (
    AccountIdentifier VARCHAR(50) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FiscalYear INT NOT NULL,
    AccountName VARCHAR(100) NULL,
    ChartOfAccountIdentifier VARCHAR(50) NOT NULL,
    ChartOfAccountEducationOrganizationId INT NOT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT LocalAccount_PK PRIMARY KEY (AccountIdentifier, EducationOrganizationId, FiscalYear)
); 
ALTER TABLE edfixfinance.LocalAccount ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.LocalAccount ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.LocalAccount ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.LocalAccountReportingTag --
CREATE TABLE edfixfinance.LocalAccountReportingTag (
    AccountIdentifier VARCHAR(50) NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FiscalYear INT NOT NULL,
    ReportingTagDescriptorId INT NOT NULL,
    TagValue VARCHAR(100) NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT LocalAccountReportingTag_PK PRIMARY KEY (AccountIdentifier, EducationOrganizationId, FiscalYear, ReportingTagDescriptorId)
); 
ALTER TABLE edfixfinance.LocalAccountReportingTag ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixfinance.LocalActual --
CREATE TABLE edfixfinance.LocalActual (
    AccountIdentifier VARCHAR(50) NOT NULL,
    AsOfDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FiscalYear INT NOT NULL,
    Amount MONEY NOT NULL,
    FinancialCollectionDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT LocalActual_PK PRIMARY KEY (AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear)
); 
ALTER TABLE edfixfinance.LocalActual ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.LocalActual ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.LocalActual ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.LocalBudget --
CREATE TABLE edfixfinance.LocalBudget (
    AccountIdentifier VARCHAR(50) NOT NULL,
    AsOfDate DATE NOT NULL,
    EducationOrganizationId INT NOT NULL,
    FiscalYear INT NOT NULL,
    Amount MONEY NOT NULL,
    FinancialCollectionDescriptorId INT NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT LocalBudget_PK PRIMARY KEY (AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear)
); 
ALTER TABLE edfixfinance.LocalBudget ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.LocalBudget ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.LocalBudget ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.ObjectDimension --
CREATE TABLE edfixfinance.ObjectDimension (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    CodeName VARCHAR(100) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT ObjectDimension_PK PRIMARY KEY (Code, FiscalYear)
); 
ALTER TABLE edfixfinance.ObjectDimension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.ObjectDimension ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.ObjectDimension ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.ObjectDimensionReportingTag --
CREATE TABLE edfixfinance.ObjectDimensionReportingTag (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    ReportingTagDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ObjectDimensionReportingTag_PK PRIMARY KEY (Code, FiscalYear, ReportingTagDescriptorId)
); 
ALTER TABLE edfixfinance.ObjectDimensionReportingTag ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixfinance.OperationalUnitDimension --
CREATE TABLE edfixfinance.OperationalUnitDimension (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    CodeName VARCHAR(100) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT OperationalUnitDimension_PK PRIMARY KEY (Code, FiscalYear)
); 
ALTER TABLE edfixfinance.OperationalUnitDimension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.OperationalUnitDimension ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.OperationalUnitDimension ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.OperationalUnitDimensionReportingTag --
CREATE TABLE edfixfinance.OperationalUnitDimensionReportingTag (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    ReportingTagDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT OperationalUnitDimensionReportingTag_PK PRIMARY KEY (Code, FiscalYear, ReportingTagDescriptorId)
); 
ALTER TABLE edfixfinance.OperationalUnitDimensionReportingTag ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixfinance.ProgramDimension --
CREATE TABLE edfixfinance.ProgramDimension (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    CodeName VARCHAR(100) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT ProgramDimension_PK PRIMARY KEY (Code, FiscalYear)
); 
ALTER TABLE edfixfinance.ProgramDimension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.ProgramDimension ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.ProgramDimension ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.ProgramDimensionReportingTag --
CREATE TABLE edfixfinance.ProgramDimensionReportingTag (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    ReportingTagDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProgramDimensionReportingTag_PK PRIMARY KEY (Code, FiscalYear, ReportingTagDescriptorId)
); 
ALTER TABLE edfixfinance.ProgramDimensionReportingTag ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixfinance.ProjectDimension --
CREATE TABLE edfixfinance.ProjectDimension (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    CodeName VARCHAR(100) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT ProjectDimension_PK PRIMARY KEY (Code, FiscalYear)
); 
ALTER TABLE edfixfinance.ProjectDimension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.ProjectDimension ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.ProjectDimension ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.ProjectDimensionReportingTag --
CREATE TABLE edfixfinance.ProjectDimensionReportingTag (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    ReportingTagDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT ProjectDimensionReportingTag_PK PRIMARY KEY (Code, FiscalYear, ReportingTagDescriptorId)
); 
ALTER TABLE edfixfinance.ProjectDimensionReportingTag ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

-- Table edfixfinance.ReportingTagDescriptor --
CREATE TABLE edfixfinance.ReportingTagDescriptor (
    ReportingTagDescriptorId INT NOT NULL,
    CONSTRAINT ReportingTagDescriptor_PK PRIMARY KEY (ReportingTagDescriptorId)
); 

-- Table edfixfinance.SourceDimension --
CREATE TABLE edfixfinance.SourceDimension (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    CodeName VARCHAR(100) NULL,
    Discriminator VARCHAR(128) NULL,
    CreateDate TIMESTAMP NOT NULL,
    LastModifiedDate TIMESTAMP NOT NULL,
    Id UUID NOT NULL,
    CONSTRAINT SourceDimension_PK PRIMARY KEY (Code, FiscalYear)
); 
ALTER TABLE edfixfinance.SourceDimension ALTER COLUMN CreateDate SET DEFAULT current_timestamp;
ALTER TABLE edfixfinance.SourceDimension ALTER COLUMN Id SET DEFAULT gen_random_uuid();
ALTER TABLE edfixfinance.SourceDimension ALTER COLUMN LastModifiedDate SET DEFAULT current_timestamp;

-- Table edfixfinance.SourceDimensionReportingTag --
CREATE TABLE edfixfinance.SourceDimensionReportingTag (
    Code VARCHAR(16) NOT NULL,
    FiscalYear INT NOT NULL,
    ReportingTagDescriptorId INT NOT NULL,
    CreateDate TIMESTAMP NOT NULL,
    CONSTRAINT SourceDimensionReportingTag_PK PRIMARY KEY (Code, FiscalYear, ReportingTagDescriptorId)
); 
ALTER TABLE edfixfinance.SourceDimensionReportingTag ALTER COLUMN CreateDate SET DEFAULT current_timestamp;

