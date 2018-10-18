BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'az.CalendarDateTrackEvent') AND name = N'UX_CalendarDateTrackEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CalendarDateTrackEvent_Id ON [az].[CalendarDateTrackEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

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

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'az.StudentSchoolAssociationLocalEducationAgency') AND name = N'UX_StudentSchoolAssociationLocalEducationAgency_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSchoolAssociationLocalEducationAgency_Id ON [az].[StudentSchoolAssociationLocalEducationAgency]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'az.StudentSchoolAssociationMembershipFTE') AND name = N'UX_StudentSchoolAssociationMembershipFTE_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSchoolAssociationMembershipFTE_Id ON [az].[StudentSchoolAssociationMembershipFTE]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'az.StudentSchoolAssociationSpecialEnrollment') AND name = N'UX_StudentSchoolAssociationSpecialEnrollment_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSchoolAssociationSpecialEnrollment_Id ON [az].[StudentSchoolAssociationSpecialEnrollment]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'az.StudentSchoolAssociationTuitionPayer') AND name = N'UX_StudentSchoolAssociationTuitionPayer_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSchoolAssociationTuitionPayer_Id ON [az].[StudentSchoolAssociationTuitionPayer]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'az.Track') AND name = N'UX_Track_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Track_Id ON [az].[Track]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

