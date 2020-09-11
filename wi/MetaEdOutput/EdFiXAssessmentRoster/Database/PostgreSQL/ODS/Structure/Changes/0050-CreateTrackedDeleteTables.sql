CREATE TABLE tracked_deletes_edfixassessmentroster.AssessmentAdministration
(
       AdministrationIdentifier VARCHAR(100) NOT NULL,
       AssessmentIdentifier VARCHAR(60) NOT NULL,
       AssigningEducationOrganizationId INT NOT NULL,
       Namespace VARCHAR(255) NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT AssessmentAdministration_PK PRIMARY KEY (ChangeVersion)
);

CREATE TABLE tracked_deletes_edfixassessmentroster.StudentAssessmentRegistration
(
       AdministrationIdentifier VARCHAR(100) NOT NULL,
       AssessmentIdentifier VARCHAR(60) NOT NULL,
       AssigningEducationOrganizationId INT NOT NULL,
       EducationOrganizationId INT NOT NULL,
       Namespace VARCHAR(255) NOT NULL,
       StudentUSI INT NOT NULL,
       Id UUID NOT NULL,
       ChangeVersion BIGINT NOT NULL,
       CONSTRAINT StudentAssessmentRegistration_PK PRIMARY KEY (ChangeVersion)
);

