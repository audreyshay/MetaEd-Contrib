CREATE TRIGGER [edfixassessmentroster].[edfixassessmentroster_AssessmentAdministration_TR_DeleteTracking] ON [edfixassessmentroster].[AssessmentAdministration] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_edfixassessmentroster].[AssessmentAdministration](AdministrationIdentifier, AssessmentIdentifier, AssigningEducationOrganizationId, Namespace, Id, ChangeVersion)
    SELECT  AdministrationIdentifier, AssessmentIdentifier, AssigningEducationOrganizationId, Namespace, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixassessmentroster].[AssessmentAdministration] ENABLE TRIGGER [edfixassessmentroster_AssessmentAdministration_TR_DeleteTracking]
GO


CREATE TRIGGER [edfixassessmentroster].[edfixassessmentroster_StudentAssessmentRegistration_TR_DeleteTracking] ON [edfixassessmentroster].[StudentAssessmentRegistration] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_deletes_edfixassessmentroster].[StudentAssessmentRegistration](AdministrationIdentifier, AssessmentIdentifier, AssigningEducationOrganizationId, EducationOrganizationId, Namespace, StudentUSI, Id, ChangeVersion)
    SELECT  AdministrationIdentifier, AssessmentIdentifier, AssigningEducationOrganizationId, EducationOrganizationId, Namespace, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [edfixassessmentroster].[StudentAssessmentRegistration] ENABLE TRIGGER [edfixassessmentroster_StudentAssessmentRegistration_TR_DeleteTracking]
GO


