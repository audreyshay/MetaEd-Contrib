CREATE TRIGGER [de].[de_AllegedBullyingVictim_TR_UpdateChangeVersion] ON [de].[AllegedBullyingVictim] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[AllegedBullyingVictim]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[AllegedBullyingVictim] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_CIPCourse_TR_UpdateChangeVersion] ON [de].[CIPCourse] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[CIPCourse]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[CIPCourse] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_DisciplineIncidentCode_TR_UpdateChangeVersion] ON [de].[DisciplineIncidentCode] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[DisciplineIncidentCode]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[DisciplineIncidentCode] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_GradeTypeDetail_TR_UpdateChangeVersion] ON [de].[GradeTypeDetail] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[GradeTypeDetail]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[GradeTypeDetail] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_LevelDetail_TR_UpdateChangeVersion] ON [de].[LevelDetail] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[LevelDetail]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[LevelDetail] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_MedicalAlert_TR_UpdateChangeVersion] ON [de].[MedicalAlert] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[MedicalAlert]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[MedicalAlert] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_MedicalOfficeVisit_TR_UpdateChangeVersion] ON [de].[MedicalOfficeVisit] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[MedicalOfficeVisit]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[MedicalOfficeVisit] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_MedicalReferralFollowUp_TR_UpdateChangeVersion] ON [de].[MedicalReferralFollowUp] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[MedicalReferralFollowUp]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[MedicalReferralFollowUp] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_MedicalScreening_TR_UpdateChangeVersion] ON [de].[MedicalScreening] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[MedicalScreening]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[MedicalScreening] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_MedicationBox_TR_UpdateChangeVersion] ON [de].[MedicationBox] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[MedicationBox]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[MedicationBox] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_NonStudent_TR_UpdateChangeVersion] ON [de].[NonStudent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[NonStudent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[NonStudent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_Person_TR_UpdateChangeVersion] ON [de].[Person] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[Person]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[Person] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_PersonDisciplineAction_TR_UpdateChangeVersion] ON [de].[PersonDisciplineAction] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[PersonDisciplineAction]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[PersonDisciplineAction] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_PersonDisciplineIncidentAssociation_TR_UpdateChangeVersion] ON [de].[PersonDisciplineIncidentAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[PersonDisciplineIncidentAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[PersonDisciplineIncidentAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_PersonImmunization_TR_UpdateChangeVersion] ON [de].[PersonImmunization] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[PersonImmunization]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[PersonImmunization] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_PersonMedicalAlert_TR_UpdateChangeVersion] ON [de].[PersonMedicalAlert] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[PersonMedicalAlert]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[PersonMedicalAlert] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_PersonMedicationBoxAssociation_TR_UpdateChangeVersion] ON [de].[PersonMedicationBoxAssociation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[PersonMedicationBoxAssociation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[PersonMedicationBoxAssociation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_PostSecondaryDetail_TR_UpdateChangeVersion] ON [de].[PostSecondaryDetail] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[PostSecondaryDetail]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[PostSecondaryDetail] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_RestraintSeclusion_TR_UpdateChangeVersion] ON [de].[RestraintSeclusion] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[RestraintSeclusion]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[RestraintSeclusion] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_StudentSectionClassPeriodAttendanceEvent_TR_UpdateChangeVersion] ON [de].[StudentSectionClassPeriodAttendanceEvent] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[StudentSectionClassPeriodAttendanceEvent]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[StudentSectionClassPeriodAttendanceEvent] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

CREATE TRIGGER [de].[de_StudentTransportation_TR_UpdateChangeVersion] ON [de].[StudentTransportation] AFTER UPDATE AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [de].[StudentTransportation]
    SET ChangeVersion = (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM [de].[StudentTransportation] u
    WHERE EXISTS (SELECT 1 FROM inserted i WHERE i.id = u.id);
END	
GO

