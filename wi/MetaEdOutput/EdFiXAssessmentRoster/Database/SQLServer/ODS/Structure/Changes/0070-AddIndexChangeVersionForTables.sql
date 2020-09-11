BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixassessmentroster.AssessmentAdministration') AND name = N'UX_AssessmentAdministration_ChangeVersion')
    CREATE INDEX [UX_AssessmentAdministration_ChangeVersion] ON [edfixassessmentroster].[AssessmentAdministration] ([ChangeVersion] ASC)
    GO
COMMIT

BEGIN TRANSACTION
    IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'edfixassessmentroster.StudentAssessmentRegistration') AND name = N'UX_StudentAssessmentRegistration_ChangeVersion')
    CREATE INDEX [UX_StudentAssessmentRegistration_ChangeVersion] ON [edfixassessmentroster].[StudentAssessmentRegistration] ([ChangeVersion] ASC)
    GO
COMMIT

