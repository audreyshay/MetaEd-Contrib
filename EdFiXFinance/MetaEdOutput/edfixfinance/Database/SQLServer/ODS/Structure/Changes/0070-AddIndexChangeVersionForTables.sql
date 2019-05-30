BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.BalanceSheetDimension') AND name = N'UX_BalanceSheetDimension_ChangeVersion')
    CREATE INDEX [UX_BalanceSheetDimension_ChangeVersion] ON [edfixfinance].[BalanceSheetDimension] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.ChartOfAccount') AND name = N'UX_ChartOfAccount_ChangeVersion')
    CREATE INDEX [UX_ChartOfAccount_ChangeVersion] ON [edfixfinance].[ChartOfAccount] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.FunctionDimension') AND name = N'UX_FunctionDimension_ChangeVersion')
    CREATE INDEX [UX_FunctionDimension_ChangeVersion] ON [edfixfinance].[FunctionDimension] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.FundDimension') AND name = N'UX_FundDimension_ChangeVersion')
    CREATE INDEX [UX_FundDimension_ChangeVersion] ON [edfixfinance].[FundDimension] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.LocalAccount') AND name = N'UX_LocalAccount_ChangeVersion')
    CREATE INDEX [UX_LocalAccount_ChangeVersion] ON [edfixfinance].[LocalAccount] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.LocalActual') AND name = N'UX_LocalActual_ChangeVersion')
    CREATE INDEX [UX_LocalActual_ChangeVersion] ON [edfixfinance].[LocalActual] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.LocalBudget') AND name = N'UX_LocalBudget_ChangeVersion')
    CREATE INDEX [UX_LocalBudget_ChangeVersion] ON [edfixfinance].[LocalBudget] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.ObjectDimension') AND name = N'UX_ObjectDimension_ChangeVersion')
    CREATE INDEX [UX_ObjectDimension_ChangeVersion] ON [edfixfinance].[ObjectDimension] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.OperationalUnitDimension') AND name = N'UX_OperationalUnitDimension_ChangeVersion')
    CREATE INDEX [UX_OperationalUnitDimension_ChangeVersion] ON [edfixfinance].[OperationalUnitDimension] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.ProgramDimension') AND name = N'UX_ProgramDimension_ChangeVersion')
    CREATE INDEX [UX_ProgramDimension_ChangeVersion] ON [edfixfinance].[ProgramDimension] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.ProjectDimension') AND name = N'UX_ProjectDimension_ChangeVersion')
    CREATE INDEX [UX_ProjectDimension_ChangeVersion] ON [edfixfinance].[ProjectDimension] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.SourceDimension') AND name = N'UX_SourceDimension_ChangeVersion')
    CREATE INDEX [UX_SourceDimension_ChangeVersion] ON [edfixfinance].[SourceDimension] ([ChangeVersion] ASC)
    GO
COMMIT

