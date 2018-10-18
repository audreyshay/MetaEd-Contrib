BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.AllegedBullyingVictim') AND name = N'UX_AllegedBullyingVictim_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AllegedBullyingVictim_Id ON [extension].[AllegedBullyingVictim]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.CIPCourse') AND name = N'UX_CIPCourse_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_CIPCourse_Id ON [extension].[CIPCourse]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.DisciplineIncidentCode') AND name = N'UX_DisciplineIncidentCode_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineIncidentCode_Id ON [extension].[DisciplineIncidentCode]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.DisciplineIssue') AND name = N'UX_DisciplineIssue_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineIssue_Id ON [extension].[DisciplineIssue]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.DisciplineIssueAction') AND name = N'UX_DisciplineIssueAction_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineIssueAction_Id ON [extension].[DisciplineIssueAction]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.DisciplineIssueRefer') AND name = N'UX_DisciplineIssueRefer_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineIssueRefer_Id ON [extension].[DisciplineIssueRefer]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.DisciplineIssueStudent') AND name = N'UX_DisciplineIssueStudent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_DisciplineIssueStudent_Id ON [extension].[DisciplineIssueStudent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.GradeTypeDetail') AND name = N'UX_GradeTypeDetail_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_GradeTypeDetail_Id ON [extension].[GradeTypeDetail]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.LevelDetail') AND name = N'UX_LevelDetail_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_LevelDetail_Id ON [extension].[LevelDetail]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.MedicalAlert') AND name = N'UX_MedicalAlert_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MedicalAlert_Id ON [extension].[MedicalAlert]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.MedicalOfficeVisit') AND name = N'UX_MedicalOfficeVisit_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MedicalOfficeVisit_Id ON [extension].[MedicalOfficeVisit]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.MedicalReferralFollowUp') AND name = N'UX_MedicalReferralFollowUp_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MedicalReferralFollowUp_Id ON [extension].[MedicalReferralFollowUp]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.MedicalScreening') AND name = N'UX_MedicalScreening_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MedicalScreening_Id ON [extension].[MedicalScreening]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.MedicationBox') AND name = N'UX_MedicationBox_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_MedicationBox_Id ON [extension].[MedicationBox]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.NonStudent') AND name = N'UX_NonStudent_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_NonStudent_Id ON [extension].[NonStudent]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.Person') AND name = N'UX_Person_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_Person_Id ON [extension].[Person]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.PersonDisciplineAction') AND name = N'UX_PersonDisciplineAction_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PersonDisciplineAction_Id ON [extension].[PersonDisciplineAction]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.PersonDisciplineIncidentAssociation') AND name = N'UX_PersonDisciplineIncidentAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PersonDisciplineIncidentAssociation_Id ON [extension].[PersonDisciplineIncidentAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.PersonImmunization') AND name = N'UX_PersonImmunization_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PersonImmunization_Id ON [extension].[PersonImmunization]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.PersonMedicalAlert') AND name = N'UX_PersonMedicalAlert_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PersonMedicalAlert_Id ON [extension].[PersonMedicalAlert]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.PersonMedicationBoxAssociation') AND name = N'UX_PersonMedicationBoxAssociation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PersonMedicationBoxAssociation_Id ON [extension].[PersonMedicationBoxAssociation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.PostSecondaryDetail') AND name = N'UX_PostSecondaryDetail_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_PostSecondaryDetail_Id ON [extension].[PostSecondaryDetail]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.RestraintSeclusion') AND name = N'UX_RestraintSeclusion_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_RestraintSeclusion_Id ON [extension].[RestraintSeclusion]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.StudentTransportation') AND name = N'UX_StudentTransportation_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentTransportation_Id ON [extension].[StudentTransportation]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'extension.SubjectAreaCode') AND name = N'UX_SubjectAreaCode_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_SubjectAreaCode_Id ON [extension].[SubjectAreaCode]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

