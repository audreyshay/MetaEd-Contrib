CREATE TABLE tracked_deletes_edfixfinance.AccountTypeDescriptor
(
       AccountTypeDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AccountTypeDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.BalanceSheetDimension
(
       Code VARCHAR(16) NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT BalanceSheetDimension_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.ChartOfAccount
(
       AccountIdentifier VARCHAR(50) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ChartOfAccount_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.FinancialCollectionDescriptor
(
       FinancialCollectionDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT FinancialCollectionDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.FunctionDimension
(
       Code VARCHAR(16) NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT FunctionDimension_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.FundDimension
(
       Code VARCHAR(16) NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT FundDimension_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.LocalAccount
(
       AccountIdentifier VARCHAR(50) NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT LocalAccount_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.LocalActual
(
       AccountIdentifier VARCHAR(50) NOT NULL,
       AsOfDate DATE NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT LocalActual_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.LocalBudget
(
       AccountIdentifier VARCHAR(50) NOT NULL,
       AsOfDate DATE NOT NULL,
       EducationOrganizationId INT NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT LocalBudget_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.ObjectDimension
(
       Code VARCHAR(16) NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ObjectDimension_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.OperationalUnitDimension
(
       Code VARCHAR(16) NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT OperationalUnitDimension_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.ProgramDimension
(
       Code VARCHAR(16) NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ProgramDimension_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.ProjectDimension
(
       Code VARCHAR(16) NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ProjectDimension_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.ReportingTagDescriptor
(
       ReportingTagDescriptorId INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT ReportingTagDescriptor_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixfinance.SourceDimension
(
       Code VARCHAR(16) NOT NULL,
       FiscalYear INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT SourceDimension_PK PRIMARY KEY (ChangeVersion)
);

