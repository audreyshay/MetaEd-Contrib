CREATE TABLE [tracked_deletes_edfixfinance].[AccountTypeDescriptor]
(
       AccountTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AccountTypeDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[BalanceSheetDimension]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_BalanceSheetDimension PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[ChartOfAccount]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ChartOfAccount PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[FinancialCollectionDescriptor]
(
       FinancialCollectionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_FinancialCollectionDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[FunctionDimension]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_FunctionDimension PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[FundDimension]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_FundDimension PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[LocalAccount]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LocalAccount PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[LocalActual]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       AsOfDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LocalActual PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[LocalBudget]
(
       AccountIdentifier [NVARCHAR](50) NOT NULL,
       AsOfDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_LocalBudget PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[ObjectDimension]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ObjectDimension PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[OperationalUnitDimension]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_OperationalUnitDimension PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[ProgramDimension]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProgramDimension PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[ProjectDimension]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ProjectDimension PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[ReportingTagDescriptor]
(
       ReportingTagDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_ReportingTagDescriptor PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixfinance].[SourceDimension]
(
       Code [NVARCHAR](16) NOT NULL,
       FiscalYear [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_SourceDimension PRIMARY KEY CLUSTERED (ChangeVersion)
)

