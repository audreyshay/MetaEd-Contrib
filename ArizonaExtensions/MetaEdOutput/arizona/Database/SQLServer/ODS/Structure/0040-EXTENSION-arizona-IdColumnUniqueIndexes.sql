BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'arizona.CalendarDateTrackEvent') AND name = N'UX_CalendarDateTrackEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CalendarDateTrackEvent_Id ON [arizona].[CalendarDateTrackEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'arizona.StudentDropOutRecoveryProgramMonthlyUpdate') AND name = N'UX_StudentDropOutRecoveryProgramMonthlyUpdate_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentDropOutRecoveryProgramMonthlyUpdate_Id ON [arizona].[StudentDropOutRecoveryProgramMonthlyUpdate]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'arizona.StudentNeed') AND name = N'UX_StudentNeed_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentNeed_Id ON [arizona].[StudentNeed]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'arizona.StudentSchoolAssociationLocalEducationAgency') AND name = N'UX_StudentSchoolAssociationLocalEducationAgency_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSchoolAssociationLocalEducationAgency_Id ON [arizona].[StudentSchoolAssociationLocalEducationAgency]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'arizona.StudentSchoolAssociationMembershipFTE') AND name = N'UX_StudentSchoolAssociationMembershipFTE_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSchoolAssociationMembershipFTE_Id ON [arizona].[StudentSchoolAssociationMembershipFTE]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'arizona.StudentSchoolAssociationSpecialEnrollment') AND name = N'UX_StudentSchoolAssociationSpecialEnrollment_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSchoolAssociationSpecialEnrollment_Id ON [arizona].[StudentSchoolAssociationSpecialEnrollment]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'arizona.StudentSchoolAssociationTuitionPayer') AND name = N'UX_StudentSchoolAssociationTuitionPayer_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSchoolAssociationTuitionPayer_Id ON [arizona].[StudentSchoolAssociationTuitionPayer]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'arizona.Track') AND name = N'UX_Track_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Track_Id ON [arizona].[Track]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

