ALTER TABLE [mn].[AncestryEthnicOriginDescriptor] WITH CHECK ADD CONSTRAINT [FK_AncestryEthnicOriginDescriptor_Descriptor] FOREIGN KEY ([AncestryEthnicOriginDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[AssessmentCharacteristicDescriptor] WITH CHECK ADD CONSTRAINT [FK_AssessmentCharacteristicDescriptor_Descriptor] FOREIGN KEY ([AssessmentCharacteristicDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[AssessmentFormatDescriptor] WITH CHECK ADD CONSTRAINT [FK_AssessmentFormatDescriptor_Descriptor] FOREIGN KEY ([AssessmentFormatDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[AssessmentStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_AssessmentStatusDescriptor_Descriptor] FOREIGN KEY ([AssessmentStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[AssessmentTierDescriptor] WITH CHECK ADD CONSTRAINT [FK_AssessmentTierDescriptor_Descriptor] FOREIGN KEY ([AssessmentTierDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[AssessmentToolDescriptor] WITH CHECK ADD CONSTRAINT [FK_AssessmentToolDescriptor_Descriptor] FOREIGN KEY ([AssessmentToolDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[CalendarExtension] WITH CHECK ADD CONSTRAINT [FK_CalendarExtension_Calendar] FOREIGN KEY ([CalendarCode], [SchoolId], [SchoolYear])
REFERENCES [edfi].[Calendar] ([CalendarCode], [SchoolId], [SchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[CalendarExtension] WITH CHECK ADD CONSTRAINT [FK_CalendarExtension_KindergartenScheduleDescriptor] FOREIGN KEY ([KindergartenScheduleDescriptorId])
REFERENCES [mn].[KindergartenScheduleDescriptor] ([KindergartenScheduleDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CalendarExtension_KindergartenScheduleDescriptor]
ON [mn].[CalendarExtension] ([KindergartenScheduleDescriptorId] ASC)
GO

ALTER TABLE [mn].[CareerClusterDescriptor] WITH CHECK ADD CONSTRAINT [FK_CareerClusterDescriptor_Descriptor] FOREIGN KEY ([CareerClusterDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[ClassPeriodExtension] WITH CHECK ADD CONSTRAINT [FK_ClassPeriodExtension_ClassPeriod] FOREIGN KEY ([ClassPeriodName], [SchoolId])
REFERENCES [edfi].[ClassPeriod] ([ClassPeriodName], [SchoolId])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [mn].[ClassPeriodExtension] WITH CHECK ADD CONSTRAINT [FK_ClassPeriodExtension_ClassPeriodTypeDescriptor] FOREIGN KEY ([ClassPeriodTypeDescriptorId])
REFERENCES [mn].[ClassPeriodTypeDescriptor] ([ClassPeriodTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ClassPeriodExtension_ClassPeriodTypeDescriptor]
ON [mn].[ClassPeriodExtension] ([ClassPeriodTypeDescriptorId] ASC)
GO

ALTER TABLE [mn].[ClassPeriodTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ClassPeriodTypeDescriptor_Descriptor] FOREIGN KEY ([ClassPeriodTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[ClassroomVolunteerDescriptor] WITH CHECK ADD CONSTRAINT [FK_ClassroomVolunteerDescriptor_Descriptor] FOREIGN KEY ([ClassroomVolunteerDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[CourseAssessmentTool] WITH CHECK ADD CONSTRAINT [FK_CourseAssessmentTool_AssessmentToolDescriptor] FOREIGN KEY ([AssessmentToolDescriptorId])
REFERENCES [mn].[AssessmentToolDescriptor] ([AssessmentToolDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseAssessmentTool_AssessmentToolDescriptor]
ON [mn].[CourseAssessmentTool] ([AssessmentToolDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseAssessmentTool] WITH CHECK ADD CONSTRAINT [FK_CourseAssessmentTool_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseAssessmentTool_Course]
ON [mn].[CourseAssessmentTool] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [mn].[CourseAssessmentTool] WITH CHECK ADD CONSTRAINT [FK_CourseAssessmentTool_ImplementationStatusDescriptor] FOREIGN KEY ([ImplementationStatusDescriptorId])
REFERENCES [mn].[ImplementationStatusDescriptor] ([ImplementationStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseAssessmentTool_ImplementationStatusDescriptor]
ON [mn].[CourseAssessmentTool] ([ImplementationStatusDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_CourseCourseAssociation_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseCourseAssociation_Course]
ON [mn].[CourseCourseAssociation] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [mn].[CourseCourseAssociation] WITH CHECK ADD CONSTRAINT [FK_CourseCourseAssociation_Course1] FOREIGN KEY ([ToCourseCode], [ToCourseEducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseCourseAssociation_Course1]
ON [mn].[CourseCourseAssociation] ([ToCourseCode] ASC, [ToCourseEducationOrganizationId] ASC)
GO

ALTER TABLE [mn].[CourseCurriculumUsed] WITH CHECK ADD CONSTRAINT [FK_CourseCurriculumUsed_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseCurriculumUsed_Course]
ON [mn].[CourseCurriculumUsed] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [mn].[CourseCurriculumUsed] WITH CHECK ADD CONSTRAINT [FK_CourseCurriculumUsed_CurriculumUsedDescriptor] FOREIGN KEY ([CurriculumUsedDescriptorId])
REFERENCES [edfi].[CurriculumUsedDescriptor] ([CurriculumUsedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseCurriculumUsed_CurriculumUsedDescriptor]
ON [mn].[CourseCurriculumUsed] ([CurriculumUsedDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseCurriculumUsed] WITH CHECK ADD CONSTRAINT [FK_CourseCurriculumUsed_ImplementationStatusDescriptor] FOREIGN KEY ([ImplementationStatusDescriptorId])
REFERENCES [mn].[ImplementationStatusDescriptor] ([ImplementationStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseCurriculumUsed_ImplementationStatusDescriptor]
ON [mn].[CourseCurriculumUsed] ([ImplementationStatusDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_CareerClusterDescriptor] FOREIGN KEY ([CareerClusterDescriptorId])
REFERENCES [mn].[CareerClusterDescriptor] ([CareerClusterDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_CareerClusterDescriptor]
ON [mn].[CourseExtension] ([CareerClusterDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_EarlyEducationCourseLocationDescriptor] FOREIGN KEY ([EarlyEducationCourseLocationDescriptorId])
REFERENCES [mn].[EarlyEducationCourseLocationDescriptor] ([EarlyEducationCourseLocationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_EarlyEducationCourseLocationDescriptor]
ON [mn].[CourseExtension] ([EarlyEducationCourseLocationDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseExtension] WITH CHECK ADD CONSTRAINT [FK_CourseExtension_StandardAddressedDescriptor] FOREIGN KEY ([StandardAddressedDescriptorId])
REFERENCES [mn].[StandardAddressedDescriptor] ([StandardAddressedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseExtension_StandardAddressedDescriptor]
ON [mn].[CourseExtension] ([StandardAddressedDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseLevelType] WITH CHECK ADD CONSTRAINT [FK_CourseLevelType_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseLevelType_Course]
ON [mn].[CourseLevelType] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [mn].[CourseLevelType] WITH CHECK ADD CONSTRAINT [FK_CourseLevelType_CourseLevelTypeDescriptor] FOREIGN KEY ([CourseLevelTypeDescriptorId])
REFERENCES [mn].[CourseLevelTypeDescriptor] ([CourseLevelTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseLevelType_CourseLevelTypeDescriptor]
ON [mn].[CourseLevelType] ([CourseLevelTypeDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseLevelTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_CourseLevelTypeDescriptor_Descriptor] FOREIGN KEY ([CourseLevelTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[CourseOfferingExtension] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingExtension_CourseOffering] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
REFERENCES [edfi].[CourseOffering] ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [mn].[CourseOfferingInstructionalApproach] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingInstructionalApproach_CourseOffering] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
REFERENCES [edfi].[CourseOffering] ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingInstructionalApproach_CourseOffering]
ON [mn].[CourseOfferingInstructionalApproach] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SessionName] ASC)
GO

ALTER TABLE [mn].[CourseOfferingInstructionalApproach] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingInstructionalApproach_ImplementationStatusDescriptor] FOREIGN KEY ([ImplementationStatusDescriptorId])
REFERENCES [mn].[ImplementationStatusDescriptor] ([ImplementationStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingInstructionalApproach_ImplementationStatusDescriptor]
ON [mn].[CourseOfferingInstructionalApproach] ([ImplementationStatusDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseOfferingInstructionalApproach] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingInstructionalApproach_InstructionalApproachDescriptor] FOREIGN KEY ([InstructionalApproachDescriptorId])
REFERENCES [mn].[InstructionalApproachDescriptor] ([InstructionalApproachDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingInstructionalApproach_InstructionalApproachDescriptor]
ON [mn].[CourseOfferingInstructionalApproach] ([InstructionalApproachDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseOfferingSiteBasedInitiative] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingSiteBasedInitiative_CourseOffering] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
REFERENCES [edfi].[CourseOffering] ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingSiteBasedInitiative_CourseOffering]
ON [mn].[CourseOfferingSiteBasedInitiative] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SessionName] ASC)
GO

ALTER TABLE [mn].[CourseOfferingSiteBasedInitiative] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingSiteBasedInitiative_ImplementationStatusDescriptor] FOREIGN KEY ([ImplementationStatusDescriptorId])
REFERENCES [mn].[ImplementationStatusDescriptor] ([ImplementationStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingSiteBasedInitiative_ImplementationStatusDescriptor]
ON [mn].[CourseOfferingSiteBasedInitiative] ([ImplementationStatusDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseOfferingSiteBasedInitiative] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingSiteBasedInitiative_SiteBasedInitiativeDescriptor] FOREIGN KEY ([SiteBasedInitiativeDescriptorId])
REFERENCES [mn].[SiteBasedInitiativeDescriptor] ([SiteBasedInitiativeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingSiteBasedInitiative_SiteBasedInitiativeDescriptor]
ON [mn].[CourseOfferingSiteBasedInitiative] ([SiteBasedInitiativeDescriptorId] ASC)
GO

ALTER TABLE [mn].[CourseProgram] WITH CHECK ADD CONSTRAINT [FK_CourseProgram_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseProgram_Course]
ON [mn].[CourseProgram] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [mn].[CourseProgram] WITH CHECK ADD CONSTRAINT [FK_CourseProgram_Program] FOREIGN KEY ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseProgram_Program]
ON [mn].[CourseProgram] ([EducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC)
GO

ALTER TABLE [mn].[DistrictTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_DistrictTypeDescriptor_Descriptor] FOREIGN KEY ([DistrictTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[EarlyChildhoodScreenerDescriptor] WITH CHECK ADD CONSTRAINT [FK_EarlyChildhoodScreenerDescriptor_Descriptor] FOREIGN KEY ([EarlyChildhoodScreenerDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[EarlyChildhoodScreeningExitStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_EarlyChildhoodScreeningExitStatusDescriptor_Descriptor] FOREIGN KEY ([EarlyChildhoodScreeningExitStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[EarlyEducationCourseLocationDescriptor] WITH CHECK ADD CONSTRAINT [FK_EarlyEducationCourseLocationDescriptor_Descriptor] FOREIGN KEY ([EarlyEducationCourseLocationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[EdFiSubmissionAccessDescriptor] WITH CHECK ADD CONSTRAINT [FK_EdFiSubmissionAccessDescriptor_Descriptor] FOREIGN KEY ([EdFiSubmissionAccessDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[ExamReimbursementRequest] WITH CHECK ADD CONSTRAINT [FK_ExamReimbursementRequest_AssessmentCategoryDescriptor] FOREIGN KEY ([AssessmentCategoryDescriptorId])
REFERENCES [edfi].[AssessmentCategoryDescriptor] ([AssessmentCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ExamReimbursementRequest_AssessmentCategoryDescriptor]
ON [mn].[ExamReimbursementRequest] ([AssessmentCategoryDescriptorId] ASC)
GO

ALTER TABLE [mn].[ExamReimbursementRequest] WITH CHECK ADD CONSTRAINT [FK_ExamReimbursementRequest_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_ExamReimbursementRequest_StudentEducationOrganizationAssociation]
ON [mn].[ExamReimbursementRequest] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [mn].[FundingSourceDescriptor] WITH CHECK ADD CONSTRAINT [FK_FundingSourceDescriptor_Descriptor] FOREIGN KEY ([FundingSourceDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[GeneralEnrollmentDescriptor] WITH CHECK ADD CONSTRAINT [FK_GeneralEnrollmentDescriptor_Descriptor] FOREIGN KEY ([GeneralEnrollmentDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[GiftedTalentedParticipationDescriptor] WITH CHECK ADD CONSTRAINT [FK_GiftedTalentedParticipationDescriptor_Descriptor] FOREIGN KEY ([GiftedTalentedParticipationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[GradeExtension] WITH CHECK ADD CONSTRAINT [FK_GradeExtension_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_GradeExtension_AcademicSubjectDescriptor]
ON [mn].[GradeExtension] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [mn].[GradeExtension] WITH CHECK ADD CONSTRAINT [FK_GradeExtension_Grade] FOREIGN KEY ([BeginDate], [GradeTypeDescriptorId], [GradingPeriodDescriptorId], [GradingPeriodSchoolYear], [GradingPeriodSequence], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[Grade] ([BeginDate], [GradeTypeDescriptorId], [GradingPeriodDescriptorId], [GradingPeriodSchoolYear], [GradingPeriodSequence], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [mn].[ImplementationStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_ImplementationStatusDescriptor_Descriptor] FOREIGN KEY ([ImplementationStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[InstructionalApproachDescriptor] WITH CHECK ADD CONSTRAINT [FK_InstructionalApproachDescriptor_Descriptor] FOREIGN KEY ([InstructionalApproachDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[InstructionalDeliveryModeDescriptor] WITH CHECK ADD CONSTRAINT [FK_InstructionalDeliveryModeDescriptor_Descriptor] FOREIGN KEY ([InstructionalDeliveryModeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[KindergartenScheduleDescriptor] WITH CHECK ADD CONSTRAINT [FK_KindergartenScheduleDescriptor_Descriptor] FOREIGN KEY ([KindergartenScheduleDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[LocalEducationAgencyExtension] WITH CHECK ADD CONSTRAINT [FK_LocalEducationAgencyExtension_DistrictTypeDescriptor] FOREIGN KEY ([DistrictTypeDescriptorId])
REFERENCES [mn].[DistrictTypeDescriptor] ([DistrictTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_LocalEducationAgencyExtension_DistrictTypeDescriptor]
ON [mn].[LocalEducationAgencyExtension] ([DistrictTypeDescriptorId] ASC)
GO

ALTER TABLE [mn].[LocalEducationAgencyExtension] WITH CHECK ADD CONSTRAINT [FK_LocalEducationAgencyExtension_EdFiSubmissionAccessDescriptor] FOREIGN KEY ([EdFiSubmissionAccessDescriptorId])
REFERENCES [mn].[EdFiSubmissionAccessDescriptor] ([EdFiSubmissionAccessDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_LocalEducationAgencyExtension_EdFiSubmissionAccessDescriptor]
ON [mn].[LocalEducationAgencyExtension] ([EdFiSubmissionAccessDescriptorId] ASC)
GO

ALTER TABLE [mn].[LocalEducationAgencyExtension] WITH CHECK ADD CONSTRAINT [FK_LocalEducationAgencyExtension_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[MembershipAttendanceUnitDescriptor] WITH CHECK ADD CONSTRAINT [FK_MembershipAttendanceUnitDescriptor_Descriptor] FOREIGN KEY ([MembershipAttendanceUnitDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[OptOutIndicatorsDescriptor] WITH CHECK ADD CONSTRAINT [FK_OptOutIndicatorsDescriptor_Descriptor] FOREIGN KEY ([OptOutIndicatorsDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[ParentExtension] WITH CHECK ADD CONSTRAINT [FK_ParentExtension_ClassroomVolunteerDescriptor] FOREIGN KEY ([ClassroomVolunteerDescriptorId])
REFERENCES [mn].[ClassroomVolunteerDescriptor] ([ClassroomVolunteerDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ParentExtension_ClassroomVolunteerDescriptor]
ON [mn].[ParentExtension] ([ClassroomVolunteerDescriptorId] ASC)
GO

ALTER TABLE [mn].[ParentExtension] WITH CHECK ADD CONSTRAINT [FK_ParentExtension_LevelOfEducationDescriptor] FOREIGN KEY ([HighestCompletedLevelOfEducationDescriptorId])
REFERENCES [edfi].[LevelOfEducationDescriptor] ([LevelOfEducationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ParentExtension_LevelOfEducationDescriptor]
ON [mn].[ParentExtension] ([HighestCompletedLevelOfEducationDescriptorId] ASC)
GO

ALTER TABLE [mn].[ParentExtension] WITH CHECK ADD CONSTRAINT [FK_ParentExtension_Parent] FOREIGN KEY ([ParentUSI])
REFERENCES [edfi].[Parent] ([ParentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[ParentIdentificationCode] WITH CHECK ADD CONSTRAINT [FK_ParentIdentificationCode_Parent] FOREIGN KEY ([ParentUSI])
REFERENCES [edfi].[Parent] ([ParentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ParentIdentificationCode_Parent]
ON [mn].[ParentIdentificationCode] ([ParentUSI] ASC)
GO

ALTER TABLE [mn].[PrecodeTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_PrecodeTypeDescriptor_Descriptor] FOREIGN KEY ([PrecodeTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[SchoolClassificationDescriptor] WITH CHECK ADD CONSTRAINT [FK_SchoolClassificationDescriptor_Descriptor] FOREIGN KEY ([SchoolClassificationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_SchoolClassificationDescriptor] FOREIGN KEY ([SchoolClassificationDescriptorId])
REFERENCES [mn].[SchoolClassificationDescriptor] ([SchoolClassificationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SchoolExtension_SchoolClassificationDescriptor]
ON [mn].[SchoolExtension] ([SchoolClassificationDescriptorId] ASC)
GO

ALTER TABLE [mn].[SectionEnrollmentTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_SectionEnrollmentTypeDescriptor_Descriptor] FOREIGN KEY ([SectionEnrollmentTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_InstructionalDeliveryModeDescriptor] FOREIGN KEY ([InstructionalDeliveryModeDescriptorId])
REFERENCES [mn].[InstructionalDeliveryModeDescriptor] ([InstructionalDeliveryModeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionExtension_InstructionalDeliveryModeDescriptor]
ON [mn].[SectionExtension] ([InstructionalDeliveryModeDescriptorId] ASC)
GO

ALTER TABLE [mn].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [mn].[SessionExtension] WITH CHECK ADD CONSTRAINT [FK_SessionExtension_Session] FOREIGN KEY ([SchoolId], [SchoolYear], [SessionName])
REFERENCES [edfi].[Session] ([SchoolId], [SchoolYear], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [mn].[ShippingInstructionDescriptor] WITH CHECK ADD CONSTRAINT [FK_ShippingInstructionDescriptor_Descriptor] FOREIGN KEY ([ShippingInstructionDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[SiteBasedInitiativeDescriptor] WITH CHECK ADD CONSTRAINT [FK_SiteBasedInitiativeDescriptor_Descriptor] FOREIGN KEY ([SiteBasedInitiativeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[SpecialEducationEvaluationStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEducationEvaluationStatusDescriptor_Descriptor] FOREIGN KEY ([SpecialEducationEvaluationStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StandardAddressedDescriptor] WITH CHECK ADD CONSTRAINT [FK_StandardAddressedDescriptor_Descriptor] FOREIGN KEY ([StandardAddressedDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StateAidCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_StateAidCategoryDescriptor_Descriptor] FOREIGN KEY ([StateAidCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[Student21stCenturyLearningCenterGrantProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_Student21stCenturyLearningCenterGrantProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentADSISProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentADSISProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentAssessmentCharacteristic] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentCharacteristic_AssessmentCharacteristicDescriptor] FOREIGN KEY ([AssessmentCharacteristicDescriptorId])
REFERENCES [mn].[AssessmentCharacteristicDescriptor] ([AssessmentCharacteristicDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentCharacteristic_AssessmentCharacteristicDescriptor]
ON [mn].[StudentAssessmentCharacteristic] ([AssessmentCharacteristicDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentCharacteristic] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentCharacteristic_StudentAssessment] FOREIGN KEY ([AssessmentIdentifier], [Namespace], [StudentAssessmentIdentifier], [StudentUSI])
REFERENCES [edfi].[StudentAssessment] ([AssessmentIdentifier], [Namespace], [StudentAssessmentIdentifier], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentCharacteristic_StudentAssessment]
ON [mn].[StudentAssessmentCharacteristic] ([AssessmentIdentifier] ASC, [Namespace] ASC, [StudentAssessmentIdentifier] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentExtension_AssessmentFormatDescriptor] FOREIGN KEY ([AssessmentFormatDescriptorId])
REFERENCES [mn].[AssessmentFormatDescriptor] ([AssessmentFormatDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentExtension_AssessmentFormatDescriptor]
ON [mn].[StudentAssessmentExtension] ([AssessmentFormatDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentExtension_AssessmentTierDescriptor] FOREIGN KEY ([AssessmentTierDescriptorId])
REFERENCES [mn].[AssessmentTierDescriptor] ([AssessmentTierDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentExtension_AssessmentTierDescriptor]
ON [mn].[StudentAssessmentExtension] ([AssessmentTierDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentExtension_EducationOrganization] FOREIGN KEY ([SiteEducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentExtension_EducationOrganization]
ON [mn].[StudentAssessmentExtension] ([SiteEducationOrganizationId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentExtension_GeneralEnrollmentDescriptor] FOREIGN KEY ([GeneralEnrollmentDescriptorId])
REFERENCES [mn].[GeneralEnrollmentDescriptor] ([GeneralEnrollmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentExtension_GeneralEnrollmentDescriptor]
ON [mn].[StudentAssessmentExtension] ([GeneralEnrollmentDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentExtension_StudentAssessment] FOREIGN KEY ([AssessmentIdentifier], [Namespace], [StudentAssessmentIdentifier], [StudentUSI])
REFERENCES [edfi].[StudentAssessment] ([AssessmentIdentifier], [Namespace], [StudentAssessmentIdentifier], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentAssessmentPrecode] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecode_GeneralEnrollmentDescriptor] FOREIGN KEY ([GeneralEnrollmentDescriptorId])
REFERENCES [mn].[GeneralEnrollmentDescriptor] ([GeneralEnrollmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecode_GeneralEnrollmentDescriptor]
ON [mn].[StudentAssessmentPrecode] ([GeneralEnrollmentDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecode] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecode_GradeLevelDescriptor] FOREIGN KEY ([AssessedGradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecode_GradeLevelDescriptor]
ON [mn].[StudentAssessmentPrecode] ([AssessedGradeLevelDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecode] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecode_GradeLevelDescriptor1] FOREIGN KEY ([EnrolledGradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecode_GradeLevelDescriptor1]
ON [mn].[StudentAssessmentPrecode] ([EnrolledGradeLevelDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecode] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecode_PrecodeTypeDescriptor] FOREIGN KEY ([PrecodeTypeDescriptorId])
REFERENCES [mn].[PrecodeTypeDescriptor] ([PrecodeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecode_PrecodeTypeDescriptor]
ON [mn].[StudentAssessmentPrecode] ([PrecodeTypeDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecode] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecode_StudentAssessmentPrecodeSite] FOREIGN KEY ([SiteEducationOrganizationId], [SitePrecodeTypeDescriptorId])
REFERENCES [mn].[StudentAssessmentPrecodeSite] ([EducationOrganizationId], [PrecodeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecode_StudentAssessmentPrecodeSite]
ON [mn].[StudentAssessmentPrecode] ([SiteEducationOrganizationId] ASC, [SitePrecodeTypeDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecode] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecode_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecode_StudentEducationOrganizationAssociation]
ON [mn].[StudentAssessmentPrecode] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecodeAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecodeAcademicSubject_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecodeAcademicSubject_AcademicSubjectDescriptor]
ON [mn].[StudentAssessmentPrecodeAcademicSubject] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecodeAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecodeAcademicSubject_StudentAssessmentPrecode] FOREIGN KEY ([EducationOrganizationId], [PrecodeTypeDescriptorId], [StudentUSI])
REFERENCES [mn].[StudentAssessmentPrecode] ([EducationOrganizationId], [PrecodeTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecodeAcademicSubject_StudentAssessmentPrecode]
ON [mn].[StudentAssessmentPrecodeAcademicSubject] ([EducationOrganizationId] ASC, [PrecodeTypeDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecodeAccommodation] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecodeAccommodation_AccommodationDescriptor] FOREIGN KEY ([AccommodationDescriptorId])
REFERENCES [edfi].[AccommodationDescriptor] ([AccommodationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecodeAccommodation_AccommodationDescriptor]
ON [mn].[StudentAssessmentPrecodeAccommodation] ([AccommodationDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecodeAccommodation] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecodeAccommodation_StudentAssessmentPrecode] FOREIGN KEY ([EducationOrganizationId], [PrecodeTypeDescriptorId], [StudentUSI])
REFERENCES [mn].[StudentAssessmentPrecode] ([EducationOrganizationId], [PrecodeTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecodeAccommodation_StudentAssessmentPrecode]
ON [mn].[StudentAssessmentPrecodeAccommodation] ([EducationOrganizationId] ASC, [PrecodeTypeDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecodeSite] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecodeSite_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecodeSite_EducationOrganization]
ON [mn].[StudentAssessmentPrecodeSite] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecodeSite] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecodeSite_PrecodeTypeDescriptor] FOREIGN KEY ([PrecodeTypeDescriptorId])
REFERENCES [mn].[PrecodeTypeDescriptor] ([PrecodeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecodeSite_PrecodeTypeDescriptor]
ON [mn].[StudentAssessmentPrecodeSite] ([PrecodeTypeDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecodeSiteContactTelephone] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecodeSiteContactTelephone_StudentAssessmentPrecodeSite] FOREIGN KEY ([EducationOrganizationId], [PrecodeTypeDescriptorId])
REFERENCES [mn].[StudentAssessmentPrecodeSite] ([EducationOrganizationId], [PrecodeTypeDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecodeSiteContactTelephone_StudentAssessmentPrecodeSite]
ON [mn].[StudentAssessmentPrecodeSiteContactTelephone] ([EducationOrganizationId] ASC, [PrecodeTypeDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecodeSiteContactTelephone] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecodeSiteContactTelephone_TelephoneNumberTypeDescriptor] FOREIGN KEY ([TelephoneNumberTypeDescriptorId])
REFERENCES [edfi].[TelephoneNumberTypeDescriptor] ([TelephoneNumberTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecodeSiteContactTelephone_TelephoneNumberTypeDescriptor]
ON [mn].[StudentAssessmentPrecodeSiteContactTelephone] ([TelephoneNumberTypeDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecodeSiteShippingInstruction] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecodeSiteShippingInstruction_ShippingInstructionDescriptor] FOREIGN KEY ([ShippingInstructionDescriptorId])
REFERENCES [mn].[ShippingInstructionDescriptor] ([ShippingInstructionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecodeSiteShippingInstruction_ShippingInstructionDescriptor]
ON [mn].[StudentAssessmentPrecodeSiteShippingInstruction] ([ShippingInstructionDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentPrecodeSiteShippingInstruction] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentPrecodeSiteShippingInstruction_StudentAssessmentPrecodeSite] FOREIGN KEY ([EducationOrganizationId], [PrecodeTypeDescriptorId])
REFERENCES [mn].[StudentAssessmentPrecodeSite] ([EducationOrganizationId], [PrecodeTypeDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentPrecodeSiteShippingInstruction_StudentAssessmentPrecodeSite]
ON [mn].[StudentAssessmentPrecodeSiteShippingInstruction] ([EducationOrganizationId] ASC, [PrecodeTypeDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessmentExtension_AssessmentFormatDescriptor] FOREIGN KEY ([AssessmentFormatDescriptorId])
REFERENCES [mn].[AssessmentFormatDescriptor] ([AssessmentFormatDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentStudentObjectiveAssessmentExtension_AssessmentFormatDescriptor]
ON [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] ([AssessmentFormatDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessmentExtension_AssessmentStatusDescriptor] FOREIGN KEY ([AssessmentStatusDescriptorId])
REFERENCES [mn].[AssessmentStatusDescriptor] ([AssessmentStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentStudentObjectiveAssessmentExtension_AssessmentStatusDescriptor]
ON [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] ([AssessmentStatusDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessmentExtension_AssessmentTierDescriptor] FOREIGN KEY ([AssessmentTierDescriptorId])
REFERENCES [mn].[AssessmentTierDescriptor] ([AssessmentTierDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentStudentObjectiveAssessmentExtension_AssessmentTierDescriptor]
ON [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] ([AssessmentTierDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessmentExtension_GradeLevelDescriptor] FOREIGN KEY ([ClusterGradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAssessmentStudentObjectiveAssessmentExtension_GradeLevelDescriptor]
ON [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] ([ClusterGradeLevelDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentAssessmentStudentObjectiveAssessmentExtension_StudentAssessmentStudentObjectiveAssessment] FOREIGN KEY ([AssessmentIdentifier], [IdentificationCode], [Namespace], [StudentAssessmentIdentifier], [StudentUSI])
REFERENCES [edfi].[StudentAssessmentStudentObjectiveAssessment] ([AssessmentIdentifier], [IdentificationCode], [Namespace], [StudentAssessmentIdentifier], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentCEISProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentCEISProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentDistanceLearnerProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentDistanceLearnerProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentEarlyChildhoodScreeningProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyChildhoodScreeningProgramAssociation_EarlyChildhoodScreenerDescriptor] FOREIGN KEY ([EarlyChildhoodScreenerDescriptorId])
REFERENCES [mn].[EarlyChildhoodScreenerDescriptor] ([EarlyChildhoodScreenerDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEarlyChildhoodScreeningProgramAssociation_EarlyChildhoodScreenerDescriptor]
ON [mn].[StudentEarlyChildhoodScreeningProgramAssociation] ([EarlyChildhoodScreenerDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentEarlyChildhoodScreeningProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyChildhoodScreeningProgramAssociation_EarlyChildhoodScreeningExitStatusDescriptor] FOREIGN KEY ([EarlyChildhoodScreeningExitStatusDescriptorId])
REFERENCES [mn].[EarlyChildhoodScreeningExitStatusDescriptor] ([EarlyChildhoodScreeningExitStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEarlyChildhoodScreeningProgramAssociation_EarlyChildhoodScreeningExitStatusDescriptor]
ON [mn].[StudentEarlyChildhoodScreeningProgramAssociation] ([EarlyChildhoodScreeningExitStatusDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentEarlyChildhoodScreeningProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyChildhoodScreeningProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentEarlyEducationProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyEducationProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentEarlyEducationProgramAssociationFundingSource] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyEducationProgramAssociationFundingSource_FundingSourceDescriptor] FOREIGN KEY ([FundingSourceDescriptorId])
REFERENCES [mn].[FundingSourceDescriptor] ([FundingSourceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEarlyEducationProgramAssociationFundingSource_FundingSourceDescriptor]
ON [mn].[StudentEarlyEducationProgramAssociationFundingSource] ([FundingSourceDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentEarlyEducationProgramAssociationFundingSource] WITH CHECK ADD CONSTRAINT [FK_StudentEarlyEducationProgramAssociationFundingSource_StudentEarlyEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [mn].[StudentEarlyEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEarlyEducationProgramAssociationFundingSource_StudentEarlyEducationProgramAssociation]
ON [mn].[StudentEarlyEducationProgramAssociationFundingSource] ([BeginDate] ASC, [EducationOrganizationId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [mn].[StudentEducationOrganizationAssociationAncestryEthnicOrigin] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationAncestryEthnicOrigin_AncestryEthnicOriginDescriptor] FOREIGN KEY ([AncestryEthnicOriginDescriptorId])
REFERENCES [mn].[AncestryEthnicOriginDescriptor] ([AncestryEthnicOriginDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationAncestryEthnicOrigin_AncestryEthnicOriginDescriptor]
ON [mn].[StudentEducationOrganizationAssociationAncestryEthnicOrigin] ([AncestryEthnicOriginDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentEducationOrganizationAssociationAncestryEthnicOrigin] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationAncestryEthnicOrigin_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationAncestryEthnicOrigin_StudentEducationOrganizationAssociation]
ON [mn].[StudentEducationOrganizationAssociationAncestryEthnicOrigin] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [mn].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_CountryDescriptor] FOREIGN KEY ([BirthCountryDescriptorId])
REFERENCES [edfi].[CountryDescriptor] ([CountryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_CountryDescriptor]
ON [mn].[StudentEducationOrganizationAssociationExtension] ([BirthCountryDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_SexDescriptor] FOREIGN KEY ([BirthSexDescriptorId])
REFERENCES [edfi].[SexDescriptor] ([SexDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_SexDescriptor]
ON [mn].[StudentEducationOrganizationAssociationExtension] ([BirthSexDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_StateAbbreviationDescriptor] FOREIGN KEY ([BirthStateAbbreviationDescriptorId])
REFERENCES [edfi].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationExtension_StateAbbreviationDescriptor]
ON [mn].[StudentEducationOrganizationAssociationExtension] ([BirthStateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentEducationOrganizationAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationExtension_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentEducationOrganizationAssociationOptOutIndicators] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationOptOutIndicators_OptOutIndicatorsDescriptor] FOREIGN KEY ([OptOutIndicatorsDescriptorId])
REFERENCES [mn].[OptOutIndicatorsDescriptor] ([OptOutIndicatorsDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationOptOutIndicators_OptOutIndicatorsDescriptor]
ON [mn].[StudentEducationOrganizationAssociationOptOutIndicators] ([OptOutIndicatorsDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentEducationOrganizationAssociationOptOutIndicators] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationOptOutIndicators_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationOptOutIndicators_StudentEducationOrganizationAssociation]
ON [mn].[StudentEducationOrganizationAssociationOptOutIndicators] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [mn].[StudentGiftedTalentedProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentGiftedTalentedProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentGiftedTalentedProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentGiftedTalentedProgramAssociation_GiftedTalentedParticipationDescriptor] FOREIGN KEY ([GiftedTalentedParticipationDescriptorId])
REFERENCES [mn].[GiftedTalentedParticipationDescriptor] ([GiftedTalentedParticipationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentGiftedTalentedProgramAssociation_GiftedTalentedParticipationDescriptor]
ON [mn].[StudentGiftedTalentedProgramAssociation] ([GiftedTalentedParticipationDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentPSEOConcurrentProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentPSEOConcurrentProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentPSEOProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentPSEOProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentSAAPProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentSAAPProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_LocalEducationAgency] FOREIGN KEY ([ResidentLocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_LocalEducationAgency]
ON [mn].[StudentSchoolAssociationExtension] ([ResidentLocalEducationAgencyId] ASC)
GO

ALTER TABLE [mn].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_SpecialEducationEvaluationStatusDescriptor] FOREIGN KEY ([SpecialEducationEvaluationStatusDescriptorId])
REFERENCES [mn].[SpecialEducationEvaluationStatusDescriptor] ([SpecialEducationEvaluationStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_SpecialEducationEvaluationStatusDescriptor]
ON [mn].[StudentSchoolAssociationExtension] ([SpecialEducationEvaluationStatusDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_StateAidCategoryDescriptor] FOREIGN KEY ([StateAidCategoryDescriptorId])
REFERENCES [mn].[StateAidCategoryDescriptor] ([StateAidCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_StateAidCategoryDescriptor]
ON [mn].[StudentSchoolAssociationExtension] ([StateAidCategoryDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [mn].[StudentSchoolAssociationMembership] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationMembership_MembershipAttendanceUnitDescriptor] FOREIGN KEY ([MembershipAttendanceUnitDescriptorId])
REFERENCES [mn].[MembershipAttendanceUnitDescriptor] ([MembershipAttendanceUnitDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationMembership_MembershipAttendanceUnitDescriptor]
ON [mn].[StudentSchoolAssociationMembership] ([MembershipAttendanceUnitDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentSchoolAssociationMembership] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationMembership_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [mn].[StudentSchoolAssociationTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationTransportation_LocalEducationAgency] FOREIGN KEY ([TransportingLocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationTransportation_LocalEducationAgency]
ON [mn].[StudentSchoolAssociationTransportation] ([TransportingLocalEducationAgencyId] ASC)
GO

ALTER TABLE [mn].[StudentSchoolAssociationTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationTransportation_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [mn].[StudentSchoolAssociationTransportation] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationTransportation_TransportationCategoryDescriptor] FOREIGN KEY ([TransportationCategoryDescriptorId])
REFERENCES [mn].[TransportationCategoryDescriptor] ([TransportationCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationTransportation_TransportationCategoryDescriptor]
ON [mn].[StudentSchoolAssociationTransportation] ([TransportationCategoryDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentSection504PlanProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentSection504PlanProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_Course] FOREIGN KEY ([CollegeCourseCode], [CollegeCourseEducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationExtension_Course]
ON [mn].[StudentSectionAssociationExtension] ([CollegeCourseCode] ASC, [CollegeCourseEducationOrganizationId] ASC)
GO

ALTER TABLE [mn].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_SectionEnrollmentTypeDescriptor] FOREIGN KEY ([SectionEnrollmentTypeDescriptorId])
REFERENCES [mn].[SectionEnrollmentTypeDescriptor] ([SectionEnrollmentTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationExtension_SectionEnrollmentTypeDescriptor]
ON [mn].[StudentSectionAssociationExtension] ([SectionEnrollmentTypeDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_StudentSectionAssociation] FOREIGN KEY ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSectionAssociation] ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [mn].[StudentSectionAssociationInstructionalApproach] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationInstructionalApproach_ImplementationStatusDescriptor] FOREIGN KEY ([ImplementationStatusDescriptorId])
REFERENCES [mn].[ImplementationStatusDescriptor] ([ImplementationStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationInstructionalApproach_ImplementationStatusDescriptor]
ON [mn].[StudentSectionAssociationInstructionalApproach] ([ImplementationStatusDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentSectionAssociationInstructionalApproach] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationInstructionalApproach_InstructionalApproachDescriptor] FOREIGN KEY ([InstructionalApproachDescriptorId])
REFERENCES [mn].[InstructionalApproachDescriptor] ([InstructionalApproachDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationInstructionalApproach_InstructionalApproachDescriptor]
ON [mn].[StudentSectionAssociationInstructionalApproach] ([InstructionalApproachDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentSectionAssociationInstructionalApproach] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationInstructionalApproach_StudentSectionAssociation] FOREIGN KEY ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSectionAssociation] ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationInstructionalApproach_StudentSectionAssociation]
ON [mn].[StudentSectionAssociationInstructionalApproach] ([BeginDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [mn].[StudentSectionAssociationSiteBasedInitiative] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationSiteBasedInitiative_ImplementationStatusDescriptor] FOREIGN KEY ([ImplementationStatusDescriptorId])
REFERENCES [mn].[ImplementationStatusDescriptor] ([ImplementationStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationSiteBasedInitiative_ImplementationStatusDescriptor]
ON [mn].[StudentSectionAssociationSiteBasedInitiative] ([ImplementationStatusDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentSectionAssociationSiteBasedInitiative] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationSiteBasedInitiative_SiteBasedInitiativeDescriptor] FOREIGN KEY ([SiteBasedInitiativeDescriptorId])
REFERENCES [mn].[SiteBasedInitiativeDescriptor] ([SiteBasedInitiativeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationSiteBasedInitiative_SiteBasedInitiativeDescriptor]
ON [mn].[StudentSectionAssociationSiteBasedInitiative] ([SiteBasedInitiativeDescriptorId] ASC)
GO

ALTER TABLE [mn].[StudentSectionAssociationSiteBasedInitiative] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationSiteBasedInitiative_StudentSectionAssociation] FOREIGN KEY ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSectionAssociation] ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationSiteBasedInitiative_StudentSectionAssociation]
ON [mn].[StudentSectionAssociationSiteBasedInitiative] ([BeginDate] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [mn].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_LocalEducationAgency] FOREIGN KEY ([PlacingLocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSpecialEducationProgramAssociationExtension_LocalEducationAgency]
ON [mn].[StudentSpecialEducationProgramAssociationExtension] ([PlacingLocalEducationAgencyId] ASC)
GO

ALTER TABLE [mn].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [mn].[TransportationCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_TransportationCategoryDescriptor_Descriptor] FOREIGN KEY ([TransportationCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

