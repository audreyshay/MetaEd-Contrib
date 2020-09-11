ALTER TABLE edfixassessmentroster.AssessmentAdministration
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

ALTER TABLE edfixassessmentroster.StudentAssessmentRegistration
ADD ChangeVersion BIGINT DEFAULT nextval('changes.ChangeVersionSequence') NOT NULL;

