ALTER TABLE [edfixfinance].[AccountTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_AccountTypeDescriptor_Descriptor] FOREIGN KEY ([AccountTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixfinance].[BalanceSheetDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_BalanceSheetDimensionReportingTag_BalanceSheetDimension] FOREIGN KEY ([Code], [FiscalYear])
REFERENCES [edfixfinance].[BalanceSheetDimension] ([Code], [FiscalYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_BalanceSheetDimensionReportingTag_BalanceSheetDimension]
ON [edfixfinance].[BalanceSheetDimensionReportingTag] ([Code] ASC, [FiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[BalanceSheetDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_BalanceSheetDimensionReportingTag_ReportingTagDescriptor] FOREIGN KEY ([ReportingTagDescriptorId])
REFERENCES [edfixfinance].[ReportingTagDescriptor] ([ReportingTagDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_BalanceSheetDimensionReportingTag_ReportingTagDescriptor]
ON [edfixfinance].[BalanceSheetDimensionReportingTag] ([ReportingTagDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccount] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccount_AccountTypeDescriptor] FOREIGN KEY ([AccountTypeDescriptorId])
REFERENCES [edfixfinance].[AccountTypeDescriptor] ([AccountTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccount_AccountTypeDescriptor]
ON [edfixfinance].[ChartOfAccount] ([AccountTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccount] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccount_BalanceSheetDimension] FOREIGN KEY ([BalanceSheetCode], [BalanceSheetFiscalYear])
REFERENCES [edfixfinance].[BalanceSheetDimension] ([Code], [FiscalYear])
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccount_BalanceSheetDimension]
ON [edfixfinance].[ChartOfAccount] ([BalanceSheetCode] ASC, [BalanceSheetFiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccount] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccount_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccount_EducationOrganization]
ON [edfixfinance].[ChartOfAccount] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccount] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccount_FunctionDimension] FOREIGN KEY ([FunctionCode], [FunctionFiscalYear])
REFERENCES [edfixfinance].[FunctionDimension] ([Code], [FiscalYear])
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccount_FunctionDimension]
ON [edfixfinance].[ChartOfAccount] ([FunctionCode] ASC, [FunctionFiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccount] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccount_FundDimension] FOREIGN KEY ([FundCode], [FundFiscalYear])
REFERENCES [edfixfinance].[FundDimension] ([Code], [FiscalYear])
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccount_FundDimension]
ON [edfixfinance].[ChartOfAccount] ([FundCode] ASC, [FundFiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccount] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccount_ObjectDimension] FOREIGN KEY ([ObjectCode], [ObjectFiscalYear])
REFERENCES [edfixfinance].[ObjectDimension] ([Code], [FiscalYear])
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccount_ObjectDimension]
ON [edfixfinance].[ChartOfAccount] ([ObjectCode] ASC, [ObjectFiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccount] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccount_OperationalUnitDimension] FOREIGN KEY ([OperationalUnitCode], [OperationalUnitFiscalYear])
REFERENCES [edfixfinance].[OperationalUnitDimension] ([Code], [FiscalYear])
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccount_OperationalUnitDimension]
ON [edfixfinance].[ChartOfAccount] ([OperationalUnitCode] ASC, [OperationalUnitFiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccount] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccount_ProgramDimension] FOREIGN KEY ([ProgramCode], [ProgramFiscalYear])
REFERENCES [edfixfinance].[ProgramDimension] ([Code], [FiscalYear])
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccount_ProgramDimension]
ON [edfixfinance].[ChartOfAccount] ([ProgramCode] ASC, [ProgramFiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccount] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccount_ProjectDimension] FOREIGN KEY ([ProjectCode], [ProjectFiscalYear])
REFERENCES [edfixfinance].[ProjectDimension] ([Code], [FiscalYear])
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccount_ProjectDimension]
ON [edfixfinance].[ChartOfAccount] ([ProjectCode] ASC, [ProjectFiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccount] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccount_SourceDimension] FOREIGN KEY ([SourceCode], [SourceFiscalYear])
REFERENCES [edfixfinance].[SourceDimension] ([Code], [FiscalYear])
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccount_SourceDimension]
ON [edfixfinance].[ChartOfAccount] ([SourceCode] ASC, [SourceFiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccountReportingTag] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccountReportingTag_ChartOfAccount] FOREIGN KEY ([AccountIdentifier], [EducationOrganizationId], [FiscalYear])
REFERENCES [edfixfinance].[ChartOfAccount] ([AccountIdentifier], [EducationOrganizationId], [FiscalYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccountReportingTag_ChartOfAccount]
ON [edfixfinance].[ChartOfAccountReportingTag] ([AccountIdentifier] ASC, [EducationOrganizationId] ASC, [FiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ChartOfAccountReportingTag] WITH CHECK ADD CONSTRAINT [FK_ChartOfAccountReportingTag_ReportingTagDescriptor] FOREIGN KEY ([ReportingTagDescriptorId])
REFERENCES [edfixfinance].[ReportingTagDescriptor] ([ReportingTagDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ChartOfAccountReportingTag_ReportingTagDescriptor]
ON [edfixfinance].[ChartOfAccountReportingTag] ([ReportingTagDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[FinancialCollectionDescriptor] WITH CHECK ADD CONSTRAINT [FK_FinancialCollectionDescriptor_Descriptor] FOREIGN KEY ([FinancialCollectionDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixfinance].[FunctionDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_FunctionDimensionReportingTag_FunctionDimension] FOREIGN KEY ([Code], [FiscalYear])
REFERENCES [edfixfinance].[FunctionDimension] ([Code], [FiscalYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_FunctionDimensionReportingTag_FunctionDimension]
ON [edfixfinance].[FunctionDimensionReportingTag] ([Code] ASC, [FiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[FunctionDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_FunctionDimensionReportingTag_ReportingTagDescriptor] FOREIGN KEY ([ReportingTagDescriptorId])
REFERENCES [edfixfinance].[ReportingTagDescriptor] ([ReportingTagDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_FunctionDimensionReportingTag_ReportingTagDescriptor]
ON [edfixfinance].[FunctionDimensionReportingTag] ([ReportingTagDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[FundDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_FundDimensionReportingTag_FundDimension] FOREIGN KEY ([Code], [FiscalYear])
REFERENCES [edfixfinance].[FundDimension] ([Code], [FiscalYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_FundDimensionReportingTag_FundDimension]
ON [edfixfinance].[FundDimensionReportingTag] ([Code] ASC, [FiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[FundDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_FundDimensionReportingTag_ReportingTagDescriptor] FOREIGN KEY ([ReportingTagDescriptorId])
REFERENCES [edfixfinance].[ReportingTagDescriptor] ([ReportingTagDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_FundDimensionReportingTag_ReportingTagDescriptor]
ON [edfixfinance].[FundDimensionReportingTag] ([ReportingTagDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[LocalAccount] WITH CHECK ADD CONSTRAINT [FK_LocalAccount_ChartOfAccount] FOREIGN KEY ([ChartOfAccountIdentifier], [ChartOfAccountEducationOrganizationId], [ChartOfAccountFiscalYear])
REFERENCES [edfixfinance].[ChartOfAccount] ([AccountIdentifier], [EducationOrganizationId], [FiscalYear])
GO

CREATE NONCLUSTERED INDEX [FK_LocalAccount_ChartOfAccount]
ON [edfixfinance].[LocalAccount] ([ChartOfAccountIdentifier] ASC, [ChartOfAccountEducationOrganizationId] ASC, [ChartOfAccountFiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[LocalAccount] WITH CHECK ADD CONSTRAINT [FK_LocalAccount_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_LocalAccount_EducationOrganization]
ON [edfixfinance].[LocalAccount] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [edfixfinance].[LocalAccountReportingTag] WITH CHECK ADD CONSTRAINT [FK_LocalAccountReportingTag_LocalAccount] FOREIGN KEY ([AccountIdentifier], [EducationOrganizationId], [FiscalYear])
REFERENCES [edfixfinance].[LocalAccount] ([AccountIdentifier], [EducationOrganizationId], [FiscalYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_LocalAccountReportingTag_LocalAccount]
ON [edfixfinance].[LocalAccountReportingTag] ([AccountIdentifier] ASC, [EducationOrganizationId] ASC, [FiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[LocalAccountReportingTag] WITH CHECK ADD CONSTRAINT [FK_LocalAccountReportingTag_ReportingTagDescriptor] FOREIGN KEY ([ReportingTagDescriptorId])
REFERENCES [edfixfinance].[ReportingTagDescriptor] ([ReportingTagDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_LocalAccountReportingTag_ReportingTagDescriptor]
ON [edfixfinance].[LocalAccountReportingTag] ([ReportingTagDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[LocalActual] WITH CHECK ADD CONSTRAINT [FK_LocalActual_FinancialCollectionDescriptor] FOREIGN KEY ([FinancialCollectionDescriptorId])
REFERENCES [edfixfinance].[FinancialCollectionDescriptor] ([FinancialCollectionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_LocalActual_FinancialCollectionDescriptor]
ON [edfixfinance].[LocalActual] ([FinancialCollectionDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[LocalActual] WITH CHECK ADD CONSTRAINT [FK_LocalActual_LocalAccount] FOREIGN KEY ([AccountIdentifier], [EducationOrganizationId], [FiscalYear])
REFERENCES [edfixfinance].[LocalAccount] ([AccountIdentifier], [EducationOrganizationId], [FiscalYear])
GO

CREATE NONCLUSTERED INDEX [FK_LocalActual_LocalAccount]
ON [edfixfinance].[LocalActual] ([AccountIdentifier] ASC, [EducationOrganizationId] ASC, [FiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[LocalBudget] WITH CHECK ADD CONSTRAINT [FK_LocalBudget_FinancialCollectionDescriptor] FOREIGN KEY ([FinancialCollectionDescriptorId])
REFERENCES [edfixfinance].[FinancialCollectionDescriptor] ([FinancialCollectionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_LocalBudget_FinancialCollectionDescriptor]
ON [edfixfinance].[LocalBudget] ([FinancialCollectionDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[LocalBudget] WITH CHECK ADD CONSTRAINT [FK_LocalBudget_LocalAccount] FOREIGN KEY ([AccountIdentifier], [EducationOrganizationId], [FiscalYear])
REFERENCES [edfixfinance].[LocalAccount] ([AccountIdentifier], [EducationOrganizationId], [FiscalYear])
GO

CREATE NONCLUSTERED INDEX [FK_LocalBudget_LocalAccount]
ON [edfixfinance].[LocalBudget] ([AccountIdentifier] ASC, [EducationOrganizationId] ASC, [FiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ObjectDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_ObjectDimensionReportingTag_ObjectDimension] FOREIGN KEY ([Code], [FiscalYear])
REFERENCES [edfixfinance].[ObjectDimension] ([Code], [FiscalYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ObjectDimensionReportingTag_ObjectDimension]
ON [edfixfinance].[ObjectDimensionReportingTag] ([Code] ASC, [FiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ObjectDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_ObjectDimensionReportingTag_ReportingTagDescriptor] FOREIGN KEY ([ReportingTagDescriptorId])
REFERENCES [edfixfinance].[ReportingTagDescriptor] ([ReportingTagDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ObjectDimensionReportingTag_ReportingTagDescriptor]
ON [edfixfinance].[ObjectDimensionReportingTag] ([ReportingTagDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[OperationalUnitDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_OperationalUnitDimensionReportingTag_OperationalUnitDimension] FOREIGN KEY ([Code], [FiscalYear])
REFERENCES [edfixfinance].[OperationalUnitDimension] ([Code], [FiscalYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_OperationalUnitDimensionReportingTag_OperationalUnitDimension]
ON [edfixfinance].[OperationalUnitDimensionReportingTag] ([Code] ASC, [FiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[OperationalUnitDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_OperationalUnitDimensionReportingTag_ReportingTagDescriptor] FOREIGN KEY ([ReportingTagDescriptorId])
REFERENCES [edfixfinance].[ReportingTagDescriptor] ([ReportingTagDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_OperationalUnitDimensionReportingTag_ReportingTagDescriptor]
ON [edfixfinance].[OperationalUnitDimensionReportingTag] ([ReportingTagDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[ProgramDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_ProgramDimensionReportingTag_ProgramDimension] FOREIGN KEY ([Code], [FiscalYear])
REFERENCES [edfixfinance].[ProgramDimension] ([Code], [FiscalYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProgramDimensionReportingTag_ProgramDimension]
ON [edfixfinance].[ProgramDimensionReportingTag] ([Code] ASC, [FiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ProgramDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_ProgramDimensionReportingTag_ReportingTagDescriptor] FOREIGN KEY ([ReportingTagDescriptorId])
REFERENCES [edfixfinance].[ReportingTagDescriptor] ([ReportingTagDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProgramDimensionReportingTag_ReportingTagDescriptor]
ON [edfixfinance].[ProgramDimensionReportingTag] ([ReportingTagDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[ProjectDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_ProjectDimensionReportingTag_ProjectDimension] FOREIGN KEY ([Code], [FiscalYear])
REFERENCES [edfixfinance].[ProjectDimension] ([Code], [FiscalYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProjectDimensionReportingTag_ProjectDimension]
ON [edfixfinance].[ProjectDimensionReportingTag] ([Code] ASC, [FiscalYear] ASC)
GO

ALTER TABLE [edfixfinance].[ProjectDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_ProjectDimensionReportingTag_ReportingTagDescriptor] FOREIGN KEY ([ReportingTagDescriptorId])
REFERENCES [edfixfinance].[ReportingTagDescriptor] ([ReportingTagDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProjectDimensionReportingTag_ReportingTagDescriptor]
ON [edfixfinance].[ProjectDimensionReportingTag] ([ReportingTagDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[ReportingTagDescriptor] WITH CHECK ADD CONSTRAINT [FK_ReportingTagDescriptor_Descriptor] FOREIGN KEY ([ReportingTagDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixfinance].[SourceDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_SourceDimensionReportingTag_ReportingTagDescriptor] FOREIGN KEY ([ReportingTagDescriptorId])
REFERENCES [edfixfinance].[ReportingTagDescriptor] ([ReportingTagDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SourceDimensionReportingTag_ReportingTagDescriptor]
ON [edfixfinance].[SourceDimensionReportingTag] ([ReportingTagDescriptorId] ASC)
GO

ALTER TABLE [edfixfinance].[SourceDimensionReportingTag] WITH CHECK ADD CONSTRAINT [FK_SourceDimensionReportingTag_SourceDimension] FOREIGN KEY ([Code], [FiscalYear])
REFERENCES [edfixfinance].[SourceDimension] ([Code], [FiscalYear])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SourceDimensionReportingTag_SourceDimension]
ON [edfixfinance].[SourceDimensionReportingTag] ([Code] ASC, [FiscalYear] ASC)
GO

