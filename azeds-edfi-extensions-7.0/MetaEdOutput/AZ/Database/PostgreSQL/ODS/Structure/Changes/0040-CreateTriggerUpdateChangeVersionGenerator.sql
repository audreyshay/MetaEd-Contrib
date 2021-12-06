CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON az.StudentDropOutRecoveryProgramMonthlyUpdate
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON az.StudentNeed
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

