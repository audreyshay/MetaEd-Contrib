CREATE TRIGGER [mn].[mn_AncestryEthnicOriginDescriptor_TR_DeleteTracking] ON [mn].[AncestryEthnicOriginDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_AncestryEthnicOriginDescriptor_TrackedDelete](AncestryEthnicOriginDescriptorId, Id, ChangeVersion)
    SELECT  d.AncestryEthnicOriginDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AncestryEthnicOriginDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[AncestryEthnicOriginDescriptor] ENABLE TRIGGER [mn_AncestryEthnicOriginDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_AssessmentCharacteristicDescriptor_TR_DeleteTracking] ON [mn].[AssessmentCharacteristicDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_AssessmentCharacteristicDescriptor_TrackedDelete](AssessmentCharacteristicDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentCharacteristicDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentCharacteristicDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[AssessmentCharacteristicDescriptor] ENABLE TRIGGER [mn_AssessmentCharacteristicDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_AssessmentFormatDescriptor_TR_DeleteTracking] ON [mn].[AssessmentFormatDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_AssessmentFormatDescriptor_TrackedDelete](AssessmentFormatDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentFormatDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentFormatDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[AssessmentFormatDescriptor] ENABLE TRIGGER [mn_AssessmentFormatDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_AssessmentStatusDescriptor_TR_DeleteTracking] ON [mn].[AssessmentStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_AssessmentStatusDescriptor_TrackedDelete](AssessmentStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[AssessmentStatusDescriptor] ENABLE TRIGGER [mn_AssessmentStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_AssessmentTierDescriptor_TR_DeleteTracking] ON [mn].[AssessmentTierDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_AssessmentTierDescriptor_TrackedDelete](AssessmentTierDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentTierDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentTierDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[AssessmentTierDescriptor] ENABLE TRIGGER [mn_AssessmentTierDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_AssessmentToolDescriptor_TR_DeleteTracking] ON [mn].[AssessmentToolDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_AssessmentToolDescriptor_TrackedDelete](AssessmentToolDescriptorId, Id, ChangeVersion)
    SELECT  d.AssessmentToolDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AssessmentToolDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[AssessmentToolDescriptor] ENABLE TRIGGER [mn_AssessmentToolDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_CareerClusterDescriptor_TR_DeleteTracking] ON [mn].[CareerClusterDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_CareerClusterDescriptor_TrackedDelete](CareerClusterDescriptorId, Id, ChangeVersion)
    SELECT  d.CareerClusterDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CareerClusterDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[CareerClusterDescriptor] ENABLE TRIGGER [mn_CareerClusterDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_ClassPeriodTypeDescriptor_TR_DeleteTracking] ON [mn].[ClassPeriodTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_ClassPeriodTypeDescriptor_TrackedDelete](ClassPeriodTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.ClassPeriodTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ClassPeriodTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[ClassPeriodTypeDescriptor] ENABLE TRIGGER [mn_ClassPeriodTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_ClassroomVolunteerDescriptor_TR_DeleteTracking] ON [mn].[ClassroomVolunteerDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_ClassroomVolunteerDescriptor_TrackedDelete](ClassroomVolunteerDescriptorId, Id, ChangeVersion)
    SELECT  d.ClassroomVolunteerDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ClassroomVolunteerDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[ClassroomVolunteerDescriptor] ENABLE TRIGGER [mn_ClassroomVolunteerDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_CourseCourseAssociation_TR_DeleteTracking] ON [mn].[CourseCourseAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_CourseCourseAssociation_TrackedDelete](CourseCode, EducationOrganizationId, ToCourseCode, ToCourseEducationOrganizationId, Id, ChangeVersion)
    SELECT  CourseCode, EducationOrganizationId, ToCourseCode, ToCourseEducationOrganizationId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [mn].[CourseCourseAssociation] ENABLE TRIGGER [mn_CourseCourseAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_CourseLevelTypeDescriptor_TR_DeleteTracking] ON [mn].[CourseLevelTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_CourseLevelTypeDescriptor_TrackedDelete](CourseLevelTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.CourseLevelTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CourseLevelTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[CourseLevelTypeDescriptor] ENABLE TRIGGER [mn_CourseLevelTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_DistrictTypeDescriptor_TR_DeleteTracking] ON [mn].[DistrictTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_DistrictTypeDescriptor_TrackedDelete](DistrictTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.DistrictTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DistrictTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[DistrictTypeDescriptor] ENABLE TRIGGER [mn_DistrictTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_EarlyChildhoodScreenerDescriptor_TR_DeleteTracking] ON [mn].[EarlyChildhoodScreenerDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_EarlyChildhoodScreenerDescriptor_TrackedDelete](EarlyChildhoodScreenerDescriptorId, Id, ChangeVersion)
    SELECT  d.EarlyChildhoodScreenerDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EarlyChildhoodScreenerDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[EarlyChildhoodScreenerDescriptor] ENABLE TRIGGER [mn_EarlyChildhoodScreenerDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_EarlyChildhoodScreeningExitStatusDescriptor_TR_DeleteTracking] ON [mn].[EarlyChildhoodScreeningExitStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_EarlyChildhoodScreeningExitStatusDescriptor_TrackedDelete](EarlyChildhoodScreeningExitStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.EarlyChildhoodScreeningExitStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EarlyChildhoodScreeningExitStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[EarlyChildhoodScreeningExitStatusDescriptor] ENABLE TRIGGER [mn_EarlyChildhoodScreeningExitStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_EarlyEducationCourseLocationDescriptor_TR_DeleteTracking] ON [mn].[EarlyEducationCourseLocationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_EarlyEducationCourseLocationDescriptor_TrackedDelete](EarlyEducationCourseLocationDescriptorId, Id, ChangeVersion)
    SELECT  d.EarlyEducationCourseLocationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EarlyEducationCourseLocationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[EarlyEducationCourseLocationDescriptor] ENABLE TRIGGER [mn_EarlyEducationCourseLocationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_EdFiSubmissionAccessDescriptor_TR_DeleteTracking] ON [mn].[EdFiSubmissionAccessDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_EdFiSubmissionAccessDescriptor_TrackedDelete](EdFiSubmissionAccessDescriptorId, Id, ChangeVersion)
    SELECT  d.EdFiSubmissionAccessDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EdFiSubmissionAccessDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[EdFiSubmissionAccessDescriptor] ENABLE TRIGGER [mn_EdFiSubmissionAccessDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_ExamReimbursementRequest_TR_DeleteTracking] ON [mn].[ExamReimbursementRequest] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_ExamReimbursementRequest_TrackedDelete](EducationOrganizationId, StudentUSI, TestedDate, Id, ChangeVersion)
    SELECT  EducationOrganizationId, StudentUSI, TestedDate, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [mn].[ExamReimbursementRequest] ENABLE TRIGGER [mn_ExamReimbursementRequest_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_FundingSourceDescriptor_TR_DeleteTracking] ON [mn].[FundingSourceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_FundingSourceDescriptor_TrackedDelete](FundingSourceDescriptorId, Id, ChangeVersion)
    SELECT  d.FundingSourceDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FundingSourceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[FundingSourceDescriptor] ENABLE TRIGGER [mn_FundingSourceDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_GeneralEnrollmentDescriptor_TR_DeleteTracking] ON [mn].[GeneralEnrollmentDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_GeneralEnrollmentDescriptor_TrackedDelete](GeneralEnrollmentDescriptorId, Id, ChangeVersion)
    SELECT  d.GeneralEnrollmentDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GeneralEnrollmentDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[GeneralEnrollmentDescriptor] ENABLE TRIGGER [mn_GeneralEnrollmentDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_GiftedTalentedParticipationDescriptor_TR_DeleteTracking] ON [mn].[GiftedTalentedParticipationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_GiftedTalentedParticipationDescriptor_TrackedDelete](GiftedTalentedParticipationDescriptorId, Id, ChangeVersion)
    SELECT  d.GiftedTalentedParticipationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GiftedTalentedParticipationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[GiftedTalentedParticipationDescriptor] ENABLE TRIGGER [mn_GiftedTalentedParticipationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_ImplementationStatusDescriptor_TR_DeleteTracking] ON [mn].[ImplementationStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_ImplementationStatusDescriptor_TrackedDelete](ImplementationStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.ImplementationStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ImplementationStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[ImplementationStatusDescriptor] ENABLE TRIGGER [mn_ImplementationStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_InstructionalApproachDescriptor_TR_DeleteTracking] ON [mn].[InstructionalApproachDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_InstructionalApproachDescriptor_TrackedDelete](InstructionalApproachDescriptorId, Id, ChangeVersion)
    SELECT  d.InstructionalApproachDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InstructionalApproachDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[InstructionalApproachDescriptor] ENABLE TRIGGER [mn_InstructionalApproachDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_InstructionalDeliveryModeDescriptor_TR_DeleteTracking] ON [mn].[InstructionalDeliveryModeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_InstructionalDeliveryModeDescriptor_TrackedDelete](InstructionalDeliveryModeDescriptorId, Id, ChangeVersion)
    SELECT  d.InstructionalDeliveryModeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InstructionalDeliveryModeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[InstructionalDeliveryModeDescriptor] ENABLE TRIGGER [mn_InstructionalDeliveryModeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_KindergartenScheduleDescriptor_TR_DeleteTracking] ON [mn].[KindergartenScheduleDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_KindergartenScheduleDescriptor_TrackedDelete](KindergartenScheduleDescriptorId, Id, ChangeVersion)
    SELECT  d.KindergartenScheduleDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.KindergartenScheduleDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[KindergartenScheduleDescriptor] ENABLE TRIGGER [mn_KindergartenScheduleDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_MembershipAttendanceUnitDescriptor_TR_DeleteTracking] ON [mn].[MembershipAttendanceUnitDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_MembershipAttendanceUnitDescriptor_TrackedDelete](MembershipAttendanceUnitDescriptorId, Id, ChangeVersion)
    SELECT  d.MembershipAttendanceUnitDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.MembershipAttendanceUnitDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[MembershipAttendanceUnitDescriptor] ENABLE TRIGGER [mn_MembershipAttendanceUnitDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_OptOutIndicatorsDescriptor_TR_DeleteTracking] ON [mn].[OptOutIndicatorsDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_OptOutIndicatorsDescriptor_TrackedDelete](OptOutIndicatorsDescriptorId, Id, ChangeVersion)
    SELECT  d.OptOutIndicatorsDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OptOutIndicatorsDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[OptOutIndicatorsDescriptor] ENABLE TRIGGER [mn_OptOutIndicatorsDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_PrecodeTypeDescriptor_TR_DeleteTracking] ON [mn].[PrecodeTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_PrecodeTypeDescriptor_TrackedDelete](PrecodeTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.PrecodeTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PrecodeTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[PrecodeTypeDescriptor] ENABLE TRIGGER [mn_PrecodeTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_SchoolClassificationDescriptor_TR_DeleteTracking] ON [mn].[SchoolClassificationDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_SchoolClassificationDescriptor_TrackedDelete](SchoolClassificationDescriptorId, Id, ChangeVersion)
    SELECT  d.SchoolClassificationDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SchoolClassificationDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[SchoolClassificationDescriptor] ENABLE TRIGGER [mn_SchoolClassificationDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_SectionEnrollmentTypeDescriptor_TR_DeleteTracking] ON [mn].[SectionEnrollmentTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_SectionEnrollmentTypeDescriptor_TrackedDelete](SectionEnrollmentTypeDescriptorId, Id, ChangeVersion)
    SELECT  d.SectionEnrollmentTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SectionEnrollmentTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[SectionEnrollmentTypeDescriptor] ENABLE TRIGGER [mn_SectionEnrollmentTypeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_ShippingInstructionDescriptor_TR_DeleteTracking] ON [mn].[ShippingInstructionDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_ShippingInstructionDescriptor_TrackedDelete](ShippingInstructionDescriptorId, Id, ChangeVersion)
    SELECT  d.ShippingInstructionDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ShippingInstructionDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[ShippingInstructionDescriptor] ENABLE TRIGGER [mn_ShippingInstructionDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_SiteBasedInitiativeDescriptor_TR_DeleteTracking] ON [mn].[SiteBasedInitiativeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_SiteBasedInitiativeDescriptor_TrackedDelete](SiteBasedInitiativeDescriptorId, Id, ChangeVersion)
    SELECT  d.SiteBasedInitiativeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SiteBasedInitiativeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[SiteBasedInitiativeDescriptor] ENABLE TRIGGER [mn_SiteBasedInitiativeDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_SpecialEducationEvaluationStatusDescriptor_TR_DeleteTracking] ON [mn].[SpecialEducationEvaluationStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_SpecialEducationEvaluationStatusDescriptor_TrackedDelete](SpecialEducationEvaluationStatusDescriptorId, Id, ChangeVersion)
    SELECT  d.SpecialEducationEvaluationStatusDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SpecialEducationEvaluationStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[SpecialEducationEvaluationStatusDescriptor] ENABLE TRIGGER [mn_SpecialEducationEvaluationStatusDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StandardAddressedDescriptor_TR_DeleteTracking] ON [mn].[StandardAddressedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StandardAddressedDescriptor_TrackedDelete](StandardAddressedDescriptorId, Id, ChangeVersion)
    SELECT  d.StandardAddressedDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StandardAddressedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[StandardAddressedDescriptor] ENABLE TRIGGER [mn_StandardAddressedDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StateAidCategoryDescriptor_TR_DeleteTracking] ON [mn].[StateAidCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StateAidCategoryDescriptor_TrackedDelete](StateAidCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.StateAidCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StateAidCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[StateAidCategoryDescriptor] ENABLE TRIGGER [mn_StateAidCategoryDescriptor_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_Student21stCenturyLearningCenterGrantProgramAssociation_TR_DeleteTracking] ON [mn].[Student21stCenturyLearningCenterGrantProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_Student21stCenturyLearningCenterGrantProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [mn].[Student21stCenturyLearningCenterGrantProgramAssociation] ENABLE TRIGGER [mn_Student21stCenturyLearningCenterGrantProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentADSISProgramAssociation_TR_DeleteTracking] ON [mn].[StudentADSISProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentADSISProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [mn].[StudentADSISProgramAssociation] ENABLE TRIGGER [mn_StudentADSISProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentAssessmentPrecodeSite_TR_DeleteTracking] ON [mn].[StudentAssessmentPrecodeSite] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentAssessmentPrecodeSite_TrackedDelete](EducationOrganizationId, PrecodeTypeDescriptorId, Id, ChangeVersion)
    SELECT  EducationOrganizationId, PrecodeTypeDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [mn].[StudentAssessmentPrecodeSite] ENABLE TRIGGER [mn_StudentAssessmentPrecodeSite_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentAssessmentPrecode_TR_DeleteTracking] ON [mn].[StudentAssessmentPrecode] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentAssessmentPrecode_TrackedDelete](EducationOrganizationId, PrecodeTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  EducationOrganizationId, PrecodeTypeDescriptorId, StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [mn].[StudentAssessmentPrecode] ENABLE TRIGGER [mn_StudentAssessmentPrecode_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentCEISProgramAssociation_TR_DeleteTracking] ON [mn].[StudentCEISProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentCEISProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [mn].[StudentCEISProgramAssociation] ENABLE TRIGGER [mn_StudentCEISProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentDistanceLearnerProgramAssociation_TR_DeleteTracking] ON [mn].[StudentDistanceLearnerProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentDistanceLearnerProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [mn].[StudentDistanceLearnerProgramAssociation] ENABLE TRIGGER [mn_StudentDistanceLearnerProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentEarlyChildhoodScreeningProgramAssociation_TR_DeleteTracking] ON [mn].[StudentEarlyChildhoodScreeningProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentEarlyChildhoodScreeningProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [mn].[StudentEarlyChildhoodScreeningProgramAssociation] ENABLE TRIGGER [mn_StudentEarlyChildhoodScreeningProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentEarlyEducationProgramAssociation_TR_DeleteTracking] ON [mn].[StudentEarlyEducationProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentEarlyEducationProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [mn].[StudentEarlyEducationProgramAssociation] ENABLE TRIGGER [mn_StudentEarlyEducationProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentGiftedTalentedProgramAssociation_TR_DeleteTracking] ON [mn].[StudentGiftedTalentedProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentGiftedTalentedProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [mn].[StudentGiftedTalentedProgramAssociation] ENABLE TRIGGER [mn_StudentGiftedTalentedProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentPSEOConcurrentProgramAssociation_TR_DeleteTracking] ON [mn].[StudentPSEOConcurrentProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentPSEOConcurrentProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [mn].[StudentPSEOConcurrentProgramAssociation] ENABLE TRIGGER [mn_StudentPSEOConcurrentProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentPSEOProgramAssociation_TR_DeleteTracking] ON [mn].[StudentPSEOProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentPSEOProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [mn].[StudentPSEOProgramAssociation] ENABLE TRIGGER [mn_StudentPSEOProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentSAAPProgramAssociation_TR_DeleteTracking] ON [mn].[StudentSAAPProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentSAAPProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [mn].[StudentSAAPProgramAssociation] ENABLE TRIGGER [mn_StudentSAAPProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_StudentSection504PlanProgramAssociation_TR_DeleteTracking] ON [mn].[StudentSection504PlanProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_StudentSection504PlanProgramAssociation_TrackedDelete](BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI, Id, ChangeVersion)
    SELECT  d.BeginDate, d.EducationOrganizationId, d.ProgramEducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, d.StudentUSI, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.GeneralStudentProgramAssociation b ON d.BeginDate = b.BeginDate AND d.EducationOrganizationId = b.EducationOrganizationId AND d.ProgramEducationOrganizationId = b.ProgramEducationOrganizationId AND d.ProgramName = b.ProgramName AND d.ProgramTypeDescriptorId = b.ProgramTypeDescriptorId AND d.StudentUSI = b.StudentUSI
END
GO

ALTER TABLE [mn].[StudentSection504PlanProgramAssociation] ENABLE TRIGGER [mn_StudentSection504PlanProgramAssociation_TR_DeleteTracking]
GO


CREATE TRIGGER [mn].[mn_TransportationCategoryDescriptor_TR_DeleteTracking] ON [mn].[TransportationCategoryDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [changes].[mn_TransportationCategoryDescriptor_TrackedDelete](TransportationCategoryDescriptorId, Id, ChangeVersion)
    SELECT  d.TransportationCategoryDescriptorId, Id, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.TransportationCategoryDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [mn].[TransportationCategoryDescriptor] ENABLE TRIGGER [mn_TransportationCategoryDescriptor_TR_DeleteTracking]
GO


