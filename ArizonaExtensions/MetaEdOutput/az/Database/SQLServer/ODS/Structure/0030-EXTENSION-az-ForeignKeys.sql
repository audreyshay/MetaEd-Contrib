ALTER TABLE [az].[AbsenceAmountDescriptor] WITH CHECK ADD CONSTRAINT [FK_AbsenceAmountDescriptor_Descriptor] FOREIGN KEY ([AbsenceAmountDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[CalendarExtension] WITH CHECK ADD CONSTRAINT [FK_CalendarExtension_Calendar] FOREIGN KEY ([CalendarCode], [SchoolId], [SchoolYear])
REFERENCES [edfi].[Calendar] ([CalendarCode], [SchoolId], [SchoolYear])
ON DELETE CASCADE
GO

ALTER TABLE [az].[CalendarExtension] WITH CHECK ADD CONSTRAINT [FK_CalendarExtension_LocalEducationAgency] FOREIGN KEY ([TrackLocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_CalendarExtension_LocalEducationAgency]
ON [az].[CalendarExtension] ([TrackLocalEducationAgencyId] ASC)
GO

ALTER TABLE [az].[CourseEntryDescriptor] WITH CHECK ADD CONSTRAINT [FK_CourseEntryDescriptor_Descriptor] FOREIGN KEY ([CourseEntryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[CourseExitDescriptor] WITH CHECK ADD CONSTRAINT [FK_CourseExitDescriptor_Descriptor] FOREIGN KEY ([CourseExitDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[CourseOfferingCourseSchedule] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingCourseSchedule_CourseOffering] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
REFERENCES [edfi].[CourseOffering] ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingCourseSchedule_CourseOffering]
ON [az].[CourseOfferingCourseSchedule] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SessionName] ASC)
GO

ALTER TABLE [az].[CourseOfferingExtension] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingExtension_CourseOffering] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
REFERENCES [edfi].[CourseOffering] ([LocalCourseCode], [SchoolId], [SchoolYear], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [az].[CourseOfferingExtension] WITH CHECK ADD CONSTRAINT [FK_CourseOfferingExtension_EndOfCourseAssessmentCodeDescriptor] FOREIGN KEY ([EndOfCourseAssessmentCodeDescriptorId])
REFERENCES [az].[EndOfCourseAssessmentCodeDescriptor] ([EndOfCourseAssessmentCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseOfferingExtension_EndOfCourseAssessmentCodeDescriptor]
ON [az].[CourseOfferingExtension] ([EndOfCourseAssessmentCodeDescriptorId] ASC)
GO

ALTER TABLE [az].[EducationLevelDescriptor] WITH CHECK ADD CONSTRAINT [FK_EducationLevelDescriptor_Descriptor] FOREIGN KEY ([EducationLevelDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[EndOfCourseAssessmentCodeDescriptor] WITH CHECK ADD CONSTRAINT [FK_EndOfCourseAssessmentCodeDescriptor_Descriptor] FOREIGN KEY ([EndOfCourseAssessmentCodeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[ExitWithdrawReasonDescriptor] WITH CHECK ADD CONSTRAINT [FK_ExitWithdrawReasonDescriptor_Descriptor] FOREIGN KEY ([ExitWithdrawReasonDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[MembershipFTEDescriptor] WITH CHECK ADD CONSTRAINT [FK_MembershipFTEDescriptor_Descriptor] FOREIGN KEY ([MembershipFTEDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[MembershipResponsibilityDescriptor] WITH CHECK ADD CONSTRAINT [FK_MembershipResponsibilityDescriptor_Descriptor] FOREIGN KEY ([MembershipResponsibilityDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[MembershipTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_MembershipTypeDescriptor_Descriptor] FOREIGN KEY ([MembershipTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[MonthDescriptor] WITH CHECK ADD CONSTRAINT [FK_MonthDescriptor_Descriptor] FOREIGN KEY ([MonthDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[NumberOfInstructionalDaysInWeekDescriptor] WITH CHECK ADD CONSTRAINT [FK_NumberOfInstructionalDaysInWeekDescriptor_Descriptor] FOREIGN KEY ([NumberOfInstructionalDaysInWeekDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[PrimaryNightTimeResidenceDescriptor] WITH CHECK ADD CONSTRAINT [FK_PrimaryNightTimeResidenceDescriptor_Descriptor] FOREIGN KEY ([PrimaryNightTimeResidenceDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[SectionExtension] WITH CHECK ADD CONSTRAINT [FK_SectionExtension_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [az].[SectionExternalProviderTeacher] WITH CHECK ADD CONSTRAINT [FK_SectionExternalProviderTeacher_ClassroomPositionDescriptor] FOREIGN KEY ([ClassroomPositionDescriptorId])
REFERENCES [edfi].[ClassroomPositionDescriptor] ([ClassroomPositionDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SectionExternalProviderTeacher_ClassroomPositionDescriptor]
ON [az].[SectionExternalProviderTeacher] ([ClassroomPositionDescriptorId] ASC)
GO

ALTER TABLE [az].[SectionExternalProviderTeacher] WITH CHECK ADD CONSTRAINT [FK_SectionExternalProviderTeacher_Section] FOREIGN KEY ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
REFERENCES [edfi].[Section] ([LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_SectionExternalProviderTeacher_Section]
ON [az].[SectionExternalProviderTeacher] ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SectionIdentifier] ASC, [SessionName] ASC)
GO

ALTER TABLE [az].[SpecialEnrollmentDescriptor] WITH CHECK ADD CONSTRAINT [FK_SpecialEnrollmentDescriptor_Descriptor] FOREIGN KEY ([SpecialEnrollmentDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[StaffEducationOrganizationEmploymentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationEmploymentAssociationExtension_EducationLevelDescriptor] FOREIGN KEY ([EducationLevelDescriptorId])
REFERENCES [az].[EducationLevelDescriptor] ([EducationLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StaffEducationOrganizationEmploymentAssociationExtension_EducationLevelDescriptor]
ON [az].[StaffEducationOrganizationEmploymentAssociationExtension] ([EducationLevelDescriptorId] ASC)
GO

ALTER TABLE [az].[StaffEducationOrganizationEmploymentAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StaffEducationOrganizationEmploymentAssociationExtension_StaffEducationOrganizationEmploymentAssociation] FOREIGN KEY ([EducationOrganizationId], [EmploymentStatusDescriptorId], [HireDate], [StaffUSI])
REFERENCES [edfi].[StaffEducationOrganizationEmploymentAssociation] ([EducationOrganizationId], [EmploymentStatusDescriptorId], [HireDate], [StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [az].[StudentDropOutRecoveryProgramAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentDropOutRecoveryProgramAssociation_GeneralStudentProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[GeneralStudentProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [az].[StudentDropOutRecoveryProgramMonthlyUpdate] WITH CHECK ADD CONSTRAINT [FK_StudentDropOutRecoveryProgramMonthlyUpdate_MonthDescriptor] FOREIGN KEY ([MonthDescriptorId])
REFERENCES [az].[MonthDescriptor] ([MonthDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentDropOutRecoveryProgramMonthlyUpdate_MonthDescriptor]
ON [az].[StudentDropOutRecoveryProgramMonthlyUpdate] ([MonthDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentDropOutRecoveryProgramMonthlyUpdate] WITH CHECK ADD CONSTRAINT [FK_StudentDropOutRecoveryProgramMonthlyUpdate_StudentDropOutRecoveryProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [az].[StudentDropOutRecoveryProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentDropOutRecoveryProgramMonthlyUpdate_StudentDropOutRecoveryProgramAssociation]
ON [az].[StudentDropOutRecoveryProgramMonthlyUpdate] ([BeginDate] ASC, [EducationOrganizationId] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [az].[StudentEducationOrganizationAssociationAZTribalAffiliation] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationAZTribalAffiliation_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationAZTribalAffiliation_StudentEducationOrganizationAssociation]
ON [az].[StudentEducationOrganizationAssociationAZTribalAffiliation] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [az].[StudentEducationOrganizationAssociationAZTribalAffiliation] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationAZTribalAffiliation_TribalAffiliationDescriptor] FOREIGN KEY ([TribalAffiliationDescriptorId])
REFERENCES [edfi].[TribalAffiliationDescriptor] ([TribalAffiliationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationAZTribalAffiliation_TribalAffiliationDescriptor]
ON [az].[StudentEducationOrganizationAssociationAZTribalAffiliation] ([TribalAffiliationDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentNeed] WITH CHECK ADD CONSTRAINT [FK_StudentNeed_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentNeed_EducationOrganization]
ON [az].[StudentNeed] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [az].[StudentNeed] WITH CHECK ADD CONSTRAINT [FK_StudentNeed_PrimaryNightTimeResidenceDescriptor] FOREIGN KEY ([PrimaryNightTimeResidenceDescriptorId])
REFERENCES [az].[PrimaryNightTimeResidenceDescriptor] ([PrimaryNightTimeResidenceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentNeed_PrimaryNightTimeResidenceDescriptor]
ON [az].[StudentNeed] ([PrimaryNightTimeResidenceDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentNeed] WITH CHECK ADD CONSTRAINT [FK_StudentNeed_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentNeed_Student]
ON [az].[StudentNeed] ([StudentUSI] ASC)
GO

ALTER TABLE [az].[StudentNeed] WITH CHECK ADD CONSTRAINT [FK_StudentNeed_StudentNeedDescriptor] FOREIGN KEY ([StudentNeedDescriptorId])
REFERENCES [az].[StudentNeedDescriptor] ([StudentNeedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentNeed_StudentNeedDescriptor]
ON [az].[StudentNeed] ([StudentNeedDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentNeedCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_StudentNeedCategoryDescriptor_Descriptor] FOREIGN KEY ([StudentNeedCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[StudentNeedDescriptor] WITH CHECK ADD CONSTRAINT [FK_StudentNeedDescriptor_Descriptor] FOREIGN KEY ([StudentNeedDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [az].[StudentNeedDescriptor] WITH CHECK ADD CONSTRAINT [FK_StudentNeedDescriptor_StudentNeedCategoryDescriptor] FOREIGN KEY ([StudentNeedCategoryDescriptorId])
REFERENCES [az].[StudentNeedCategoryDescriptor] ([StudentNeedCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentNeedDescriptor_StudentNeedCategoryDescriptor]
ON [az].[StudentNeedDescriptor] ([StudentNeedCategoryDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentProgramAttendanceEventTimeLog] WITH CHECK ADD CONSTRAINT [FK_StudentProgramAttendanceEventTimeLog_StudentProgramAttendanceEvent] FOREIGN KEY ([AttendanceEventCategoryDescriptorId], [EducationOrganizationId], [EventDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentProgramAttendanceEvent] ([AttendanceEventCategoryDescriptorId], [EducationOrganizationId], [EventDate], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentProgramAttendanceEventTimeLog_StudentProgramAttendanceEvent]
ON [az].[StudentProgramAttendanceEventTimeLog] ([AttendanceEventCategoryDescriptorId] ASC, [EducationOrganizationId] ASC, [EventDate] ASC, [ProgramEducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [az].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_ExitWithdrawReasonDescriptor] FOREIGN KEY ([ExitWithdrawReasonDescriptorId])
REFERENCES [az].[ExitWithdrawReasonDescriptor] ([ExitWithdrawReasonDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_ExitWithdrawReasonDescriptor]
ON [az].[StudentSchoolAssociationExtension] ([ExitWithdrawReasonDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_MembershipTypeDescriptor] FOREIGN KEY ([MembershipTypeDescriptorId])
REFERENCES [az].[MembershipTypeDescriptor] ([MembershipTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationExtension_MembershipTypeDescriptor]
ON [az].[StudentSchoolAssociationExtension] ([MembershipTypeDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentSchoolAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationExtension_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [az].[StudentSchoolAssociationLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationLocalEducationAgency_LocalEducationAgency] FOREIGN KEY ([LocalEducationAgencyId])
REFERENCES [edfi].[LocalEducationAgency] ([LocalEducationAgencyId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationLocalEducationAgency_LocalEducationAgency]
ON [az].[StudentSchoolAssociationLocalEducationAgency] ([LocalEducationAgencyId] ASC)
GO

ALTER TABLE [az].[StudentSchoolAssociationLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationLocalEducationAgency_MembershipResponsibilityDescriptor] FOREIGN KEY ([MembershipResponsibilityDescriptorId])
REFERENCES [az].[MembershipResponsibilityDescriptor] ([MembershipResponsibilityDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationLocalEducationAgency_MembershipResponsibilityDescriptor]
ON [az].[StudentSchoolAssociationLocalEducationAgency] ([MembershipResponsibilityDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentSchoolAssociationLocalEducationAgency] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationLocalEducationAgency_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationLocalEducationAgency_StudentSchoolAssociation]
ON [az].[StudentSchoolAssociationLocalEducationAgency] ([EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [az].[StudentSchoolAssociationMembershipFTE] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationMembershipFTE_MembershipFTEDescriptor] FOREIGN KEY ([MembershipFTEDescriptorId])
REFERENCES [az].[MembershipFTEDescriptor] ([MembershipFTEDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationMembershipFTE_MembershipFTEDescriptor]
ON [az].[StudentSchoolAssociationMembershipFTE] ([MembershipFTEDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentSchoolAssociationMembershipFTE] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationMembershipFTE_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationMembershipFTE_StudentSchoolAssociation]
ON [az].[StudentSchoolAssociationMembershipFTE] ([EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [az].[StudentSchoolAssociationSpecialEnrollment] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationSpecialEnrollment_SpecialEnrollmentDescriptor] FOREIGN KEY ([SpecialEnrollmentDescriptorId])
REFERENCES [az].[SpecialEnrollmentDescriptor] ([SpecialEnrollmentDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationSpecialEnrollment_SpecialEnrollmentDescriptor]
ON [az].[StudentSchoolAssociationSpecialEnrollment] ([SpecialEnrollmentDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentSchoolAssociationSpecialEnrollment] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationSpecialEnrollment_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationSpecialEnrollment_StudentSchoolAssociation]
ON [az].[StudentSchoolAssociationSpecialEnrollment] ([EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [az].[StudentSchoolAssociationTuitionPayer] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationTuitionPayer_StudentSchoolAssociation] FOREIGN KEY ([EntryDate], [SchoolId], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAssociation] ([EntryDate], [SchoolId], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationTuitionPayer_StudentSchoolAssociation]
ON [az].[StudentSchoolAssociationTuitionPayer] ([EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [az].[StudentSchoolAssociationTuitionPayer] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAssociationTuitionPayer_TuitionPayerDescriptor] FOREIGN KEY ([TuitionPayerDescriptorId])
REFERENCES [az].[TuitionPayerDescriptor] ([TuitionPayerDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSchoolAssociationTuitionPayer_TuitionPayerDescriptor]
ON [az].[StudentSchoolAssociationTuitionPayer] ([TuitionPayerDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentSchoolAttendanceEventExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSchoolAttendanceEventExtension_StudentSchoolAttendanceEvent] FOREIGN KEY ([AttendanceEventCategoryDescriptorId], [EventDate], [SchoolId], [SchoolYear], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSchoolAttendanceEvent] ([AttendanceEventCategoryDescriptorId], [EventDate], [SchoolId], [SchoolYear], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [az].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_CourseEntryDescriptor] FOREIGN KEY ([CourseEntryDescriptorId])
REFERENCES [az].[CourseEntryDescriptor] ([CourseEntryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationExtension_CourseEntryDescriptor]
ON [az].[StudentSectionAssociationExtension] ([CourseEntryDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_CourseExitDescriptor] FOREIGN KEY ([CourseExitDescriptorId])
REFERENCES [az].[CourseExitDescriptor] ([CourseExitDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentSectionAssociationExtension_CourseExitDescriptor]
ON [az].[StudentSectionAssociationExtension] ([CourseExitDescriptorId] ASC)
GO

ALTER TABLE [az].[StudentSectionAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSectionAssociationExtension_StudentSectionAssociation] FOREIGN KEY ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
REFERENCES [edfi].[StudentSectionAssociation] ([BeginDate], [LocalCourseCode], [SchoolId], [SchoolYear], [SectionIdentifier], [SessionName], [StudentUSI])
ON DELETE CASCADE
ON UPDATE CASCADE
GO

ALTER TABLE [az].[StudentSpecialEducationProgramAssociationExtension] WITH CHECK ADD CONSTRAINT [FK_StudentSpecialEducationProgramAssociationExtension_StudentSpecialEducationProgramAssociation] FOREIGN KEY ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
REFERENCES [edfi].[StudentSpecialEducationProgramAssociation] ([BeginDate], [EducationOrganizationId], [ProgramEducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId], [StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [az].[TuitionPayerDescriptor] WITH CHECK ADD CONSTRAINT [FK_TuitionPayerDescriptor_Descriptor] FOREIGN KEY ([TuitionPayerDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

