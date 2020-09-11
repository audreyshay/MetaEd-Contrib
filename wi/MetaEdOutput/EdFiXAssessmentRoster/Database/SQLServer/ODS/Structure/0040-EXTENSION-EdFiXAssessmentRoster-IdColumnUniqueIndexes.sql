BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixassessmentroster.AssessmentAdministration') AND name = N'UX_AssessmentAdministration_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_AssessmentAdministration_Id ON [edfixassessmentroster].[AssessmentAdministration]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixassessmentroster.StudentAssessmentRegistration') AND name = N'UX_StudentAssessmentRegistration_Id')
    CREATE UNIQUE NONCLUSTERED INDEX UX_StudentAssessmentRegistration_Id ON [edfixassessmentroster].[StudentAssessmentRegistration]
    (Id) WITH (PAD_INDEX = ON, FILLFACTOR = 75, STATISTICS_NORECOMPUTE = OFF) ON [PRIMARY]
    GO
COMMIT

