CREATE TRIGGER [edfixfinance].[edfixfinance_AccountTypeDescriptor_TR_DeleteTracking] ON [edfixfinance].[AccountTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_AccountTypeDescriptor_TrackedDelete](AccountTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.AccountTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AccountTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixfinance].[AccountTypeDescriptor] ENABLE TRIGGER [edfixfinance_AccountTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_BalanceSheetDimension_TR_DeleteTracking] ON [edfixfinance].[BalanceSheetDimension] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_BalanceSheetDimension_TrackedDelete](Code, FiscalYear, Id, ChangeVersion)
    SELECT  Code, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[BalanceSheetDimension] ENABLE TRIGGER [edfixfinance_BalanceSheetDimension_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_ChartOfAccount_TR_DeleteTracking] ON [edfixfinance].[ChartOfAccount] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_ChartOfAccount_TrackedDelete](AccountIdentifier, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    SELECT  AccountIdentifier, EducationOrganizationId, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[ChartOfAccount] ENABLE TRIGGER [edfixfinance_ChartOfAccount_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_FinancialCollectionDescriptor_TR_DeleteTracking] ON [edfixfinance].[FinancialCollectionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_FinancialCollectionDescriptor_TrackedDelete](FinancialCollectionDescriptorId, Id, ChangeVersion)
    SELECT  d.FinancialCollectionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FinancialCollectionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixfinance].[FinancialCollectionDescriptor] ENABLE TRIGGER [edfixfinance_FinancialCollectionDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_FunctionDimension_TR_DeleteTracking] ON [edfixfinance].[FunctionDimension] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_FunctionDimension_TrackedDelete](Code, FiscalYear, Id, ChangeVersion)
    SELECT  Code, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[FunctionDimension] ENABLE TRIGGER [edfixfinance_FunctionDimension_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_FundDimension_TR_DeleteTracking] ON [edfixfinance].[FundDimension] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_FundDimension_TrackedDelete](Code, FiscalYear, Id, ChangeVersion)
    SELECT  Code, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[FundDimension] ENABLE TRIGGER [edfixfinance_FundDimension_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_LocalAccount_TR_DeleteTracking] ON [edfixfinance].[LocalAccount] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_LocalAccount_TrackedDelete](AccountIdentifier, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    SELECT  AccountIdentifier, EducationOrganizationId, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[LocalAccount] ENABLE TRIGGER [edfixfinance_LocalAccount_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_LocalActual_TR_DeleteTracking] ON [edfixfinance].[LocalActual] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_LocalActual_TrackedDelete](AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    SELECT  AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[LocalActual] ENABLE TRIGGER [edfixfinance_LocalActual_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_LocalBudget_TR_DeleteTracking] ON [edfixfinance].[LocalBudget] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_LocalBudget_TrackedDelete](AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, Id, ChangeVersion)
    SELECT  AccountIdentifier, AsOfDate, EducationOrganizationId, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[LocalBudget] ENABLE TRIGGER [edfixfinance_LocalBudget_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_ObjectDimension_TR_DeleteTracking] ON [edfixfinance].[ObjectDimension] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_ObjectDimension_TrackedDelete](Code, FiscalYear, Id, ChangeVersion)
    SELECT  Code, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[ObjectDimension] ENABLE TRIGGER [edfixfinance_ObjectDimension_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_OperationalUnitDimension_TR_DeleteTracking] ON [edfixfinance].[OperationalUnitDimension] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_OperationalUnitDimension_TrackedDelete](Code, FiscalYear, Id, ChangeVersion)
    SELECT  Code, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[OperationalUnitDimension] ENABLE TRIGGER [edfixfinance_OperationalUnitDimension_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_ProgramDimension_TR_DeleteTracking] ON [edfixfinance].[ProgramDimension] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_ProgramDimension_TrackedDelete](Code, FiscalYear, Id, ChangeVersion)
    SELECT  Code, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[ProgramDimension] ENABLE TRIGGER [edfixfinance_ProgramDimension_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_ProjectDimension_TR_DeleteTracking] ON [edfixfinance].[ProjectDimension] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_ProjectDimension_TrackedDelete](Code, FiscalYear, Id, ChangeVersion)
    SELECT  Code, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[ProjectDimension] ENABLE TRIGGER [edfixfinance_ProjectDimension_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_ReportingTagDescriptor_TR_DeleteTracking] ON [edfixfinance].[ReportingTagDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_ReportingTagDescriptor_TrackedDelete](ReportingTagDescriptorId, Id, ChangeVersion)
    SELECT  d.ReportingTagDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ReportingTagDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [edfixfinance].[ReportingTagDescriptor] ENABLE TRIGGER [edfixfinance_ReportingTagDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixfinance].[edfixfinance_SourceDimension_TR_DeleteTracking] ON [edfixfinance].[SourceDimension] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[edfixfinance_SourceDimension_TrackedDelete](Code, FiscalYear, Id, ChangeVersion)
    SELECT  Code, FiscalYear, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixfinance].[SourceDimension] ENABLE TRIGGER [edfixfinance_SourceDimension_TR_DeleteTracking]
GO


