CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.BalanceSheetDimension
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.ChartOfAccount
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.FunctionDimension
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.FundDimension
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.LocalAccount
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.LocalActual
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.LocalBudget
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.ObjectDimension
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.OperationalUnitDimension
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.ProgramDimension
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.ProjectDimension
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixfinance.SourceDimension
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

