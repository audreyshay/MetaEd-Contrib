BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.BalanceSheetDimension') AND name = N'UX_BalanceSheetDimension_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_BalanceSheetDimension_Id ON [edfixfinance].[BalanceSheetDimension]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.ChartOfAccount') AND name = N'UX_ChartOfAccount_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ChartOfAccount_Id ON [edfixfinance].[ChartOfAccount]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.FunctionDimension') AND name = N'UX_FunctionDimension_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_FunctionDimension_Id ON [edfixfinance].[FunctionDimension]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.FundDimension') AND name = N'UX_FundDimension_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_FundDimension_Id ON [edfixfinance].[FundDimension]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.LocalAccount') AND name = N'UX_LocalAccount_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LocalAccount_Id ON [edfixfinance].[LocalAccount]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.LocalActual') AND name = N'UX_LocalActual_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LocalActual_Id ON [edfixfinance].[LocalActual]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.LocalBudget') AND name = N'UX_LocalBudget_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LocalBudget_Id ON [edfixfinance].[LocalBudget]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.ObjectDimension') AND name = N'UX_ObjectDimension_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ObjectDimension_Id ON [edfixfinance].[ObjectDimension]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.OperationalUnitDimension') AND name = N'UX_OperationalUnitDimension_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_OperationalUnitDimension_Id ON [edfixfinance].[OperationalUnitDimension]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.ProgramDimension') AND name = N'UX_ProgramDimension_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ProgramDimension_Id ON [edfixfinance].[ProgramDimension]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.ProjectDimension') AND name = N'UX_ProjectDimension_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_ProjectDimension_Id ON [edfixfinance].[ProjectDimension]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixfinance.SourceDimension') AND name = N'UX_SourceDimension_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SourceDimension_Id ON [edfixfinance].[SourceDimension]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

