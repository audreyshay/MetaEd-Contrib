ALTER TABLE [arizona].[AbsenceAmountDescriptor] WITH CHECK ADD CONSTRAINT [FK_AbsenceAmountDescriptor_Descriptor] FOREIGN KEY ([AbsenceAmountDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[CalendarDateTrackEvent] WITH CHECK ADD CONSTRAINT [FK_CalendarDateTrackEvent_Track] FOREIGN KEY ([TrackLocalEducationAgencyId], [TrackNumberDescriptorId], [TrackSchoolId])
REFERENCES [arizona].[Track] ([TrackLocalEducationAgencyId], [TrackNumberDescriptorId], [TrackSchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_CalendarDateTrackEvent_Track]
ON [arizona].[CalendarDateTrackEvent] ([TrackLocalEducationAgencyId] ASC, [TrackNumberDescriptorId] ASC, [TrackSchoolId] ASC)
GO

ALTER TABLE [arizona].[CalendarDateTrackEvent] WITH CHECK ADD CONSTRAINT [FK_CalendarDateTrackEvent_TrackEventDescriptor] FOREIGN KEY ([TrackEventDescriptorId])
REFERENCES [arizona].[TrackEventDescriptor] ([TrackEventDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CalendarDateTrackEvent_TrackEventDescriptor]
ON [arizona].[CalendarDateTrackEvent] ([TrackEventDescriptorId] ASC)
GO

ALTER TABLE [arizona].[CourseEntryDescriptor] WITH CHECK ADD CONSTRAINT [FK_CourseEntryDescriptor_Descriptor] FOREIGN KEY ([CourseEntryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[CourseExitDescriptor] WITH CHECK ADD CONSTRAINT [FK_CourseExitDescriptor_Descriptor] FOREIGN KEY ([CourseExitDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[CourseOfferingCourseSchedule] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingCourseSchedule_CourseOffering] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
REFERENCES [edfi].[CourseOffering] ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingCourseSchedule_CourseOffering]
ON [arizona].[CourseOfferingCourseSchedule] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SessionName] ASC)
GO

ALTER TABLE [arizona].[CourseOfferingExtension] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingExtension_CourseOffering] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
REFERENCES [edfi].[CourseOffering] ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[CourseOfferingExtension] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingExtension_EndOfCourseAssessmentCodeDescriptor] FOREIGN KEY ([EndOfCourseAssessmentCodeDescriptorId])
REFERENCES [arizona].[EndOfCourseAssessmentCodeDescriptor] ([EndOfCourseAssessmentCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingExtension_EndOfCourseAssessmentCodeDescriptor]
ON [arizona].[CourseOfferingExtension] ([EndOfCourseAssessmentCodeDescriptorId] ASC)
GO

ALTER TABLE [arizona].[EndOfCourseAssessmentCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_EndOfCourseAssessmentCodeDescriptor_Descriptor] FOREIGN KEY ([EndOfCourseAssessmentCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[ExitWithdrawReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_ExitWithdrawReasonDescriptor_Descriptor] FOREIGN KEY ([ExitWithdrawReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[MembershipFTEDescriptor] WITH CHECK ADD CONSTRAINT [FK_MembershipFTEDescriptor_Descriptor] FOREIGN KEY ([MembershipFTEDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[MembershipResponsibilityDescriptor] WITH CHECK ADD CONSTRAINT [FK_MembershipResponsibilityDescriptor_Descriptor] FOREIGN KEY ([MembershipResponsibilityDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[MembershipTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_MembershipTypeDescriptor_Descriptor] FOREIGN KEY ([MembershipTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[MonthDescriptor] WITH CHECK ADD CONSTRAINT [FK_MonthDescriptor_Descriptor] FOREIGN KEY ([MonthDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[NumberOfInstructionalDaysInWeekDescriptor] WITH CHECK ADD CONSTRAINT [FK_NumberOfInstructionalDaysInWeekDescriptor_Descriptor] FOREIGN KEY ([NumberOfInstructionalDaysInWeekDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[PrimaryNightTimeResidenceDescriptor] WITH CHECK ADD CONSTRAINT [FK_PrimaryNightTimeResidenceDescriptor_Descriptor] FOREIGN KEY ([PrimaryNightTimeResidenceDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[SectionCourseCharacteristic] WITH CHECK ADD CONSTRAINT [FK_SectionCourseCharacteristic_CourseLevelCharacteristicDescriptor] FOREIGN KEY ([CourseLevelCharacteristicDescriptorId])
REFERENCES [edfi].[CourseLevelCharacteristicDescriptor] ([CourseLevelCharacteristicDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionCourseCharacteristic_CourseLevelCharacteristicDescriptor]
ON [arizona].[SectionCourseCharacteristic] ([CourseLevelCharacteristicDescriptorId] ASC)
GO

ALTER TABLE [arizona].[SectionCourseCharacteristic] WITH CHECK ADD CONSTRAINT [FK_SectionCourseCharacteristic_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionCourseCharacteristic_Section]
ON [arizona].[SectionCourseCharacteristic] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [arizona].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [arizona].[SectionExternalProviderTeacher] WITH CHECK ADD CONSTRAINT [FK_SectionExternalProviderTeacher_ClassroomPositionDescriptor] FOREIGN KEY ([ClassroomPositionDescriptorId])
REFERENCES [edfi].[ClassroomPositionDescriptor] ([ClassroomPositionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionExternalProviderTeacher_ClassroomPositionDescriptor]
ON [arizona].[SectionExternalProviderTeacher] ([ClassroomPositionDescriptorId] ASC)
GO

ALTER TABLE [arizona].[SectionExternalProviderTeacher] WITH CHECK ADD CONSTRAINT [FK_SectionExternalProviderTeacher_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionExternalProviderTeacher_Section]
ON [arizona].[SectionExternalProviderTeacher] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [arizona].[SectionGradeLevel] WITH CHECK ADD CONSTRAINT [FK_SectionGradeLevel_GradeLevelDescriptor] FOREIGN KEY ([GradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionGradeLevel_GradeLevelDescriptor]
ON [arizona].[SectionGradeLevel] ([GradeLevelDescriptorId] ASC)
GO

ALTER TABLE [arizona].[SectionGradeLevel] WITH CHECK ADD CONSTRAINT [FK_SectionGradeLevel_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionGradeLevel_Section]
ON [arizona].[SectionGradeLevel] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [arizona].[SessionExtension] WITH CHECK ADD CONSTRAINT [FK_SessionExtension_Session] FOREIGN KEY ([SchoolId], [SchoolYear], [SessionName])
REFERENCES [edfi].[Session] ([SchoolId], [SchoolYear], [SessionName])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[SessionExtension] WITH CHECK ADD CONSTRAINT [FK_SessionExtension_SessionTypeDescriptor] FOREIGN KEY ([SessionTypeDescriptorId])
REFERENCES [arizona].[SessionTypeDescriptor] ([SessionTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SessionExtension_SessionTypeDescriptor]
ON [arizona].[SessionExtension] ([SessionTypeDescriptorId] ASC)
GO

ALTER TABLE [arizona].[SessionTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_SessionTypeDescriptor_Descriptor] FOREIGN KEY ([SessionTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[SpecialEnrollmentDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEnrollmentDescriptor_Descriptor] FOREIGN KEY ([SpecialEnrollmentDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[StudentDropOutRecoveryProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentDropOutRecoveryProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[StudentDropOutRecoveryProgramMonthlyUpdate] WITH CHECK ADD CONSTRAINT [FK_StudentDropOutRecoveryProgramMonthlyUpdate_MonthDescriptor] FOREIGN KEY ([MonthDescriptorId])
REFERENCES [arizona].[MonthDescriptor] ([MonthDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentDropOutRecoveryProgramMonthlyUpdate_MonthDescriptor]
ON [arizona].[StudentDropOutRecoveryProgramMonthlyUpdate] ([MonthDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentDropOutRecoveryProgramMonthlyUpdate] WITH CHECK ADD CONSTRAINT [FK_StudentDropOutRecoveryProgramMonthlyUpdate_StudentDropOutRecoveryProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [arizona].[StudentDropOutRecoveryProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentDropOutRecoveryProgramMonthlyUpdate_StudentDropOutRecoveryProgramAssociation]
ON [arizona].[StudentDropOutRecoveryProgramMonthlyUpdate] ([BeginDate] ASC, [EducationOrganizationId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [arizona].[StudentExtension] WITH CHECK ADD CONSTRAINT [FK_StudentExtension_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[StudentNeed] WITH CHECK ADD CONSTRAINT [FK_StudentNeed_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentNeed_EducationOrganization]
ON [arizona].[StudentNeed] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [arizona].[StudentNeed] WITH CHECK ADD CONSTRAINT [FK_StudentNeed_PrimaryNightTimeResidenceDescriptor] FOREIGN KEY ([PrimaryNightTimeResidenceDescriptorId])
REFERENCES [arizona].[PrimaryNightTimeResidenceDescriptor] ([PrimaryNightTimeResidenceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentNeed_PrimaryNightTimeResidenceDescriptor]
ON [arizona].[StudentNeed] ([PrimaryNightTimeResidenceDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentNeed] WITH CHECK ADD CONSTRAINT [FK_StudentNeed_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentNeed_Student]
ON [arizona].[StudentNeed] ([StudentUSI] ASC)
GO

ALTER TABLE [arizona].[StudentNeed] WITH CHECK ADD CONSTRAINT [FK_StudentNeed_StudentNeedDescriptor] FOREIGN KEY ([StudentNeedDescriptorId])
REFERENCES [arizona].[StudentNeedDescriptor] ([StudentNeedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentNeed_StudentNeedDescriptor]
ON [arizona].[StudentNeed] ([StudentNeedDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentNeedCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_StudentNeedCategoryDescriptor_Descriptor] FOREIGN KEY ([StudentNeedCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[StudentNeedDescriptor] WITH CHECK ADD CONSTRAINT [FK_StudentNeedDescriptor_Descriptor] FOREIGN KEY ([StudentNeedDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[StudentNeedDescriptor] WITH CHECK ADD CONSTRAINT [FK_StudentNeedDescriptor_StudentNeedCategoryDescriptor] FOREIGN KEY ([StudentNeedCategoryDescriptorId])
REFERENCES [arizona].[StudentNeedCategoryDescriptor] ([StudentNeedCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentNeedDescriptor_StudentNeedCategoryDescriptor]
ON [arizona].[StudentNeedDescriptor] ([StudentNeedCategoryDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentProgramAttendanceEventTimeLog] WITH CHECK ADD CONSTRAINT [FK_StudentProgramAttendanceEventTimeLog_StudentProgramAttendanceEvent] FOREIGN KEY ([AttendanceEventCategoryDescriptorId], [EducationOrganizationId], [EventDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentProgramAttendanceEvent] ([AttendanceEventCategoryDescriptorId], [EducationOrganizationId], [EventDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentProgramAttendanceEventTimeLog_StudentProgramAttendanceEvent]
ON [arizona].[StudentProgramAttendanceEventTimeLog] ([AttendanceEventCategoryDescriptorId] ASC, [EducationOrganizationId] ASC, [EventDate] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_ExitWithdrawReasonDescriptor] FOREIGN KEY ([ExitWithdrawReasonDescriptorId])
REFERENCES [arizona].[ExitWithdrawReasonDescriptor] ([ExitWithdrawReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_ExitWithdrawReasonDescriptor]
ON [arizona].[StudentSchoolAssociationExtension] ([ExitWithdrawReasonDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_MembershipTypeDescriptor] FOREIGN KEY ([MembershipTypeDescriptorId])
REFERENCES [arizona].[MembershipTypeDescriptor] ([MembershipTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_MembershipTypeDescriptor]
ON [arizona].[StudentSchoolAssociationExtension] ([MembershipTypeDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [arizona].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_Track] FOREIGN KEY ([TrackLocalEducationAgencyId], [TrackNumberDescriptorId], [TrackSchoolId])
REFERENCES [arizona].[Track] ([TrackLocalEducationAgencyId], [TrackNumberDescriptorId], [TrackSchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_Track]
ON [arizona].[StudentSchoolAssociationExtension] ([TrackLocalEducationAgencyId] ASC, [TrackNumberDescriptorId] ASC, [TrackSchoolId] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationLocalEducationAgency_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationLocalEducationAgency_LocalEducationAgency]
ON [arizona].[StudentSchoolAssociationLocalEducationAgency] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationLocalEducationAgency_MembershipResponsibilityDescriptor] FOREIGN KEY ([MembershipResponsibilityDescriptorId])
REFERENCES [arizona].[MembershipResponsibilityDescriptor] ([MembershipResponsibilityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationLocalEducationAgency_MembershipResponsibilityDescriptor]
ON [arizona].[StudentSchoolAssociationLocalEducationAgency] ([MembershipResponsibilityDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationLocalEducationAgency_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationLocalEducationAgency_StudentSchoolAssociation]
ON [arizona].[StudentSchoolAssociationLocalEducationAgency] ([EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationMembershipFTE] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationMembershipFTE_MembershipFTEDescriptor] FOREIGN KEY ([MembershipFTEDescriptorId])
REFERENCES [arizona].[MembershipFTEDescriptor] ([MembershipFTEDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationMembershipFTE_MembershipFTEDescriptor]
ON [arizona].[StudentSchoolAssociationMembershipFTE] ([MembershipFTEDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationMembershipFTE] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationMembershipFTE_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationMembershipFTE_StudentSchoolAssociation]
ON [arizona].[StudentSchoolAssociationMembershipFTE] ([EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationSpecialEnrollment] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationSpecialEnrollment_SpecialEnrollmentDescriptor] FOREIGN KEY ([SpecialEnrollmentDescriptorId])
REFERENCES [arizona].[SpecialEnrollmentDescriptor] ([SpecialEnrollmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationSpecialEnrollment_SpecialEnrollmentDescriptor]
ON [arizona].[StudentSchoolAssociationSpecialEnrollment] ([SpecialEnrollmentDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationSpecialEnrollment] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationSpecialEnrollment_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationSpecialEnrollment_StudentSchoolAssociation]
ON [arizona].[StudentSchoolAssociationSpecialEnrollment] ([EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationTuitionPayer] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationTuitionPayer_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationTuitionPayer_StudentSchoolAssociation]
ON [arizona].[StudentSchoolAssociationTuitionPayer] ([EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAssociationTuitionPayer] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationTuitionPayer_TuitionPayerDescriptor] FOREIGN KEY ([TuitionPayerDescriptorId])
REFERENCES [arizona].[TuitionPayerDescriptor] ([TuitionPayerDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationTuitionPayer_TuitionPayerDescriptor]
ON [arizona].[StudentSchoolAssociationTuitionPayer] ([TuitionPayerDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAttendanceEventExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAttendanceEventExtension_AbsenceAmountDescriptor] FOREIGN KEY ([AbsenceAmountDescriptorId])
REFERENCES [arizona].[AbsenceAmountDescriptor] ([AbsenceAmountDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAttendanceEventExtension_AbsenceAmountDescriptor]
ON [arizona].[StudentSchoolAttendanceEventExtension] ([AbsenceAmountDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentSchoolAttendanceEventExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAttendanceEventExtension_StudentSchoolAttendanceEvent] FOREIGN KEY ([AttendanceEventCategoryDescriptorId], [EventDate], [SchoolId], [SchoolYear], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAttendanceEvent] ([AttendanceEventCategoryDescriptorId], [EventDate], [SchoolId], [SchoolYear], [SessionName], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_CourseEntryDescriptor] FOREIGN KEY ([CourseEntryDescriptorId])
REFERENCES [arizona].[CourseEntryDescriptor] ([CourseEntryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationExtension_CourseEntryDescriptor]
ON [arizona].[StudentSectionAssociationExtension] ([CourseEntryDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_CourseExitDescriptor] FOREIGN KEY ([CourseExitDescriptorId])
REFERENCES [arizona].[CourseExitDescriptor] ([CourseExitDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationExtension_CourseExitDescriptor]
ON [arizona].[StudentSectionAssociationExtension] ([CourseExitDescriptorId] ASC)
GO

ALTER TABLE [arizona].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_StudentSectionAssociation] FOREIGN KEY ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSectionAssociation] ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [arizona].[Track] WITH CHECK ADD CONSTRAINT [FK_Track_LocalEducationAgency] FOREIGN KEY ([TrackLocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_Track_LocalEducationAgency]
ON [arizona].[Track] ([TrackLocalEducationAgencyId] ASC)
GO

ALTER TABLE [arizona].[Track] WITH CHECK ADD CONSTRAINT [FK_Track_NumberOfInstructionalDaysInWeekDescriptor] FOREIGN KEY ([NumberOfInstructionalDaysInWeekDescriptorId])
REFERENCES [arizona].[NumberOfInstructionalDaysInWeekDescriptor] ([NumberOfInstructionalDaysInWeekDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Track_NumberOfInstructionalDaysInWeekDescriptor]
ON [arizona].[Track] ([NumberOfInstructionalDaysInWeekDescriptorId] ASC)
GO

ALTER TABLE [arizona].[Track] WITH CHECK ADD CONSTRAINT [FK_Track_School] FOREIGN KEY ([TrackSchoolId])
REFERENCES [edfi].[School] ([SchoolId])
GO

CREATE NONCLUSTERED INDEX [FK_Track_School]
ON [arizona].[Track] ([TrackSchoolId] ASC)
GO

ALTER TABLE [arizona].[Track] WITH CHECK ADD CONSTRAINT [FK_Track_TrackNumberDescriptor] FOREIGN KEY ([TrackNumberDescriptorId])
REFERENCES [arizona].[TrackNumberDescriptor] ([TrackNumberDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_Track_TrackNumberDescriptor]
ON [arizona].[Track] ([TrackNumberDescriptorId] ASC)
GO

ALTER TABLE [arizona].[TrackEventDescriptor] WITH CHECK ADD CONSTRAINT [FK_TrackEventDescriptor_Descriptor] FOREIGN KEY ([TrackEventDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[TrackNumberDescriptor] WITH CHECK ADD CONSTRAINT [FK_TrackNumberDescriptor_Descriptor] FOREIGN KEY ([TrackNumberDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [arizona].[TuitionPayerDescriptor] WITH CHECK ADD CONSTRAINT [FK_TuitionPayerDescriptor_Descriptor] FOREIGN KEY ([TuitionPayerDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

