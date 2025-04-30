CREATE TABLE [changes].[edfixfinance_AccountTypeDescriptor_TrackedDelete]
(
       AccountTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_AccountTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_BalanceSheetDimension_TrackedDelete]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_BalanceSheetDimension_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_ChartOfAccount_TrackedDelete]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_ChartOfAccount_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_FinancialCollectionDescriptor_TrackedDelete]
(
       FinancialCollectionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_FinancialCollectionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_FunctionDimension_TrackedDelete]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_FunctionDimension_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_FundDimension_TrackedDelete]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_FundDimension_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_LocalAccount_TrackedDelete]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_LocalAccount_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_LocalActual_TrackedDelete]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       AsOfDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_LocalActual_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_LocalBudget_TrackedDelete]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       AsOfDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_LocalBudget_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_ObjectDimension_TrackedDelete]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_ObjectDimension_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_OperationalUnitDimension_TrackedDelete]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_OperationalUnitDimension_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_ProgramDimension_TrackedDelete]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_ProgramDimension_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_ProjectDimension_TrackedDelete]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_ProjectDimension_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_ReportingTagDescriptor_TrackedDelete]
(
       ReportingTagDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_ReportingTagDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[edfixfinance_SourceDimension_TrackedDelete]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [SMALLINT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_edfixfinance_SourceDimension_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

