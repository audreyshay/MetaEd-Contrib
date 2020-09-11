ALTER TABLE [edfixassessmentroster].[AssessmentAdministration] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

ALTER TABLE [edfixassessmentroster].[StudentAssessmentRegistration] ADD [ChangeVersion] [BIGINT] DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) NOT NULL;

