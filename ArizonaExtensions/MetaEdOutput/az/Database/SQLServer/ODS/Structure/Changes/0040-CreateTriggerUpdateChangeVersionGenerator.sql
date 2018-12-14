CREATE TRIGGER [az].[az_StudentDropOutRecoveryProgramMonthlyUpdate_TR_UpdateChangeVersion] ON [az].[StudentDropOutRecoveryProgramMonthlyUpdate] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [az].[StudentDropOutRecoveryProgramMonthlyUpdate]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [az].[StudentDropOutRecoveryProgramMonthlyUpdate] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [az].[az_StudentNeed_TR_UpdateChangeVersion] ON [az].[StudentNeed] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [az].[StudentNeed]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [az].[StudentNeed] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

