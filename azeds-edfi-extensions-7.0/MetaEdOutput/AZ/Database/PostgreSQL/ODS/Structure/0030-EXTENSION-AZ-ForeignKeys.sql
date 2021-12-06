ALTER TABLE az.AbsenceAmountDescriptor ADD CONSTRAINT FK_97a38a_Descriptor FOREIGN KEY (AbsenceAmountDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.AssessmentOutcomesSummaryDescriptor ADD CONSTRAINT FK_474bde_Descriptor FOREIGN KEY (AssessmentOutcomesSummaryDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.CalendarExtension ADD CONSTRAINT FK_6ff5f6_Calendar FOREIGN KEY (CalendarCode, SchoolId, SchoolYear)
REFERENCES edfi.Calendar (CalendarCode, SchoolId, SchoolYear)
ON DELETE CASCADE
;

ALTER TABLE az.CalendarExtension ADD CONSTRAINT FK_6ff5f6_LocalEducationAgency FOREIGN KEY (TrackLocalEducationAgencyId)
REFERENCES edfi.LocalEducationAgency (LocalEducationAgencyId)
;

CREATE INDEX FK_6ff5f6_LocalEducationAgency
ON az.CalendarExtension (TrackLocalEducationAgencyId ASC);

ALTER TABLE az.CourseEntryDescriptor ADD CONSTRAINT FK_6538d7_Descriptor FOREIGN KEY (CourseEntryDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.CourseExitDescriptor ADD CONSTRAINT FK_039f1d_Descriptor FOREIGN KEY (CourseExitDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.CourseOfferingCourseSchedule ADD CONSTRAINT FK_841284_CourseOffering FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SessionName)
REFERENCES edfi.CourseOffering (LocalCourseCode, SchoolId, SchoolYear, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_841284_CourseOffering
ON az.CourseOfferingCourseSchedule (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SessionName ASC);

ALTER TABLE az.CourseOfferingExtension ADD CONSTRAINT FK_f6d093_CourseOffering FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SessionName)
REFERENCES edfi.CourseOffering (LocalCourseCode, SchoolId, SchoolYear, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE az.CourseOfferingExtension ADD CONSTRAINT FK_f6d093_EndOfCourseAssessmentCodeDescriptor FOREIGN KEY (EndOfCourseAssessmentCodeDescriptorId)
REFERENCES az.EndOfCourseAssessmentCodeDescriptor (EndOfCourseAssessmentCodeDescriptorId)
;

CREATE INDEX FK_f6d093_EndOfCourseAssessmentCodeDescriptor
ON az.CourseOfferingExtension (EndOfCourseAssessmentCodeDescriptorId ASC);

ALTER TABLE az.CourseTranscriptExtension ADD CONSTRAINT FK_440c5c_CourseTranscript FOREIGN KEY (CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
REFERENCES edfi.CourseTranscript (CourseAttemptResultDescriptorId, CourseCode, CourseEducationOrganizationId, EducationOrganizationId, SchoolYear, StudentUSI, TermDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.CourseTranscriptExtension ADD CONSTRAINT FK_440c5c_FinalLetterGradeDescriptor FOREIGN KEY (FinalLetterGradeDescriptorId)
REFERENCES az.FinalLetterGradeDescriptor (FinalLetterGradeDescriptorId)
;

CREATE INDEX FK_440c5c_FinalLetterGradeDescriptor
ON az.CourseTranscriptExtension (FinalLetterGradeDescriptorId ASC);

ALTER TABLE az.EducationLevelDescriptor ADD CONSTRAINT FK_5a3c2c_Descriptor FOREIGN KEY (EducationLevelDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.EndOfCourseAssessmentCodeDescriptor ADD CONSTRAINT FK_b17d42_Descriptor FOREIGN KEY (EndOfCourseAssessmentCodeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.ExitWithdrawReasonDescriptor ADD CONSTRAINT FK_e58e9d_Descriptor FOREIGN KEY (ExitWithdrawReasonDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.FinalLetterGradeDescriptor ADD CONSTRAINT FK_b25edf_Descriptor FOREIGN KEY (FinalLetterGradeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.MembershipFTEDescriptor ADD CONSTRAINT FK_2ab6c0_Descriptor FOREIGN KEY (MembershipFTEDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.MembershipResponsibilityDescriptor ADD CONSTRAINT FK_b807ec_Descriptor FOREIGN KEY (MembershipResponsibilityDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.MembershipTypeDescriptor ADD CONSTRAINT FK_2cdcc2_Descriptor FOREIGN KEY (MembershipTypeDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.MonthDescriptor ADD CONSTRAINT FK_e23589_Descriptor FOREIGN KEY (MonthDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.NumberOfInstructionalDaysInWeekDescriptor ADD CONSTRAINT FK_f79dc4_Descriptor FOREIGN KEY (NumberOfInstructionalDaysInWeekDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.PrimaryNightTimeResidenceDescriptor ADD CONSTRAINT FK_75a5b5_Descriptor FOREIGN KEY (PrimaryNightTimeResidenceDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.SectionExtension ADD CONSTRAINT FK_86dfb3_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE az.SectionExternalProviderTeacher ADD CONSTRAINT FK_1f3000_ClassroomPositionDescriptor FOREIGN KEY (ClassroomPositionDescriptorId)
REFERENCES edfi.ClassroomPositionDescriptor (ClassroomPositionDescriptorId)
;

CREATE INDEX FK_1f3000_ClassroomPositionDescriptor
ON az.SectionExternalProviderTeacher (ClassroomPositionDescriptorId ASC);

ALTER TABLE az.SectionExternalProviderTeacher ADD CONSTRAINT FK_1f3000_Section FOREIGN KEY (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
REFERENCES edfi.Section (LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_1f3000_Section
ON az.SectionExternalProviderTeacher (LocalCourseCode ASC, SchoolId ASC, SchoolYear ASC, SectionIdentifier ASC, SessionName ASC);

ALTER TABLE az.SpecialEnrollmentDescriptor ADD CONSTRAINT FK_6df72c_Descriptor FOREIGN KEY (SpecialEnrollmentDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.StaffEducationOrganizationEmploymentAssociationExtension ADD CONSTRAINT FK_ec4394_EducationLevelDescriptor FOREIGN KEY (EducationLevelDescriptorId)
REFERENCES az.EducationLevelDescriptor (EducationLevelDescriptorId)
;

CREATE INDEX FK_ec4394_EducationLevelDescriptor
ON az.StaffEducationOrganizationEmploymentAssociationExtension (EducationLevelDescriptorId ASC);

ALTER TABLE az.StaffEducationOrganizationEmploymentAssociationExtension ADD CONSTRAINT FK_ec4394_StaffEducationOrganizationEmploymentAssociation FOREIGN KEY (EducationOrganizationId, EmploymentStatusDescriptorId, HireDate, StaffUSI)
REFERENCES edfi.StaffEducationOrganizationEmploymentAssociation (EducationOrganizationId, EmploymentStatusDescriptorId, HireDate, StaffUSI)
ON DELETE CASCADE
;

ALTER TABLE az.StudentDropOutRecoveryProgramAssociation ADD CONSTRAINT FK_4754cb_GeneralStudentProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.GeneralStudentProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE az.StudentDropOutRecoveryProgramMonthlyUpdate ADD CONSTRAINT FK_56f8e3_MonthDescriptor FOREIGN KEY (MonthDescriptorId)
REFERENCES az.MonthDescriptor (MonthDescriptorId)
;

CREATE INDEX FK_56f8e3_MonthDescriptor
ON az.StudentDropOutRecoveryProgramMonthlyUpdate (MonthDescriptorId ASC);

ALTER TABLE az.StudentDropOutRecoveryProgramMonthlyUpdate ADD CONSTRAINT FK_56f8e3_StudentDropOutRecoveryProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES az.StudentDropOutRecoveryProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
;

CREATE INDEX FK_56f8e3_StudentDropOutRecoveryProgramAssociation
ON az.StudentDropOutRecoveryProgramMonthlyUpdate (BeginDate ASC, EducationOrganizationId ASC, ProgramEducationOrganizationId ASC, ProgramName ASC, ProgramTypeDescriptorId ASC, StudentUSI ASC);

ALTER TABLE az.StudentEducationOrganizationAssociationAZTribalAffiliation ADD CONSTRAINT FK_30d01b_StudentEducationOrganizationAssociation FOREIGN KEY (EducationOrganizationId, StudentUSI)
REFERENCES edfi.StudentEducationOrganizationAssociation (EducationOrganizationId, StudentUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_30d01b_StudentEducationOrganizationAssociation
ON az.StudentEducationOrganizationAssociationAZTribalAffiliation (EducationOrganizationId ASC, StudentUSI ASC);

ALTER TABLE az.StudentEducationOrganizationAssociationAZTribalAffiliation ADD CONSTRAINT FK_30d01b_TribalAffiliationDescriptor FOREIGN KEY (TribalAffiliationDescriptorId)
REFERENCES edfi.TribalAffiliationDescriptor (TribalAffiliationDescriptorId)
;

CREATE INDEX FK_30d01b_TribalAffiliationDescriptor
ON az.StudentEducationOrganizationAssociationAZTribalAffiliation (TribalAffiliationDescriptorId ASC);

ALTER TABLE az.StudentNeed ADD CONSTRAINT FK_1b6559_EducationOrganization FOREIGN KEY (EducationOrganizationId)
REFERENCES edfi.EducationOrganization (EducationOrganizationId)
;

CREATE INDEX FK_1b6559_EducationOrganization
ON az.StudentNeed (EducationOrganizationId ASC);

ALTER TABLE az.StudentNeed ADD CONSTRAINT FK_1b6559_PrimaryNightTimeResidenceDescriptor FOREIGN KEY (PrimaryNightTimeResidenceDescriptorId)
REFERENCES az.PrimaryNightTimeResidenceDescriptor (PrimaryNightTimeResidenceDescriptorId)
;

CREATE INDEX FK_1b6559_PrimaryNightTimeResidenceDescriptor
ON az.StudentNeed (PrimaryNightTimeResidenceDescriptorId ASC);

ALTER TABLE az.StudentNeed ADD CONSTRAINT FK_1b6559_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
;

CREATE INDEX FK_1b6559_Student
ON az.StudentNeed (StudentUSI ASC);

ALTER TABLE az.StudentNeed ADD CONSTRAINT FK_1b6559_StudentNeedDescriptor FOREIGN KEY (StudentNeedDescriptorId)
REFERENCES az.StudentNeedDescriptor (StudentNeedDescriptorId)
;

CREATE INDEX FK_1b6559_StudentNeedDescriptor
ON az.StudentNeed (StudentNeedDescriptorId ASC);

ALTER TABLE az.StudentNeedCategoryDescriptor ADD CONSTRAINT FK_097b68_Descriptor FOREIGN KEY (StudentNeedCategoryDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.StudentNeedDescriptor ADD CONSTRAINT FK_fb64d0_Descriptor FOREIGN KEY (StudentNeedDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE az.StudentNeedDescriptor ADD CONSTRAINT FK_fb64d0_StudentNeedCategoryDescriptor FOREIGN KEY (StudentNeedCategoryDescriptorId)
REFERENCES az.StudentNeedCategoryDescriptor (StudentNeedCategoryDescriptorId)
;

CREATE INDEX FK_fb64d0_StudentNeedCategoryDescriptor
ON az.StudentNeedDescriptor (StudentNeedCategoryDescriptorId ASC);

ALTER TABLE az.StudentProgramAttendanceEventTimeLog ADD CONSTRAINT FK_f76de0_StudentProgramAttendanceEvent FOREIGN KEY (AttendanceEventCategoryDescriptorId, EducationOrganizationId, EventDate, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentProgramAttendanceEvent (AttendanceEventCategoryDescriptorId, EducationOrganizationId, EventDate, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_f76de0_StudentProgramAttendanceEvent
ON az.StudentProgramAttendanceEventTimeLog (AttendanceEventCategoryDescriptorId ASC, EducationOrganizationId ASC, EventDate ASC, ProgramEducationOrganizationId ASC, ProgramName ASC, ProgramTypeDescriptorId ASC, StudentUSI ASC);

ALTER TABLE az.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_ExitWithdrawReasonDescriptor FOREIGN KEY (ExitWithdrawReasonDescriptorId)
REFERENCES az.ExitWithdrawReasonDescriptor (ExitWithdrawReasonDescriptorId)
;

CREATE INDEX FK_880cb1_ExitWithdrawReasonDescriptor
ON az.StudentSchoolAssociationExtension (ExitWithdrawReasonDescriptorId ASC);

ALTER TABLE az.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_MembershipTypeDescriptor FOREIGN KEY (MembershipTypeDescriptorId)
REFERENCES az.MembershipTypeDescriptor (MembershipTypeDescriptorId)
;

CREATE INDEX FK_880cb1_MembershipTypeDescriptor
ON az.StudentSchoolAssociationExtension (MembershipTypeDescriptorId ASC);

ALTER TABLE az.StudentSchoolAssociationExtension ADD CONSTRAINT FK_880cb1_StudentSchoolAssociation FOREIGN KEY (EntryDate, SchoolId, StudentUSI)
REFERENCES edfi.StudentSchoolAssociation (EntryDate, SchoolId, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE az.StudentSchoolAssociationLocalEducationAgency ADD CONSTRAINT FK_bd2774_LocalEducationAgency FOREIGN KEY (LocalEducationAgencyId)
REFERENCES edfi.LocalEducationAgency (LocalEducationAgencyId)
;

CREATE INDEX FK_bd2774_LocalEducationAgency
ON az.StudentSchoolAssociationLocalEducationAgency (LocalEducationAgencyId ASC);

ALTER TABLE az.StudentSchoolAssociationLocalEducationAgency ADD CONSTRAINT FK_bd2774_MembershipResponsibilityDescriptor FOREIGN KEY (MembershipResponsibilityDescriptorId)
REFERENCES az.MembershipResponsibilityDescriptor (MembershipResponsibilityDescriptorId)
;

CREATE INDEX FK_bd2774_MembershipResponsibilityDescriptor
ON az.StudentSchoolAssociationLocalEducationAgency (MembershipResponsibilityDescriptorId ASC);

ALTER TABLE az.StudentSchoolAssociationLocalEducationAgency ADD CONSTRAINT FK_bd2774_StudentSchoolAssociation FOREIGN KEY (EntryDate, SchoolId, StudentUSI)
REFERENCES edfi.StudentSchoolAssociation (EntryDate, SchoolId, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_bd2774_StudentSchoolAssociation
ON az.StudentSchoolAssociationLocalEducationAgency (EntryDate ASC, SchoolId ASC, StudentUSI ASC);

ALTER TABLE az.StudentSchoolAssociationMembershipFTE ADD CONSTRAINT FK_98392d_MembershipFTEDescriptor FOREIGN KEY (MembershipFTEDescriptorId)
REFERENCES az.MembershipFTEDescriptor (MembershipFTEDescriptorId)
;

CREATE INDEX FK_98392d_MembershipFTEDescriptor
ON az.StudentSchoolAssociationMembershipFTE (MembershipFTEDescriptorId ASC);

ALTER TABLE az.StudentSchoolAssociationMembershipFTE ADD CONSTRAINT FK_98392d_StudentSchoolAssociation FOREIGN KEY (EntryDate, SchoolId, StudentUSI)
REFERENCES edfi.StudentSchoolAssociation (EntryDate, SchoolId, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_98392d_StudentSchoolAssociation
ON az.StudentSchoolAssociationMembershipFTE (EntryDate ASC, SchoolId ASC, StudentUSI ASC);

ALTER TABLE az.StudentSchoolAssociationSpecialEnrollment ADD CONSTRAINT FK_1166cc_SpecialEnrollmentDescriptor FOREIGN KEY (SpecialEnrollmentDescriptorId)
REFERENCES az.SpecialEnrollmentDescriptor (SpecialEnrollmentDescriptorId)
;

CREATE INDEX FK_1166cc_SpecialEnrollmentDescriptor
ON az.StudentSchoolAssociationSpecialEnrollment (SpecialEnrollmentDescriptorId ASC);

ALTER TABLE az.StudentSchoolAssociationSpecialEnrollment ADD CONSTRAINT FK_1166cc_StudentSchoolAssociation FOREIGN KEY (EntryDate, SchoolId, StudentUSI)
REFERENCES edfi.StudentSchoolAssociation (EntryDate, SchoolId, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_1166cc_StudentSchoolAssociation
ON az.StudentSchoolAssociationSpecialEnrollment (EntryDate ASC, SchoolId ASC, StudentUSI ASC);

ALTER TABLE az.StudentSchoolAssociationTuitionPayer ADD CONSTRAINT FK_889609_StudentSchoolAssociation FOREIGN KEY (EntryDate, SchoolId, StudentUSI)
REFERENCES edfi.StudentSchoolAssociation (EntryDate, SchoolId, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

CREATE INDEX FK_889609_StudentSchoolAssociation
ON az.StudentSchoolAssociationTuitionPayer (EntryDate ASC, SchoolId ASC, StudentUSI ASC);

ALTER TABLE az.StudentSchoolAssociationTuitionPayer ADD CONSTRAINT FK_889609_TuitionPayerDescriptor FOREIGN KEY (TuitionPayerDescriptorId)
REFERENCES az.TuitionPayerDescriptor (TuitionPayerDescriptorId)
;

CREATE INDEX FK_889609_TuitionPayerDescriptor
ON az.StudentSchoolAssociationTuitionPayer (TuitionPayerDescriptorId ASC);

ALTER TABLE az.StudentSchoolAttendanceEventExtension ADD CONSTRAINT FK_85b337_StudentSchoolAttendanceEvent FOREIGN KEY (AttendanceEventCategoryDescriptorId, EventDate, SchoolId, SchoolYear, SessionName, StudentUSI)
REFERENCES edfi.StudentSchoolAttendanceEvent (AttendanceEventCategoryDescriptorId, EventDate, SchoolId, SchoolYear, SessionName, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE az.StudentSectionAssociationExtension ADD CONSTRAINT FK_a77484_CourseEntryDescriptor FOREIGN KEY (CourseEntryDescriptorId)
REFERENCES az.CourseEntryDescriptor (CourseEntryDescriptorId)
;

CREATE INDEX FK_a77484_CourseEntryDescriptor
ON az.StudentSectionAssociationExtension (CourseEntryDescriptorId ASC);

ALTER TABLE az.StudentSectionAssociationExtension ADD CONSTRAINT FK_a77484_CourseExitDescriptor FOREIGN KEY (CourseExitDescriptorId)
REFERENCES az.CourseExitDescriptor (CourseExitDescriptorId)
;

CREATE INDEX FK_a77484_CourseExitDescriptor
ON az.StudentSectionAssociationExtension (CourseExitDescriptorId ASC);

ALTER TABLE az.StudentSectionAssociationExtension ADD CONSTRAINT FK_a77484_StudentSectionAssociation FOREIGN KEY (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
REFERENCES edfi.StudentSectionAssociation (BeginDate, LocalCourseCode, SchoolId, SchoolYear, SectionIdentifier, SessionName, StudentUSI)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE az.StudentSpecialEducationProgramAssociationAssessmentOutcome ADD CONSTRAINT FK_166618_AssessmentCategoryDescriptor FOREIGN KEY (AssessmentCategoryDescriptorId)
REFERENCES edfi.AssessmentCategoryDescriptor (AssessmentCategoryDescriptorId)
;

CREATE INDEX FK_166618_AssessmentCategoryDescriptor
ON az.StudentSpecialEducationProgramAssociationAssessmentOutcome (AssessmentCategoryDescriptorId ASC);

ALTER TABLE az.StudentSpecialEducationProgramAssociationAssessmentOutcome ADD CONSTRAINT FK_166618_AssessmentOutcomesSummaryDescriptor FOREIGN KEY (AssessmentOutcomesSummaryDescriptorId)
REFERENCES az.AssessmentOutcomesSummaryDescriptor (AssessmentOutcomesSummaryDescriptorId)
;

CREATE INDEX FK_166618_AssessmentOutcomesSummaryDescriptor
ON az.StudentSpecialEducationProgramAssociationAssessmentOutcome (AssessmentOutcomesSummaryDescriptorId ASC);

ALTER TABLE az.StudentSpecialEducationProgramAssociationAssessmentOutcome ADD CONSTRAINT FK_166618_AssessmentPeriodDescriptor FOREIGN KEY (AssessmentPeriodDescriptorId)
REFERENCES edfi.AssessmentPeriodDescriptor (AssessmentPeriodDescriptorId)
;

CREATE INDEX FK_166618_AssessmentPeriodDescriptor
ON az.StudentSpecialEducationProgramAssociationAssessmentOutcome (AssessmentPeriodDescriptorId ASC);

ALTER TABLE az.StudentSpecialEducationProgramAssociationAssessmentOutcome ADD CONSTRAINT FK_166618_StudentSpecialEducationProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentSpecialEducationProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_166618_StudentSpecialEducationProgramAssociation
ON az.StudentSpecialEducationProgramAssociationAssessmentOutcome (BeginDate ASC, EducationOrganizationId ASC, ProgramEducationOrganizationId ASC, ProgramName ASC, ProgramTypeDescriptorId ASC, StudentUSI ASC);

ALTER TABLE az.StudentSpecialEducationProgramAssociationExtension ADD CONSTRAINT FK_3da84f_StudentSpecialEducationProgramAssociation FOREIGN KEY (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
REFERENCES edfi.StudentSpecialEducationProgramAssociation (BeginDate, EducationOrganizationId, ProgramEducationOrganizationId, ProgramName, ProgramTypeDescriptorId, StudentUSI)
ON DELETE CASCADE
;

ALTER TABLE az.TuitionPayerDescriptor ADD CONSTRAINT FK_fdb3e0_Descriptor FOREIGN KEY (TuitionPayerDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

