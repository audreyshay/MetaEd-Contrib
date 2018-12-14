CREATE TRIGGER [az].[az_AbsenceAmountDescriptor_TR_DeleteTracking] ON [az].[AbsenceAmountDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_AbsenceAmountDescriptor_TrackedDelete](AbsenceAmountDescriptorId, Id, ChangeVersion)
    SELECT  d.AbsenceAmountDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AbsenceAmountDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[AbsenceAmountDescriptor] ENABLE TRIGGER [az_AbsenceAmountDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_CourseEntryDescriptor_TR_DeleteTracking] ON [az].[CourseEntryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_CourseEntryDescriptor_TrackedDelete](CourseEntryDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseEntryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseEntryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[CourseEntryDescriptor] ENABLE TRIGGER [az_CourseEntryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_CourseExitDescriptor_TR_DeleteTracking] ON [az].[CourseExitDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_CourseExitDescriptor_TrackedDelete](CourseExitDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseExitDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseExitDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[CourseExitDescriptor] ENABLE TRIGGER [az_CourseExitDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_EducationLevelDescriptor_TR_DeleteTracking] ON [az].[EducationLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_EducationLevelDescriptor_TrackedDelete](EducationLevelDescriptorId, Id, ChangeVersion)
    SELECT  d.EducationLevelDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EducationLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[EducationLevelDescriptor] ENABLE TRIGGER [az_EducationLevelDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_EndOfCourseAssessmentCodeDescriptor_TR_DeleteTracking] ON [az].[EndOfCourseAssessmentCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_EndOfCourseAssessmentCodeDescriptor_TrackedDelete](EndOfCourseAssessmentCodeDescriptorId, Id, ChangeVersion)
    SELECT  d.EndOfCourseAssessmentCodeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EndOfCourseAssessmentCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[EndOfCourseAssessmentCodeDescriptor] ENABLE TRIGGER [az_EndOfCourseAssessmentCodeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_ExitWithdrawReasonDescriptor_TR_DeleteTracking] ON [az].[ExitWithdrawReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_ExitWithdrawReasonDescriptor_TrackedDelete](ExitWithdrawReasonDescriptorId, Id, ChangeVersion)
    SELECT  d.ExitWithdrawReasonDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ExitWithdrawReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[ExitWithdrawReasonDescriptor] ENABLE TRIGGER [az_ExitWithdrawReasonDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_MembershipFTEDescriptor_TR_DeleteTracking] ON [az].[MembershipFTEDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_MembershipFTEDescriptor_TrackedDelete](MembershipFTEDescriptorId, Id, ChangeVersion)
    SELECT  d.MembershipFTEDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MembershipFTEDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[MembershipFTEDescriptor] ENABLE TRIGGER [az_MembershipFTEDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_MembershipResponsibilityDescriptor_TR_DeleteTracking] ON [az].[MembershipResponsibilityDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_MembershipResponsibilityDescriptor_TrackedDelete](MembershipResponsibilityDescriptorId, Id, ChangeVersion)
    SELECT  d.MembershipResponsibilityDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MembershipResponsibilityDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[MembershipResponsibilityDescriptor] ENABLE TRIGGER [az_MembershipResponsibilityDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_MembershipTypeDescriptor_TR_DeleteTracking] ON [az].[MembershipTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_MembershipTypeDescriptor_TrackedDelete](MembershipTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.MembershipTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MembershipTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[MembershipTypeDescriptor] ENABLE TRIGGER [az_MembershipTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_MonthDescriptor_TR_DeleteTracking] ON [az].[MonthDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_MonthDescriptor_TrackedDelete](MonthDescriptorId, Id, ChangeVersion)
    SELECT  d.MonthDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MonthDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[MonthDescriptor] ENABLE TRIGGER [az_MonthDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_NumberOfInstructionalDaysInWeekDescriptor_TR_DeleteTracking] ON [az].[NumberOfInstructionalDaysInWeekDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_NumberOfInstructionalDaysInWeekDescriptor_TrackedDelete](NumberOfInstructionalDaysInWeekDescriptorId, Id, ChangeVersion)
    SELECT  d.NumberOfInstructionalDaysInWeekDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.NumberOfInstructionalDaysInWeekDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[NumberOfInstructionalDaysInWeekDescriptor] ENABLE TRIGGER [az_NumberOfInstructionalDaysInWeekDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_PrimaryNightTimeResidenceDescriptor_TR_DeleteTracking] ON [az].[PrimaryNightTimeResidenceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_PrimaryNightTimeResidenceDescriptor_TrackedDelete](PrimaryNightTimeResidenceDescriptorId, Id, ChangeVersion)
    SELECT  d.PrimaryNightTimeResidenceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PrimaryNightTimeResidenceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[PrimaryNightTimeResidenceDescriptor] ENABLE TRIGGER [az_PrimaryNightTimeResidenceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_SpecialEnrollmentDescriptor_TR_DeleteTracking] ON [az].[SpecialEnrollmentDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_SpecialEnrollmentDescriptor_TrackedDelete](SpecialEnrollmentDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEnrollmentDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEnrollmentDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[SpecialEnrollmentDescriptor] ENABLE TRIGGER [az_SpecialEnrollmentDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_StudentDropOutRecoveryProgramAssociation_TR_DeleteTracking] ON [az].[StudentDropOutRecoveryProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_StudentDropOutRecoveryProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [az].[StudentDropOutRecoveryProgramAssociation] ENABLE TRIGGER [az_StudentDropOutRecoveryProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_StudentDropOutRecoveryProgramMonthlyUpdate_TR_DeleteTracking] ON [az].[StudentDropOutRecoveryProgramMonthlyUpdate] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_StudentDropOutRecoveryProgramMonthlyUpdate_TrackedDelete](BeginDate, EducationOrganizationId, MonthDescriptorId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  BeginDate, EducationOrganizationId, MonthDescriptorId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [az].[StudentDropOutRecoveryProgramMonthlyUpdate] ENABLE TRIGGER [az_StudentDropOutRecoveryProgramMonthlyUpdate_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_StudentNeedCategoryDescriptor_TR_DeleteTracking] ON [az].[StudentNeedCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_StudentNeedCategoryDescriptor_TrackedDelete](StudentNeedCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.StudentNeedCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentNeedCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[StudentNeedCategoryDescriptor] ENABLE TRIGGER [az_StudentNeedCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_StudentNeedDescriptor_TR_DeleteTracking] ON [az].[StudentNeedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_StudentNeedDescriptor_TrackedDelete](StudentNeedDescriptorId, Id, ChangeVersion)
    SELECT  d.StudentNeedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StudentNeedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[StudentNeedDescriptor] ENABLE TRIGGER [az_StudentNeedDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_StudentNeed_TR_DeleteTracking] ON [az].[StudentNeed] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_StudentNeed_TrackedDelete](EducationOrganizationId, StudentNeedDescriptorId, StudentNeedEntryDate, StudentUSI, Id, ChangeVersion)
    SELECT  EducationOrganizationId, StudentNeedDescriptorId, StudentNeedEntryDate, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [az].[StudentNeed] ENABLE TRIGGER [az_StudentNeed_TR_DeleteTracking]
GO


CREATE TRIGGER [az].[az_TuitionPayerDescriptor_TR_DeleteTracking] ON [az].[TuitionPayerDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[az_TuitionPayerDescriptor_TrackedDelete](TuitionPayerDescriptorId, Id, ChangeVersion)
    SELECT  d.TuitionPayerDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TuitionPayerDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [az].[TuitionPayerDescriptor] ENABLE TRIGGER [az_TuitionPayerDescriptor_TR_DeleteTracking]
GO


