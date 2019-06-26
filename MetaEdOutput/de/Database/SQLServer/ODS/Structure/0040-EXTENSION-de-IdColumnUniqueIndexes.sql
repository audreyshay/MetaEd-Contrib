BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.AllegedBullyingVictim') AND name = N'UX_AllegedBullyingVictim_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AllegedBullyingVictim_Id ON [de].[AllegedBullyingVictim]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.CIPCourse') AND name = N'UX_CIPCourse_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CIPCourse_Id ON [de].[CIPCourse]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.DisciplineIncidentCode') AND name = N'UX_DisciplineIncidentCode_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineIncidentCode_Id ON [de].[DisciplineIncidentCode]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.GradeTypeDetail') AND name = N'UX_GradeTypeDetail_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_GradeTypeDetail_Id ON [de].[GradeTypeDetail]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.LevelDetail') AND name = N'UX_LevelDetail_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LevelDetail_Id ON [de].[LevelDetail]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.MedicalAlert') AND name = N'UX_MedicalAlert_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MedicalAlert_Id ON [de].[MedicalAlert]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.MedicalOfficeVisit') AND name = N'UX_MedicalOfficeVisit_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MedicalOfficeVisit_Id ON [de].[MedicalOfficeVisit]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.MedicalReferralFollowUp') AND name = N'UX_MedicalReferralFollowUp_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MedicalReferralFollowUp_Id ON [de].[MedicalReferralFollowUp]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.MedicalScreening') AND name = N'UX_MedicalScreening_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MedicalScreening_Id ON [de].[MedicalScreening]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.MedicationBox') AND name = N'UX_MedicationBox_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MedicationBox_Id ON [de].[MedicationBox]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.NonStudent') AND name = N'UX_NonStudent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_NonStudent_Id ON [de].[NonStudent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.Person') AND name = N'UX_Person_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Person_Id ON [de].[Person]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.PersonDisciplineAction') AND name = N'UX_PersonDisciplineAction_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PersonDisciplineAction_Id ON [de].[PersonDisciplineAction]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.PersonDisciplineIncidentAssociation') AND name = N'UX_PersonDisciplineIncidentAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PersonDisciplineIncidentAssociation_Id ON [de].[PersonDisciplineIncidentAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.PersonImmunization') AND name = N'UX_PersonImmunization_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PersonImmunization_Id ON [de].[PersonImmunization]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.PersonMedicalAlert') AND name = N'UX_PersonMedicalAlert_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PersonMedicalAlert_Id ON [de].[PersonMedicalAlert]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.PersonMedicationBoxAssociation') AND name = N'UX_PersonMedicationBoxAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PersonMedicationBoxAssociation_Id ON [de].[PersonMedicationBoxAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.PostSecondaryDetail') AND name = N'UX_PostSecondaryDetail_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PostSecondaryDetail_Id ON [de].[PostSecondaryDetail]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.RestraintSeclusion') AND name = N'UX_RestraintSeclusion_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RestraintSeclusion_Id ON [de].[RestraintSeclusion]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.StudentSectionClassPeriodAttendanceEvent') AND name = N'UX_StudentSectionClassPeriodAttendanceEvent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentSectionClassPeriodAttendanceEvent_Id ON [de].[StudentSectionClassPeriodAttendanceEvent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'de.StudentTransportation') AND name = N'UX_StudentTransportation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentTransportation_Id ON [de].[StudentTransportation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

