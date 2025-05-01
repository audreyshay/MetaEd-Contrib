CREATE TRIGGER [edfixfinance].[edfixfinance_BalanceSheetDimension_TR_UpdateChangeVersion] ON [edfixfinance].[BalanceSheetDimension] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[BalanceSheetDimension]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[BalanceSheetDimension] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixfinance].[edfixfinance_ChartOfAccount_TR_UpdateChangeVersion] ON [edfixfinance].[ChartOfAccount] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[ChartOfAccount]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[ChartOfAccount] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixfinance].[edfixfinance_FunctionDimension_TR_UpdateChangeVersion] ON [edfixfinance].[FunctionDimension] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[FunctionDimension]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[FunctionDimension] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixfinance].[edfixfinance_FundDimension_TR_UpdateChangeVersion] ON [edfixfinance].[FundDimension] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[FundDimension]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[FundDimension] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixfinance].[edfixfinance_LocalAccount_TR_UpdateChangeVersion] ON [edfixfinance].[LocalAccount] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[LocalAccount]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[LocalAccount] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixfinance].[edfixfinance_LocalActual_TR_UpdateChangeVersion] ON [edfixfinance].[LocalActual] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[LocalActual]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[LocalActual] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixfinance].[edfixfinance_LocalBudget_TR_UpdateChangeVersion] ON [edfixfinance].[LocalBudget] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[LocalBudget]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[LocalBudget] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixfinance].[edfixfinance_ObjectDimension_TR_UpdateChangeVersion] ON [edfixfinance].[ObjectDimension] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[ObjectDimension]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[ObjectDimension] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixfinance].[edfixfinance_OperationalUnitDimension_TR_UpdateChangeVersion] ON [edfixfinance].[OperationalUnitDimension] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[OperationalUnitDimension]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[OperationalUnitDimension] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixfinance].[edfixfinance_ProgramDimension_TR_UpdateChangeVersion] ON [edfixfinance].[ProgramDimension] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[ProgramDimension]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[ProgramDimension] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixfinance].[edfixfinance_ProjectDimension_TR_UpdateChangeVersion] ON [edfixfinance].[ProjectDimension] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[ProjectDimension]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[ProjectDimension] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixfinance].[edfixfinance_SourceDimension_TR_UpdateChangeVersion] ON [edfixfinance].[SourceDimension] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixfinance].[SourceDimension]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixfinance].[SourceDimension] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

