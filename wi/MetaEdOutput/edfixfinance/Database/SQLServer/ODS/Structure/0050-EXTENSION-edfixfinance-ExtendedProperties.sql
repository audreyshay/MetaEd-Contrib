-- Extended Properties [edfixfinance].[AccountTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of Account such as Revenue, Expenditure, or Balance Sheet.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'AccountTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'AccountTypeDescriptor', @level2type=N'COLUMN', @level2name=N'AccountTypeDescriptorId'
GO

-- Extended Properties [edfixfinance].[BalanceSheetDimension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NCES Balance Sheet Dimension', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'BalanceSheetDimension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Balance Sheet dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'BalanceSheetDimension', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Balance Sheet dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'BalanceSheetDimension', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of the account Balance Sheet dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'BalanceSheetDimension', @level2type=N'COLUMN', @level2name=N'CodeName'
GO

-- Extended Properties [edfixfinance].[BalanceSheetDimensionReportingTag] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'BalanceSheetDimensionReportingTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Balance Sheet dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'BalanceSheetDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Balance Sheet dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'BalanceSheetDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'BalanceSheetDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'ReportingTagDescriptorId'
GO

-- Extended Properties [edfixfinance].[ChartOfAccount] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A valid combination of account dimensions under which financials are reported. This financial entity represents a funding source combined with its purpose and type of transaction. It provides a formal record of the debits and credits relating to the specific account.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEA populated Code value for the valid combination of account dimensions under which financials are reported.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'AccountIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fiscal year for the account', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of Account such as Revenue, Expenditure, or Balance Sheet.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'AccountTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A descriptive name for the account', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'AccountName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Balance Sheet dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'BalanceSheetCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Balance Sheet dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'BalanceSheetFiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Function dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'FunctionCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Function dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'FunctionFiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Fund dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'FundCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Fund dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'FundFiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Object dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'ObjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Object dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'ObjectFiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Operational Unit dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'OperationalUnitCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Operational Unit dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'OperationalUnitFiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Program dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'ProgramCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Program dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'ProgramFiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Project dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'ProjectCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Project dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'ProjectFiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Source dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'SourceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Source dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccount', @level2type=N'COLUMN', @level2name=N'SourceFiscalYear'
GO

-- Extended Properties [edfixfinance].[ChartOfAccountReportingTag] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccountReportingTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEA populated Code value for the valid combination of account dimensions under which financials are reported.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccountReportingTag', @level2type=N'COLUMN', @level2name=N'AccountIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccountReportingTag', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fiscal year for the account', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccountReportingTag', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ChartOfAccountReportingTag', @level2type=N'COLUMN', @level2name=N'ReportingTagDescriptorId'
GO

-- Extended Properties [edfixfinance].[FinancialCollectionDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The accounting period or grouping for which financial information is collected.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FinancialCollectionDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FinancialCollectionDescriptor', @level2type=N'COLUMN', @level2name=N'FinancialCollectionDescriptorId'
GO

-- Extended Properties [edfixfinance].[FunctionDimension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NCES Function Dimension', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FunctionDimension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Function dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FunctionDimension', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Function dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FunctionDimension', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of the account Function dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FunctionDimension', @level2type=N'COLUMN', @level2name=N'CodeName'
GO

-- Extended Properties [edfixfinance].[FunctionDimensionReportingTag] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FunctionDimensionReportingTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Function dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FunctionDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Function dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FunctionDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FunctionDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'ReportingTagDescriptorId'
GO

-- Extended Properties [edfixfinance].[FundDimension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NCES Fund Dimension', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FundDimension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Fund dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FundDimension', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Fund dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FundDimension', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of the account Fund dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FundDimension', @level2type=N'COLUMN', @level2name=N'CodeName'
GO

-- Extended Properties [edfixfinance].[FundDimensionReportingTag] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FundDimensionReportingTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Fund dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FundDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Fund dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FundDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'FundDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'ReportingTagDescriptorId'
GO

-- Extended Properties [edfixfinance].[LocalAccount] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The set of account codes defined by an education organization for a fiscal year.It provides a formal record of the debits and credits relating to the specific account.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code value for the valid combination of account dimensions by LEA under which financials are reported. ', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccount', @level2type=N'COLUMN', @level2name=N'AccountIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccount', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fiscal year for the account', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccount', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A descriptive name for the account', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccount', @level2type=N'COLUMN', @level2name=N'AccountName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEA populated Code value for the valid combination of account dimensions under which financials are reported.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccount', @level2type=N'COLUMN', @level2name=N'ChartOfAccountIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fiscal year for the account', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccount', @level2type=N'COLUMN', @level2name=N'ChartOfAccountFiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccount', @level2type=N'COLUMN', @level2name=N'ChartOfAccountEducationOrganizationId'
GO

-- Extended Properties [edfixfinance].[LocalAccountReportingTag] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccountReportingTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code value for the valid combination of account dimensions by LEA under which financials are reported. ', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccountReportingTag', @level2type=N'COLUMN', @level2name=N'AccountIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccountReportingTag', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fiscal year for the account', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccountReportingTag', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalAccountReportingTag', @level2type=N'COLUMN', @level2name=N'ReportingTagDescriptorId'
GO

-- Extended Properties [edfixfinance].[LocalActual] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Expense/Revenue amounts', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalActual'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code value for the valid combination of account dimensions by LEA under which financials are reported. ', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalActual', @level2type=N'COLUMN', @level2name=N'AccountIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date of the reported amount for Account.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalActual', @level2type=N'COLUMN', @level2name=N'AsOfDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalActual', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fiscal year for the account', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalActual', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current balance for the account.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalActual', @level2type=N'COLUMN', @level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The accounting period or grouping for which the amount is collected.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalActual', @level2type=N'COLUMN', @level2name=N'FinancialCollectionDescriptorId'
GO

-- Extended Properties [edfixfinance].[LocalBudget] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Budget amounts', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalBudget'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code value for the valid combination of account dimensions by LEA under which financials are reported. ', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalBudget', @level2type=N'COLUMN', @level2name=N'AccountIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date that the amount is applied to.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalBudget', @level2type=N'COLUMN', @level2name=N'AsOfDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalBudget', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fiscal year for the account', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalBudget', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Currency value applied to the account.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalBudget', @level2type=N'COLUMN', @level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The accounting period or grouping for which the amount is collected.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'LocalBudget', @level2type=N'COLUMN', @level2name=N'FinancialCollectionDescriptorId'
GO

-- Extended Properties [edfixfinance].[ObjectDimension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NCES Object Dimension', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ObjectDimension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Object dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ObjectDimension', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Object dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ObjectDimension', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of the account Object dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ObjectDimension', @level2type=N'COLUMN', @level2name=N'CodeName'
GO

-- Extended Properties [edfixfinance].[ObjectDimensionReportingTag] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ObjectDimensionReportingTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Object dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ObjectDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Object dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ObjectDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ObjectDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'ReportingTagDescriptorId'
GO

-- Extended Properties [edfixfinance].[OperationalUnitDimension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NCES Operational Unit Dimension', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'OperationalUnitDimension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Operational Unit dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'OperationalUnitDimension', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Operational Unit dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'OperationalUnitDimension', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of the account Operational Unit dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'OperationalUnitDimension', @level2type=N'COLUMN', @level2name=N'CodeName'
GO

-- Extended Properties [edfixfinance].[OperationalUnitDimensionReportingTag] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'OperationalUnitDimensionReportingTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Operational Unit dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'OperationalUnitDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Operational Unit dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'OperationalUnitDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'OperationalUnitDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'ReportingTagDescriptorId'
GO

-- Extended Properties [edfixfinance].[ProgramDimension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NCES Program Dimension', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProgramDimension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Program dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProgramDimension', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Program dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProgramDimension', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of the account Program dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProgramDimension', @level2type=N'COLUMN', @level2name=N'CodeName'
GO

-- Extended Properties [edfixfinance].[ProgramDimensionReportingTag] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProgramDimensionReportingTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Program dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProgramDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Program dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProgramDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProgramDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'ReportingTagDescriptorId'
GO

-- Extended Properties [edfixfinance].[ProjectDimension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NCES Project Dimension', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProjectDimension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Project dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProjectDimension', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Project dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProjectDimension', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of the account Project dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProjectDimension', @level2type=N'COLUMN', @level2name=N'CodeName'
GO

-- Extended Properties [edfixfinance].[ProjectDimensionReportingTag] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProjectDimensionReportingTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Project dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProjectDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Project dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProjectDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ProjectDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'ReportingTagDescriptorId'
GO

-- Extended Properties [edfixfinance].[ReportingTagDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A descriptor used at the dimension and/or chart of account levels to demote specific State needs for ESSA reporting. e.g., Federal, State and Local funding', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ReportingTagDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'ReportingTagDescriptor', @level2type=N'COLUMN', @level2name=N'ReportingTagDescriptorId'
GO

-- Extended Properties [edfixfinance].[SourceDimension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NCES Source Dimension', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'SourceDimension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Source dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'SourceDimension', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Source dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'SourceDimension', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of the account Source dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'SourceDimension', @level2type=N'COLUMN', @level2name=N'CodeName'
GO

-- Extended Properties [edfixfinance].[SourceDimensionReportingTag] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'SourceDimensionReportingTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code representation of the account Source dimension.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'SourceDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fiscal year for which the account Source dimension is valid.', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'SourceDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'FiscalYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Optional tag for accountability reporting (e.g. ESSA).', @level0type=N'SCHEMA', @level0name=N'edfixfinance', @level1type=N'TABLE', @level1name=N'SourceDimensionReportingTag', @level2type=N'COLUMN', @level2name=N'ReportingTagDescriptorId'
GO

