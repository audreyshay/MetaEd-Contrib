ALTER TABLE edfixfinance.AccountTypeDescriptor ADD CONSTRAINT FK_8f249f_Descriptor FOREIGN KEY (AccountTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE edfixfinance.BalanceSheetDimensionReportingTag ADD CONSTRAINT FK_bcbd82_BalanceSheetDimension FOREIGN KEY (Code, FiscalYear)
REFERENCES edfixfinance.BalanceSheetDimension (Code, FiscalYear)
ON DELETE CASCADE
;

CREATE INDEX FK_bcbd82_BalanceSheetDimension
ON edfixfinance.BalanceSheetDimensionReportingTag (Code ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.BalanceSheetDimensionReportingTag ADD CONSTRAINT FK_bcbd82_ReportingTagDescriptor FOREIGN KEY (ReportingTagDescriptorId)
REFERENCES edfixfinance.ReportingTagDescriptor (ReportingTagDescriptorId)
;

CREATE INDEX FK_bcbd82_ReportingTagDescriptor
ON edfixfinance.BalanceSheetDimensionReportingTag (ReportingTagDescriptorId ASC);

ALTER TABLE edfixfinance.ChartOfAccount ADD CONSTRAINT FK_131e2b_AccountTypeDescriptor FOREIGN KEY (AccountTypeDescriptorId)
REFERENCES edfixfinance.AccountTypeDescriptor (AccountTypeDescriptorId)
;

CREATE INDEX FK_131e2b_AccountTypeDescriptor
ON edfixfinance.ChartOfAccount (AccountTypeDescriptorId ASC);

ALTER TABLE edfixfinance.ChartOfAccount ADD CONSTRAINT FK_131e2b_BalanceSheetDimension FOREIGN KEY (BalanceSheetCode, FiscalYear)
REFERENCES edfixfinance.BalanceSheetDimension (Code, FiscalYear)
;

CREATE INDEX FK_131e2b_BalanceSheetDimension
ON edfixfinance.ChartOfAccount (BalanceSheetCode ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ChartOfAccount ADD CONSTRAINT FK_131e2b_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_131e2b_EducationOrganization
ON edfixfinance.ChartOfAccount (EducationOrganizationId ASC);

ALTER TABLE edfixfinance.ChartOfAccount ADD CONSTRAINT FK_131e2b_FunctionDimension FOREIGN KEY (FunctionCode, FiscalYear)
REFERENCES edfixfinance.FunctionDimension (Code, FiscalYear)
;

CREATE INDEX FK_131e2b_FunctionDimension
ON edfixfinance.ChartOfAccount (FunctionCode ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ChartOfAccount ADD CONSTRAINT FK_131e2b_FundDimension FOREIGN KEY (FundCode, FiscalYear)
REFERENCES edfixfinance.FundDimension (Code, FiscalYear)
;

CREATE INDEX FK_131e2b_FundDimension
ON edfixfinance.ChartOfAccount (FundCode ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ChartOfAccount ADD CONSTRAINT FK_131e2b_ObjectDimension FOREIGN KEY (ObjectCode, FiscalYear)
REFERENCES edfixfinance.ObjectDimension (Code, FiscalYear)
;

CREATE INDEX FK_131e2b_ObjectDimension
ON edfixfinance.ChartOfAccount (ObjectCode ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ChartOfAccount ADD CONSTRAINT FK_131e2b_OperationalUnitDimension FOREIGN KEY (OperationalUnitCode, FiscalYear)
REFERENCES edfixfinance.OperationalUnitDimension (Code, FiscalYear)
;

CREATE INDEX FK_131e2b_OperationalUnitDimension
ON edfixfinance.ChartOfAccount (OperationalUnitCode ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ChartOfAccount ADD CONSTRAINT FK_131e2b_ProgramDimension FOREIGN KEY (ProgramCode, FiscalYear)
REFERENCES edfixfinance.ProgramDimension (Code, FiscalYear)
;

CREATE INDEX FK_131e2b_ProgramDimension
ON edfixfinance.ChartOfAccount (ProgramCode ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ChartOfAccount ADD CONSTRAINT FK_131e2b_ProjectDimension FOREIGN KEY (ProjectCode, FiscalYear)
REFERENCES edfixfinance.ProjectDimension (Code, FiscalYear)
;

CREATE INDEX FK_131e2b_ProjectDimension
ON edfixfinance.ChartOfAccount (ProjectCode ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ChartOfAccount ADD CONSTRAINT FK_131e2b_SourceDimension FOREIGN KEY (SourceCode, FiscalYear)
REFERENCES edfixfinance.SourceDimension (Code, FiscalYear)
;

CREATE INDEX FK_131e2b_SourceDimension
ON edfixfinance.ChartOfAccount (SourceCode ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ChartOfAccountReportingTag ADD CONSTRAINT FK_8422f4_ChartOfAccount FOREIGN KEY (AccountIdentifier, EducationOrganizationId, FiscalYear)
REFERENCES edfixfinance.ChartOfAccount (AccountIdentifier, EducationOrganizationId, FiscalYear)
ON DELETE CASCADE
;

CREATE INDEX FK_8422f4_ChartOfAccount
ON edfixfinance.ChartOfAccountReportingTag (AccountIdentifier ASC, EducationOrganizationId ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ChartOfAccountReportingTag ADD CONSTRAINT FK_8422f4_ReportingTagDescriptor FOREIGN KEY (ReportingTagDescriptorId)
REFERENCES edfixfinance.ReportingTagDescriptor (ReportingTagDescriptorId)
;

CREATE INDEX FK_8422f4_ReportingTagDescriptor
ON edfixfinance.ChartOfAccountReportingTag (ReportingTagDescriptorId ASC);

ALTER TABLE edfixfinance.FinancialCollectionDescriptor ADD CONSTRAINT FK_6dc716_Descriptor FOREIGN KEY (FinancialCollectionDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE edfixfinance.FunctionDimensionReportingTag ADD CONSTRAINT FK_8d455d_FunctionDimension FOREIGN KEY (Code, FiscalYear)
REFERENCES edfixfinance.FunctionDimension (Code, FiscalYear)
ON DELETE CASCADE
;

CREATE INDEX FK_8d455d_FunctionDimension
ON edfixfinance.FunctionDimensionReportingTag (Code ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.FunctionDimensionReportingTag ADD CONSTRAINT FK_8d455d_ReportingTagDescriptor FOREIGN KEY (ReportingTagDescriptorId)
REFERENCES edfixfinance.ReportingTagDescriptor (ReportingTagDescriptorId)
;

CREATE INDEX FK_8d455d_ReportingTagDescriptor
ON edfixfinance.FunctionDimensionReportingTag (ReportingTagDescriptorId ASC);

ALTER TABLE edfixfinance.FundDimensionReportingTag ADD CONSTRAINT FK_7062bd_FundDimension FOREIGN KEY (Code, FiscalYear)
REFERENCES edfixfinance.FundDimension (Code, FiscalYear)
ON DELETE CASCADE
;

CREATE INDEX FK_7062bd_FundDimension
ON edfixfinance.FundDimensionReportingTag (Code ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.FundDimensionReportingTag ADD CONSTRAINT FK_7062bd_ReportingTagDescriptor FOREIGN KEY (ReportingTagDescriptorId)
REFERENCES edfixfinance.ReportingTagDescriptor (ReportingTagDescriptorId)
;

CREATE INDEX FK_7062bd_ReportingTagDescriptor
ON edfixfinance.FundDimensionReportingTag (ReportingTagDescriptorId ASC);

ALTER TABLE edfixfinance.LocalAccount ADD CONSTRAINT FK_32eddb_ChartOfAccount FOREIGN KEY (ChartOfAccountIdentifier, ChartOfAccountEducationOrganizationId, FiscalYear)
REFERENCES edfixfinance.ChartOfAccount (AccountIdentifier, EducationOrganizationId, FiscalYear)
;

CREATE INDEX FK_32eddb_ChartOfAccount
ON edfixfinance.LocalAccount (ChartOfAccountIdentifier ASC, ChartOfAccountEducationOrganizationId ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.LocalAccount ADD CONSTRAINT FK_32eddb_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_32eddb_EducationOrganization
ON edfixfinance.LocalAccount (EducationOrganizationId ASC);

ALTER TABLE edfixfinance.LocalAccountReportingTag ADD CONSTRAINT FK_c38935_LocalAccount FOREIGN KEY (AccountIdentifier, EducationOrganizationId, FiscalYear)
REFERENCES edfixfinance.LocalAccount (AccountIdentifier, EducationOrganizationId, FiscalYear)
ON DELETE CASCADE
;

CREATE INDEX FK_c38935_LocalAccount
ON edfixfinance.LocalAccountReportingTag (AccountIdentifier ASC, EducationOrganizationId ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.LocalAccountReportingTag ADD CONSTRAINT FK_c38935_ReportingTagDescriptor FOREIGN KEY (ReportingTagDescriptorId)
REFERENCES edfixfinance.ReportingTagDescriptor (ReportingTagDescriptorId)
;

CREATE INDEX FK_c38935_ReportingTagDescriptor
ON edfixfinance.LocalAccountReportingTag (ReportingTagDescriptorId ASC);

ALTER TABLE edfixfinance.LocalActual ADD CONSTRAINT FK_b6310e_FinancialCollectionDescriptor FOREIGN KEY (FinancialCollectionDescriptorId)
REFERENCES edfixfinance.FinancialCollectionDescriptor (FinancialCollectionDescriptorId)
;

CREATE INDEX FK_b6310e_FinancialCollectionDescriptor
ON edfixfinance.LocalActual (FinancialCollectionDescriptorId ASC);

ALTER TABLE edfixfinance.LocalActual ADD CONSTRAINT FK_b6310e_LocalAccount FOREIGN KEY (AccountIdentifier, EducationOrganizationId, FiscalYear)
REFERENCES edfixfinance.LocalAccount (AccountIdentifier, EducationOrganizationId, FiscalYear)
;

CREATE INDEX FK_b6310e_LocalAccount
ON edfixfinance.LocalActual (AccountIdentifier ASC, EducationOrganizationId ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.LocalBudget ADD CONSTRAINT FK_000683_FinancialCollectionDescriptor FOREIGN KEY (FinancialCollectionDescriptorId)
REFERENCES edfixfinance.FinancialCollectionDescriptor (FinancialCollectionDescriptorId)
;

CREATE INDEX FK_000683_FinancialCollectionDescriptor
ON edfixfinance.LocalBudget (FinancialCollectionDescriptorId ASC);

ALTER TABLE edfixfinance.LocalBudget ADD CONSTRAINT FK_000683_LocalAccount FOREIGN KEY (AccountIdentifier, EducationOrganizationId, FiscalYear)
REFERENCES edfixfinance.LocalAccount (AccountIdentifier, EducationOrganizationId, FiscalYear)
;

CREATE INDEX FK_000683_LocalAccount
ON edfixfinance.LocalBudget (AccountIdentifier ASC, EducationOrganizationId ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ObjectDimensionReportingTag ADD CONSTRAINT FK_fda3b7_ObjectDimension FOREIGN KEY (Code, FiscalYear)
REFERENCES edfixfinance.ObjectDimension (Code, FiscalYear)
ON DELETE CASCADE
;

CREATE INDEX FK_fda3b7_ObjectDimension
ON edfixfinance.ObjectDimensionReportingTag (Code ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ObjectDimensionReportingTag ADD CONSTRAINT FK_fda3b7_ReportingTagDescriptor FOREIGN KEY (ReportingTagDescriptorId)
REFERENCES edfixfinance.ReportingTagDescriptor (ReportingTagDescriptorId)
;

CREATE INDEX FK_fda3b7_ReportingTagDescriptor
ON edfixfinance.ObjectDimensionReportingTag (ReportingTagDescriptorId ASC);

ALTER TABLE edfixfinance.OperationalUnitDimensionReportingTag ADD CONSTRAINT FK_3b06c7_OperationalUnitDimension FOREIGN KEY (Code, FiscalYear)
REFERENCES edfixfinance.OperationalUnitDimension (Code, FiscalYear)
ON DELETE CASCADE
;

CREATE INDEX FK_3b06c7_OperationalUnitDimension
ON edfixfinance.OperationalUnitDimensionReportingTag (Code ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.OperationalUnitDimensionReportingTag ADD CONSTRAINT FK_3b06c7_ReportingTagDescriptor FOREIGN KEY (ReportingTagDescriptorId)
REFERENCES edfixfinance.ReportingTagDescriptor (ReportingTagDescriptorId)
;

CREATE INDEX FK_3b06c7_ReportingTagDescriptor
ON edfixfinance.OperationalUnitDimensionReportingTag (ReportingTagDescriptorId ASC);

ALTER TABLE edfixfinance.ProgramDimensionReportingTag ADD CONSTRAINT FK_3e04ae_ProgramDimension FOREIGN KEY (Code, FiscalYear)
REFERENCES edfixfinance.ProgramDimension (Code, FiscalYear)
ON DELETE CASCADE
;

CREATE INDEX FK_3e04ae_ProgramDimension
ON edfixfinance.ProgramDimensionReportingTag (Code ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ProgramDimensionReportingTag ADD CONSTRAINT FK_3e04ae_ReportingTagDescriptor FOREIGN KEY (ReportingTagDescriptorId)
REFERENCES edfixfinance.ReportingTagDescriptor (ReportingTagDescriptorId)
;

CREATE INDEX FK_3e04ae_ReportingTagDescriptor
ON edfixfinance.ProgramDimensionReportingTag (ReportingTagDescriptorId ASC);

ALTER TABLE edfixfinance.ProjectDimensionReportingTag ADD CONSTRAINT FK_b5314a_ProjectDimension FOREIGN KEY (Code, FiscalYear)
REFERENCES edfixfinance.ProjectDimension (Code, FiscalYear)
ON DELETE CASCADE
;

CREATE INDEX FK_b5314a_ProjectDimension
ON edfixfinance.ProjectDimensionReportingTag (Code ASC, FiscalYear ASC);

ALTER TABLE edfixfinance.ProjectDimensionReportingTag ADD CONSTRAINT FK_b5314a_ReportingTagDescriptor FOREIGN KEY (ReportingTagDescriptorId)
REFERENCES edfixfinance.ReportingTagDescriptor (ReportingTagDescriptorId)
;

CREATE INDEX FK_b5314a_ReportingTagDescriptor
ON edfixfinance.ProjectDimensionReportingTag (ReportingTagDescriptorId ASC);

ALTER TABLE edfixfinance.ReportingTagDescriptor ADD CONSTRAINT FK_b173f4_Descriptor FOREIGN KEY (ReportingTagDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE edfixfinance.SourceDimensionReportingTag ADD CONSTRAINT FK_0c6eff_ReportingTagDescriptor FOREIGN KEY (ReportingTagDescriptorId)
REFERENCES edfixfinance.ReportingTagDescriptor (ReportingTagDescriptorId)
;

CREATE INDEX FK_0c6eff_ReportingTagDescriptor
ON edfixfinance.SourceDimensionReportingTag (ReportingTagDescriptorId ASC);

ALTER TABLE edfixfinance.SourceDimensionReportingTag ADD CONSTRAINT FK_0c6eff_SourceDimension FOREIGN KEY (Code, FiscalYear)
REFERENCES edfixfinance.SourceDimension (Code, FiscalYear)
ON DELETE CASCADE
;

CREATE INDEX FK_0c6eff_SourceDimension
ON edfixfinance.SourceDimensionReportingTag (Code ASC, FiscalYear ASC);

