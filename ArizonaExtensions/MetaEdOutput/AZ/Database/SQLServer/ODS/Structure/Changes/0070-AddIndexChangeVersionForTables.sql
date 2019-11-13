BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'az.StudentDropOutRecoveryProgramMonthlyUpdate') AND name = N'UX_StudentDropOutRecoveryProgramMonthlyUpdate_ChangeVersion')
    CREATE INDEX [UX_StudentDropOutRecoveryProgramMonthlyUpdate_ChangeVersion] ON [az].[StudentDropOutRecoveryProgramMonthlyUpdate] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'az.StudentNeed') AND name = N'UX_StudentNeed_ChangeVersion')
    CREATE INDEX [UX_StudentNeed_ChangeVersion] ON [az].[StudentNeed] ([ChangeVersion] ASC)
    GO
COMMIT

