ALTER TABLE [de].[AcceptanceStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_AcceptanceStatusDescriptor_Descriptor] FOREIGN KEY ([AcceptanceStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[AllegedBullyingVictim] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictim_IncidentLocationDescriptor] FOREIGN KEY ([IncidentLocationDescriptorId])
REFERENCES [edfi].[IncidentLocationDescriptor] ([IncidentLocationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictim_IncidentLocationDescriptor]
ON [de].[AllegedBullyingVictim] ([IncidentLocationDescriptorId] ASC)
GO

ALTER TABLE [de].[AllegedBullyingVictim] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictim_IncidentRelatedToDescriptor] FOREIGN KEY ([ReasonIncidentRelatedToDescriptorId])
REFERENCES [de].[IncidentRelatedToDescriptor] ([IncidentRelatedToDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictim_IncidentRelatedToDescriptor]
ON [de].[AllegedBullyingVictim] ([ReasonIncidentRelatedToDescriptorId] ASC)
GO

ALTER TABLE [de].[AllegedBullyingVictim] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictim_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictim_School]
ON [de].[AllegedBullyingVictim] ([SchoolId] ASC)
GO

ALTER TABLE [de].[AllegedBullyingVictim] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictim_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictim_Student]
ON [de].[AllegedBullyingVictim] ([StudentUSI] ASC)
GO

ALTER TABLE [de].[AllegedBullyingVictimBullyingCategory] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictimBullyingCategory_AllegedBullyingVictim] FOREIGN KEY ([AllegedIncidentDate], [SchoolId], [StudentUSI])
REFERENCES [de].[AllegedBullyingVictim] ([AllegedIncidentDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictimBullyingCategory_AllegedBullyingVictim]
ON [de].[AllegedBullyingVictimBullyingCategory] ([AllegedIncidentDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [de].[AllegedBullyingVictimBullyingCategory] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictimBullyingCategory_BullyingCategoryDescriptor] FOREIGN KEY ([BullyingCategoryDescriptorId])
REFERENCES [de].[BullyingCategoryDescriptor] ([BullyingCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictimBullyingCategory_BullyingCategoryDescriptor]
ON [de].[AllegedBullyingVictimBullyingCategory] ([BullyingCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[APExamCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_APExamCodeDescriptor_Descriptor] FOREIGN KEY ([APExamCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[AttendanceConfigurationCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_AttendanceConfigurationCategoryDescriptor_Descriptor] FOREIGN KEY ([AttendanceConfigurationCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[BullyingCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_BullyingCategoryDescriptor_Descriptor] FOREIGN KEY ([BullyingCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[CalendarDateExtension] WITH CHECK ADD CONSTRAINT [FK_CalendarDateExtension_CalendarDate] FOREIGN KEY ([CalendarCode], [Date], [SchoolId], [SchoolYear])
REFERENCES [edfi].[CalendarDate] ([CalendarCode], [Date], [SchoolId], [SchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [de].[CalendarDateExtension] WITH CHECK ADD CONSTRAINT [FK_CalendarDateExtension_CycleDescriptor] FOREIGN KEY ([CycleDescriptorId])
REFERENCES [de].[CycleDescriptor] ([CycleDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CalendarDateExtension_CycleDescriptor]
ON [de].[CalendarDateExtension] ([CycleDescriptorId] ASC)
GO

ALTER TABLE [de].[CertificateCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_CertificateCategoryDescriptor_Descriptor] FOREIGN KEY ([CertificateCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[CertificationDescriptor] WITH CHECK ADD CONSTRAINT [FK_CertificationDescriptor_Descriptor] FOREIGN KEY ([CertificationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[ChoiceCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_ChoiceCategoryDescriptor_Descriptor] FOREIGN KEY ([ChoiceCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[CIPCourse] WITH CHECK ADD CONSTRAINT [FK_CIPCourse_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_CIPCourse_LocalEducationAgency]
ON [de].[CIPCourse] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [de].[ClassPeriodCycle] WITH CHECK ADD CONSTRAINT [FK_ClassPeriodCycle_ClassPeriod] FOREIGN KEY ([ClassPeriodName], [SchoolId])
REFERENCES [edfi].[ClassPeriod] ([ClassPeriodName], [SchoolId])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ClassPeriodCycle_ClassPeriod]
ON [de].[ClassPeriodCycle] ([ClassPeriodName] ASC, [SchoolId] ASC)
GO

ALTER TABLE [de].[ClassPeriodCycle] WITH CHECK ADD CONSTRAINT [FK_ClassPeriodCycle_CycleDescriptor] FOREIGN KEY ([CycleDescriptorId])
REFERENCES [de].[CycleDescriptor] ([CycleDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ClassPeriodCycle_CycleDescriptor]
ON [de].[ClassPeriodCycle] ([CycleDescriptorId] ASC)
GO

ALTER TABLE [de].[ClassPeriodExtension] WITH CHECK ADD CONSTRAINT [FK_ClassPeriodExtension_ClassPeriod] FOREIGN KEY ([ClassPeriodName], [SchoolId])
REFERENCES [edfi].[ClassPeriod] ([ClassPeriodName], [SchoolId])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [de].[CoreSubjectDescriptor] WITH CHECK ADD CONSTRAINT [FK_CoreSubjectDescriptor_Descriptor] FOREIGN KEY ([CoreSubjectDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_APExamCodeDescriptor] FOREIGN KEY ([APExamCodeDescriptorId])
REFERENCES [de].[APExamCodeDescriptor] ([APExamCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_APExamCodeDescriptor]
ON [de].[CourseExtension] ([APExamCodeDescriptorId] ASC)
GO

ALTER TABLE [de].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_CoreSubjectDescriptor] FOREIGN KEY ([CoreSubjectDescriptorId])
REFERENCES [de].[CoreSubjectDescriptor] ([CoreSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_CoreSubjectDescriptor]
ON [de].[CourseExtension] ([CoreSubjectDescriptorId] ASC)
GO

ALTER TABLE [de].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_CredentialFieldDescriptor] FOREIGN KEY ([StaffCredentialFieldDescriptorId])
REFERENCES [edfi].[CredentialFieldDescriptor] ([CredentialFieldDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_CredentialFieldDescriptor]
ON [de].[CourseExtension] ([StaffCredentialFieldDescriptorId] ASC)
GO

ALTER TABLE [de].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_CredentialFieldDescriptor1] FOREIGN KEY ([SecondaryStaffCredentialFieldDescriptorId])
REFERENCES [edfi].[CredentialFieldDescriptor] ([CredentialFieldDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_CredentialFieldDescriptor1]
ON [de].[CourseExtension] ([SecondaryStaffCredentialFieldDescriptorId] ASC)
GO

ALTER TABLE [de].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_School] FOREIGN KEY ([UnitCountExceptionSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_School]
ON [de].[CourseExtension] ([UnitCountExceptionSchoolId] ASC)
GO

ALTER TABLE [de].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_ServiceStatusDescriptor] FOREIGN KEY ([SecondaryStaffClassroomServiceStatusDescriptorId])
REFERENCES [de].[ServiceStatusDescriptor] ([ServiceStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_ServiceStatusDescriptor]
ON [de].[CourseExtension] ([SecondaryStaffClassroomServiceStatusDescriptorId] ASC)
GO

ALTER TABLE [de].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_StaffRoleDescriptor] FOREIGN KEY ([SecondaryStaffRoleDescriptorId])
REFERENCES [de].[StaffRoleDescriptor] ([StaffRoleDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_StaffRoleDescriptor]
ON [de].[CourseExtension] ([SecondaryStaffRoleDescriptorId] ASC)
GO

ALTER TABLE [de].[CycleDescriptor] WITH CHECK ADD CONSTRAINT [FK_CycleDescriptor_Descriptor] FOREIGN KEY ([CycleDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[DiplomaCertificateCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_DiplomaCertificateCategoryDescriptor_Descriptor] FOREIGN KEY ([DiplomaCertificateCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[DisciplineDispositionDescriptor] WITH CHECK ADD CONSTRAINT [FK_DisciplineDispositionDescriptor_Descriptor] FOREIGN KEY ([DisciplineDispositionDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[DisciplineIncidentCode] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentCode_BehaviorDescriptor] FOREIGN KEY ([BehaviorDescriptorId])
REFERENCES [edfi].[BehaviorDescriptor] ([BehaviorDescriptorId])
GO

ALTER TABLE [de].[DisciplineIncidentExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentExtension_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[DisciplineIncidentReason] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentReason_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIncidentReason_DisciplineIncident]
ON [de].[DisciplineIncidentReason] ([IncidentIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [de].[DisciplineIncidentReason] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentReason_IncidentRelatedToDescriptor] FOREIGN KEY ([IncidentRelatedToDescriptorId])
REFERENCES [de].[IncidentRelatedToDescriptor] ([IncidentRelatedToDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIncidentReason_IncidentRelatedToDescriptor]
ON [de].[DisciplineIncidentReason] ([IncidentRelatedToDescriptorId] ASC)
GO

ALTER TABLE [de].[DisciplineIncidentReferral] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentReferral_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIncidentReferral_DisciplineIncident]
ON [de].[DisciplineIncidentReferral] ([IncidentIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [de].[DisciplineIncidentReferral] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentReferral_ReferralDescriptor] FOREIGN KEY ([ReferralDescriptorId])
REFERENCES [de].[ReferralDescriptor] ([ReferralDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIncidentReferral_ReferralDescriptor]
ON [de].[DisciplineIncidentReferral] ([ReferralDescriptorId] ASC)
GO

ALTER TABLE [de].[EnrollmentTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_EnrollmentTypeDescriptor_Descriptor] FOREIGN KEY ([EnrollmentTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[FerpaOptOutDescriptor] WITH CHECK ADD CONSTRAINT [FK_FerpaOptOutDescriptor_Descriptor] FOREIGN KEY ([FerpaOptOutDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[FollowupCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_FollowupCategoryDescriptor_Descriptor] FOREIGN KEY ([FollowupCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[FundingNeedsCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_FundingNeedsCategoryDescriptor_Descriptor] FOREIGN KEY ([FundingNeedsCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[GradeTypeDetail] WITH CHECK ADD CONSTRAINT [FK_GradeTypeDetail_GradeTypeDescriptor] FOREIGN KEY ([GradeTypeDescriptorId])
REFERENCES [edfi].[GradeTypeDescriptor] ([GradeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_GradeTypeDetail_GradeTypeDescriptor]
ON [de].[GradeTypeDetail] ([GradeTypeDescriptorId] ASC)
GO

ALTER TABLE [de].[GradeTypeDetail] WITH CHECK ADD CONSTRAINT [FK_GradeTypeDetail_GradeTypeWhenTakenDescriptor] FOREIGN KEY ([GradeTypeWhenTakenDescriptorId])
REFERENCES [de].[GradeTypeWhenTakenDescriptor] ([GradeTypeWhenTakenDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_GradeTypeDetail_GradeTypeWhenTakenDescriptor]
ON [de].[GradeTypeDetail] ([GradeTypeWhenTakenDescriptorId] ASC)
GO

ALTER TABLE [de].[GradeTypeDetail] WITH CHECK ADD CONSTRAINT [FK_GradeTypeDetail_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_GradeTypeDetail_School]
ON [de].[GradeTypeDetail] ([SchoolId] ASC)
GO

ALTER TABLE [de].[GradeTypeWhenTakenDescriptor] WITH CHECK ADD CONSTRAINT [FK_GradeTypeWhenTakenDescriptor_Descriptor] FOREIGN KEY ([GradeTypeWhenTakenDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[GradingPeriodExtension] WITH CHECK ADD CONSTRAINT [FK_GradingPeriodExtension_GradingPeriod] FOREIGN KEY ([GradingPeriodDescriptorId], [PeriodSequence], [SchoolId], [SchoolYear])
REFERENCES [edfi].[GradingPeriod] ([GradingPeriodDescriptorId], [PeriodSequence], [SchoolId], [SchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [de].[ImmunizationCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ImmunizationCodeDescriptor_Descriptor] FOREIGN KEY ([ImmunizationCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[IncidentRelatedToDescriptor] WITH CHECK ADD CONSTRAINT [FK_IncidentRelatedToDescriptor_Descriptor] FOREIGN KEY ([IncidentRelatedToDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[InjuryDescriptor] WITH CHECK ADD CONSTRAINT [FK_InjuryDescriptor_Descriptor] FOREIGN KEY ([InjuryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[LevelDetail] WITH CHECK ADD CONSTRAINT [FK_LevelDetail_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_LevelDetail_School]
ON [de].[LevelDetail] ([SchoolId] ASC)
GO

ALTER TABLE [de].[MedicalAlert] WITH CHECK ADD CONSTRAINT [FK_MedicalAlert_MedicalAlertCategoryDescriptor] FOREIGN KEY ([MedicalAlertCategoryDescriptorId])
REFERENCES [de].[MedicalAlertCategoryDescriptor] ([MedicalAlertCategoryDescriptorId])
GO

ALTER TABLE [de].[MedicalAlertCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_MedicalAlertCategoryDescriptor_Descriptor] FOREIGN KEY ([MedicalAlertCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[MedicalDispositionDescriptor] WITH CHECK ADD CONSTRAINT [FK_MedicalDispositionDescriptor_Descriptor] FOREIGN KEY ([MedicalDispositionDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[MedicalOfficeVisit] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisit_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisit_Person]
ON [de].[MedicalOfficeVisit] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[MedicalOfficeVisit] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisit_School] FOREIGN KEY ([SchoolOfServiceSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisit_School]
ON [de].[MedicalOfficeVisit] ([SchoolOfServiceSchoolId] ASC)
GO

ALTER TABLE [de].[MedicalOfficeVisitContactType] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitContactType_ContactTypeDescriptor] FOREIGN KEY ([ContactTypeDescriptorId])
REFERENCES [edfi].[ContactTypeDescriptor] ([ContactTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitContactType_ContactTypeDescriptor]
ON [de].[MedicalOfficeVisitContactType] ([ContactTypeDescriptorId] ASC)
GO

ALTER TABLE [de].[MedicalOfficeVisitContactType] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitContactType_MedicalOfficeVisit] FOREIGN KEY ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[MedicalOfficeVisit] ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitContactType_MedicalOfficeVisit]
ON [de].[MedicalOfficeVisitContactType] ([OfficeInDate] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[MedicalOfficeVisitMedicalDisposition] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalDisposition_MedicalDispositionDescriptor] FOREIGN KEY ([MedicalDispositionDescriptorId])
REFERENCES [de].[MedicalDispositionDescriptor] ([MedicalDispositionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalDisposition_MedicalDispositionDescriptor]
ON [de].[MedicalOfficeVisitMedicalDisposition] ([MedicalDispositionDescriptorId] ASC)
GO

ALTER TABLE [de].[MedicalOfficeVisitMedicalDisposition] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalDisposition_MedicalOfficeVisit] FOREIGN KEY ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[MedicalOfficeVisit] ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalDisposition_MedicalOfficeVisit]
ON [de].[MedicalOfficeVisitMedicalDisposition] ([OfficeInDate] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[MedicalOfficeVisitMedicalTreatmentCode] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalTreatmentCode_MedicalOfficeVisit] FOREIGN KEY ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[MedicalOfficeVisit] ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalTreatmentCode_MedicalOfficeVisit]
ON [de].[MedicalOfficeVisitMedicalTreatmentCode] ([OfficeInDate] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[MedicalOfficeVisitMedicalTreatmentCode] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalTreatmentCode_MedicalTreatmentCodeDescriptor] FOREIGN KEY ([MedicalTreatmentCodeDescriptorId])
REFERENCES [de].[MedicalTreatmentCodeDescriptor] ([MedicalTreatmentCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalTreatmentCode_MedicalTreatmentCodeDescriptor]
ON [de].[MedicalOfficeVisitMedicalTreatmentCode] ([MedicalTreatmentCodeDescriptorId] ASC)
GO

ALTER TABLE [de].[MedicalOfficeVisitMedicalVisitReason] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalVisitReason_MedicalOfficeVisit] FOREIGN KEY ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[MedicalOfficeVisit] ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalVisitReason_MedicalOfficeVisit]
ON [de].[MedicalOfficeVisitMedicalVisitReason] ([OfficeInDate] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[MedicalOfficeVisitMedicalVisitReason] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalVisitReason_MedicalVisitReasonDescriptor] FOREIGN KEY ([MedicalVisitReasonDescriptorId])
REFERENCES [de].[MedicalVisitReasonDescriptor] ([MedicalVisitReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalVisitReason_MedicalVisitReasonDescriptor]
ON [de].[MedicalOfficeVisitMedicalVisitReason] ([MedicalVisitReasonDescriptorId] ASC)
GO

ALTER TABLE [de].[MedicalReferralFollowUp] WITH CHECK ADD CONSTRAINT [FK_MedicalReferralFollowUp_FollowupCategoryDescriptor] FOREIGN KEY ([FollowupCategoryDescriptorId])
REFERENCES [de].[FollowupCategoryDescriptor] ([FollowupCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalReferralFollowUp_FollowupCategoryDescriptor]
ON [de].[MedicalReferralFollowUp] ([FollowupCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[MedicalReferralFollowUp] WITH CHECK ADD CONSTRAINT [FK_MedicalReferralFollowUp_MedicalTestCategoryDescriptor] FOREIGN KEY ([MedicalTestCategoryDescriptorId])
REFERENCES [de].[MedicalTestCategoryDescriptor] ([MedicalTestCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalReferralFollowUp_MedicalTestCategoryDescriptor]
ON [de].[MedicalReferralFollowUp] ([MedicalTestCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[MedicalReferralFollowUp] WITH CHECK ADD CONSTRAINT [FK_MedicalReferralFollowUp_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalReferralFollowUp_Person]
ON [de].[MedicalReferralFollowUp] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[MedicalScreening] WITH CHECK ADD CONSTRAINT [FK_MedicalScreening_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalScreening_GradeLevelDescriptor]
ON [de].[MedicalScreening] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [de].[MedicalScreening] WITH CHECK ADD CONSTRAINT [FK_MedicalScreening_MedicalTestCategoryDescriptor] FOREIGN KEY ([MedicalTestCategoryDescriptorId])
REFERENCES [de].[MedicalTestCategoryDescriptor] ([MedicalTestCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalScreening_MedicalTestCategoryDescriptor]
ON [de].[MedicalScreening] ([MedicalTestCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[MedicalScreening] WITH CHECK ADD CONSTRAINT [FK_MedicalScreening_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalScreening_Person]
ON [de].[MedicalScreening] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[MedicalScreening] WITH CHECK ADD CONSTRAINT [FK_MedicalScreening_School] FOREIGN KEY ([SchoolOfServiceSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalScreening_School]
ON [de].[MedicalScreening] ([SchoolOfServiceSchoolId] ASC)
GO

ALTER TABLE [de].[MedicalTestCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_MedicalTestCategoryDescriptor_Descriptor] FOREIGN KEY ([MedicalTestCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[MedicalTreatmentCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_MedicalTreatmentCodeDescriptor_Descriptor] FOREIGN KEY ([MedicalTreatmentCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[MedicalVisitReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_MedicalVisitReasonDescriptor_Descriptor] FOREIGN KEY ([MedicalVisitReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[MedicationBox] WITH CHECK ADD CONSTRAINT [FK_MedicationBox_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicationBox_LocalEducationAgency]
ON [de].[MedicationBox] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [de].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_CountryDescriptor] FOREIGN KEY ([BirthCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_CountryDescriptor]
ON [de].[NonStudent] ([BirthCountryDescriptorId] ASC)
GO

ALTER TABLE [de].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_LocalEducationAgency]
ON [de].[NonStudent] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [de].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_Person]
ON [de].[NonStudent] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_School]
ON [de].[NonStudent] ([SchoolId] ASC)
GO

ALTER TABLE [de].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_SexDescriptor] FOREIGN KEY ([BirthSexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_SexDescriptor]
ON [de].[NonStudent] ([BirthSexDescriptorId] ASC)
GO

ALTER TABLE [de].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_SexDescriptor1] FOREIGN KEY ([SexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_SexDescriptor1]
ON [de].[NonStudent] ([SexDescriptorId] ASC)
GO

ALTER TABLE [de].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_StateAbbreviationDescriptor] FOREIGN KEY ([BirthStateAbbreviationDescriptorId])
REFERENCES [edfi].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_StateAbbreviationDescriptor]
ON [de].[NonStudent] ([BirthStateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [de].[NonStudentEthnicity] WITH CHECK ADD CONSTRAINT [FK_NonStudentEthnicity_NonStudent] FOREIGN KEY ([LocalEducationAgencyId], [NonStudentLocalId])
REFERENCES [de].[NonStudent] ([LocalEducationAgencyId], [NonStudentLocalId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[NonStudentEthnicity] WITH CHECK ADD CONSTRAINT [FK_NonStudentEthnicity_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentEthnicity_RaceDescriptor]
ON [de].[NonStudentEthnicity] ([RaceDescriptorId] ASC)
GO

ALTER TABLE [de].[NonStudentEthnicity] WITH CHECK ADD CONSTRAINT [FK_NonStudentEthnicity_RaceDescriptor1] FOREIGN KEY ([FederalRaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentEthnicity_RaceDescriptor1]
ON [de].[NonStudentEthnicity] ([FederalRaceDescriptorId] ASC)
GO

ALTER TABLE [de].[NonStudentPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_NonStudentPersonalIdentificationDocument_CountryDescriptor] FOREIGN KEY ([IssuerCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentPersonalIdentificationDocument_CountryDescriptor]
ON [de].[NonStudentPersonalIdentificationDocument] ([IssuerCountryDescriptorId] ASC)
GO

ALTER TABLE [de].[NonStudentPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_NonStudentPersonalIdentificationDocument_IdentificationDocumentUseDescriptor] FOREIGN KEY ([IdentificationDocumentUseDescriptorId])
REFERENCES [edfi].[IdentificationDocumentUseDescriptor] ([IdentificationDocumentUseDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentPersonalIdentificationDocument_IdentificationDocumentUseDescriptor]
ON [de].[NonStudentPersonalIdentificationDocument] ([IdentificationDocumentUseDescriptorId] ASC)
GO

ALTER TABLE [de].[NonStudentPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_NonStudentPersonalIdentificationDocument_NonStudent] FOREIGN KEY ([LocalEducationAgencyId], [NonStudentLocalId])
REFERENCES [de].[NonStudent] ([LocalEducationAgencyId], [NonStudentLocalId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentPersonalIdentificationDocument_NonStudent]
ON [de].[NonStudentPersonalIdentificationDocument] ([LocalEducationAgencyId] ASC, [NonStudentLocalId] ASC)
GO

ALTER TABLE [de].[NonStudentPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_NonStudentPersonalIdentificationDocument_PersonalInformationVerificationDescriptor] FOREIGN KEY ([PersonalInformationVerificationDescriptorId])
REFERENCES [edfi].[PersonalInformationVerificationDescriptor] ([PersonalInformationVerificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentPersonalIdentificationDocument_PersonalInformationVerificationDescriptor]
ON [de].[NonStudentPersonalIdentificationDocument] ([PersonalInformationVerificationDescriptorId] ASC)
GO

ALTER TABLE [de].[NotificationMethodDescriptor] WITH CHECK ADD CONSTRAINT [FK_NotificationMethodDescriptor_Descriptor] FOREIGN KEY ([NotificationMethodDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[ParentAddressExtension] WITH CHECK ADD CONSTRAINT [FK_ParentAddressExtension_ParentAddress] FOREIGN KEY ([AddressTypeDescriptorId], [ParentUSI])
REFERENCES [edfi].[ParentAddress] ([AddressTypeDescriptorId], [ParentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[ParticipationCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ParticipationCodeDescriptor_Descriptor] FOREIGN KEY ([ParticipationCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[Person] WITH CHECK ADD CONSTRAINT [FK_Person_PersonCategoryDescriptor] FOREIGN KEY ([PersonCategoryDescriptorId])
REFERENCES [de].[PersonCategoryDescriptor] ([PersonCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Person_PersonCategoryDescriptor]
ON [de].[Person] ([PersonCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[PersonCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_PersonCategoryDescriptor_Descriptor] FOREIGN KEY ([PersonCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[PersonDisciplineAction] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineAction_DisciplineActionLengthDifferenceReasonDescriptor] FOREIGN KEY ([DisciplineActionLengthDifferenceReasonDescriptorId])
REFERENCES [edfi].[DisciplineActionLengthDifferenceReasonDescriptor] ([DisciplineActionLengthDifferenceReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineAction_DisciplineActionLengthDifferenceReasonDescriptor]
ON [de].[PersonDisciplineAction] ([DisciplineActionLengthDifferenceReasonDescriptorId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineAction] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineAction_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineAction_DisciplineIncident]
ON [de].[PersonDisciplineAction] ([IncidentIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineAction] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineAction_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineAction_Person]
ON [de].[PersonDisciplineAction] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineAction] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineAction_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineAction_School]
ON [de].[PersonDisciplineAction] ([SchoolId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineActionDiscipline] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineActionDiscipline_DisciplineDescriptor] FOREIGN KEY ([DisciplineDescriptorId])
REFERENCES [edfi].[DisciplineDescriptor] ([DisciplineDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineActionDiscipline_DisciplineDescriptor]
ON [de].[PersonDisciplineActionDiscipline] ([DisciplineDescriptorId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineActionDiscipline] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineActionDiscipline_PersonDisciplineAction] FOREIGN KEY ([ActionIdentifier], [ActionStartDate], [IncidentIdentifier], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
REFERENCES [de].[PersonDisciplineAction] ([ActionIdentifier], [ActionStartDate], [IncidentIdentifier], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineActionDiscipline_PersonDisciplineAction]
ON [de].[PersonDisciplineActionDiscipline] ([ActionIdentifier] ASC, [ActionStartDate] ASC, [IncidentIdentifier] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC, [SchoolId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineActionDisciplineDisposition] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineActionDisciplineDisposition_DisciplineDispositionDescriptor] FOREIGN KEY ([DisciplineDispositionDescriptorId])
REFERENCES [de].[DisciplineDispositionDescriptor] ([DisciplineDispositionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineActionDisciplineDisposition_DisciplineDispositionDescriptor]
ON [de].[PersonDisciplineActionDisciplineDisposition] ([DisciplineDispositionDescriptorId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineActionDisciplineDisposition] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineActionDisciplineDisposition_PersonDisciplineAction] FOREIGN KEY ([ActionIdentifier], [ActionStartDate], [IncidentIdentifier], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
REFERENCES [de].[PersonDisciplineAction] ([ActionIdentifier], [ActionStartDate], [IncidentIdentifier], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineActionDisciplineDisposition_PersonDisciplineAction]
ON [de].[PersonDisciplineActionDisciplineDisposition] ([ActionIdentifier] ASC, [ActionStartDate] ASC, [IncidentIdentifier] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC, [SchoolId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineIncidentAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociation_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociation_DisciplineIncident]
ON [de].[PersonDisciplineIncidentAssociation] ([IncidentIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineIncidentAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociation_ParticipationCodeDescriptor] FOREIGN KEY ([ParticipationCodeDescriptorId])
REFERENCES [de].[ParticipationCodeDescriptor] ([ParticipationCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociation_ParticipationCodeDescriptor]
ON [de].[PersonDisciplineIncidentAssociation] ([ParticipationCodeDescriptorId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineIncidentAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociation_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociation_Person]
ON [de].[PersonDisciplineIncidentAssociation] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineIncidentAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociation_VictimCategoryDescriptor] FOREIGN KEY ([VictimCategoryDescriptorId])
REFERENCES [de].[VictimCategoryDescriptor] ([VictimCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociation_VictimCategoryDescriptor]
ON [de].[PersonDisciplineIncidentAssociation] ([VictimCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineIncidentAssociationOffenderBehavior] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociationOffenderBehavior_BehaviorDescriptor] FOREIGN KEY ([BehaviorDescriptorId])
REFERENCES [edfi].[BehaviorDescriptor] ([BehaviorDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociationOffenderBehavior_BehaviorDescriptor]
ON [de].[PersonDisciplineIncidentAssociationOffenderBehavior] ([BehaviorDescriptorId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineIncidentAssociationOffenderBehavior] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociationOffenderBehavior_PersonDisciplineIncidentAssociation] FOREIGN KEY ([IncidentIdentifier], [ParticipantNumber], [ParticipationCodeDescriptorId], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
REFERENCES [de].[PersonDisciplineIncidentAssociation] ([IncidentIdentifier], [ParticipantNumber], [ParticipationCodeDescriptorId], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociationOffenderBehavior_PersonDisciplineIncidentAssociation]
ON [de].[PersonDisciplineIncidentAssociationOffenderBehavior] ([IncidentIdentifier] ASC, [ParticipantNumber] ASC, [ParticipationCodeDescriptorId] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC, [SchoolId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineIncidentAssociationVictimInjury] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociationVictimInjury_InjuryDescriptor] FOREIGN KEY ([InjuryDescriptorId])
REFERENCES [de].[InjuryDescriptor] ([InjuryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociationVictimInjury_InjuryDescriptor]
ON [de].[PersonDisciplineIncidentAssociationVictimInjury] ([InjuryDescriptorId] ASC)
GO

ALTER TABLE [de].[PersonDisciplineIncidentAssociationVictimInjury] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociationVictimInjury_PersonDisciplineIncidentAssociation] FOREIGN KEY ([IncidentIdentifier], [ParticipantNumber], [ParticipationCodeDescriptorId], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
REFERENCES [de].[PersonDisciplineIncidentAssociation] ([IncidentIdentifier], [ParticipantNumber], [ParticipationCodeDescriptorId], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociationVictimInjury_PersonDisciplineIncidentAssociation]
ON [de].[PersonDisciplineIncidentAssociationVictimInjury] ([IncidentIdentifier] ASC, [ParticipantNumber] ASC, [ParticipationCodeDescriptorId] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC, [SchoolId] ASC)
GO

ALTER TABLE [de].[PersonImmunization] WITH CHECK ADD CONSTRAINT [FK_PersonImmunization_ImmunizationCodeDescriptor] FOREIGN KEY ([ImmunizationCodeDescriptorId])
REFERENCES [de].[ImmunizationCodeDescriptor] ([ImmunizationCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonImmunization_ImmunizationCodeDescriptor]
ON [de].[PersonImmunization] ([ImmunizationCodeDescriptorId] ASC)
GO

ALTER TABLE [de].[PersonImmunization] WITH CHECK ADD CONSTRAINT [FK_PersonImmunization_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonImmunization_Person]
ON [de].[PersonImmunization] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[PersonMedicalAlert] WITH CHECK ADD CONSTRAINT [FK_PersonMedicalAlert_MedicalAlert] FOREIGN KEY ([MedicalAlertCategoryDescriptorId])
REFERENCES [de].[MedicalAlert] ([MedicalAlertCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonMedicalAlert_MedicalAlert]
ON [de].[PersonMedicalAlert] ([MedicalAlertCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[PersonMedicalAlert] WITH CHECK ADD CONSTRAINT [FK_PersonMedicalAlert_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonMedicalAlert_Person]
ON [de].[PersonMedicalAlert] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[PersonMedicationBoxAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonMedicationBoxAssociation_MedicationBox] FOREIGN KEY ([LocalEducationAgencyId], [MedicationBoxId])
REFERENCES [de].[MedicationBox] ([LocalEducationAgencyId], [MedicationBoxId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonMedicationBoxAssociation_MedicationBox]
ON [de].[PersonMedicationBoxAssociation] ([LocalEducationAgencyId] ASC, [MedicationBoxId] ASC)
GO

ALTER TABLE [de].[PersonMedicationBoxAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonMedicationBoxAssociation_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonMedicationBoxAssociation_Person]
ON [de].[PersonMedicationBoxAssociation] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[PersonMedicationBoxAssociationIssue] WITH CHECK ADD CONSTRAINT [FK_PersonMedicationBoxAssociationIssue_PersonMedicationBoxAssociation] FOREIGN KEY ([LocalEducationAgencyId], [MedicationBoxId], [PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[PersonMedicationBoxAssociation] ([LocalEducationAgencyId], [MedicationBoxId], [PersonCategoryDescriptorId], [PersonId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PersonMedicationBoxAssociationIssue_PersonMedicationBoxAssociation]
ON [de].[PersonMedicationBoxAssociationIssue] ([LocalEducationAgencyId] ASC, [MedicationBoxId] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[PostSecondaryDetail] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetail_PostSecondaryEventCategoryDescriptor] FOREIGN KEY ([PostSecondaryEventCategoryDescriptorId])
REFERENCES [edfi].[PostSecondaryEventCategoryDescriptor] ([PostSecondaryEventCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetail_PostSecondaryEventCategoryDescriptor]
ON [de].[PostSecondaryDetail] ([PostSecondaryEventCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[PostSecondaryDetail] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetail_ReasonNotApplied4PlusCollegeDescriptor] FOREIGN KEY ([ReasonNotApplied4PlusCollegeDescriptorId])
REFERENCES [de].[ReasonNotApplied4PlusCollegeDescriptor] ([ReasonNotApplied4PlusCollegeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetail_ReasonNotApplied4PlusCollegeDescriptor]
ON [de].[PostSecondaryDetail] ([ReasonNotApplied4PlusCollegeDescriptorId] ASC)
GO

ALTER TABLE [de].[PostSecondaryDetail] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetail_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetail_School]
ON [de].[PostSecondaryDetail] ([SchoolId] ASC)
GO

ALTER TABLE [de].[PostSecondaryDetail] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetail_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetail_SchoolYearType]
ON [de].[PostSecondaryDetail] ([SchoolYear] ASC)
GO

ALTER TABLE [de].[PostSecondaryDetail] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetail_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetail_Student]
ON [de].[PostSecondaryDetail] ([StudentUSI] ASC)
GO

ALTER TABLE [de].[PostSecondaryDetailInstitution] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetailInstitution_AcceptanceStatusDescriptor] FOREIGN KEY ([AcceptanceStatusDescriptorId])
REFERENCES [de].[AcceptanceStatusDescriptor] ([AcceptanceStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetailInstitution_AcceptanceStatusDescriptor]
ON [de].[PostSecondaryDetailInstitution] ([AcceptanceStatusDescriptorId] ASC)
GO

ALTER TABLE [de].[PostSecondaryDetailInstitution] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetailInstitution_PostSecondaryDetail] FOREIGN KEY ([PostSecondaryEventCategoryDescriptorId], [SchoolId], [SchoolYear], [StudentUSI])
REFERENCES [de].[PostSecondaryDetail] ([PostSecondaryEventCategoryDescriptorId], [SchoolId], [SchoolYear], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetailInstitution_PostSecondaryDetail]
ON [de].[PostSecondaryDetailInstitution] ([PostSecondaryEventCategoryDescriptorId] ASC, [SchoolId] ASC, [SchoolYear] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [de].[PostSecondaryDetailInstitution] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetailInstitution_PostSecondaryInstitution] FOREIGN KEY ([PostSecondaryInstitutionId])
REFERENCES [edfi].[PostSecondaryInstitution] ([PostSecondaryInstitutionId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetailInstitution_PostSecondaryInstitution]
ON [de].[PostSecondaryDetailInstitution] ([PostSecondaryInstitutionId] ASC)
GO

ALTER TABLE [de].[ReasonNotApplied4PlusCollegeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ReasonNotApplied4PlusCollegeDescriptor_Descriptor] FOREIGN KEY ([ReasonNotApplied4PlusCollegeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[ReferralDescriptor] WITH CHECK ADD CONSTRAINT [FK_ReferralDescriptor_Descriptor] FOREIGN KEY ([ReferralDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[RestraintEventCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_RestraintEventCategoryDescriptor_Descriptor] FOREIGN KEY ([RestraintEventCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_IncidentLocationDescriptor] FOREIGN KEY ([IncidentLocationDescriptorId])
REFERENCES [edfi].[IncidentLocationDescriptor] ([IncidentLocationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_IncidentLocationDescriptor]
ON [de].[RestraintSeclusion] ([IncidentLocationDescriptorId] ASC)
GO

ALTER TABLE [de].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_NotificationMethodDescriptor] FOREIGN KEY ([NotificationMethodDescriptorId])
REFERENCES [de].[NotificationMethodDescriptor] ([NotificationMethodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_NotificationMethodDescriptor]
ON [de].[RestraintSeclusion] ([NotificationMethodDescriptorId] ASC)
GO

ALTER TABLE [de].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_RestraintEventCategoryDescriptor] FOREIGN KEY ([RestraintEventCategoryDescriptorId])
REFERENCES [de].[RestraintEventCategoryDescriptor] ([RestraintEventCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_RestraintEventCategoryDescriptor]
ON [de].[RestraintSeclusion] ([RestraintEventCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_RestraintEventReasonDescriptor] FOREIGN KEY ([RestraintEventReasonDescriptorId])
REFERENCES [edfi].[RestraintEventReasonDescriptor] ([RestraintEventReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_RestraintEventReasonDescriptor]
ON [de].[RestraintSeclusion] ([RestraintEventReasonDescriptorId] ASC)
GO

ALTER TABLE [de].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_School]
ON [de].[RestraintSeclusion] ([SchoolId] ASC)
GO

ALTER TABLE [de].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_Student]
ON [de].[RestraintSeclusion] ([StudentUSI] ASC)
GO

ALTER TABLE [de].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_SupportPlanChangeDescriptor] FOREIGN KEY ([SupportPlanChangeDescriptorId])
REFERENCES [de].[SupportPlanChangeDescriptor] ([SupportPlanChangeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_SupportPlanChangeDescriptor]
ON [de].[RestraintSeclusion] ([SupportPlanChangeDescriptorId] ASC)
GO

ALTER TABLE [de].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_TreatmentDescriptor] FOREIGN KEY ([StaffTreatmentDescriptorId])
REFERENCES [de].[TreatmentDescriptor] ([TreatmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_TreatmentDescriptor]
ON [de].[RestraintSeclusion] ([StaffTreatmentDescriptorId] ASC)
GO

ALTER TABLE [de].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_TreatmentDescriptor1] FOREIGN KEY ([StudentTreatmentDescriptorId])
REFERENCES [de].[TreatmentDescriptor] ([TreatmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_TreatmentDescriptor1]
ON [de].[RestraintSeclusion] ([StudentTreatmentDescriptorId] ASC)
GO

ALTER TABLE [de].[RestraintSeclusionStaffProvidingRestraint] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusionStaffProvidingRestraint_RestraintSeclusion] FOREIGN KEY ([EventDate], [EventTime], [RestraintEventCategoryDescriptorId], [RestraintEventReasonDescriptorId], [SchoolId], [StudentUSI])
REFERENCES [de].[RestraintSeclusion] ([EventDate], [EventTime], [RestraintEventCategoryDescriptorId], [RestraintEventReasonDescriptorId], [SchoolId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusionStaffProvidingRestraint_RestraintSeclusion]
ON [de].[RestraintSeclusionStaffProvidingRestraint] ([EventDate] ASC, [EventTime] ASC, [RestraintEventCategoryDescriptorId] ASC, [RestraintEventReasonDescriptorId] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [de].[RestraintSeclusionStaffProvidingRestraint] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusionStaffProvidingRestraint_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusionStaffProvidingRestraint_Staff]
ON [de].[RestraintSeclusionStaffProvidingRestraint] ([StaffUSI] ASC)
GO

ALTER TABLE [de].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_AttendanceConfigurationCategoryDescriptor] FOREIGN KEY ([AttendanceConfigurationCategoryDescriptorId])
REFERENCES [de].[AttendanceConfigurationCategoryDescriptor] ([AttendanceConfigurationCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SchoolExtension_AttendanceConfigurationCategoryDescriptor]
ON [de].[SchoolExtension] ([AttendanceConfigurationCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [de].[SectionMarkingPeriod] WITH CHECK ADD CONSTRAINT [FK_SectionMarkingPeriod_GradingPeriodDescriptor] FOREIGN KEY ([GradingPeriodDescriptorId])
REFERENCES [edfi].[GradingPeriodDescriptor] ([GradingPeriodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionMarkingPeriod_GradingPeriodDescriptor]
ON [de].[SectionMarkingPeriod] ([GradingPeriodDescriptorId] ASC)
GO

ALTER TABLE [de].[SectionMarkingPeriod] WITH CHECK ADD CONSTRAINT [FK_SectionMarkingPeriod_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionMarkingPeriod_Section]
ON [de].[SectionMarkingPeriod] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [de].[SectionSubjectArea] WITH CHECK ADD CONSTRAINT [FK_SectionSubjectArea_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionSubjectArea_AcademicSubjectDescriptor]
ON [de].[SectionSubjectArea] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [de].[SectionSubjectArea] WITH CHECK ADD CONSTRAINT [FK_SectionSubjectArea_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionSubjectArea_Section]
ON [de].[SectionSubjectArea] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [de].[ServiceStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_ServiceStatusDescriptor_Descriptor] FOREIGN KEY ([ServiceStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_StaffEducationOrganizationAssignmentAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
REFERENCES [edfi].[StaffEducationOrganizationAssignmentAssociation] ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffExtension_Person]
ON [de].[StaffExtension] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_RaceDescriptor] FOREIGN KEY ([FederalRaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffExtension_RaceDescriptor]
ON [de].[StaffExtension] ([FederalRaceDescriptorId] ASC)
GO

ALTER TABLE [de].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StaffProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffProgramAssociationExtension_LanguageDescriptor] FOREIGN KEY ([ImmersionLanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffProgramAssociationExtension_LanguageDescriptor]
ON [de].[StaffProgramAssociationExtension] ([ImmersionLanguageDescriptorId] ASC)
GO

ALTER TABLE [de].[StaffProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffProgramAssociationExtension_StaffProgramAssociation] FOREIGN KEY ([BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StaffUSI])
REFERENCES [edfi].[StaffProgramAssociation] ([BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StaffRoleDescriptor] WITH CHECK ADD CONSTRAINT [FK_StaffRoleDescriptor_Descriptor] FOREIGN KEY ([StaffRoleDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[Student504ProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_Student504ProgramAssociation_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId])
REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Student504ProgramAssociation_DisabilityDescriptor]
ON [de].[Student504ProgramAssociation] ([DisabilityDescriptorId] ASC)
GO

ALTER TABLE [de].[Student504ProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_Student504ProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StudentCTEProgramAssociationCTEProgramExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor] FOREIGN KEY ([FirstCertificationDescriptorId])
REFERENCES [de].[CertificationDescriptor] ([CertificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor]
ON [de].[StudentCTEProgramAssociationCTEProgramExtension] ([FirstCertificationDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentCTEProgramAssociationCTEProgramExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor1] FOREIGN KEY ([SecondCertificationDescriptorId])
REFERENCES [de].[CertificationDescriptor] ([CertificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor1]
ON [de].[StudentCTEProgramAssociationCTEProgramExtension] ([SecondCertificationDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentCTEProgramAssociationCTEProgramExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor2] FOREIGN KEY ([ThirdCertificationDescriptorId])
REFERENCES [de].[CertificationDescriptor] ([CertificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor2]
ON [de].[StudentCTEProgramAssociationCTEProgramExtension] ([ThirdCertificationDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentCTEProgramAssociationCTEProgramExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgramExtension_StudentCTEProgramAssociationCTEProgram] FOREIGN KEY ([BeginDate], [CareerPathwayDescriptorId], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentCTEProgramAssociationCTEProgram] ([BeginDate], [CareerPathwayDescriptorId], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StudentCTEProgramAssociationCTEProgramExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgramExtension_TechnicalSkillsAssessmentDescriptor] FOREIGN KEY ([EndOfPathwayTechnicalSkillsAssessmentDescriptorId])
REFERENCES [edfi].[TechnicalSkillsAssessmentDescriptor] ([TechnicalSkillsAssessmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationCTEProgramExtension_TechnicalSkillsAssessmentDescriptor]
ON [de].[StudentCTEProgramAssociationCTEProgramExtension] ([EndOfPathwayTechnicalSkillsAssessmentDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentEarlyChildhoodProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyChildhoodProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StudentEarlyChildhoodProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyChildhoodProgramAssociation_ProgramCharacteristicDescriptor] FOREIGN KEY ([ProgramCharacteristicDescriptorId])
REFERENCES [edfi].[ProgramCharacteristicDescriptor] ([ProgramCharacteristicDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEarlyChildhoodProgramAssociation_ProgramCharacteristicDescriptor]
ON [de].[StudentEarlyChildhoodProgramAssociation] ([ProgramCharacteristicDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentEducationOrganizationAssociationAddressExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationAddressExtension_StudentEducationOrganizationAssociationAddress] FOREIGN KEY ([AddressTypeDescriptorId], [EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociationAddress] ([AddressTypeDescriptorId], [EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StudentEducationOrganizationAssociationEthnicity] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationEthnicity_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationEthnicity_RaceDescriptor]
ON [de].[StudentEducationOrganizationAssociationEthnicity] ([RaceDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentEducationOrganizationAssociationEthnicity] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationEthnicity_RaceDescriptor1] FOREIGN KEY ([FederalRaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationEthnicity_RaceDescriptor1]
ON [de].[StudentEducationOrganizationAssociationEthnicity] ([FederalRaceDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentEducationOrganizationAssociationEthnicity] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationEthnicity_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationEthnicity_StudentEducationOrganizationAssociation]
ON [de].[StudentEducationOrganizationAssociationEthnicity] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [de].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_ChoiceCategoryDescriptor] FOREIGN KEY ([ChoiceCategoryDescriptorId])
REFERENCES [de].[ChoiceCategoryDescriptor] ([ChoiceCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_ChoiceCategoryDescriptor]
ON [de].[StudentEducationOrganizationAssociationExtension] ([ChoiceCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_FerpaOptOutDescriptor] FOREIGN KEY ([FerpaOptOutDescriptorId])
REFERENCES [de].[FerpaOptOutDescriptor] ([FerpaOptOutDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_FerpaOptOutDescriptor]
ON [de].[StudentEducationOrganizationAssociationExtension] ([FerpaOptOutDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StudentEducationOrganizationAssociationMultiliteracy] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationMultiliteracy_CertificateCategoryDescriptor] FOREIGN KEY ([CertificateCategoryDescriptorId])
REFERENCES [de].[CertificateCategoryDescriptor] ([CertificateCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationMultiliteracy_CertificateCategoryDescriptor]
ON [de].[StudentEducationOrganizationAssociationMultiliteracy] ([CertificateCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentEducationOrganizationAssociationMultiliteracy] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationMultiliteracy_LanguageDescriptor] FOREIGN KEY ([LanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationMultiliteracy_LanguageDescriptor]
ON [de].[StudentEducationOrganizationAssociationMultiliteracy] ([LanguageDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentEducationOrganizationAssociationMultiliteracy] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationMultiliteracy_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationMultiliteracy_StudentEducationOrganizationAssociation]
ON [de].[StudentEducationOrganizationAssociationMultiliteracy] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [de].[StudentEducationOrganizationAssociationScholarship] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationScholarship_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationScholarship_StudentEducationOrganizationAssociation]
ON [de].[StudentEducationOrganizationAssociationScholarship] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [de].[StudentEducationOrganizationResponsibilityAssociationTransfer] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationResponsibilityAssociationTransfer_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationResponsibilityAssociationTransfer_GradeLevelDescriptor]
ON [de].[StudentEducationOrganizationResponsibilityAssociationTransfer] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentEducationOrganizationResponsibilityAssociationTransfer] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationResponsibilityAssociationTransfer_StudentEducationOrganizationResponsibilityAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ResponsibilityDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationResponsibilityAssociation] ([BeginDate], [EducationOrganizationId], [ResponsibilityDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationResponsibilityAssociationTransfer_StudentEducationOrganizationResponsibilityAssociation]
ON [de].[StudentEducationOrganizationResponsibilityAssociationTransfer] ([BeginDate] ASC, [EducationOrganizationId] ASC, [ResponsibilityDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [de].[StudentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentExtension_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [de].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentExtension_Person]
ON [de].[StudentExtension] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [de].[StudentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentExtension_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StudentLanguageInstructionProgramAssociationLanguageImmersion] WITH CHECK ADD CONSTRAINT [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_GradeLevelDescriptor]
ON [de].[StudentLanguageInstructionProgramAssociationLanguageImmersion] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentLanguageInstructionProgramAssociationLanguageImmersion] WITH CHECK ADD CONSTRAINT [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_LanguageDescriptor] FOREIGN KEY ([ImmersionLanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_LanguageDescriptor]
ON [de].[StudentLanguageInstructionProgramAssociationLanguageImmersion] ([ImmersionLanguageDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentLanguageInstructionProgramAssociationLanguageImmersion] WITH CHECK ADD CONSTRAINT [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_SchoolYearType]
ON [de].[StudentLanguageInstructionProgramAssociationLanguageImmersion] ([SchoolYear] ASC)
GO

ALTER TABLE [de].[StudentLanguageInstructionProgramAssociationLanguageImmersion] WITH CHECK ADD CONSTRAINT [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_StudentLanguageInstructionProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentLanguageInstructionProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_StudentLanguageInstructionProgramAssociation]
ON [de].[StudentLanguageInstructionProgramAssociationLanguageImmersion] ([BeginDate] ASC, [EducationOrganizationId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [de].[StudentParentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentParentAssociationExtension_ContactTypeDescriptor] FOREIGN KEY ([ContactTypeDescriptorId])
REFERENCES [edfi].[ContactTypeDescriptor] ([ContactTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentParentAssociationExtension_ContactTypeDescriptor]
ON [de].[StudentParentAssociationExtension] ([ContactTypeDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentParentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentParentAssociationExtension_StudentParentAssociation] FOREIGN KEY ([ParentUSI], [StudentUSI])
REFERENCES [edfi].[StudentParentAssociation] ([ParentUSI], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_EnrollmentTypeDescriptor] FOREIGN KEY ([EnrollmentTypeDescriptorId])
REFERENCES [de].[EnrollmentTypeDescriptor] ([EnrollmentTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_EnrollmentTypeDescriptor]
ON [de].[StudentSchoolAssociationExtension] ([EnrollmentTypeDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [de].[StudentSchoolAttendanceEventExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAttendanceEventExtension_StudentSchoolAttendanceEvent] FOREIGN KEY ([AttendanceEventCategoryDescriptorId], [EventDate], [SchoolId], [SchoolYear], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAttendanceEvent] ([AttendanceEventCategoryDescriptorId], [EventDate], [SchoolId], [SchoolYear], [SessionName], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StudentSectionClassPeriodAttendanceEvent] WITH CHECK ADD CONSTRAINT [FK_StudentSectionClassPeriodAttendanceEvent_AttendanceEventCategoryDescriptor] FOREIGN KEY ([AttendanceEventCategoryDescriptorId])
REFERENCES [edfi].[AttendanceEventCategoryDescriptor] ([AttendanceEventCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionClassPeriodAttendanceEvent_AttendanceEventCategoryDescriptor]
ON [de].[StudentSectionClassPeriodAttendanceEvent] ([AttendanceEventCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentSectionClassPeriodAttendanceEvent] WITH CHECK ADD CONSTRAINT [FK_StudentSectionClassPeriodAttendanceEvent_ClassPeriod] FOREIGN KEY ([ClassPeriodName], [SchoolId])
REFERENCES [edfi].[ClassPeriod] ([ClassPeriodName], [SchoolId])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionClassPeriodAttendanceEvent_ClassPeriod]
ON [de].[StudentSectionClassPeriodAttendanceEvent] ([ClassPeriodName] ASC, [SchoolId] ASC)
GO

ALTER TABLE [de].[StudentSectionClassPeriodAttendanceEvent] WITH CHECK ADD CONSTRAINT [FK_StudentSectionClassPeriodAttendanceEvent_EducationalEnvironmentDescriptor] FOREIGN KEY ([EducationalEnvironmentDescriptorId])
REFERENCES [edfi].[EducationalEnvironmentDescriptor] ([EducationalEnvironmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionClassPeriodAttendanceEvent_EducationalEnvironmentDescriptor]
ON [de].[StudentSectionClassPeriodAttendanceEvent] ([EducationalEnvironmentDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentSectionClassPeriodAttendanceEvent] WITH CHECK ADD CONSTRAINT [FK_StudentSectionClassPeriodAttendanceEvent_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionClassPeriodAttendanceEvent_Section]
ON [de].[StudentSectionClassPeriodAttendanceEvent] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [de].[StudentSectionClassPeriodAttendanceEvent] WITH CHECK ADD CONSTRAINT [FK_StudentSectionClassPeriodAttendanceEvent_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionClassPeriodAttendanceEvent_Student]
ON [de].[StudentSectionClassPeriodAttendanceEvent] ([StudentUSI] ASC)
GO

ALTER TABLE [de].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_DiplomaCertificateCategoryDescriptor] FOREIGN KEY ([DiplomaCertificateCategoryDescriptorId])
REFERENCES [de].[DiplomaCertificateCategoryDescriptor] ([DiplomaCertificateCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_DiplomaCertificateCategoryDescriptor]
ON [de].[StudentSpecialEducationProgramAssociationExtension] ([DiplomaCertificateCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_FundingNeedsCategoryDescriptor] FOREIGN KEY ([FundingNeedsCategoryDescriptorId])
REFERENCES [de].[FundingNeedsCategoryDescriptor] ([FundingNeedsCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_FundingNeedsCategoryDescriptor]
ON [de].[StudentSpecialEducationProgramAssociationExtension] ([FundingNeedsCategoryDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_School] FOREIGN KEY ([PrivateSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_School]
ON [de].[StudentSpecialEducationProgramAssociationExtension] ([PrivateSchoolId] ASC)
GO

ALTER TABLE [de].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_ServiceStatusDescriptor] FOREIGN KEY ([ServiceStatusDescriptorId])
REFERENCES [de].[ServiceStatusDescriptor] ([ServiceStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_ServiceStatusDescriptor]
ON [de].[StudentSpecialEducationProgramAssociationExtension] ([ServiceStatusDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [de].[StudentTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentTransportation_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentTransportation_LocalEducationAgency]
ON [de].[StudentTransportation] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [de].[StudentTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentTransportation_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentTransportation_Student]
ON [de].[StudentTransportation] ([StudentUSI] ASC)
GO

ALTER TABLE [de].[StudentTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentTransportation_TravelDayOfWeekDescriptor] FOREIGN KEY ([TravelDayOfWeekDescriptorId])
REFERENCES [de].[TravelDayOfWeekDescriptor] ([TravelDayOfWeekDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentTransportation_TravelDayOfWeekDescriptor]
ON [de].[StudentTransportation] ([TravelDayOfWeekDescriptorId] ASC)
GO

ALTER TABLE [de].[StudentTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentTransportation_TravelDirectionDescriptor] FOREIGN KEY ([TravelDirectionDescriptorId])
REFERENCES [de].[TravelDirectionDescriptor] ([TravelDirectionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentTransportation_TravelDirectionDescriptor]
ON [de].[StudentTransportation] ([TravelDirectionDescriptorId] ASC)
GO

ALTER TABLE [de].[SupportPlanChangeDescriptor] WITH CHECK ADD CONSTRAINT [FK_SupportPlanChangeDescriptor_Descriptor] FOREIGN KEY ([SupportPlanChangeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[TravelDayOfWeekDescriptor] WITH CHECK ADD CONSTRAINT [FK_TravelDayOfWeekDescriptor_Descriptor] FOREIGN KEY ([TravelDayOfWeekDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[TravelDirectionDescriptor] WITH CHECK ADD CONSTRAINT [FK_TravelDirectionDescriptor_Descriptor] FOREIGN KEY ([TravelDirectionDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[TreatmentDescriptor] WITH CHECK ADD CONSTRAINT [FK_TreatmentDescriptor_Descriptor] FOREIGN KEY ([TreatmentDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [de].[VictimCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_VictimCategoryDescriptor_Descriptor] FOREIGN KEY ([VictimCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

