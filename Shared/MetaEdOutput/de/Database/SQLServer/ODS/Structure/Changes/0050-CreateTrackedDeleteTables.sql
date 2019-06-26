CREATE TABLE [changes].[de_APExamCodeDescriptor_TrackedDelete]
(
       APExamCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_APExamCodeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_AcceptanceStatusDescriptor_TrackedDelete]
(
       AcceptanceStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_AcceptanceStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_AllegedBullyingVictim_TrackedDelete]
(
       AllegedIncidentDate [DATE] NOT NULL,
       SchoolId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_AllegedBullyingVictim_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_AttendanceConfigurationCategoryDescriptor_TrackedDelete]
(
       AttendanceConfigurationCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_AttendanceConfigurationCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_BullyingCategoryDescriptor_TrackedDelete]
(
       BullyingCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_BullyingCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_CIPCourse_TrackedDelete]
(
       CIPCode [NVARCHAR](120) NOT NULL,
       LocalEducationAgencyId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_CIPCourse_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_CertificateCategoryDescriptor_TrackedDelete]
(
       CertificateCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_CertificateCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_CertificationDescriptor_TrackedDelete]
(
       CertificationDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_CertificationDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_ChoiceCategoryDescriptor_TrackedDelete]
(
       ChoiceCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_ChoiceCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_CoreSubjectDescriptor_TrackedDelete]
(
       CoreSubjectDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_CoreSubjectDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_CycleDescriptor_TrackedDelete]
(
       CycleDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_CycleDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_DiplomaCertificateCategoryDescriptor_TrackedDelete]
(
       DiplomaCertificateCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_DiplomaCertificateCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_DisciplineDispositionDescriptor_TrackedDelete]
(
       DisciplineDispositionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_DisciplineDispositionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_DisciplineIncidentCode_TrackedDelete]
(
       BehaviorDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_DisciplineIncidentCode_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_EnrollmentTypeDescriptor_TrackedDelete]
(
       EnrollmentTypeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_EnrollmentTypeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_FerpaOptOutDescriptor_TrackedDelete]
(
       FerpaOptOutDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_FerpaOptOutDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_FollowupCategoryDescriptor_TrackedDelete]
(
       FollowupCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_FollowupCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_FundingNeedsCategoryDescriptor_TrackedDelete]
(
       FundingNeedsCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_FundingNeedsCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_GradeTypeDetail_TrackedDelete]
(
       GradeTypeDescriptorId [INT] NOT NULL,
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_GradeTypeDetail_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_GradeTypeWhenTakenDescriptor_TrackedDelete]
(
       GradeTypeWhenTakenDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_GradeTypeWhenTakenDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_ImmunizationCodeDescriptor_TrackedDelete]
(
       ImmunizationCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_ImmunizationCodeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_IncidentRelatedToDescriptor_TrackedDelete]
(
       IncidentRelatedToDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_IncidentRelatedToDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_InjuryDescriptor_TrackedDelete]
(
       InjuryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_InjuryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_LevelDetail_TrackedDelete]
(
       LevelNumber [INT] NOT NULL,
       Mark [NVARCHAR](3) NOT NULL,
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_LevelDetail_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_MedicalAlertCategoryDescriptor_TrackedDelete]
(
       MedicalAlertCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_MedicalAlertCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_MedicalAlert_TrackedDelete]
(
       MedicalAlertCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_MedicalAlert_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_MedicalDispositionDescriptor_TrackedDelete]
(
       MedicalDispositionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_MedicalDispositionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_MedicalOfficeVisit_TrackedDelete]
(
       OfficeInDate [DATETIME2](7) NOT NULL,
       PersonCategoryDescriptorId [INT] NOT NULL,
       PersonId [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_MedicalOfficeVisit_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_MedicalReferralFollowUp_TrackedDelete]
(
       FollowupCategoryDescriptorId [INT] NOT NULL,
       MedicalTestCategoryDescriptorId [INT] NOT NULL,
       PersonCategoryDescriptorId [INT] NOT NULL,
       PersonId [NVARCHAR](60) NOT NULL,
       TestDate [DATETIME2](7) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_MedicalReferralFollowUp_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_MedicalScreening_TrackedDelete]
(
       MedicalTestCategoryDescriptorId [INT] NOT NULL,
       PersonCategoryDescriptorId [INT] NOT NULL,
       PersonId [NVARCHAR](60) NOT NULL,
       TestDate [DATETIME2](7) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_MedicalScreening_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_MedicalTestCategoryDescriptor_TrackedDelete]
(
       MedicalTestCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_MedicalTestCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_MedicalTreatmentCodeDescriptor_TrackedDelete]
(
       MedicalTreatmentCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_MedicalTreatmentCodeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_MedicalVisitReasonDescriptor_TrackedDelete]
(
       MedicalVisitReasonDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_MedicalVisitReasonDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_MedicationBox_TrackedDelete]
(
       LocalEducationAgencyId [INT] NOT NULL,
       MedicationBoxId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_MedicationBox_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_NonStudent_TrackedDelete]
(
       LocalEducationAgencyId [INT] NOT NULL,
       NonStudentLocalId [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_NonStudent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_NotificationMethodDescriptor_TrackedDelete]
(
       NotificationMethodDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_NotificationMethodDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_ParticipationCodeDescriptor_TrackedDelete]
(
       ParticipationCodeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_ParticipationCodeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_PersonCategoryDescriptor_TrackedDelete]
(
       PersonCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_PersonCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_PersonDisciplineAction_TrackedDelete]
(
       ActionIdentifier [INT] NOT NULL,
       ActionStartDate [DATE] NOT NULL,
       IncidentIdentifier [NVARCHAR](20) NOT NULL,
       PersonCategoryDescriptorId [INT] NOT NULL,
       PersonId [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_PersonDisciplineAction_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_PersonDisciplineIncidentAssociation_TrackedDelete]
(
       IncidentIdentifier [NVARCHAR](20) NOT NULL,
       ParticipantNumber [INT] NOT NULL,
       ParticipationCodeDescriptorId [INT] NOT NULL,
       PersonCategoryDescriptorId [INT] NOT NULL,
       PersonId [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_PersonDisciplineIncidentAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_PersonImmunization_TrackedDelete]
(
       ImmunizationCodeDescriptorId [INT] NOT NULL,
       ImmunizationDate [DATE] NOT NULL,
       PersonCategoryDescriptorId [INT] NOT NULL,
       PersonId [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_PersonImmunization_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_PersonMedicalAlert_TrackedDelete]
(
       MedicalAlertCategoryDescriptorId [INT] NOT NULL,
       PersonCategoryDescriptorId [INT] NOT NULL,
       PersonId [NVARCHAR](60) NOT NULL,
       Sequence [INT] NOT NULL,
       StartDate [DATE] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_PersonMedicalAlert_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_PersonMedicationBoxAssociation_TrackedDelete]
(
       LocalEducationAgencyId [INT] NOT NULL,
       MedicationBoxId [INT] NOT NULL,
       PersonCategoryDescriptorId [INT] NOT NULL,
       PersonId [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_PersonMedicationBoxAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_Person_TrackedDelete]
(
       PersonCategoryDescriptorId [INT] NOT NULL,
       PersonId [NVARCHAR](60) NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_Person_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_PostSecondaryDetail_TrackedDelete]
(
       PostSecondaryEventCategoryDescriptorId [INT] NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_PostSecondaryDetail_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_ReasonNotApplied4PlusCollegeDescriptor_TrackedDelete]
(
       ReasonNotApplied4PlusCollegeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_ReasonNotApplied4PlusCollegeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_ReferralDescriptor_TrackedDelete]
(
       ReferralDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_ReferralDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_RestraintEventCategoryDescriptor_TrackedDelete]
(
       RestraintEventCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_RestraintEventCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_RestraintSeclusion_TrackedDelete]
(
       EventDate [DATE] NOT NULL,
       EventTime [TIME](7) NOT NULL,
       RestraintEventCategoryDescriptorId [INT] NOT NULL,
       RestraintEventReasonDescriptorId [INT] NOT NULL,
       SchoolId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_RestraintSeclusion_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_ServiceStatusDescriptor_TrackedDelete]
(
       ServiceStatusDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_ServiceStatusDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_StaffRoleDescriptor_TrackedDelete]
(
       StaffRoleDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_StaffRoleDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_Student504ProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_Student504ProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_StudentEarlyChildhoodProgramAssociation_TrackedDelete]
(
       BeginDate [DATE] NOT NULL,
       EducationOrganizationId [INT] NOT NULL,
       ProgramEducationOrganizationId [INT] NOT NULL,
       ProgramName [NVARCHAR](60) NOT NULL,
       ProgramTypeDescriptorId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_StudentEarlyChildhoodProgramAssociation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_StudentSectionClassPeriodAttendanceEvent_TrackedDelete]
(
       AttendanceEventCategoryDescriptorId [INT] NOT NULL,
       ClassPeriodName [NVARCHAR](60) NOT NULL,
       EventDate [DATE] NOT NULL,
       LocalCourseCode [NVARCHAR](60) NOT NULL,
       SchoolId [INT] NOT NULL,
       SchoolYear [SMALLINT] NOT NULL,
       SectionIdentifier [NVARCHAR](255) NOT NULL,
       SessionName [NVARCHAR](60) NOT NULL,
       StudentUSI [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_StudentSectionClassPeriodAttendanceEvent_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_StudentTransportation_TrackedDelete]
(
       LocalEducationAgencyId [INT] NOT NULL,
       StudentUSI [INT] NOT NULL,
       TravelDayOfWeekDescriptorId [INT] NOT NULL,
       TravelDirectionDescriptorId [INT] NOT NULL,
       TravelSegment [INT] NOT NULL,
       TravelTrip [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_StudentTransportation_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_SupportPlanChangeDescriptor_TrackedDelete]
(
       SupportPlanChangeDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_SupportPlanChangeDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_TravelDayOfWeekDescriptor_TrackedDelete]
(
       TravelDayOfWeekDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_TravelDayOfWeekDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_TravelDirectionDescriptor_TrackedDelete]
(
       TravelDirectionDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_TravelDirectionDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_TreatmentDescriptor_TrackedDelete]
(
       TreatmentDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_TreatmentDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

CREATE TABLE [changes].[de_VictimCategoryDescriptor_TrackedDelete]
(
       VictimCategoryDescriptorId [INT] NOT NULL,
       Id uniqueidentifier NOT NULL,
       ChangeVersion bigint NOT NULL,
       CONSTRAINT PK_de_VictimCategoryDescriptor_TrackedDelete PRIMARY KEY CLUSTERED (ChangeVersion)
)

