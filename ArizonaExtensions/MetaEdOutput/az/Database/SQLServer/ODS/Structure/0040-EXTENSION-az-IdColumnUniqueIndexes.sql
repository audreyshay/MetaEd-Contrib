BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'az.StudentDropOutRecoveryProgramMonthlyUpdate') AND name = N'UX_StudentDropOutRecoveryProgramMonthlyUpdate_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentDropOutRecoveryProgramMonthlyUpdate_Id ON [az].[StudentDropOutRecoveryProgramMonthlyUpdate]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'az.StudentNeed') AND name = N'UX_StudentNeed_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentNeed_Id ON [az].[StudentNeed]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

