-- Extended Properties [edfixfinance].[AccountTypeDescriptor] --
COMMENT ON TABLE edfixfinance.AccountTypeDescriptor IS 'Type of Account such as Revenue, Expenditure, or Balance Sheet.';
COMMENT ON COLUMN edfixfinance.AccountTypeDescriptor.AccountTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [edfixfinance].[BalanceSheetDimension] --
COMMENT ON TABLE edfixfinance.BalanceSheetDimension IS 'NCES Balance Sheet Dimension';
COMMENT ON COLUMN edfixfinance.BalanceSheetDimension.Code IS 'The code representation of the account Balance Sheet dimension.';
COMMENT ON COLUMN edfixfinance.BalanceSheetDimension.FiscalYear IS 'The fiscal year for which the account Balance Sheet dimension is valid.';
COMMENT ON COLUMN edfixfinance.BalanceSheetDimension.CodeName IS 'A description of the account Balance Sheet dimension.';

-- Extended Properties [edfixfinance].[BalanceSheetDimensionReportingTag] --
COMMENT ON TABLE edfixfinance.BalanceSheetDimensionReportingTag IS 'Optional tag for accountability reporting (e.g. ESSA).';
COMMENT ON COLUMN edfixfinance.BalanceSheetDimensionReportingTag.Code IS 'The code representation of the account Balance Sheet dimension.';
COMMENT ON COLUMN edfixfinance.BalanceSheetDimensionReportingTag.FiscalYear IS 'The fiscal year for which the account Balance Sheet dimension is valid.';
COMMENT ON COLUMN edfixfinance.BalanceSheetDimensionReportingTag.ReportingTagDescriptorId IS 'Optional tag for accountability reporting (e.g. ESSA).';

-- Extended Properties [edfixfinance].[ChartOfAccount] --
COMMENT ON TABLE edfixfinance.ChartOfAccount IS 'A valid combination of account dimensions under which financials are reported. This financial entity represents a funding source combined with its purpose and type of transaction. It provides a formal record of the debits and credits relating to the specific account.';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.AccountIdentifier IS 'SEA populated Code value for the valid combination of account dimensions under which financials are reported.';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.FiscalYear IS 'Fiscal year for the account';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.AccountTypeDescriptorId IS 'Type of Account such as Revenue, Expenditure, or Balance Sheet.';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.AccountName IS 'A descriptive name for the account';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.BalanceSheetCode IS 'The code representation of the account Balance Sheet dimension.';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.FunctionCode IS 'The code representation of the account Function dimension.';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.FundCode IS 'The code representation of the account Fund dimension.';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.ObjectCode IS 'The code representation of the account Object dimension.';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.OperationalUnitCode IS 'The code representation of the account Operational Unit dimension.';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.ProgramCode IS 'The code representation of the account Program dimension.';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.ProjectCode IS 'The code representation of the account Project dimension.';
COMMENT ON COLUMN edfixfinance.ChartOfAccount.SourceCode IS 'The code representation of the account Source dimension.';

-- Extended Properties [edfixfinance].[ChartOfAccountReportingTag] --
COMMENT ON TABLE edfixfinance.ChartOfAccountReportingTag IS 'Optional tag for accountability reporting (e.g. ESSA).';
COMMENT ON COLUMN edfixfinance.ChartOfAccountReportingTag.AccountIdentifier IS 'SEA populated Code value for the valid combination of account dimensions under which financials are reported.';
COMMENT ON COLUMN edfixfinance.ChartOfAccountReportingTag.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixfinance.ChartOfAccountReportingTag.FiscalYear IS 'Fiscal year for the account';
COMMENT ON COLUMN edfixfinance.ChartOfAccountReportingTag.ReportingTagDescriptorId IS 'ReportinTag Descriptor';
COMMENT ON COLUMN edfixfinance.ChartOfAccountReportingTag.TagValue IS 'TagValue';

-- Extended Properties [edfixfinance].[FinancialCollectionDescriptor] --
COMMENT ON TABLE edfixfinance.FinancialCollectionDescriptor IS 'The accounting period or grouping for which financial information is collected.';
COMMENT ON COLUMN edfixfinance.FinancialCollectionDescriptor.FinancialCollectionDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [edfixfinance].[FunctionDimension] --
COMMENT ON TABLE edfixfinance.FunctionDimension IS 'NCES Function Dimension';
COMMENT ON COLUMN edfixfinance.FunctionDimension.Code IS 'The code representation of the account Function dimension.';
COMMENT ON COLUMN edfixfinance.FunctionDimension.FiscalYear IS 'The fiscal year for which the account Function dimension is valid.';
COMMENT ON COLUMN edfixfinance.FunctionDimension.CodeName IS 'A description of the account Function dimension.';

-- Extended Properties [edfixfinance].[FunctionDimensionReportingTag] --
COMMENT ON TABLE edfixfinance.FunctionDimensionReportingTag IS 'Optional tag for accountability reporting (e.g. ESSA).';
COMMENT ON COLUMN edfixfinance.FunctionDimensionReportingTag.Code IS 'The code representation of the account Function dimension.';
COMMENT ON COLUMN edfixfinance.FunctionDimensionReportingTag.FiscalYear IS 'The fiscal year for which the account Function dimension is valid.';
COMMENT ON COLUMN edfixfinance.FunctionDimensionReportingTag.ReportingTagDescriptorId IS 'Optional tag for accountability reporting (e.g. ESSA).';

-- Extended Properties [edfixfinance].[FundDimension] --
COMMENT ON TABLE edfixfinance.FundDimension IS 'NCES Fund Dimension';
COMMENT ON COLUMN edfixfinance.FundDimension.Code IS 'The code representation of the account Fund dimension.';
COMMENT ON COLUMN edfixfinance.FundDimension.FiscalYear IS 'The fiscal year for which the account Fund dimension is valid.';
COMMENT ON COLUMN edfixfinance.FundDimension.CodeName IS 'A description of the account Fund dimension.';

-- Extended Properties [edfixfinance].[FundDimensionReportingTag] --
COMMENT ON TABLE edfixfinance.FundDimensionReportingTag IS 'Optional tag for accountability reporting (e.g. ESSA).';
COMMENT ON COLUMN edfixfinance.FundDimensionReportingTag.Code IS 'The code representation of the account Fund dimension.';
COMMENT ON COLUMN edfixfinance.FundDimensionReportingTag.FiscalYear IS 'The fiscal year for which the account Fund dimension is valid.';
COMMENT ON COLUMN edfixfinance.FundDimensionReportingTag.ReportingTagDescriptorId IS 'Optional tag for accountability reporting (e.g. ESSA).';

-- Extended Properties [edfixfinance].[LocalAccount] --
COMMENT ON TABLE edfixfinance.LocalAccount IS 'The set of account codes defined by an education organization for a fiscal year.It provides a formal record of the debits and credits relating to the specific account.';
COMMENT ON COLUMN edfixfinance.LocalAccount.AccountIdentifier IS 'Code value for the valid combination of account dimensions by LEA under which financials are reported. ';
COMMENT ON COLUMN edfixfinance.LocalAccount.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixfinance.LocalAccount.FiscalYear IS 'Fiscal year for the account';
COMMENT ON COLUMN edfixfinance.LocalAccount.AccountName IS 'A descriptive name for the account';
COMMENT ON COLUMN edfixfinance.LocalAccount.ChartOfAccountIdentifier IS 'SEA populated Code value for the valid combination of account dimensions under which financials are reported.';
COMMENT ON COLUMN edfixfinance.LocalAccount.ChartOfAccountEducationOrganizationId IS 'The identifier assigned to an education organization.';

-- Extended Properties [edfixfinance].[LocalAccountReportingTag] --
COMMENT ON TABLE edfixfinance.LocalAccountReportingTag IS 'Optional tag for accountability reporting (e.g. ESSA).';
COMMENT ON COLUMN edfixfinance.LocalAccountReportingTag.AccountIdentifier IS 'Code value for the valid combination of account dimensions by LEA under which financials are reported. ';
COMMENT ON COLUMN edfixfinance.LocalAccountReportingTag.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixfinance.LocalAccountReportingTag.FiscalYear IS 'Fiscal year for the account';
COMMENT ON COLUMN edfixfinance.LocalAccountReportingTag.ReportingTagDescriptorId IS 'ReportinTag Descriptor';
COMMENT ON COLUMN edfixfinance.LocalAccountReportingTag.TagValue IS 'TagValue';

-- Extended Properties [edfixfinance].[LocalActual] --
COMMENT ON TABLE edfixfinance.LocalActual IS 'Expense/Revenue amounts';
COMMENT ON COLUMN edfixfinance.LocalActual.AccountIdentifier IS 'Code value for the valid combination of account dimensions by LEA under which financials are reported. ';
COMMENT ON COLUMN edfixfinance.LocalActual.AsOfDate IS 'The date of the reported amount for Account.';
COMMENT ON COLUMN edfixfinance.LocalActual.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixfinance.LocalActual.FiscalYear IS 'Fiscal year for the account';
COMMENT ON COLUMN edfixfinance.LocalActual.Amount IS 'Current balance for the account.';
COMMENT ON COLUMN edfixfinance.LocalActual.FinancialCollectionDescriptorId IS 'The accounting period or grouping for which the amount is collected.';

-- Extended Properties [edfixfinance].[LocalBudget] --
COMMENT ON TABLE edfixfinance.LocalBudget IS 'Budget amounts';
COMMENT ON COLUMN edfixfinance.LocalBudget.AccountIdentifier IS 'Code value for the valid combination of account dimensions by LEA under which financials are reported. ';
COMMENT ON COLUMN edfixfinance.LocalBudget.AsOfDate IS 'The date that the amount is applied to.';
COMMENT ON COLUMN edfixfinance.LocalBudget.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixfinance.LocalBudget.FiscalYear IS 'Fiscal year for the account';
COMMENT ON COLUMN edfixfinance.LocalBudget.Amount IS 'Currency value applied to the account.';
COMMENT ON COLUMN edfixfinance.LocalBudget.FinancialCollectionDescriptorId IS 'The accounting period or grouping for which the amount is collected.';

-- Extended Properties [edfixfinance].[ObjectDimension] --
COMMENT ON TABLE edfixfinance.ObjectDimension IS 'NCES Object Dimension';
COMMENT ON COLUMN edfixfinance.ObjectDimension.Code IS 'The code representation of the account Object dimension.';
COMMENT ON COLUMN edfixfinance.ObjectDimension.FiscalYear IS 'The fiscal year for which the account Object dimension is valid.';
COMMENT ON COLUMN edfixfinance.ObjectDimension.CodeName IS 'A description of the account Object dimension.';

-- Extended Properties [edfixfinance].[ObjectDimensionReportingTag] --
COMMENT ON TABLE edfixfinance.ObjectDimensionReportingTag IS 'Optional tag for accountability reporting (e.g. ESSA).';
COMMENT ON COLUMN edfixfinance.ObjectDimensionReportingTag.Code IS 'The code representation of the account Object dimension.';
COMMENT ON COLUMN edfixfinance.ObjectDimensionReportingTag.FiscalYear IS 'The fiscal year for which the account Object dimension is valid.';
COMMENT ON COLUMN edfixfinance.ObjectDimensionReportingTag.ReportingTagDescriptorId IS 'Optional tag for accountability reporting (e.g. ESSA).';

-- Extended Properties [edfixfinance].[OperationalUnitDimension] --
COMMENT ON TABLE edfixfinance.OperationalUnitDimension IS 'NCES Operational Unit Dimension';
COMMENT ON COLUMN edfixfinance.OperationalUnitDimension.Code IS 'The code representation of the account Operational Unit dimension.';
COMMENT ON COLUMN edfixfinance.OperationalUnitDimension.FiscalYear IS 'The fiscal year for which the account Operational Unit dimension is valid.';
COMMENT ON COLUMN edfixfinance.OperationalUnitDimension.CodeName IS 'A description of the account Operational Unit dimension.';

-- Extended Properties [edfixfinance].[OperationalUnitDimensionReportingTag] --
COMMENT ON TABLE edfixfinance.OperationalUnitDimensionReportingTag IS 'Optional tag for accountability reporting (e.g. ESSA).';
COMMENT ON COLUMN edfixfinance.OperationalUnitDimensionReportingTag.Code IS 'The code representation of the account Operational Unit dimension.';
COMMENT ON COLUMN edfixfinance.OperationalUnitDimensionReportingTag.FiscalYear IS 'The fiscal year for which the account Operational Unit dimension is valid.';
COMMENT ON COLUMN edfixfinance.OperationalUnitDimensionReportingTag.ReportingTagDescriptorId IS 'Optional tag for accountability reporting (e.g. ESSA).';

-- Extended Properties [edfixfinance].[ProgramDimension] --
COMMENT ON TABLE edfixfinance.ProgramDimension IS 'NCES Program Dimension';
COMMENT ON COLUMN edfixfinance.ProgramDimension.Code IS 'The code representation of the account Program dimension.';
COMMENT ON COLUMN edfixfinance.ProgramDimension.FiscalYear IS 'The fiscal year for which the account Program dimension is valid.';
COMMENT ON COLUMN edfixfinance.ProgramDimension.CodeName IS 'A description of the account Program dimension.';

-- Extended Properties [edfixfinance].[ProgramDimensionReportingTag] --
COMMENT ON TABLE edfixfinance.ProgramDimensionReportingTag IS 'Optional tag for accountability reporting (e.g. ESSA).';
COMMENT ON COLUMN edfixfinance.ProgramDimensionReportingTag.Code IS 'The code representation of the account Program dimension.';
COMMENT ON COLUMN edfixfinance.ProgramDimensionReportingTag.FiscalYear IS 'The fiscal year for which the account Program dimension is valid.';
COMMENT ON COLUMN edfixfinance.ProgramDimensionReportingTag.ReportingTagDescriptorId IS 'Optional tag for accountability reporting (e.g. ESSA).';

-- Extended Properties [edfixfinance].[ProjectDimension] --
COMMENT ON TABLE edfixfinance.ProjectDimension IS 'NCES Project Dimension';
COMMENT ON COLUMN edfixfinance.ProjectDimension.Code IS 'The code representation of the account Project dimension.';
COMMENT ON COLUMN edfixfinance.ProjectDimension.FiscalYear IS 'The fiscal year for which the account Project dimension is valid.';
COMMENT ON COLUMN edfixfinance.ProjectDimension.CodeName IS 'A description of the account Project dimension.';

-- Extended Properties [edfixfinance].[ProjectDimensionReportingTag] --
COMMENT ON TABLE edfixfinance.ProjectDimensionReportingTag IS 'Optional tag for accountability reporting (e.g. ESSA).';
COMMENT ON COLUMN edfixfinance.ProjectDimensionReportingTag.Code IS 'The code representation of the account Project dimension.';
COMMENT ON COLUMN edfixfinance.ProjectDimensionReportingTag.FiscalYear IS 'The fiscal year for which the account Project dimension is valid.';
COMMENT ON COLUMN edfixfinance.ProjectDimensionReportingTag.ReportingTagDescriptorId IS 'Optional tag for accountability reporting (e.g. ESSA).';

-- Extended Properties [edfixfinance].[ReportingTagDescriptor] --
COMMENT ON TABLE edfixfinance.ReportingTagDescriptor IS 'A descriptor used at the dimension and/or chart of account levels to demote specific State needs for ESSA reporting. e.g., Federal, State and Local funding';
COMMENT ON COLUMN edfixfinance.ReportingTagDescriptor.ReportingTagDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [edfixfinance].[SourceDimension] --
COMMENT ON TABLE edfixfinance.SourceDimension IS 'NCES Source Dimension';
COMMENT ON COLUMN edfixfinance.SourceDimension.Code IS 'The code representation of the account Source dimension.';
COMMENT ON COLUMN edfixfinance.SourceDimension.FiscalYear IS 'The fiscal year for which the account Source dimension is valid.';
COMMENT ON COLUMN edfixfinance.SourceDimension.CodeName IS 'A description of the account Source dimension.';

-- Extended Properties [edfixfinance].[SourceDimensionReportingTag] --
COMMENT ON TABLE edfixfinance.SourceDimensionReportingTag IS 'Optional tag for accountability reporting (e.g. ESSA).';
COMMENT ON COLUMN edfixfinance.SourceDimensionReportingTag.Code IS 'The code representation of the account Source dimension.';
COMMENT ON COLUMN edfixfinance.SourceDimensionReportingTag.FiscalYear IS 'The fiscal year for which the account Source dimension is valid.';
COMMENT ON COLUMN edfixfinance.SourceDimensionReportingTag.ReportingTagDescriptorId IS 'Optional tag for accountability reporting (e.g. ESSA).';

