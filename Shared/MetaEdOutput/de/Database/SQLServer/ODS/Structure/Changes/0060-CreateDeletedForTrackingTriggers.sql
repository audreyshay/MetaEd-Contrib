CREATE TRIGGER [de].[de_APExamCodeDescriptor_TR_DeleteTracking] ON [de].[APExamCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_APExamCodeDescriptor_TrackedDelete](APExamCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.APExamCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.APExamCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[APExamCodeDescriptor] ENABLE TRIGGER [de_APExamCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_AcceptanceStatusDescriptor_TR_DeleteTracking] ON [de].[AcceptanceStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_AcceptanceStatusDescriptor_TrackedDelete](AcceptanceStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.AcceptanceStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AcceptanceStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[AcceptanceStatusDescriptor] ENABLE TRIGGER [de_AcceptanceStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_AllegedBullyingVictim_TR_DeleteTracking] ON [de].[AllegedBullyingVictim] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_AllegedBullyingVictim_TrackedDelete](AllegedIncidentDate, SchoolId, StudentUSI, Id, ChangeVersion)
    SELECT  AllegedIncidentDate, SchoolId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[AllegedBullyingVictim] ENABLE TRIGGER [de_AllegedBullyingVictim_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_AttendanceConfigurationCategoryDescriptor_TR_DeleteTracking] ON [de].[AttendanceConfigurationCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_AttendanceConfigurationCategoryDescriptor_TrackedDelete](AttendanceConfigurationCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.AttendanceConfigurationCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AttendanceConfigurationCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[AttendanceConfigurationCategoryDescriptor] ENABLE TRIGGER [de_AttendanceConfigurationCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_BullyingCategoryDescriptor_TR_DeleteTracking] ON [de].[BullyingCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_BullyingCategoryDescriptor_TrackedDelete](BullyingCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.BullyingCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.BullyingCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[BullyingCategoryDescriptor] ENABLE TRIGGER [de_BullyingCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_CIPCourse_TR_DeleteTracking] ON [de].[CIPCourse] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_CIPCourse_TrackedDelete](CIPCode, LocalEducationAgencyId, Id, ChangeVersion)
    SELECT  CIPCode, LocalEducationAgencyId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[CIPCourse] ENABLE TRIGGER [de_CIPCourse_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_CertificateCategoryDescriptor_TR_DeleteTracking] ON [de].[CertificateCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_CertificateCategoryDescriptor_TrackedDelete](CertificateCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.CertificateCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CertificateCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[CertificateCategoryDescriptor] ENABLE TRIGGER [de_CertificateCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_CertificationDescriptor_TR_DeleteTracking] ON [de].[CertificationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_CertificationDescriptor_TrackedDelete](CertificationDescriptorId, Id, ChangeVersion)
    SELECT  d.CertificationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CertificationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[CertificationDescriptor] ENABLE TRIGGER [de_CertificationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_ChoiceCategoryDescriptor_TR_DeleteTracking] ON [de].[ChoiceCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_ChoiceCategoryDescriptor_TrackedDelete](ChoiceCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.ChoiceCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ChoiceCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[ChoiceCategoryDescriptor] ENABLE TRIGGER [de_ChoiceCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_CoreSubjectDescriptor_TR_DeleteTracking] ON [de].[CoreSubjectDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_CoreSubjectDescriptor_TrackedDelete](CoreSubjectDescriptorId, Id, ChangeVersion)
    SELECT  d.CoreSubjectDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CoreSubjectDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[CoreSubjectDescriptor] ENABLE TRIGGER [de_CoreSubjectDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_CycleDescriptor_TR_DeleteTracking] ON [de].[CycleDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_CycleDescriptor_TrackedDelete](CycleDescriptorId, Id, ChangeVersion)
    SELECT  d.CycleDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CycleDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[CycleDescriptor] ENABLE TRIGGER [de_CycleDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_DiplomaCertificateCategoryDescriptor_TR_DeleteTracking] ON [de].[DiplomaCertificateCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_DiplomaCertificateCategoryDescriptor_TrackedDelete](DiplomaCertificateCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.DiplomaCertificateCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DiplomaCertificateCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[DiplomaCertificateCategoryDescriptor] ENABLE TRIGGER [de_DiplomaCertificateCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_DisciplineDispositionDescriptor_TR_DeleteTracking] ON [de].[DisciplineDispositionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_DisciplineDispositionDescriptor_TrackedDelete](DisciplineDispositionDescriptorId, Id, ChangeVersion)
    SELECT  d.DisciplineDispositionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DisciplineDispositionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[DisciplineDispositionDescriptor] ENABLE TRIGGER [de_DisciplineDispositionDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_DisciplineIncidentCode_TR_DeleteTracking] ON [de].[DisciplineIncidentCode] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_DisciplineIncidentCode_TrackedDelete](BehaviorDescriptorId, Id, ChangeVersion)
    SELECT  BehaviorDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[DisciplineIncidentCode] ENABLE TRIGGER [de_DisciplineIncidentCode_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_EnrollmentTypeDescriptor_TR_DeleteTracking] ON [de].[EnrollmentTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_EnrollmentTypeDescriptor_TrackedDelete](EnrollmentTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.EnrollmentTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EnrollmentTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[EnrollmentTypeDescriptor] ENABLE TRIGGER [de_EnrollmentTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_FerpaOptOutDescriptor_TR_DeleteTracking] ON [de].[FerpaOptOutDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_FerpaOptOutDescriptor_TrackedDelete](FerpaOptOutDescriptorId, Id, ChangeVersion)
    SELECT  d.FerpaOptOutDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FerpaOptOutDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[FerpaOptOutDescriptor] ENABLE TRIGGER [de_FerpaOptOutDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_FollowupCategoryDescriptor_TR_DeleteTracking] ON [de].[FollowupCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_FollowupCategoryDescriptor_TrackedDelete](FollowupCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.FollowupCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FollowupCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[FollowupCategoryDescriptor] ENABLE TRIGGER [de_FollowupCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_FundingNeedsCategoryDescriptor_TR_DeleteTracking] ON [de].[FundingNeedsCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_FundingNeedsCategoryDescriptor_TrackedDelete](FundingNeedsCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.FundingNeedsCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FundingNeedsCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[FundingNeedsCategoryDescriptor] ENABLE TRIGGER [de_FundingNeedsCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_GradeTypeDetail_TR_DeleteTracking] ON [de].[GradeTypeDetail] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_GradeTypeDetail_TrackedDelete](GradeTypeDescriptorId, SchoolId, Id, ChangeVersion)
    SELECT  GradeTypeDescriptorId, SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[GradeTypeDetail] ENABLE TRIGGER [de_GradeTypeDetail_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_GradeTypeWhenTakenDescriptor_TR_DeleteTracking] ON [de].[GradeTypeWhenTakenDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_GradeTypeWhenTakenDescriptor_TrackedDelete](GradeTypeWhenTakenDescriptorId, Id, ChangeVersion)
    SELECT  d.GradeTypeWhenTakenDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GradeTypeWhenTakenDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[GradeTypeWhenTakenDescriptor] ENABLE TRIGGER [de_GradeTypeWhenTakenDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_ImmunizationCodeDescriptor_TR_DeleteTracking] ON [de].[ImmunizationCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_ImmunizationCodeDescriptor_TrackedDelete](ImmunizationCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.ImmunizationCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ImmunizationCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[ImmunizationCodeDescriptor] ENABLE TRIGGER [de_ImmunizationCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_IncidentRelatedToDescriptor_TR_DeleteTracking] ON [de].[IncidentRelatedToDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_IncidentRelatedToDescriptor_TrackedDelete](IncidentRelatedToDescriptorId, Id, ChangeVersion)
    SELECT  d.IncidentRelatedToDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.IncidentRelatedToDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[IncidentRelatedToDescriptor] ENABLE TRIGGER [de_IncidentRelatedToDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_InjuryDescriptor_TR_DeleteTracking] ON [de].[InjuryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_InjuryDescriptor_TrackedDelete](InjuryDescriptorId, Id, ChangeVersion)
    SELECT  d.InjuryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InjuryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[InjuryDescriptor] ENABLE TRIGGER [de_InjuryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_LevelDetail_TR_DeleteTracking] ON [de].[LevelDetail] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_LevelDetail_TrackedDelete](LevelNumber, Mark, SchoolId, Id, ChangeVersion)
    SELECT  LevelNumber, Mark, SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[LevelDetail] ENABLE TRIGGER [de_LevelDetail_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_MedicalAlertCategoryDescriptor_TR_DeleteTracking] ON [de].[MedicalAlertCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_MedicalAlertCategoryDescriptor_TrackedDelete](MedicalAlertCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.MedicalAlertCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MedicalAlertCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[MedicalAlertCategoryDescriptor] ENABLE TRIGGER [de_MedicalAlertCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_MedicalAlert_TR_DeleteTracking] ON [de].[MedicalAlert] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_MedicalAlert_TrackedDelete](MedicalAlertCategoryDescriptorId, Id, ChangeVersion)
    SELECT  MedicalAlertCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[MedicalAlert] ENABLE TRIGGER [de_MedicalAlert_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_MedicalDispositionDescriptor_TR_DeleteTracking] ON [de].[MedicalDispositionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_MedicalDispositionDescriptor_TrackedDelete](MedicalDispositionDescriptorId, Id, ChangeVersion)
    SELECT  d.MedicalDispositionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MedicalDispositionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[MedicalDispositionDescriptor] ENABLE TRIGGER [de_MedicalDispositionDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_MedicalOfficeVisit_TR_DeleteTracking] ON [de].[MedicalOfficeVisit] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_MedicalOfficeVisit_TrackedDelete](OfficeInDate, PersonCategoryDescriptorId, PersonId, Id, ChangeVersion)
    SELECT  OfficeInDate, PersonCategoryDescriptorId, PersonId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[MedicalOfficeVisit] ENABLE TRIGGER [de_MedicalOfficeVisit_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_MedicalReferralFollowUp_TR_DeleteTracking] ON [de].[MedicalReferralFollowUp] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_MedicalReferralFollowUp_TrackedDelete](FollowupCategoryDescriptorId, MedicalTestCategoryDescriptorId, PersonCategoryDescriptorId, PersonId, TestDate, Id, ChangeVersion)
    SELECT  FollowupCategoryDescriptorId, MedicalTestCategoryDescriptorId, PersonCategoryDescriptorId, PersonId, TestDate, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[MedicalReferralFollowUp] ENABLE TRIGGER [de_MedicalReferralFollowUp_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_MedicalScreening_TR_DeleteTracking] ON [de].[MedicalScreening] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_MedicalScreening_TrackedDelete](MedicalTestCategoryDescriptorId, PersonCategoryDescriptorId, PersonId, TestDate, Id, ChangeVersion)
    SELECT  MedicalTestCategoryDescriptorId, PersonCategoryDescriptorId, PersonId, TestDate, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[MedicalScreening] ENABLE TRIGGER [de_MedicalScreening_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_MedicalTestCategoryDescriptor_TR_DeleteTracking] ON [de].[MedicalTestCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_MedicalTestCategoryDescriptor_TrackedDelete](MedicalTestCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.MedicalTestCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MedicalTestCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[MedicalTestCategoryDescriptor] ENABLE TRIGGER [de_MedicalTestCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_MedicalTreatmentCodeDescriptor_TR_DeleteTracking] ON [de].[MedicalTreatmentCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_MedicalTreatmentCodeDescriptor_TrackedDelete](MedicalTreatmentCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.MedicalTreatmentCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MedicalTreatmentCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[MedicalTreatmentCodeDescriptor] ENABLE TRIGGER [de_MedicalTreatmentCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_MedicalVisitReasonDescriptor_TR_DeleteTracking] ON [de].[MedicalVisitReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_MedicalVisitReasonDescriptor_TrackedDelete](MedicalVisitReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.MedicalVisitReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MedicalVisitReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[MedicalVisitReasonDescriptor] ENABLE TRIGGER [de_MedicalVisitReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_MedicationBox_TR_DeleteTracking] ON [de].[MedicationBox] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_MedicationBox_TrackedDelete](LocalEducationAgencyId, MedicationBoxId, Id, ChangeVersion)
    SELECT  LocalEducationAgencyId, MedicationBoxId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[MedicationBox] ENABLE TRIGGER [de_MedicationBox_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_NonStudent_TR_DeleteTracking] ON [de].[NonStudent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_NonStudent_TrackedDelete](LocalEducationAgencyId, NonStudentLocalId, Id, ChangeVersion)
    SELECT  LocalEducationAgencyId, NonStudentLocalId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[NonStudent] ENABLE TRIGGER [de_NonStudent_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_NotificationMethodDescriptor_TR_DeleteTracking] ON [de].[NotificationMethodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_NotificationMethodDescriptor_TrackedDelete](NotificationMethodDescriptorId, Id, ChangeVersion)
    SELECT  d.NotificationMethodDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NotificationMethodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[NotificationMethodDescriptor] ENABLE TRIGGER [de_NotificationMethodDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_ParticipationCodeDescriptor_TR_DeleteTracking] ON [de].[ParticipationCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_ParticipationCodeDescriptor_TrackedDelete](ParticipationCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.ParticipationCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ParticipationCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[ParticipationCodeDescriptor] ENABLE TRIGGER [de_ParticipationCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_PersonCategoryDescriptor_TR_DeleteTracking] ON [de].[PersonCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_PersonCategoryDescriptor_TrackedDelete](PersonCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.PersonCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PersonCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[PersonCategoryDescriptor] ENABLE TRIGGER [de_PersonCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_PersonDisciplineAction_TR_DeleteTracking] ON [de].[PersonDisciplineAction] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_PersonDisciplineAction_TrackedDelete](ActionIdentifier, ActionStartDate, IncidentIdentifier, PersonCategoryDescriptorId, PersonId, SchoolId, Id, ChangeVersion)
    SELECT  ActionIdentifier, ActionStartDate, IncidentIdentifier, PersonCategoryDescriptorId, PersonId, SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[PersonDisciplineAction] ENABLE TRIGGER [de_PersonDisciplineAction_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_PersonDisciplineIncidentAssociation_TR_DeleteTracking] ON [de].[PersonDisciplineIncidentAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_PersonDisciplineIncidentAssociation_TrackedDelete](IncidentIdentifier, ParticipantNumber, ParticipationCodeDescriptorId, PersonCategoryDescriptorId, PersonId, SchoolId, Id, ChangeVersion)
    SELECT  IncidentIdentifier, ParticipantNumber, ParticipationCodeDescriptorId, PersonCategoryDescriptorId, PersonId, SchoolId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[PersonDisciplineIncidentAssociation] ENABLE TRIGGER [de_PersonDisciplineIncidentAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_PersonImmunization_TR_DeleteTracking] ON [de].[PersonImmunization] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_PersonImmunization_TrackedDelete](ImmunizationCodeDescriptorId, ImmunizationDate, PersonCategoryDescriptorId, PersonId, Id, ChangeVersion)
    SELECT  ImmunizationCodeDescriptorId, ImmunizationDate, PersonCategoryDescriptorId, PersonId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[PersonImmunization] ENABLE TRIGGER [de_PersonImmunization_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_PersonMedicalAlert_TR_DeleteTracking] ON [de].[PersonMedicalAlert] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_PersonMedicalAlert_TrackedDelete](MedicalAlertCategoryDescriptorId, PersonCategoryDescriptorId, PersonId, Sequence, StartDate, Id, ChangeVersion)
    SELECT  MedicalAlertCategoryDescriptorId, PersonCategoryDescriptorId, PersonId, Sequence, StartDate, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[PersonMedicalAlert] ENABLE TRIGGER [de_PersonMedicalAlert_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_PersonMedicationBoxAssociation_TR_DeleteTracking] ON [de].[PersonMedicationBoxAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_PersonMedicationBoxAssociation_TrackedDelete](LocalEducationAgencyId, MedicationBoxId, PersonCategoryDescriptorId, PersonId, Id, ChangeVersion)
    SELECT  LocalEducationAgencyId, MedicationBoxId, PersonCategoryDescriptorId, PersonId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[PersonMedicationBoxAssociation] ENABLE TRIGGER [de_PersonMedicationBoxAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_Person_TR_DeleteTracking] ON [de].[Person] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_Person_TrackedDelete](PersonCategoryDescriptorId, PersonId, Id, ChangeVersion)
    SELECT  PersonCategoryDescriptorId, PersonId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[Person] ENABLE TRIGGER [de_Person_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_PostSecondaryDetail_TR_DeleteTracking] ON [de].[PostSecondaryDetail] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_PostSecondaryDetail_TrackedDelete](PostSecondaryEventCategoryDescriptorId, SchoolId, SchoolYear, StudentUSI, Id, ChangeVersion)
    SELECT  PostSecondaryEventCategoryDescriptorId, SchoolId, SchoolYear, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[PostSecondaryDetail] ENABLE TRIGGER [de_PostSecondaryDetail_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_ReasonNotApplied4PlusCollegeDescriptor_TR_DeleteTracking] ON [de].[ReasonNotApplied4PlusCollegeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_ReasonNotApplied4PlusCollegeDescriptor_TrackedDelete](ReasonNotApplied4PlusCollegeDescriptorId, Id, ChangeVersion)
    SELECT  d.ReasonNotApplied4PlusCollegeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ReasonNotApplied4PlusCollegeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[ReasonNotApplied4PlusCollegeDescriptor] ENABLE TRIGGER [de_ReasonNotApplied4PlusCollegeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_ReferralDescriptor_TR_DeleteTracking] ON [de].[ReferralDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_ReferralDescriptor_TrackedDelete](ReferralDescriptorId, Id, ChangeVersion)
    SELECT  d.ReferralDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ReferralDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[ReferralDescriptor] ENABLE TRIGGER [de_ReferralDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_RestraintEventCategoryDescriptor_TR_DeleteTracking] ON [de].[RestraintEventCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_RestraintEventCategoryDescriptor_TrackedDelete](RestraintEventCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.RestraintEventCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RestraintEventCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[RestraintEventCategoryDescriptor] ENABLE TRIGGER [de_RestraintEventCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_RestraintSeclusion_TR_DeleteTracking] ON [de].[RestraintSeclusion] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_RestraintSeclusion_TrackedDelete](EventDate, EventTime, RestraintEventCategoryDescriptorId, RestraintEventReasonDescriptorId, SchoolId, StudentUSI, Id, ChangeVersion)
    SELECT  EventDate, EventTime, RestraintEventCategoryDescriptorId, RestraintEventReasonDescriptorId, SchoolId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[RestraintSeclusion] ENABLE TRIGGER [de_RestraintSeclusion_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_ServiceStatusDescriptor_TR_DeleteTracking] ON [de].[ServiceStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_ServiceStatusDescriptor_TrackedDelete](ServiceStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.ServiceStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ServiceStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[ServiceStatusDescriptor] ENABLE TRIGGER [de_ServiceStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_StaffRoleDescriptor_TR_DeleteTracking] ON [de].[StaffRoleDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_StaffRoleDescriptor_TrackedDelete](StaffRoleDescriptorId, Id, ChangeVersion)
    SELECT  d.StaffRoleDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffRoleDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[StaffRoleDescriptor] ENABLE TRIGGER [de_StaffRoleDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_Student504ProgramAssociation_TR_DeleteTracking] ON [de].[Student504ProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_Student504ProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [de].[Student504ProgramAssociation] ENABLE TRIGGER [de_Student504ProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_StudentEarlyChildhoodProgramAssociation_TR_DeleteTracking] ON [de].[StudentEarlyChildhoodProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_StudentEarlyChildhoodProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [de].[StudentEarlyChildhoodProgramAssociation] ENABLE TRIGGER [de_StudentEarlyChildhoodProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_StudentSectionClassPeriodAttendanceEvent_TR_DeleteTracking] ON [de].[StudentSectionClassPeriodAttendanceEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_StudentSectionClassPeriodAttendanceEvent_TrackedDelete](AttendanceEventCategoryDescriptorId, ClassPeriodName, EventDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI, Id, ChangeVersion)
    SELECT  AttendanceEventCategoryDescriptorId, ClassPeriodName, EventDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[StudentSectionClassPeriodAttendanceEvent] ENABLE TRIGGER [de_StudentSectionClassPeriodAttendanceEvent_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_StudentTransportation_TR_DeleteTracking] ON [de].[StudentTransportation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_StudentTransportation_TrackedDelete](LocalEducationAgencyId, StudentUSI, TravelDayOfWeekDescriptorId, TravelDirectionDescriptorId, TravelSegment, TravelTrip, Id, ChangeVersion)
    SELECT  LocalEducationAgencyId, StudentUSI, TravelDayOfWeekDescriptorId, TravelDirectionDescriptorId, TravelSegment, TravelTrip, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [de].[StudentTransportation] ENABLE TRIGGER [de_StudentTransportation_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_SupportPlanChangeDescriptor_TR_DeleteTracking] ON [de].[SupportPlanChangeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_SupportPlanChangeDescriptor_TrackedDelete](SupportPlanChangeDescriptorId, Id, ChangeVersion)
    SELECT  d.SupportPlanChangeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SupportPlanChangeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[SupportPlanChangeDescriptor] ENABLE TRIGGER [de_SupportPlanChangeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_TravelDayOfWeekDescriptor_TR_DeleteTracking] ON [de].[TravelDayOfWeekDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_TravelDayOfWeekDescriptor_TrackedDelete](TravelDayOfWeekDescriptorId, Id, ChangeVersion)
    SELECT  d.TravelDayOfWeekDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TravelDayOfWeekDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[TravelDayOfWeekDescriptor] ENABLE TRIGGER [de_TravelDayOfWeekDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_TravelDirectionDescriptor_TR_DeleteTracking] ON [de].[TravelDirectionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_TravelDirectionDescriptor_TrackedDelete](TravelDirectionDescriptorId, Id, ChangeVersion)
    SELECT  d.TravelDirectionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TravelDirectionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[TravelDirectionDescriptor] ENABLE TRIGGER [de_TravelDirectionDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_TreatmentDescriptor_TR_DeleteTracking] ON [de].[TreatmentDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_TreatmentDescriptor_TrackedDelete](TreatmentDescriptorId, Id, ChangeVersion)
    SELECT  d.TreatmentDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TreatmentDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[TreatmentDescriptor] ENABLE TRIGGER [de_TreatmentDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [de].[de_VictimCategoryDescriptor_TR_DeleteTracking] ON [de].[VictimCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[de_VictimCategoryDescriptor_TrackedDelete](VictimCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.VictimCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.VictimCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [de].[VictimCategoryDescriptor] ENABLE TRIGGER [de_VictimCategoryDescriptor_TR_DeleteTracking]
GO


