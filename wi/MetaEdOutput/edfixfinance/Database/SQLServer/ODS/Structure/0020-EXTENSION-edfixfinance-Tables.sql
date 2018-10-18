-- Table [edfixfinance].[AccountTypeDescriptor] --
CREATE TABLE [edfixfinance].[AccountTypeDescriptor] (
    [AccountTypeDescriptorId] [INT] NOT NULL,
    CONSTRAINT [AccountTypeDescriptor_PK] PRIMARY KEY CLUSTERED (
        [AccountTypeDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [edfixfinance].[BalanceSheetDimension] --
CREATE TABLE [edfixfinance].[BalanceSheetDimension] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [CodeName] [NVARCHAR](100) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [BalanceSheetDimension_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[BalanceSheetDimension] ADD CONSTRAINT [BalanceSheetDimension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[BalanceSheetDimension] ADD CONSTRAINT [BalanceSheetDimension_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[BalanceSheetDimension] ADD CONSTRAINT [BalanceSheetDimension_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[BalanceSheetDimensionReportingTag] --
CREATE TABLE [edfixfinance].[BalanceSheetDimensionReportingTag] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [ReportingTagDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [BalanceSheetDimensionReportingTag_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC,
        [ReportingTagDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[BalanceSheetDimensionReportingTag] ADD CONSTRAINT [BalanceSheetDimensionReportingTag_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixfinance].[ChartOfAccount] --
CREATE TABLE [edfixfinance].[ChartOfAccount] (
    [AccountIdentifier] [NVARCHAR](50) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [AccountTypeDescriptorId] [INT] NOT NULL,
    [AccountName] [NVARCHAR](100) NULL,
    [BalanceSheetCode] [NVARCHAR](16) NULL,
    [BalanceSheetFiscalYear] [SMALLINT] NULL,
    [FunctionCode] [NVARCHAR](16) NULL,
    [FunctionFiscalYear] [SMALLINT] NULL,
    [FundCode] [NVARCHAR](16) NULL,
    [FundFiscalYear] [SMALLINT] NULL,
    [ObjectCode] [NVARCHAR](16) NULL,
    [ObjectFiscalYear] [SMALLINT] NULL,
    [OperationalUnitCode] [NVARCHAR](16) NULL,
    [OperationalUnitFiscalYear] [SMALLINT] NULL,
    [ProgramCode] [NVARCHAR](16) NULL,
    [ProgramFiscalYear] [SMALLINT] NULL,
    [ProjectCode] [NVARCHAR](16) NULL,
    [ProjectFiscalYear] [SMALLINT] NULL,
    [SourceCode] [NVARCHAR](16) NULL,
    [SourceFiscalYear] [SMALLINT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [ChartOfAccount_PK] PRIMARY KEY CLUSTERED (
        [AccountIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[ChartOfAccount] ADD CONSTRAINT [ChartOfAccount_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[ChartOfAccount] ADD CONSTRAINT [ChartOfAccount_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[ChartOfAccount] ADD CONSTRAINT [ChartOfAccount_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[ChartOfAccountReportingTag] --
CREATE TABLE [edfixfinance].[ChartOfAccountReportingTag] (
    [AccountIdentifier] [NVARCHAR](50) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [ReportingTagDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [ChartOfAccountReportingTag_PK] PRIMARY KEY CLUSTERED (
        [AccountIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [FiscalYear] ASC,
        [ReportingTagDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[ChartOfAccountReportingTag] ADD CONSTRAINT [ChartOfAccountReportingTag_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixfinance].[FinancialCollectionDescriptor] --
CREATE TABLE [edfixfinance].[FinancialCollectionDescriptor] (
    [FinancialCollectionDescriptorId] [INT] NOT NULL,
    CONSTRAINT [FinancialCollectionDescriptor_PK] PRIMARY KEY CLUSTERED (
        [FinancialCollectionDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [edfixfinance].[FunctionDimension] --
CREATE TABLE [edfixfinance].[FunctionDimension] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [CodeName] [NVARCHAR](100) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [FunctionDimension_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[FunctionDimension] ADD CONSTRAINT [FunctionDimension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[FunctionDimension] ADD CONSTRAINT [FunctionDimension_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[FunctionDimension] ADD CONSTRAINT [FunctionDimension_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[FunctionDimensionReportingTag] --
CREATE TABLE [edfixfinance].[FunctionDimensionReportingTag] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [ReportingTagDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [FunctionDimensionReportingTag_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC,
        [ReportingTagDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[FunctionDimensionReportingTag] ADD CONSTRAINT [FunctionDimensionReportingTag_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixfinance].[FundDimension] --
CREATE TABLE [edfixfinance].[FundDimension] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [CodeName] [NVARCHAR](100) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [FundDimension_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[FundDimension] ADD CONSTRAINT [FundDimension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[FundDimension] ADD CONSTRAINT [FundDimension_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[FundDimension] ADD CONSTRAINT [FundDimension_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[FundDimensionReportingTag] --
CREATE TABLE [edfixfinance].[FundDimensionReportingTag] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [ReportingTagDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [FundDimensionReportingTag_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC,
        [ReportingTagDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[FundDimensionReportingTag] ADD CONSTRAINT [FundDimensionReportingTag_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixfinance].[LocalAccount] --
CREATE TABLE [edfixfinance].[LocalAccount] (
    [AccountIdentifier] [NVARCHAR](50) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [AccountName] [NVARCHAR](100) NULL,
    [ChartOfAccountIdentifier] [NVARCHAR](50) NOT NULL,
    [ChartOfAccountFiscalYear] [SMALLINT] NOT NULL,
    [ChartOfAccountEducationOrganizationId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [LocalAccount_PK] PRIMARY KEY CLUSTERED (
        [AccountIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[LocalAccount] ADD CONSTRAINT [LocalAccount_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[LocalAccount] ADD CONSTRAINT [LocalAccount_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[LocalAccount] ADD CONSTRAINT [LocalAccount_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[LocalAccountReportingTag] --
CREATE TABLE [edfixfinance].[LocalAccountReportingTag] (
    [AccountIdentifier] [NVARCHAR](50) NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [ReportingTagDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [LocalAccountReportingTag_PK] PRIMARY KEY CLUSTERED (
        [AccountIdentifier] ASC,
        [EducationOrganizationId] ASC,
        [FiscalYear] ASC,
        [ReportingTagDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[LocalAccountReportingTag] ADD CONSTRAINT [LocalAccountReportingTag_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixfinance].[LocalActual] --
CREATE TABLE [edfixfinance].[LocalActual] (
    [AccountIdentifier] [NVARCHAR](50) NOT NULL,
    [AsOfDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [Amount] [MONEY] NOT NULL,
    [FinancialCollectionDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [LocalActual_PK] PRIMARY KEY CLUSTERED (
        [AccountIdentifier] ASC,
        [AsOfDate] ASC,
        [EducationOrganizationId] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[LocalActual] ADD CONSTRAINT [LocalActual_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[LocalActual] ADD CONSTRAINT [LocalActual_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[LocalActual] ADD CONSTRAINT [LocalActual_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[LocalBudget] --
CREATE TABLE [edfixfinance].[LocalBudget] (
    [AccountIdentifier] [NVARCHAR](50) NOT NULL,
    [AsOfDate] [DATE] NOT NULL,
    [EducationOrganizationId] [INT] NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [Amount] [MONEY] NOT NULL,
    [FinancialCollectionDescriptorId] [INT] NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [LocalBudget_PK] PRIMARY KEY CLUSTERED (
        [AccountIdentifier] ASC,
        [AsOfDate] ASC,
        [EducationOrganizationId] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[LocalBudget] ADD CONSTRAINT [LocalBudget_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[LocalBudget] ADD CONSTRAINT [LocalBudget_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[LocalBudget] ADD CONSTRAINT [LocalBudget_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[ObjectDimension] --
CREATE TABLE [edfixfinance].[ObjectDimension] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [CodeName] [NVARCHAR](100) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [ObjectDimension_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[ObjectDimension] ADD CONSTRAINT [ObjectDimension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[ObjectDimension] ADD CONSTRAINT [ObjectDimension_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[ObjectDimension] ADD CONSTRAINT [ObjectDimension_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[ObjectDimensionReportingTag] --
CREATE TABLE [edfixfinance].[ObjectDimensionReportingTag] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [ReportingTagDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [ObjectDimensionReportingTag_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC,
        [ReportingTagDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[ObjectDimensionReportingTag] ADD CONSTRAINT [ObjectDimensionReportingTag_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixfinance].[OperationalUnitDimension] --
CREATE TABLE [edfixfinance].[OperationalUnitDimension] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [CodeName] [NVARCHAR](100) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [OperationalUnitDimension_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[OperationalUnitDimension] ADD CONSTRAINT [OperationalUnitDimension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[OperationalUnitDimension] ADD CONSTRAINT [OperationalUnitDimension_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[OperationalUnitDimension] ADD CONSTRAINT [OperationalUnitDimension_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[OperationalUnitDimensionReportingTag] --
CREATE TABLE [edfixfinance].[OperationalUnitDimensionReportingTag] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [ReportingTagDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [OperationalUnitDimensionReportingTag_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC,
        [ReportingTagDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[OperationalUnitDimensionReportingTag] ADD CONSTRAINT [OperationalUnitDimensionReportingTag_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixfinance].[ProgramDimension] --
CREATE TABLE [edfixfinance].[ProgramDimension] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [CodeName] [NVARCHAR](100) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [ProgramDimension_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[ProgramDimension] ADD CONSTRAINT [ProgramDimension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[ProgramDimension] ADD CONSTRAINT [ProgramDimension_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[ProgramDimension] ADD CONSTRAINT [ProgramDimension_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[ProgramDimensionReportingTag] --
CREATE TABLE [edfixfinance].[ProgramDimensionReportingTag] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [ReportingTagDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [ProgramDimensionReportingTag_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC,
        [ReportingTagDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[ProgramDimensionReportingTag] ADD CONSTRAINT [ProgramDimensionReportingTag_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixfinance].[ProjectDimension] --
CREATE TABLE [edfixfinance].[ProjectDimension] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [CodeName] [NVARCHAR](100) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [ProjectDimension_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[ProjectDimension] ADD CONSTRAINT [ProjectDimension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[ProjectDimension] ADD CONSTRAINT [ProjectDimension_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[ProjectDimension] ADD CONSTRAINT [ProjectDimension_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[ProjectDimensionReportingTag] --
CREATE TABLE [edfixfinance].[ProjectDimensionReportingTag] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [ReportingTagDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [ProjectDimensionReportingTag_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC,
        [ReportingTagDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[ProjectDimensionReportingTag] ADD CONSTRAINT [ProjectDimensionReportingTag_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

-- Table [edfixfinance].[ReportingTagDescriptor] --
CREATE TABLE [edfixfinance].[ReportingTagDescriptor] (
    [ReportingTagDescriptorId] [INT] NOT NULL,
    CONSTRAINT [ReportingTagDescriptor_PK] PRIMARY KEY CLUSTERED (
        [ReportingTagDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Table [edfixfinance].[SourceDimension] --
CREATE TABLE [edfixfinance].[SourceDimension] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [CodeName] [NVARCHAR](100) NULL,
    [CreateDate] [DATETIME] NOT NULL,
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL,
    CONSTRAINT [SourceDimension_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[SourceDimension] ADD CONSTRAINT [SourceDimension_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [edfixfinance].[SourceDimension] ADD CONSTRAINT [SourceDimension_DF_Id] DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [edfixfinance].[SourceDimension] ADD CONSTRAINT [SourceDimension_DF_LastModifiedDate] DEFAULT (getdate()) FOR [LastModifiedDate]
GO

-- Table [edfixfinance].[SourceDimensionReportingTag] --
CREATE TABLE [edfixfinance].[SourceDimensionReportingTag] (
    [Code] [NVARCHAR](16) NOT NULL,
    [FiscalYear] [SMALLINT] NOT NULL,
    [ReportingTagDescriptorId] [INT] NOT NULL,
    [CreateDate] [DATETIME] NOT NULL,
    CONSTRAINT [SourceDimensionReportingTag_PK] PRIMARY KEY CLUSTERED (
        [Code] ASC,
        [FiscalYear] ASC,
        [ReportingTagDescriptorId] ASC
    ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [edfixfinance].[SourceDimensionReportingTag] ADD CONSTRAINT [SourceDimensionReportingTag_DF_CreateDate] DEFAULT (getdate()) FOR [CreateDate]
GO

