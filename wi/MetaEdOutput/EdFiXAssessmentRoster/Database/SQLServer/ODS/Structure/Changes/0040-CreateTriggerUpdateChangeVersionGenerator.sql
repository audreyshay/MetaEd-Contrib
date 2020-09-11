CREATE TRIGGER [edfixassessmentroster].[edfixassessmentroster_AssessmentAdministration_TR_UpdateChangeVersion] ON [edfixassessmentroster].[AssessmentAdministration] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixassessmentroster].[AssessmentAdministration]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixassessmentroster].[AssessmentAdministration] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [edfixassessmentroster].[edfixassessmentroster_StudentAssessmentRegistration_TR_UpdateChangeVersion] ON [edfixassessmentroster].[StudentAssessmentRegistration] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [edfixassessmentroster].[StudentAssessmentRegistration]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [edfixassessmentroster].[StudentAssessmentRegistration] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

