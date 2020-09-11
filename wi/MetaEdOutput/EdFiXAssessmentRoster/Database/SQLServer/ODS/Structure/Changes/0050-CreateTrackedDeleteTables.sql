CREATE TABLE [tracked_deletes_edfixassessmentroster].[AssessmentAdministration]
(
       AdministrationIdentifier [NVARCHAR](100) NOT NULL,
       AssessmentIdentifier [NVARCHAR](60) NOT NULL,
       AssigningEducationOrganizationId [INT] NOT NULL,
       Namespace [NVARCHAR](255) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_AssessmentAdministration PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [tracked_deletes_edfixassessmentroster].[StudentAssessmentRegistration]
(
       AdministrationIdentifier [NVARCHAR](100) NOT NULL,
       AssessmentIdentifier [NVARCHAR](60) NOT NULL,
       AssigningEducationOrganizationId [INT] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       Namespace [NVARCHAR](255) NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_StudentAssessmentRegistration PRIMARY KEY CLUSTERED (ChangeVersion)
)

