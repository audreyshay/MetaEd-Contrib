CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixassessmentroster.AssessmentAdministration
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON edfixassessmentroster.StudentAssessmentRegistration
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();

