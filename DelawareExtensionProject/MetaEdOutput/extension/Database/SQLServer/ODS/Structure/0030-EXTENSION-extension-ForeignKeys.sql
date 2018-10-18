ALTER TABLE [extension].[AcceptanceStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_AcceptanceStatusDescriptor_Descriptor] FOREIGN KEY ([AcceptanceStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[AllegedBullyingVictim] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictim_IncidentLocationDescriptor] FOREIGN KEY ([IncidentLocationDescriptorId])
REFERENCES [edfi].[IncidentLocationDescriptor] ([IncidentLocationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictim_IncidentLocationDescriptor]
ON [extension].[AllegedBullyingVictim] ([IncidentLocationDescriptorId] ASC)
GO

ALTER TABLE [extension].[AllegedBullyingVictim] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictim_IncidentRelatedToDescriptor] FOREIGN KEY ([ReasonIncidentRelatedToDescriptorId])
REFERENCES [extension].[IncidentRelatedToDescriptor] ([IncidentRelatedToDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictim_IncidentRelatedToDescriptor]
ON [extension].[AllegedBullyingVictim] ([ReasonIncidentRelatedToDescriptorId] ASC)
GO

ALTER TABLE [extension].[AllegedBullyingVictim] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictim_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictim_School]
ON [extension].[AllegedBullyingVictim] ([SchoolId] ASC)
GO

ALTER TABLE [extension].[AllegedBullyingVictim] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictim_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictim_Student]
ON [extension].[AllegedBullyingVictim] ([StudentUSI] ASC)
GO

ALTER TABLE [extension].[AllegedBullyingVictimBullyingCategory] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictimBullyingCategory_AllegedBullyingVictim] FOREIGN KEY ([AllegedIncidentDate], [SchoolId], [StudentUSI])
REFERENCES [extension].[AllegedBullyingVictim] ([AllegedIncidentDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictimBullyingCategory_AllegedBullyingVictim]
ON [extension].[AllegedBullyingVictimBullyingCategory] ([AllegedIncidentDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [extension].[AllegedBullyingVictimBullyingCategory] WITH CHECK ADD CONSTRAINT [FK_AllegedBullyingVictimBullyingCategory_BullyingCategoryDescriptor] FOREIGN KEY ([BullyingCategoryDescriptorId])
REFERENCES [extension].[BullyingCategoryDescriptor] ([BullyingCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_AllegedBullyingVictimBullyingCategory_BullyingCategoryDescriptor]
ON [extension].[AllegedBullyingVictimBullyingCategory] ([BullyingCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[APExamCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_APExamCodeDescriptor_Descriptor] FOREIGN KEY ([APExamCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[AttendanceConfigurationCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_AttendanceConfigurationCategoryDescriptor_Descriptor] FOREIGN KEY ([AttendanceConfigurationCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[BullyingCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_BullyingCategoryDescriptor_Descriptor] FOREIGN KEY ([BullyingCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[CalendarDateExtension] WITH CHECK ADD CONSTRAINT [FK_CalendarDateExtension_CalendarDate] FOREIGN KEY ([CalendarCode], [Date], [SchoolId], [SchoolYear])
REFERENCES [edfi].[CalendarDate] ([CalendarCode], [Date], [SchoolId], [SchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[CalendarDateExtension] WITH CHECK ADD CONSTRAINT [FK_CalendarDateExtension_CycleDescriptor] FOREIGN KEY ([CycleDescriptorId])
REFERENCES [extension].[CycleDescriptor] ([CycleDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CalendarDateExtension_CycleDescriptor]
ON [extension].[CalendarDateExtension] ([CycleDescriptorId] ASC)
GO

ALTER TABLE [extension].[CertificateCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_CertificateCategoryDescriptor_Descriptor] FOREIGN KEY ([CertificateCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[CertificationDescriptor] WITH CHECK ADD CONSTRAINT [FK_CertificationDescriptor_Descriptor] FOREIGN KEY ([CertificationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ChoiceCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_ChoiceCategoryDescriptor_Descriptor] FOREIGN KEY ([ChoiceCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ClassPeriodCycle] WITH CHECK ADD CONSTRAINT [FK_ClassPeriodCycle_ClassPeriod] FOREIGN KEY ([ClassPeriodName], [SchoolId])
REFERENCES [edfi].[ClassPeriod] ([ClassPeriodName], [SchoolId])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ClassPeriodCycle_ClassPeriod]
ON [extension].[ClassPeriodCycle] ([ClassPeriodName] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[ClassPeriodCycle] WITH CHECK ADD CONSTRAINT [FK_ClassPeriodCycle_CycleDescriptor] FOREIGN KEY ([CycleDescriptorId])
REFERENCES [extension].[CycleDescriptor] ([CycleDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ClassPeriodCycle_CycleDescriptor]
ON [extension].[ClassPeriodCycle] ([CycleDescriptorId] ASC)
GO

ALTER TABLE [extension].[ClassPeriodExtension] WITH CHECK ADD CONSTRAINT [FK_ClassPeriodExtension_ClassPeriod] FOREIGN KEY ([ClassPeriodName], [SchoolId])
REFERENCES [edfi].[ClassPeriod] ([ClassPeriodName], [SchoolId])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [extension].[CoreSubjectDescriptor] WITH CHECK ADD CONSTRAINT [FK_CoreSubjectDescriptor_Descriptor] FOREIGN KEY ([CoreSubjectDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_APExamCodeDescriptor] FOREIGN KEY ([APExamCodeDescriptorId])
REFERENCES [extension].[APExamCodeDescriptor] ([APExamCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_APExamCodeDescriptor]
ON [extension].[CourseExtension] ([APExamCodeDescriptorId] ASC)
GO

ALTER TABLE [extension].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_CoreSubjectDescriptor] FOREIGN KEY ([CoreSubjectDescriptorId])
REFERENCES [extension].[CoreSubjectDescriptor] ([CoreSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_CoreSubjectDescriptor]
ON [extension].[CourseExtension] ([CoreSubjectDescriptorId] ASC)
GO

ALTER TABLE [extension].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_CredentialFieldDescriptor] FOREIGN KEY ([StaffCredentialFieldDescriptorId])
REFERENCES [edfi].[CredentialFieldDescriptor] ([CredentialFieldDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_CredentialFieldDescriptor]
ON [extension].[CourseExtension] ([StaffCredentialFieldDescriptorId] ASC)
GO

ALTER TABLE [extension].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_CredentialFieldDescriptor1] FOREIGN KEY ([SecondaryStaffCredentialFieldDescriptorId])
REFERENCES [edfi].[CredentialFieldDescriptor] ([CredentialFieldDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_CredentialFieldDescriptor1]
ON [extension].[CourseExtension] ([SecondaryStaffCredentialFieldDescriptorId] ASC)
GO

ALTER TABLE [extension].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_School] FOREIGN KEY ([UnitCountExceptionSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_School]
ON [extension].[CourseExtension] ([UnitCountExceptionSchoolId] ASC)
GO

ALTER TABLE [extension].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_ServiceStatusDescriptor] FOREIGN KEY ([SecondaryStaffClassroomServiceStatusDescriptorId])
REFERENCES [extension].[ServiceStatusDescriptor] ([ServiceStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_ServiceStatusDescriptor]
ON [extension].[CourseExtension] ([SecondaryStaffClassroomServiceStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_StaffRoleDescriptor] FOREIGN KEY ([SecondaryStaffRoleDescriptorId])
REFERENCES [extension].[StaffRoleDescriptor] ([StaffRoleDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_StaffRoleDescriptor]
ON [extension].[CourseExtension] ([SecondaryStaffRoleDescriptorId] ASC)
GO

ALTER TABLE [extension].[CycleDescriptor] WITH CHECK ADD CONSTRAINT [FK_CycleDescriptor_Descriptor] FOREIGN KEY ([CycleDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[DiplomaCertificateCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_DiplomaCertificateCategoryDescriptor_Descriptor] FOREIGN KEY ([DiplomaCertificateCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[DisciplineDispositionDescriptor] WITH CHECK ADD CONSTRAINT [FK_DisciplineDispositionDescriptor_Descriptor] FOREIGN KEY ([DisciplineDispositionDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[DisciplineIncidentCode] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentCode_BehaviorDescriptor] FOREIGN KEY ([BehaviorDescriptorId])
REFERENCES [edfi].[BehaviorDescriptor] ([BehaviorDescriptorId])
GO

ALTER TABLE [extension].[DisciplineIncidentExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentExtension_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[DisciplineIncidentExtension] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentExtension_IncidentTimeFrameDescriptor] FOREIGN KEY ([IncidentTimeFrameDescriptorId])
REFERENCES [extension].[IncidentTimeFrameDescriptor] ([IncidentTimeFrameDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIncidentExtension_IncidentTimeFrameDescriptor]
ON [extension].[DisciplineIncidentExtension] ([IncidentTimeFrameDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineIncidentReason] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentReason_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIncidentReason_DisciplineIncident]
ON [extension].[DisciplineIncidentReason] ([IncidentIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[DisciplineIncidentReason] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentReason_IncidentRelatedToDescriptor] FOREIGN KEY ([IncidentRelatedToDescriptorId])
REFERENCES [extension].[IncidentRelatedToDescriptor] ([IncidentRelatedToDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIncidentReason_IncidentRelatedToDescriptor]
ON [extension].[DisciplineIncidentReason] ([IncidentRelatedToDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineIncidentReferral] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentReferral_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIncidentReferral_DisciplineIncident]
ON [extension].[DisciplineIncidentReferral] ([IncidentIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[DisciplineIncidentReferral] WITH CHECK ADD CONSTRAINT [FK_DisciplineIncidentReferral_ReferralDescriptor] FOREIGN KEY ([ReferralDescriptorId])
REFERENCES [extension].[ReferralDescriptor] ([ReferralDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIncidentReferral_ReferralDescriptor]
ON [extension].[DisciplineIncidentReferral] ([ReferralDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssue] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssue_IncidentLocationDescriptor] FOREIGN KEY ([IssueIncidentLocationDescriptorId])
REFERENCES [edfi].[IncidentLocationDescriptor] ([IncidentLocationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssue_IncidentLocationDescriptor]
ON [extension].[DisciplineIssue] ([IssueIncidentLocationDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssue] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssue_IssueCategoryDescriptor] FOREIGN KEY ([IssueCategoryDescriptorId])
REFERENCES [extension].[IssueCategoryDescriptor] ([IssueCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssue_IssueCategoryDescriptor]
ON [extension].[DisciplineIssue] ([IssueCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssue] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssue_IssueSourceDescriptor] FOREIGN KEY ([IssueSourceDescriptorId])
REFERENCES [extension].[IssueSourceDescriptor] ([IssueSourceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssue_IssueSourceDescriptor]
ON [extension].[DisciplineIssue] ([IssueSourceDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssue] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssue_IssueStatusDescriptor] FOREIGN KEY ([IssueStatusDescriptorId])
REFERENCES [extension].[IssueStatusDescriptor] ([IssueStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssue_IssueStatusDescriptor]
ON [extension].[DisciplineIssue] ([IssueStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssue] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssue_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssue_School]
ON [extension].[DisciplineIssue] ([SchoolId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssue] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssue_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssue_Staff]
ON [extension].[DisciplineIssue] ([StaffUSI] ASC)
GO

ALTER TABLE [extension].[DisciplineIssueAction] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssueAction_DisciplineIssue] FOREIGN KEY ([IssueIdentifier], [SchoolId])
REFERENCES [extension].[DisciplineIssue] ([IssueIdentifier], [SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssueAction_DisciplineIssue]
ON [extension].[DisciplineIssueAction] ([IssueIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssueAction] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssueAction_IssueActionCategoryDescriptor] FOREIGN KEY ([IssueActionCategoryDescriptorId])
REFERENCES [extension].[IssueActionCategoryDescriptor] ([IssueActionCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssueAction_IssueActionCategoryDescriptor]
ON [extension].[DisciplineIssueAction] ([IssueActionCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssueRefer] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssueRefer_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssueRefer_DisciplineIncident]
ON [extension].[DisciplineIssueRefer] ([IncidentIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssueRefer] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssueRefer_DisciplineIssue] FOREIGN KEY ([IssueIdentifier], [SchoolId])
REFERENCES [extension].[DisciplineIssue] ([IssueIdentifier], [SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssueRefer_DisciplineIssue]
ON [extension].[DisciplineIssueRefer] ([IssueIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssueRefer] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssueRefer_IssueStatusDescriptor] FOREIGN KEY ([ReferIssueStatusDescriptorId])
REFERENCES [extension].[IssueStatusDescriptor] ([IssueStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssueRefer_IssueStatusDescriptor]
ON [extension].[DisciplineIssueRefer] ([ReferIssueStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssueRelated] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssueRelated_DisciplineIssue] FOREIGN KEY ([IssueIdentifier], [SchoolId])
REFERENCES [extension].[DisciplineIssue] ([IssueIdentifier], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssueRelated_DisciplineIssue]
ON [extension].[DisciplineIssueRelated] ([IssueIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssueStudent] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssueStudent_DisciplineIssue] FOREIGN KEY ([IssueIdentifier], [SchoolId])
REFERENCES [extension].[DisciplineIssue] ([IssueIdentifier], [SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssueStudent_DisciplineIssue]
ON [extension].[DisciplineIssueStudent] ([IssueIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssueStudent] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssueStudent_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssueStudent_Student]
ON [extension].[DisciplineIssueStudent] ([StudentUSI] ASC)
GO

ALTER TABLE [extension].[DisciplineIssueStudent] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssueStudent_StudentParticipationCodeDescriptor] FOREIGN KEY ([AdminAssignedStudentParticipationCodeDescriptorId])
REFERENCES [edfi].[StudentParticipationCodeDescriptor] ([StudentParticipationCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssueStudent_StudentParticipationCodeDescriptor]
ON [extension].[DisciplineIssueStudent] ([AdminAssignedStudentParticipationCodeDescriptorId] ASC)
GO

ALTER TABLE [extension].[DisciplineIssueStudent] WITH CHECK ADD CONSTRAINT [FK_DisciplineIssueStudent_StudentParticipationCodeDescriptor1] FOREIGN KEY ([StudentParticipationCodeDescriptorId])
REFERENCES [edfi].[StudentParticipationCodeDescriptor] ([StudentParticipationCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_DisciplineIssueStudent_StudentParticipationCodeDescriptor1]
ON [extension].[DisciplineIssueStudent] ([StudentParticipationCodeDescriptorId] ASC)
GO

ALTER TABLE [extension].[FerpaOptOutDescriptor] WITH CHECK ADD CONSTRAINT [FK_FerpaOptOutDescriptor_Descriptor] FOREIGN KEY ([FerpaOptOutDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[FollowupCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_FollowupCategoryDescriptor_Descriptor] FOREIGN KEY ([FollowupCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[FundingNeedsCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_FundingNeedsCategoryDescriptor_Descriptor] FOREIGN KEY ([FundingNeedsCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[GradeTypeDetail] WITH CHECK ADD CONSTRAINT [FK_GradeTypeDetail_GradeTypeDescriptor] FOREIGN KEY ([GradeTypeDescriptorId])
REFERENCES [edfi].[GradeTypeDescriptor] ([GradeTypeDescriptorId])
GO

ALTER TABLE [extension].[GradeTypeDetail] WITH CHECK ADD CONSTRAINT [FK_GradeTypeDetail_GradeTypeWhenTakenDescriptor] FOREIGN KEY ([GradeTypeWhenTakenDescriptorId])
REFERENCES [extension].[GradeTypeWhenTakenDescriptor] ([GradeTypeWhenTakenDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_GradeTypeDetail_GradeTypeWhenTakenDescriptor]
ON [extension].[GradeTypeDetail] ([GradeTypeWhenTakenDescriptorId] ASC)
GO

ALTER TABLE [extension].[GradeTypeWhenTakenDescriptor] WITH CHECK ADD CONSTRAINT [FK_GradeTypeWhenTakenDescriptor_Descriptor] FOREIGN KEY ([GradeTypeWhenTakenDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[GradingPeriodExtension] WITH CHECK ADD CONSTRAINT [FK_GradingPeriodExtension_GradingPeriod] FOREIGN KEY ([GradingPeriodDescriptorId], [PeriodSequence], [SchoolId], [SchoolYear])
REFERENCES [edfi].[GradingPeriod] ([GradingPeriodDescriptorId], [PeriodSequence], [SchoolId], [SchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ImmunizationCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ImmunizationCodeDescriptor_Descriptor] FOREIGN KEY ([ImmunizationCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IncidentRelatedToDescriptor] WITH CHECK ADD CONSTRAINT [FK_IncidentRelatedToDescriptor_Descriptor] FOREIGN KEY ([IncidentRelatedToDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IncidentTimeFrameDescriptor] WITH CHECK ADD CONSTRAINT [FK_IncidentTimeFrameDescriptor_Descriptor] FOREIGN KEY ([IncidentTimeFrameDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[InjuryDescriptor] WITH CHECK ADD CONSTRAINT [FK_InjuryDescriptor_Descriptor] FOREIGN KEY ([InjuryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IssueActionCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_IssueActionCategoryDescriptor_Descriptor] FOREIGN KEY ([IssueActionCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IssueCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_IssueCategoryDescriptor_Descriptor] FOREIGN KEY ([IssueCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IssueSourceDescriptor] WITH CHECK ADD CONSTRAINT [FK_IssueSourceDescriptor_Descriptor] FOREIGN KEY ([IssueSourceDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[IssueStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_IssueStatusDescriptor_Descriptor] FOREIGN KEY ([IssueStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[LevelDetail] WITH CHECK ADD CONSTRAINT [FK_LevelDetail_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_LevelDetail_School]
ON [extension].[LevelDetail] ([SchoolId] ASC)
GO

ALTER TABLE [extension].[MedicalAlert] WITH CHECK ADD CONSTRAINT [FK_MedicalAlert_MedicalAlertCategoryDescriptor] FOREIGN KEY ([MedicalAlertCategoryDescriptorId])
REFERENCES [extension].[MedicalAlertCategoryDescriptor] ([MedicalAlertCategoryDescriptorId])
GO

ALTER TABLE [extension].[MedicalAlertCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_MedicalAlertCategoryDescriptor_Descriptor] FOREIGN KEY ([MedicalAlertCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[MedicalDispositionDescriptor] WITH CHECK ADD CONSTRAINT [FK_MedicalDispositionDescriptor_Descriptor] FOREIGN KEY ([MedicalDispositionDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[MedicalOfficeVisit] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisit_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisit_Person]
ON [extension].[MedicalOfficeVisit] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[MedicalOfficeVisit] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisit_School] FOREIGN KEY ([SchoolOfServiceSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisit_School]
ON [extension].[MedicalOfficeVisit] ([SchoolOfServiceSchoolId] ASC)
GO

ALTER TABLE [extension].[MedicalOfficeVisitContactType] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitContactType_ContactTypeDescriptor] FOREIGN KEY ([ContactTypeDescriptorId])
REFERENCES [edfi].[ContactTypeDescriptor] ([ContactTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitContactType_ContactTypeDescriptor]
ON [extension].[MedicalOfficeVisitContactType] ([ContactTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[MedicalOfficeVisitContactType] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitContactType_MedicalOfficeVisit] FOREIGN KEY ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[MedicalOfficeVisit] ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitContactType_MedicalOfficeVisit]
ON [extension].[MedicalOfficeVisitContactType] ([OfficeInDate] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[MedicalOfficeVisitMedicalDisposition] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalDisposition_MedicalDispositionDescriptor] FOREIGN KEY ([MedicalDispositionDescriptorId])
REFERENCES [extension].[MedicalDispositionDescriptor] ([MedicalDispositionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalDisposition_MedicalDispositionDescriptor]
ON [extension].[MedicalOfficeVisitMedicalDisposition] ([MedicalDispositionDescriptorId] ASC)
GO

ALTER TABLE [extension].[MedicalOfficeVisitMedicalDisposition] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalDisposition_MedicalOfficeVisit] FOREIGN KEY ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[MedicalOfficeVisit] ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalDisposition_MedicalOfficeVisit]
ON [extension].[MedicalOfficeVisitMedicalDisposition] ([OfficeInDate] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[MedicalOfficeVisitMedicalTreatmentCode] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalTreatmentCode_MedicalOfficeVisit] FOREIGN KEY ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[MedicalOfficeVisit] ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalTreatmentCode_MedicalOfficeVisit]
ON [extension].[MedicalOfficeVisitMedicalTreatmentCode] ([OfficeInDate] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[MedicalOfficeVisitMedicalTreatmentCode] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalTreatmentCode_MedicalTreatmentCodeDescriptor] FOREIGN KEY ([MedicalTreatmentCodeDescriptorId])
REFERENCES [extension].[MedicalTreatmentCodeDescriptor] ([MedicalTreatmentCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalTreatmentCode_MedicalTreatmentCodeDescriptor]
ON [extension].[MedicalOfficeVisitMedicalTreatmentCode] ([MedicalTreatmentCodeDescriptorId] ASC)
GO

ALTER TABLE [extension].[MedicalOfficeVisitMedicalVisitReason] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalVisitReason_MedicalOfficeVisit] FOREIGN KEY ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[MedicalOfficeVisit] ([OfficeInDate], [PersonCategoryDescriptorId], [PersonId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalVisitReason_MedicalOfficeVisit]
ON [extension].[MedicalOfficeVisitMedicalVisitReason] ([OfficeInDate] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[MedicalOfficeVisitMedicalVisitReason] WITH CHECK ADD CONSTRAINT [FK_MedicalOfficeVisitMedicalVisitReason_MedicalVisitReasonDescriptor] FOREIGN KEY ([MedicalVisitReasonDescriptorId])
REFERENCES [extension].[MedicalVisitReasonDescriptor] ([MedicalVisitReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalOfficeVisitMedicalVisitReason_MedicalVisitReasonDescriptor]
ON [extension].[MedicalOfficeVisitMedicalVisitReason] ([MedicalVisitReasonDescriptorId] ASC)
GO

ALTER TABLE [extension].[MedicalReferralFollowUp] WITH CHECK ADD CONSTRAINT [FK_MedicalReferralFollowUp_FollowupCategoryDescriptor] FOREIGN KEY ([FollowupCategoryDescriptorId])
REFERENCES [extension].[FollowupCategoryDescriptor] ([FollowupCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalReferralFollowUp_FollowupCategoryDescriptor]
ON [extension].[MedicalReferralFollowUp] ([FollowupCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[MedicalReferralFollowUp] WITH CHECK ADD CONSTRAINT [FK_MedicalReferralFollowUp_MedicalTestCategoryDescriptor] FOREIGN KEY ([MedicalTestCategoryDescriptorId])
REFERENCES [extension].[MedicalTestCategoryDescriptor] ([MedicalTestCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalReferralFollowUp_MedicalTestCategoryDescriptor]
ON [extension].[MedicalReferralFollowUp] ([MedicalTestCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[MedicalReferralFollowUp] WITH CHECK ADD CONSTRAINT [FK_MedicalReferralFollowUp_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalReferralFollowUp_Person]
ON [extension].[MedicalReferralFollowUp] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[MedicalScreening] WITH CHECK ADD CONSTRAINT [FK_MedicalScreening_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalScreening_GradeLevelDescriptor]
ON [extension].[MedicalScreening] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [extension].[MedicalScreening] WITH CHECK ADD CONSTRAINT [FK_MedicalScreening_MedicalTestCategoryDescriptor] FOREIGN KEY ([MedicalTestCategoryDescriptorId])
REFERENCES [extension].[MedicalTestCategoryDescriptor] ([MedicalTestCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalScreening_MedicalTestCategoryDescriptor]
ON [extension].[MedicalScreening] ([MedicalTestCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[MedicalScreening] WITH CHECK ADD CONSTRAINT [FK_MedicalScreening_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalScreening_Person]
ON [extension].[MedicalScreening] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[MedicalScreening] WITH CHECK ADD CONSTRAINT [FK_MedicalScreening_School] FOREIGN KEY ([SchoolOfServiceSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicalScreening_School]
ON [extension].[MedicalScreening] ([SchoolOfServiceSchoolId] ASC)
GO

ALTER TABLE [extension].[MedicalTestCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_MedicalTestCategoryDescriptor_Descriptor] FOREIGN KEY ([MedicalTestCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[MedicalTreatmentCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_MedicalTreatmentCodeDescriptor_Descriptor] FOREIGN KEY ([MedicalTreatmentCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[MedicalVisitReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_MedicalVisitReasonDescriptor_Descriptor] FOREIGN KEY ([MedicalVisitReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[MedicationBox] WITH CHECK ADD CONSTRAINT [FK_MedicationBox_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_MedicationBox_LocalEducationAgency]
ON [extension].[MedicationBox] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [extension].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_CountryDescriptor] FOREIGN KEY ([BirthCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_CountryDescriptor]
ON [extension].[NonStudent] ([BirthCountryDescriptorId] ASC)
GO

ALTER TABLE [extension].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_LocalEducationAgency]
ON [extension].[NonStudent] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [extension].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_Person]
ON [extension].[NonStudent] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_School]
ON [extension].[NonStudent] ([SchoolId] ASC)
GO

ALTER TABLE [extension].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_SexDescriptor] FOREIGN KEY ([BirthSexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_SexDescriptor]
ON [extension].[NonStudent] ([BirthSexDescriptorId] ASC)
GO

ALTER TABLE [extension].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_SexDescriptor1] FOREIGN KEY ([SexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_SexDescriptor1]
ON [extension].[NonStudent] ([SexDescriptorId] ASC)
GO

ALTER TABLE [extension].[NonStudent] WITH CHECK ADD CONSTRAINT [FK_NonStudent_StateAbbreviationDescriptor] FOREIGN KEY ([BirthStateAbbreviationDescriptorId])
REFERENCES [edfi].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudent_StateAbbreviationDescriptor]
ON [extension].[NonStudent] ([BirthStateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [extension].[NonStudentEthnicity] WITH CHECK ADD CONSTRAINT [FK_NonStudentEthnicity_NonStudent] FOREIGN KEY ([LocalEducationAgencyId], [NonStudentLocalId])
REFERENCES [extension].[NonStudent] ([LocalEducationAgencyId], [NonStudentLocalId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[NonStudentEthnicity] WITH CHECK ADD CONSTRAINT [FK_NonStudentEthnicity_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentEthnicity_RaceDescriptor]
ON [extension].[NonStudentEthnicity] ([RaceDescriptorId] ASC)
GO

ALTER TABLE [extension].[NonStudentEthnicity] WITH CHECK ADD CONSTRAINT [FK_NonStudentEthnicity_RaceDescriptor1] FOREIGN KEY ([FederalRaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentEthnicity_RaceDescriptor1]
ON [extension].[NonStudentEthnicity] ([FederalRaceDescriptorId] ASC)
GO

ALTER TABLE [extension].[NonStudentPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_NonStudentPersonalIdentificationDocument_CountryDescriptor] FOREIGN KEY ([IssuerCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentPersonalIdentificationDocument_CountryDescriptor]
ON [extension].[NonStudentPersonalIdentificationDocument] ([IssuerCountryDescriptorId] ASC)
GO

ALTER TABLE [extension].[NonStudentPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_NonStudentPersonalIdentificationDocument_IdentificationDocumentUseDescriptor] FOREIGN KEY ([IdentificationDocumentUseDescriptorId])
REFERENCES [edfi].[IdentificationDocumentUseDescriptor] ([IdentificationDocumentUseDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentPersonalIdentificationDocument_IdentificationDocumentUseDescriptor]
ON [extension].[NonStudentPersonalIdentificationDocument] ([IdentificationDocumentUseDescriptorId] ASC)
GO

ALTER TABLE [extension].[NonStudentPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_NonStudentPersonalIdentificationDocument_NonStudent] FOREIGN KEY ([LocalEducationAgencyId], [NonStudentLocalId])
REFERENCES [extension].[NonStudent] ([LocalEducationAgencyId], [NonStudentLocalId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentPersonalIdentificationDocument_NonStudent]
ON [extension].[NonStudentPersonalIdentificationDocument] ([LocalEducationAgencyId] ASC, [NonStudentLocalId] ASC)
GO

ALTER TABLE [extension].[NonStudentPersonalIdentificationDocument] WITH CHECK ADD CONSTRAINT [FK_NonStudentPersonalIdentificationDocument_PersonalInformationVerificationDescriptor] FOREIGN KEY ([PersonalInformationVerificationDescriptorId])
REFERENCES [edfi].[PersonalInformationVerificationDescriptor] ([PersonalInformationVerificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_NonStudentPersonalIdentificationDocument_PersonalInformationVerificationDescriptor]
ON [extension].[NonStudentPersonalIdentificationDocument] ([PersonalInformationVerificationDescriptorId] ASC)
GO

ALTER TABLE [extension].[NotificationMethodDescriptor] WITH CHECK ADD CONSTRAINT [FK_NotificationMethodDescriptor_Descriptor] FOREIGN KEY ([NotificationMethodDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ParentAddressExtension] WITH CHECK ADD CONSTRAINT [FK_ParentAddressExtension_ParentAddress] FOREIGN KEY ([AddressTypeDescriptorId], [ParentUSI])
REFERENCES [edfi].[ParentAddress] ([AddressTypeDescriptorId], [ParentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ParticipationCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ParticipationCodeDescriptor_Descriptor] FOREIGN KEY ([ParticipationCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[Person] WITH CHECK ADD CONSTRAINT [FK_Person_PersonCategoryDescriptor] FOREIGN KEY ([PersonCategoryDescriptorId])
REFERENCES [extension].[PersonCategoryDescriptor] ([PersonCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Person_PersonCategoryDescriptor]
ON [extension].[Person] ([PersonCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[PersonCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_PersonCategoryDescriptor_Descriptor] FOREIGN KEY ([PersonCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[PersonDisciplineAction] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineAction_DisciplineActionLengthDifferenceReasonDescriptor] FOREIGN KEY ([DisciplineActionLengthDifferenceReasonDescriptorId])
REFERENCES [edfi].[DisciplineActionLengthDifferenceReasonDescriptor] ([DisciplineActionLengthDifferenceReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineAction_DisciplineActionLengthDifferenceReasonDescriptor]
ON [extension].[PersonDisciplineAction] ([DisciplineActionLengthDifferenceReasonDescriptorId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineAction] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineAction_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineAction_Person]
ON [extension].[PersonDisciplineAction] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineAction] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineAction_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineAction_School]
ON [extension].[PersonDisciplineAction] ([SchoolId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineActionDiscipline] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineActionDiscipline_DisciplineDescriptor] FOREIGN KEY ([DisciplineDescriptorId])
REFERENCES [edfi].[DisciplineDescriptor] ([DisciplineDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineActionDiscipline_DisciplineDescriptor]
ON [extension].[PersonDisciplineActionDiscipline] ([DisciplineDescriptorId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineActionDiscipline] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineActionDiscipline_PersonDisciplineAction] FOREIGN KEY ([ActionIdentifier], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
REFERENCES [extension].[PersonDisciplineAction] ([ActionIdentifier], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineActionDiscipline_PersonDisciplineAction]
ON [extension].[PersonDisciplineActionDiscipline] ([ActionIdentifier] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineActionDisciplineDisposition] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineActionDisciplineDisposition_DisciplineDispositionDescriptor] FOREIGN KEY ([DisciplineDispositionDescriptorId])
REFERENCES [extension].[DisciplineDispositionDescriptor] ([DisciplineDispositionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineActionDisciplineDisposition_DisciplineDispositionDescriptor]
ON [extension].[PersonDisciplineActionDisciplineDisposition] ([DisciplineDispositionDescriptorId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineActionDisciplineDisposition] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineActionDisciplineDisposition_PersonDisciplineAction] FOREIGN KEY ([ActionIdentifier], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
REFERENCES [extension].[PersonDisciplineAction] ([ActionIdentifier], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineActionDisciplineDisposition_PersonDisciplineAction]
ON [extension].[PersonDisciplineActionDisciplineDisposition] ([ActionIdentifier] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineActionPersonDisciplineIncidentAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineActionPersonDisciplineIncidentAssociation_PersonDisciplineAction] FOREIGN KEY ([ActionIdentifier], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
REFERENCES [extension].[PersonDisciplineAction] ([ActionIdentifier], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineActionPersonDisciplineIncidentAssociation_PersonDisciplineAction]
ON [extension].[PersonDisciplineActionPersonDisciplineIncidentAssociation] ([ActionIdentifier] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineActionPersonDisciplineIncidentAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineActionPersonDisciplineIncidentAssociation_PersonDisciplineIncidentAssociation] FOREIGN KEY ([IncidentIdentifier], [ParticipationCodeDescriptorId], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
REFERENCES [extension].[PersonDisciplineIncidentAssociation] ([IncidentIdentifier], [ParticipationCodeDescriptorId], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineActionPersonDisciplineIncidentAssociation_PersonDisciplineIncidentAssociation]
ON [extension].[PersonDisciplineActionPersonDisciplineIncidentAssociation] ([IncidentIdentifier] ASC, [ParticipationCodeDescriptorId] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineIncidentAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociation_DisciplineIncident] FOREIGN KEY ([IncidentIdentifier], [SchoolId])
REFERENCES [edfi].[DisciplineIncident] ([IncidentIdentifier], [SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociation_DisciplineIncident]
ON [extension].[PersonDisciplineIncidentAssociation] ([IncidentIdentifier] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineIncidentAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociation_ParticipationCodeDescriptor] FOREIGN KEY ([ParticipationCodeDescriptorId])
REFERENCES [extension].[ParticipationCodeDescriptor] ([ParticipationCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociation_ParticipationCodeDescriptor]
ON [extension].[PersonDisciplineIncidentAssociation] ([ParticipationCodeDescriptorId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineIncidentAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociation_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociation_Person]
ON [extension].[PersonDisciplineIncidentAssociation] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineIncidentAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociation_VictimCategoryDescriptor] FOREIGN KEY ([VictimCategoryDescriptorId])
REFERENCES [extension].[VictimCategoryDescriptor] ([VictimCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociation_VictimCategoryDescriptor]
ON [extension].[PersonDisciplineIncidentAssociation] ([VictimCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineIncidentAssociationOffenderBehavior] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociationOffenderBehavior_BehaviorDescriptor] FOREIGN KEY ([BehaviorDescriptorId])
REFERENCES [edfi].[BehaviorDescriptor] ([BehaviorDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociationOffenderBehavior_BehaviorDescriptor]
ON [extension].[PersonDisciplineIncidentAssociationOffenderBehavior] ([BehaviorDescriptorId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineIncidentAssociationOffenderBehavior] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociationOffenderBehavior_PersonDisciplineIncidentAssociation] FOREIGN KEY ([IncidentIdentifier], [ParticipationCodeDescriptorId], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
REFERENCES [extension].[PersonDisciplineIncidentAssociation] ([IncidentIdentifier], [ParticipationCodeDescriptorId], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociationOffenderBehavior_PersonDisciplineIncidentAssociation]
ON [extension].[PersonDisciplineIncidentAssociationOffenderBehavior] ([IncidentIdentifier] ASC, [ParticipationCodeDescriptorId] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineIncidentAssociationVictimInjury] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociationVictimInjury_InjuryDescriptor] FOREIGN KEY ([InjuryDescriptorId])
REFERENCES [extension].[InjuryDescriptor] ([InjuryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociationVictimInjury_InjuryDescriptor]
ON [extension].[PersonDisciplineIncidentAssociationVictimInjury] ([InjuryDescriptorId] ASC)
GO

ALTER TABLE [extension].[PersonDisciplineIncidentAssociationVictimInjury] WITH CHECK ADD CONSTRAINT [FK_PersonDisciplineIncidentAssociationVictimInjury_PersonDisciplineIncidentAssociation] FOREIGN KEY ([IncidentIdentifier], [ParticipationCodeDescriptorId], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
REFERENCES [extension].[PersonDisciplineIncidentAssociation] ([IncidentIdentifier], [ParticipationCodeDescriptorId], [PersonCategoryDescriptorId], [PersonId], [SchoolId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PersonDisciplineIncidentAssociationVictimInjury_PersonDisciplineIncidentAssociation]
ON [extension].[PersonDisciplineIncidentAssociationVictimInjury] ([IncidentIdentifier] ASC, [ParticipationCodeDescriptorId] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC, [SchoolId] ASC)
GO

ALTER TABLE [extension].[PersonImmunization] WITH CHECK ADD CONSTRAINT [FK_PersonImmunization_ImmunizationCodeDescriptor] FOREIGN KEY ([ImmunizationCodeDescriptorId])
REFERENCES [extension].[ImmunizationCodeDescriptor] ([ImmunizationCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonImmunization_ImmunizationCodeDescriptor]
ON [extension].[PersonImmunization] ([ImmunizationCodeDescriptorId] ASC)
GO

ALTER TABLE [extension].[PersonImmunization] WITH CHECK ADD CONSTRAINT [FK_PersonImmunization_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonImmunization_Person]
ON [extension].[PersonImmunization] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[PersonMedicalAlert] WITH CHECK ADD CONSTRAINT [FK_PersonMedicalAlert_MedicalAlert] FOREIGN KEY ([MedicalAlertCategoryDescriptorId])
REFERENCES [extension].[MedicalAlert] ([MedicalAlertCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonMedicalAlert_MedicalAlert]
ON [extension].[PersonMedicalAlert] ([MedicalAlertCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[PersonMedicalAlert] WITH CHECK ADD CONSTRAINT [FK_PersonMedicalAlert_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonMedicalAlert_Person]
ON [extension].[PersonMedicalAlert] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[PersonMedicationBoxAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonMedicationBoxAssociation_MedicationBox] FOREIGN KEY ([LocalEducationAgencyId], [MedicationBoxId])
REFERENCES [extension].[MedicationBox] ([LocalEducationAgencyId], [MedicationBoxId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonMedicationBoxAssociation_MedicationBox]
ON [extension].[PersonMedicationBoxAssociation] ([LocalEducationAgencyId] ASC, [MedicationBoxId] ASC)
GO

ALTER TABLE [extension].[PersonMedicationBoxAssociation] WITH CHECK ADD CONSTRAINT [FK_PersonMedicationBoxAssociation_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_PersonMedicationBoxAssociation_Person]
ON [extension].[PersonMedicationBoxAssociation] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[PersonMedicationBoxAssociationIssue] WITH CHECK ADD CONSTRAINT [FK_PersonMedicationBoxAssociationIssue_PersonMedicationBoxAssociation] FOREIGN KEY ([LocalEducationAgencyId], [MedicationBoxId], [PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[PersonMedicationBoxAssociation] ([LocalEducationAgencyId], [MedicationBoxId], [PersonCategoryDescriptorId], [PersonId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PersonMedicationBoxAssociationIssue_PersonMedicationBoxAssociation]
ON [extension].[PersonMedicationBoxAssociationIssue] ([LocalEducationAgencyId] ASC, [MedicationBoxId] ASC, [PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[PostSecondaryDetail] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetail_PostSecondaryEventCategoryDescriptor] FOREIGN KEY ([PostSecondaryEventCategoryDescriptorId])
REFERENCES [edfi].[PostSecondaryEventCategoryDescriptor] ([PostSecondaryEventCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetail_PostSecondaryEventCategoryDescriptor]
ON [extension].[PostSecondaryDetail] ([PostSecondaryEventCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[PostSecondaryDetail] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetail_ReasonNotApplied4PlusCollegeDescriptor] FOREIGN KEY ([ReasonNotApplied4PlusCollegeDescriptorId])
REFERENCES [extension].[ReasonNotApplied4PlusCollegeDescriptor] ([ReasonNotApplied4PlusCollegeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetail_ReasonNotApplied4PlusCollegeDescriptor]
ON [extension].[PostSecondaryDetail] ([ReasonNotApplied4PlusCollegeDescriptorId] ASC)
GO

ALTER TABLE [extension].[PostSecondaryDetail] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetail_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetail_School]
ON [extension].[PostSecondaryDetail] ([SchoolId] ASC)
GO

ALTER TABLE [extension].[PostSecondaryDetail] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetail_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetail_SchoolYearType]
ON [extension].[PostSecondaryDetail] ([SchoolYear] ASC)
GO

ALTER TABLE [extension].[PostSecondaryDetail] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetail_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetail_Student]
ON [extension].[PostSecondaryDetail] ([StudentUSI] ASC)
GO

ALTER TABLE [extension].[PostSecondaryDetailInstitution] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetailInstitution_AcceptanceStatusDescriptor] FOREIGN KEY ([AcceptanceStatusDescriptorId])
REFERENCES [extension].[AcceptanceStatusDescriptor] ([AcceptanceStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetailInstitution_AcceptanceStatusDescriptor]
ON [extension].[PostSecondaryDetailInstitution] ([AcceptanceStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[PostSecondaryDetailInstitution] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetailInstitution_PostSecondaryDetail] FOREIGN KEY ([PostSecondaryEventCategoryDescriptorId], [SchoolId], [SchoolYear], [StudentUSI])
REFERENCES [extension].[PostSecondaryDetail] ([PostSecondaryEventCategoryDescriptorId], [SchoolId], [SchoolYear], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetailInstitution_PostSecondaryDetail]
ON [extension].[PostSecondaryDetailInstitution] ([PostSecondaryEventCategoryDescriptorId] ASC, [SchoolId] ASC, [SchoolYear] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [extension].[PostSecondaryDetailInstitution] WITH CHECK ADD CONSTRAINT [FK_PostSecondaryDetailInstitution_PostSecondaryInstitution] FOREIGN KEY ([PostSecondaryInstitutionId])
REFERENCES [edfi].[PostSecondaryInstitution] ([PostSecondaryInstitutionId])
GO

CREATE NONCLUSTERED INDEX [FK_PostSecondaryDetailInstitution_PostSecondaryInstitution]
ON [extension].[PostSecondaryDetailInstitution] ([PostSecondaryInstitutionId] ASC)
GO

ALTER TABLE [extension].[ReasonNotApplied4PlusCollegeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ReasonNotApplied4PlusCollegeDescriptor_Descriptor] FOREIGN KEY ([ReasonNotApplied4PlusCollegeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[ReferralDescriptor] WITH CHECK ADD CONSTRAINT [FK_ReferralDescriptor_Descriptor] FOREIGN KEY ([ReferralDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[Regulation619ComplianceReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_Regulation619ComplianceReasonDescriptor_Descriptor] FOREIGN KEY ([Regulation619ComplianceReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[RestraintEventCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_RestraintEventCategoryDescriptor_Descriptor] FOREIGN KEY ([RestraintEventCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_IncidentLocationDescriptor] FOREIGN KEY ([IncidentLocationDescriptorId])
REFERENCES [edfi].[IncidentLocationDescriptor] ([IncidentLocationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_IncidentLocationDescriptor]
ON [extension].[RestraintSeclusion] ([IncidentLocationDescriptorId] ASC)
GO

ALTER TABLE [extension].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_NotificationMethodDescriptor] FOREIGN KEY ([NotificationMethodDescriptorId])
REFERENCES [extension].[NotificationMethodDescriptor] ([NotificationMethodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_NotificationMethodDescriptor]
ON [extension].[RestraintSeclusion] ([NotificationMethodDescriptorId] ASC)
GO

ALTER TABLE [extension].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_RestraintEventCategoryDescriptor] FOREIGN KEY ([RestraintEventCategoryDescriptorId])
REFERENCES [extension].[RestraintEventCategoryDescriptor] ([RestraintEventCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_RestraintEventCategoryDescriptor]
ON [extension].[RestraintSeclusion] ([RestraintEventCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_RestraintEventReasonDescriptor] FOREIGN KEY ([RestraintEventReasonDescriptorId])
REFERENCES [edfi].[RestraintEventReasonDescriptor] ([RestraintEventReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_RestraintEventReasonDescriptor]
ON [extension].[RestraintSeclusion] ([RestraintEventReasonDescriptorId] ASC)
GO

ALTER TABLE [extension].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_School]
ON [extension].[RestraintSeclusion] ([SchoolId] ASC)
GO

ALTER TABLE [extension].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_Student]
ON [extension].[RestraintSeclusion] ([StudentUSI] ASC)
GO

ALTER TABLE [extension].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_SupportPlanChangeDescriptor] FOREIGN KEY ([SupportPlanChangeDescriptorId])
REFERENCES [extension].[SupportPlanChangeDescriptor] ([SupportPlanChangeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_SupportPlanChangeDescriptor]
ON [extension].[RestraintSeclusion] ([SupportPlanChangeDescriptorId] ASC)
GO

ALTER TABLE [extension].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_TreatmentDescriptor] FOREIGN KEY ([StaffTreatmentDescriptorId])
REFERENCES [extension].[TreatmentDescriptor] ([TreatmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_TreatmentDescriptor]
ON [extension].[RestraintSeclusion] ([StaffTreatmentDescriptorId] ASC)
GO

ALTER TABLE [extension].[RestraintSeclusion] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusion_TreatmentDescriptor1] FOREIGN KEY ([StudentTreatmentDescriptorId])
REFERENCES [extension].[TreatmentDescriptor] ([TreatmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusion_TreatmentDescriptor1]
ON [extension].[RestraintSeclusion] ([StudentTreatmentDescriptorId] ASC)
GO

ALTER TABLE [extension].[RestraintSeclusionStaffProvidingRestraint] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusionStaffProvidingRestraint_RestraintSeclusion] FOREIGN KEY ([EventDate], [EventTime], [RestraintEventCategoryDescriptorId], [RestraintEventReasonDescriptorId], [SchoolId], [StudentUSI])
REFERENCES [extension].[RestraintSeclusion] ([EventDate], [EventTime], [RestraintEventCategoryDescriptorId], [RestraintEventReasonDescriptorId], [SchoolId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusionStaffProvidingRestraint_RestraintSeclusion]
ON [extension].[RestraintSeclusionStaffProvidingRestraint] ([EventDate] ASC, [EventTime] ASC, [RestraintEventCategoryDescriptorId] ASC, [RestraintEventReasonDescriptorId] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [extension].[RestraintSeclusionStaffProvidingRestraint] WITH CHECK ADD CONSTRAINT [FK_RestraintSeclusionStaffProvidingRestraint_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintSeclusionStaffProvidingRestraint_Staff]
ON [extension].[RestraintSeclusionStaffProvidingRestraint] ([StaffUSI] ASC)
GO

ALTER TABLE [extension].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_AttendanceConfigurationCategoryDescriptor] FOREIGN KEY ([AttendanceConfigurationCategoryDescriptorId])
REFERENCES [extension].[AttendanceConfigurationCategoryDescriptor] ([AttendanceConfigurationCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SchoolExtension_AttendanceConfigurationCategoryDescriptor]
ON [extension].[SchoolExtension] ([AttendanceConfigurationCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_LevelDetail] FOREIGN KEY ([CourseLevelNumber], [CourseSchoolId])
REFERENCES [extension].[LevelDetail] ([LevelNumber], [SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionExtension_LevelDetail]
ON [extension].[SectionExtension] ([CourseLevelNumber] ASC, [CourseSchoolId] ASC)
GO

ALTER TABLE [extension].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [extension].[SectionMarkingPeriod] WITH CHECK ADD CONSTRAINT [FK_SectionMarkingPeriod_GradingPeriodDescriptor] FOREIGN KEY ([GradingPeriodDescriptorId])
REFERENCES [edfi].[GradingPeriodDescriptor] ([GradingPeriodDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionMarkingPeriod_GradingPeriodDescriptor]
ON [extension].[SectionMarkingPeriod] ([GradingPeriodDescriptorId] ASC)
GO

ALTER TABLE [extension].[SectionMarkingPeriod] WITH CHECK ADD CONSTRAINT [FK_SectionMarkingPeriod_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionMarkingPeriod_Section]
ON [extension].[SectionMarkingPeriod] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [extension].[SectionSubjectArea] WITH CHECK ADD CONSTRAINT [FK_SectionSubjectArea_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionSubjectArea_AcademicSubjectDescriptor]
ON [extension].[SectionSubjectArea] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [extension].[SectionSubjectArea] WITH CHECK ADD CONSTRAINT [FK_SectionSubjectArea_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionSubjectArea_Section]
ON [extension].[SectionSubjectArea] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [extension].[ServiceStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_ServiceStatusDescriptor_Descriptor] FOREIGN KEY ([ServiceStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StaffEducationOrganizationAssignmentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationAssignmentAssociationExtension_StaffEducationOrganizationAssignmentAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
REFERENCES [edfi].[StaffEducationOrganizationAssignmentAssociation] ([BeginDate], [EducationOrganizationId], [StaffClassificationDescriptorId], [StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffExtension_Person]
ON [extension].[StaffExtension] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_RaceDescriptor] FOREIGN KEY ([FederalRaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffExtension_RaceDescriptor]
ON [extension].[StaffExtension] ([FederalRaceDescriptorId] ASC)
GO

ALTER TABLE [extension].[StaffExtension] WITH CHECK ADD CONSTRAINT [FK_StaffExtension_Staff] FOREIGN KEY ([StaffUSI])
REFERENCES [edfi].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StaffProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffProgramAssociationExtension_LanguageDescriptor] FOREIGN KEY ([ImmersionLanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffProgramAssociationExtension_LanguageDescriptor]
ON [extension].[StaffProgramAssociationExtension] ([ImmersionLanguageDescriptorId] ASC)
GO

ALTER TABLE [extension].[StaffProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffProgramAssociationExtension_StaffProgramAssociation] FOREIGN KEY ([BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StaffUSI])
REFERENCES [edfi].[StaffProgramAssociation] ([BeginDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StaffRoleDescriptor] WITH CHECK ADD CONSTRAINT [FK_StaffRoleDescriptor_Descriptor] FOREIGN KEY ([StaffRoleDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[Student504ProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_Student504ProgramAssociation_DisabilityDescriptor] FOREIGN KEY ([DisabilityDescriptorId])
REFERENCES [edfi].[DisabilityDescriptor] ([DisabilityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Student504ProgramAssociation_DisabilityDescriptor]
ON [extension].[Student504ProgramAssociation] ([DisabilityDescriptorId] ASC)
GO

ALTER TABLE [extension].[Student504ProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_Student504ProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StudentCTEProgramAssociationCTEProgramExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor] FOREIGN KEY ([FirstCertificationDescriptorId])
REFERENCES [extension].[CertificationDescriptor] ([CertificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor]
ON [extension].[StudentCTEProgramAssociationCTEProgramExtension] ([FirstCertificationDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentCTEProgramAssociationCTEProgramExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor1] FOREIGN KEY ([SecondCertificationDescriptorId])
REFERENCES [extension].[CertificationDescriptor] ([CertificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor1]
ON [extension].[StudentCTEProgramAssociationCTEProgramExtension] ([SecondCertificationDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentCTEProgramAssociationCTEProgramExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor2] FOREIGN KEY ([ThirdCertificationDescriptorId])
REFERENCES [extension].[CertificationDescriptor] ([CertificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationCTEProgramExtension_CertificationDescriptor2]
ON [extension].[StudentCTEProgramAssociationCTEProgramExtension] ([ThirdCertificationDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentCTEProgramAssociationCTEProgramExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgramExtension_StudentCTEProgramAssociationCTEProgram] FOREIGN KEY ([BeginDate], [CareerPathwayDescriptorId], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentCTEProgramAssociationCTEProgram] ([BeginDate], [CareerPathwayDescriptorId], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StudentCTEProgramAssociationCTEProgramExtension] WITH CHECK ADD CONSTRAINT [FK_StudentCTEProgramAssociationCTEProgramExtension_TechnicalSkillsAssessmentDescriptor] FOREIGN KEY ([EndOfPathwayTechnicalSkillsAssessmentDescriptorId])
REFERENCES [edfi].[TechnicalSkillsAssessmentDescriptor] ([TechnicalSkillsAssessmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCTEProgramAssociationCTEProgramExtension_TechnicalSkillsAssessmentDescriptor]
ON [extension].[StudentCTEProgramAssociationCTEProgramExtension] ([EndOfPathwayTechnicalSkillsAssessmentDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentEarlyChildhoodProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyChildhoodProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StudentEarlyChildhoodProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyChildhoodProgramAssociation_Regulation619ComplianceReasonDescriptor] FOREIGN KEY ([Regulation619ComplianceReasonDescriptorId])
REFERENCES [extension].[Regulation619ComplianceReasonDescriptor] ([Regulation619ComplianceReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEarlyChildhoodProgramAssociation_Regulation619ComplianceReasonDescriptor]
ON [extension].[StudentEarlyChildhoodProgramAssociation] ([Regulation619ComplianceReasonDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentEducationOrganizationAssociationAddressExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationAddressExtension_StudentEducationOrganizationAssociationAddress] FOREIGN KEY ([AddressTypeDescriptorId], [EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociationAddress] ([AddressTypeDescriptorId], [EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StudentEducationOrganizationAssociationEthnicity] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationEthnicity_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationEthnicity_RaceDescriptor]
ON [extension].[StudentEducationOrganizationAssociationEthnicity] ([RaceDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentEducationOrganizationAssociationEthnicity] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationEthnicity_RaceDescriptor1] FOREIGN KEY ([FederalRaceDescriptorId])
REFERENCES [edfi].[RaceDescriptor] ([RaceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationEthnicity_RaceDescriptor1]
ON [extension].[StudentEducationOrganizationAssociationEthnicity] ([FederalRaceDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentEducationOrganizationAssociationEthnicity] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationEthnicity_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationEthnicity_StudentEducationOrganizationAssociation]
ON [extension].[StudentEducationOrganizationAssociationEthnicity] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [extension].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_ChoiceCategoryDescriptor] FOREIGN KEY ([ChoiceCategoryDescriptorId])
REFERENCES [extension].[ChoiceCategoryDescriptor] ([ChoiceCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_ChoiceCategoryDescriptor]
ON [extension].[StudentEducationOrganizationAssociationExtension] ([ChoiceCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_FerpaOptOutDescriptor] FOREIGN KEY ([FerpaOptOutDescriptorId])
REFERENCES [extension].[FerpaOptOutDescriptor] ([FerpaOptOutDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_FerpaOptOutDescriptor]
ON [extension].[StudentEducationOrganizationAssociationExtension] ([FerpaOptOutDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StudentEducationOrganizationAssociationMultiliteracy] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationMultiliteracy_CertificateCategoryDescriptor] FOREIGN KEY ([CertificateCategoryDescriptorId])
REFERENCES [extension].[CertificateCategoryDescriptor] ([CertificateCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationMultiliteracy_CertificateCategoryDescriptor]
ON [extension].[StudentEducationOrganizationAssociationMultiliteracy] ([CertificateCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentEducationOrganizationAssociationMultiliteracy] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationMultiliteracy_LanguageDescriptor] FOREIGN KEY ([LanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationMultiliteracy_LanguageDescriptor]
ON [extension].[StudentEducationOrganizationAssociationMultiliteracy] ([LanguageDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentEducationOrganizationAssociationMultiliteracy] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationMultiliteracy_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationMultiliteracy_StudentEducationOrganizationAssociation]
ON [extension].[StudentEducationOrganizationAssociationMultiliteracy] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [extension].[StudentEducationOrganizationAssociationScholarship] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationScholarship_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationScholarship_StudentEducationOrganizationAssociation]
ON [extension].[StudentEducationOrganizationAssociationScholarship] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [extension].[StudentEducationOrganizationResponsibilityAssociationTransfer] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationResponsibilityAssociationTransfer_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationResponsibilityAssociationTransfer_GradeLevelDescriptor]
ON [extension].[StudentEducationOrganizationResponsibilityAssociationTransfer] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentEducationOrganizationResponsibilityAssociationTransfer] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationResponsibilityAssociationTransfer_StudentEducationOrganizationResponsibilityAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ResponsibilityDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationResponsibilityAssociation] ([BeginDate], [EducationOrganizationId], [ResponsibilityDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationResponsibilityAssociationTransfer_StudentEducationOrganizationResponsibilityAssociation]
ON [extension].[StudentEducationOrganizationResponsibilityAssociationTransfer] ([BeginDate] ASC, [EducationOrganizationId] ASC, [ResponsibilityDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [extension].[StudentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentExtension_Person] FOREIGN KEY ([PersonCategoryDescriptorId], [PersonId])
REFERENCES [extension].[Person] ([PersonCategoryDescriptorId], [PersonId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentExtension_Person]
ON [extension].[StudentExtension] ([PersonCategoryDescriptorId] ASC, [PersonId] ASC)
GO

ALTER TABLE [extension].[StudentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentExtension_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] WITH CHECK ADD CONSTRAINT [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_GradeLevelDescriptor]
ON [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] WITH CHECK ADD CONSTRAINT [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_LanguageDescriptor] FOREIGN KEY ([ImmersionLanguageDescriptorId])
REFERENCES [edfi].[LanguageDescriptor] ([LanguageDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_LanguageDescriptor]
ON [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] ([ImmersionLanguageDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] WITH CHECK ADD CONSTRAINT [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_SchoolYearType]
ON [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] ([SchoolYear] ASC)
GO

ALTER TABLE [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] WITH CHECK ADD CONSTRAINT [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_StudentLanguageInstructionProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentLanguageInstructionProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentLanguageInstructionProgramAssociationLanguageImmersion_StudentLanguageInstructionProgramAssociation]
ON [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] ([BeginDate] ASC, [EducationOrganizationId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [extension].[StudentParentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentParentAssociationExtension_ContactTypeDescriptor] FOREIGN KEY ([ContactTypeDescriptorId])
REFERENCES [edfi].[ContactTypeDescriptor] ([ContactTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentParentAssociationExtension_ContactTypeDescriptor]
ON [extension].[StudentParentAssociationExtension] ([ContactTypeDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentParentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentParentAssociationExtension_StudentParentAssociation] FOREIGN KEY ([ParentUSI], [StudentUSI])
REFERENCES [edfi].[StudentParentAssociation] ([ParentUSI], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StudentSchoolAttendanceEventExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAttendanceEventExtension_StudentSchoolAttendanceEvent] FOREIGN KEY ([AttendanceEventCategoryDescriptorId], [EventDate], [SchoolId], [SchoolYear], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAttendanceEvent] ([AttendanceEventCategoryDescriptorId], [EventDate], [SchoolId], [SchoolYear], [SessionName], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_DiplomaCertificateCategoryDescriptor] FOREIGN KEY ([DiplomaCertificateCategoryDescriptorId])
REFERENCES [extension].[DiplomaCertificateCategoryDescriptor] ([DiplomaCertificateCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_DiplomaCertificateCategoryDescriptor]
ON [extension].[StudentSpecialEducationProgramAssociationExtension] ([DiplomaCertificateCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_FundingNeedsCategoryDescriptor] FOREIGN KEY ([FundingNeedsCategoryDescriptorId])
REFERENCES [extension].[FundingNeedsCategoryDescriptor] ([FundingNeedsCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_FundingNeedsCategoryDescriptor]
ON [extension].[StudentSpecialEducationProgramAssociationExtension] ([FundingNeedsCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_ServiceStatusDescriptor] FOREIGN KEY ([ServiceStatusDescriptorId])
REFERENCES [extension].[ServiceStatusDescriptor] ([ServiceStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_ServiceStatusDescriptor]
ON [extension].[StudentSpecialEducationProgramAssociationExtension] ([ServiceStatusDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[StudentTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentTransportation_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentTransportation_LocalEducationAgency]
ON [extension].[StudentTransportation] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [extension].[StudentTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentTransportation_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentTransportation_Student]
ON [extension].[StudentTransportation] ([StudentUSI] ASC)
GO

ALTER TABLE [extension].[StudentTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentTransportation_TravelCategoryDescriptor] FOREIGN KEY ([TravelCategoryDescriptorId])
REFERENCES [extension].[TravelCategoryDescriptor] ([TravelCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentTransportation_TravelCategoryDescriptor]
ON [extension].[StudentTransportation] ([TravelCategoryDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentTransportation_TravelDayOfWeekDescriptor] FOREIGN KEY ([TravelDayOfWeekDescriptorId])
REFERENCES [extension].[TravelDayOfWeekDescriptor] ([TravelDayOfWeekDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentTransportation_TravelDayOfWeekDescriptor]
ON [extension].[StudentTransportation] ([TravelDayOfWeekDescriptorId] ASC)
GO

ALTER TABLE [extension].[StudentTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentTransportation_TravelDirectionDescriptor] FOREIGN KEY ([TravelDirectionDescriptorId])
REFERENCES [extension].[TravelDirectionDescriptor] ([TravelDirectionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentTransportation_TravelDirectionDescriptor]
ON [extension].[StudentTransportation] ([TravelDirectionDescriptorId] ASC)
GO

ALTER TABLE [extension].[SubjectAreaCode] WITH CHECK ADD CONSTRAINT [FK_SubjectAreaCode_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

ALTER TABLE [extension].[SupportPlanChangeDescriptor] WITH CHECK ADD CONSTRAINT [FK_SupportPlanChangeDescriptor_Descriptor] FOREIGN KEY ([SupportPlanChangeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[TravelCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_TravelCategoryDescriptor_Descriptor] FOREIGN KEY ([TravelCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[TravelDayOfWeekDescriptor] WITH CHECK ADD CONSTRAINT [FK_TravelDayOfWeekDescriptor_Descriptor] FOREIGN KEY ([TravelDayOfWeekDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[TravelDirectionDescriptor] WITH CHECK ADD CONSTRAINT [FK_TravelDirectionDescriptor_Descriptor] FOREIGN KEY ([TravelDirectionDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[TreatmentDescriptor] WITH CHECK ADD CONSTRAINT [FK_TreatmentDescriptor_Descriptor] FOREIGN KEY ([TreatmentDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [extension].[VictimCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_VictimCategoryDescriptor_Descriptor] FOREIGN KEY ([VictimCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

