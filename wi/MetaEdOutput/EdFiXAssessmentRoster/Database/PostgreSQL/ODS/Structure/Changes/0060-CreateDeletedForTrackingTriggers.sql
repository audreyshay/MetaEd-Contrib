CREATE FUNCTION tracked_deletes_edfixassessmentroster.AssessmentAdministration_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixassessmentroster.AssessmentAdministration(AdministrationIdentifier, AssessmentIdentifier, AssigningEducationOrganizationId, Namespace, Id, ChangeVersion)
    VALUES (OLD.AdministrationIdentifier, OLD.AssessmentIdentifier, OLD.AssigningEducationOrganizationId, OLD.Namespace, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixassessmentroster.AssessmentAdministration 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixassessmentroster.AssessmentAdministration_TR_DelTrkg();

CREATE FUNCTION tracked_deletes_edfixassessmentroster.StudentAssessmentRegistration_TR_DelTrkg()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_deletes_edfixassessmentroster.StudentAssessmentRegistration(AdministrationIdentifier, AssessmentIdentifier, AssigningEducationOrganizationId, EducationOrganizationId, Namespace, StudentUSI, Id, ChangeVersion)
    VALUES (OLD.AdministrationIdentifier, OLD.AssessmentIdentifier, OLD.AssigningEducationOrganizationId, OLD.EducationOrganizationId, OLD.Namespace, OLD.StudentUSI, OLD.Id, nextval('changes.ChangeVersionSequence'));
    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

CREATE TRIGGER TrackDeletes AFTER DELETE ON edfixassessmentroster.StudentAssessmentRegistration 
    FOR EACH ROW EXECUTE PROCEDURE tracked_deletes_edfixassessmentroster.StudentAssessmentRegistration_TR_DelTrkg();

