-- Extended Properties [az].[AbsenceAmountDescriptor] --
COMMENT ON TABLE az.AbsenceAmountDescriptor IS 'Absence Amounts must be less than or equal to the  Student Membership
                FTE, since absences are measured in quarter day increments.';
COMMENT ON COLUMN az.AbsenceAmountDescriptor.AbsenceAmountDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[AssessmentOutcomesSummaryDescriptor] --
COMMENT ON TABLE az.AssessmentOutcomesSummaryDescriptor IS 'This descriptor holds the outcomes of an assessment based on format and content.';
COMMENT ON COLUMN az.AssessmentOutcomesSummaryDescriptor.AssessmentOutcomesSummaryDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[CalendarExtension] --
COMMENT ON TABLE az.CalendarExtension IS '';
COMMENT ON COLUMN az.CalendarExtension.CalendarCode IS 'The identifier for the Calendar.';
COMMENT ON COLUMN az.CalendarExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.CalendarExtension.SchoolYear IS 'The identifier for the school year associated with the Calendar.';
COMMENT ON COLUMN az.CalendarExtension.TrackLocalEducationAgencyId IS 'The identifier assigned to a local education agency.';
COMMENT ON COLUMN az.CalendarExtension.BeginDate IS 'The first date of the track';
COMMENT ON COLUMN az.CalendarExtension.EndDate IS 'The last date of the track';
COMMENT ON COLUMN az.CalendarExtension.TotalInstructionalDays IS 'The total number of instructional days in the school calendar.
                National Education Data Model (NEDM): Total Days in Session';

-- Extended Properties [az].[CourseEntryDescriptor] --
COMMENT ON TABLE az.CourseEntryDescriptor IS 'The way the student entered this course, either as a
                  new enrollee or as a transfer from another section at the same
                  school';
COMMENT ON COLUMN az.CourseEntryDescriptor.CourseEntryDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[CourseExitDescriptor] --
COMMENT ON TABLE az.CourseExitDescriptor IS 'The type of exit the student had from this course section.';
COMMENT ON COLUMN az.CourseExitDescriptor.CourseExitDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[CourseOfferingCourseSchedule] --
COMMENT ON TABLE az.CourseOfferingCourseSchedule IS 'CourseSchedule for given course';
COMMENT ON COLUMN az.CourseOfferingCourseSchedule.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN az.CourseOfferingCourseSchedule.ScheduleDate IS 'The Schedule date for the course.';
COMMENT ON COLUMN az.CourseOfferingCourseSchedule.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.CourseOfferingCourseSchedule.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN az.CourseOfferingCourseSchedule.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN az.CourseOfferingCourseSchedule.InstructionalMinutesPlanned IS 'Number of Instructional minutes planned for given ScheduledDate';

-- Extended Properties [az].[CourseOfferingExtension] --
COMMENT ON TABLE az.CourseOfferingExtension IS '';
COMMENT ON COLUMN az.CourseOfferingExtension.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN az.CourseOfferingExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.CourseOfferingExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN az.CourseOfferingExtension.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN az.CourseOfferingExtension.EndOfCourseAssessmentCodeDescriptorId IS 'The end of course assesment code. Submitted for courses that end with Assessment testing';

-- Extended Properties [az].[CourseTranscriptExtension] --
COMMENT ON TABLE az.CourseTranscriptExtension IS '';
COMMENT ON COLUMN az.CourseTranscriptExtension.CourseAttemptResultDescriptorId IS 'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.';
COMMENT ON COLUMN az.CourseTranscriptExtension.CourseCode IS 'A unique alphanumeric code assigned to a course.';
COMMENT ON COLUMN az.CourseTranscriptExtension.CourseEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.CourseTranscriptExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.CourseTranscriptExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN az.CourseTranscriptExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.CourseTranscriptExtension.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN az.CourseTranscriptExtension.FinalLetterGradeDescriptorId IS 'The final indicator of student performance in a class as submitted by the instructor';

-- Extended Properties [az].[EducationLevelDescriptor] --
COMMENT ON TABLE az.EducationLevelDescriptor IS 'This descriptor defines education level of a staff who is asscoiated with education organization.';
COMMENT ON COLUMN az.EducationLevelDescriptor.EducationLevelDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[EndOfCourseAssessmentCodeDescriptor] --
COMMENT ON TABLE az.EndOfCourseAssessmentCodeDescriptor IS 'Submitted for courses that end with Assessment testing';
COMMENT ON COLUMN az.EndOfCourseAssessmentCodeDescriptor.EndOfCourseAssessmentCodeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[ExitWithdrawReasonDescriptor] --
COMMENT ON TABLE az.ExitWithdrawReasonDescriptor IS 'Withdrawal Reasons are a secondary reason for the withdrawal (the
                primary reason being the Withdrawal Activity Code). Withdrawal
                Reasons are optional, and will not apply to the great majority
                of students who withdraw from school prior to the last scheduled
                day of session.';
COMMENT ON COLUMN az.ExitWithdrawReasonDescriptor.ExitWithdrawReasonDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[FinalLetterGradeDescriptor] --
COMMENT ON TABLE az.FinalLetterGradeDescriptor IS 'The final indicator of student performance in a class as submitted by the instructor.';
COMMENT ON COLUMN az.FinalLetterGradeDescriptor.FinalLetterGradeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[MembershipFTEDescriptor] --
COMMENT ON TABLE az.MembershipFTEDescriptor IS 'This descriptor describes the full-time equivalency codes';
COMMENT ON COLUMN az.MembershipFTEDescriptor.MembershipFTEDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[MembershipResponsibilityDescriptor] --
COMMENT ON TABLE az.MembershipResponsibilityDescriptor IS 'This descriptor defines types of responsibility a local education agency may have for a student school association(e.g., funding).';
COMMENT ON COLUMN az.MembershipResponsibilityDescriptor.MembershipResponsibilityDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[MembershipTypeDescriptor] --
COMMENT ON TABLE az.MembershipTypeDescriptor IS 'Membership Type identifies whether a school has primary responsibility
                for managing a specific student''s curriculum or not. The ''P'' code
                value will allow the reporting of students who are enrolled in
                a SPED program but not enrolled in a school.';
COMMENT ON COLUMN az.MembershipTypeDescriptor.MembershipTypeDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[MonthDescriptor] --
COMMENT ON TABLE az.MonthDescriptor IS 'The month number descriptor';
COMMENT ON COLUMN az.MonthDescriptor.MonthDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[NumberOfInstructionalDaysInWeekDescriptor] --
COMMENT ON TABLE az.NumberOfInstructionalDaysInWeekDescriptor IS 'This descriptor defines the number of instructional days for a week in calendar track (e.g., three days per week, fours days per week, five days per week).';
COMMENT ON COLUMN az.NumberOfInstructionalDaysInWeekDescriptor.NumberOfInstructionalDaysInWeekDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[PrimaryNightTimeResidenceDescriptor] --
COMMENT ON TABLE az.PrimaryNightTimeResidenceDescriptor IS 'The Primary Nighttime residence is a field associated with students
                who have been designated as Homeless.';
COMMENT ON COLUMN az.PrimaryNightTimeResidenceDescriptor.PrimaryNightTimeResidenceDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[SectionExtension] --
COMMENT ON TABLE az.SectionExtension IS '';
COMMENT ON COLUMN az.SectionExtension.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN az.SectionExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.SectionExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN az.SectionExtension.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN az.SectionExtension.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN az.SectionExtension.TimetableDayIdentifier IS 'Report the days on which the course/section meets. MTWRF if meets
                every day, MWF if the course/section meets every other day. If
                the course is on a block schedule, use AB.';
COMMENT ON COLUMN az.SectionExtension.Note IS 'This is a free field that may contain up to 250 characters.';
COMMENT ON COLUMN az.SectionExtension.MinutesPerWeek IS 'Minutes reported per week';

-- Extended Properties [az].[SectionExternalProviderTeacher] --
COMMENT ON TABLE az.SectionExternalProviderTeacher IS 'A collection fo external teachers assigned to a section';
COMMENT ON COLUMN az.SectionExternalProviderTeacher.ExternalProviderName IS 'If the course is being provided by an external organization, e.g.
                  a distance education or virtual course, the name of that providing
                  organization.';
COMMENT ON COLUMN az.SectionExternalProviderTeacher.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN az.SectionExternalProviderTeacher.ProviderTeacherFirstName IS 'If the course is being provided by an external provider, the first
                  or given name of the provider''s primary instructor.';
COMMENT ON COLUMN az.SectionExternalProviderTeacher.ProviderTeacherLastName IS 'If the course is being provided by an external provider, the last,
                  family, or surname of the provider''s primary instructor.';
COMMENT ON COLUMN az.SectionExternalProviderTeacher.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.SectionExternalProviderTeacher.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN az.SectionExternalProviderTeacher.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN az.SectionExternalProviderTeacher.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN az.SectionExternalProviderTeacher.ClassroomPositionDescriptorId IS 'The type of position the Staff member holds in the specific class/section;
                    for example:

                    Teacher of Record, Assistant Teacher, Support Teacher, Substitute Teacher...';
COMMENT ON COLUMN az.SectionExternalProviderTeacher.BeginDate IS 'The first date the teacher was associated with the section.';
COMMENT ON COLUMN az.SectionExternalProviderTeacher.EndDate IS 'The last date the teacher was associated with the section.';

-- Extended Properties [az].[SpecialEnrollmentDescriptor] --
COMMENT ON TABLE az.SpecialEnrollmentDescriptor IS 'This descriptor describes special enrollment codes';
COMMENT ON COLUMN az.SpecialEnrollmentDescriptor.SpecialEnrollmentDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[StaffEducationOrganizationEmploymentAssociationExtension] --
COMMENT ON TABLE az.StaffEducationOrganizationEmploymentAssociationExtension IS '';
COMMENT ON COLUMN az.StaffEducationOrganizationEmploymentAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StaffEducationOrganizationEmploymentAssociationExtension.EmploymentStatusDescriptorId IS 'Reflects the type of employment or contract; for example:
        Probationary
        Contractual
        Substitute/temporary
        Tenured or permanent
        Volunteer/no contract
        ...';
COMMENT ON COLUMN az.StaffEducationOrganizationEmploymentAssociationExtension.HireDate IS 'The month, day, and year on which an individual was hired for a position.';
COMMENT ON COLUMN az.StaffEducationOrganizationEmploymentAssociationExtension.StaffUSI IS 'A unique alphanumeric code assigned to a staff.';
COMMENT ON COLUMN az.StaffEducationOrganizationEmploymentAssociationExtension.EducationLevelDescriptorId IS 'It defines the staff education level';
COMMENT ON COLUMN az.StaffEducationOrganizationEmploymentAssociationExtension.Benefits IS 'It is benefit percentage.';
COMMENT ON COLUMN az.StaffEducationOrganizationEmploymentAssociationExtension.Salary IS 'Salary defined for a staff.';
COMMENT ON COLUMN az.StaffEducationOrganizationEmploymentAssociationExtension.FullTimeEquivalencyOther IS 'The ratio between the hours of work expected in a position and the hours of work normally expected in a full-time position in the same setting.';
COMMENT ON COLUMN az.StaffEducationOrganizationEmploymentAssociationExtension.PSP IS 'Purchased Services Personnel (PSP) employees.';

-- Extended Properties [az].[StudentDropOutRecoveryProgramAssociation] --
COMMENT ON TABLE az.StudentDropOutRecoveryProgramAssociation IS '';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramAssociation.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramAssociation.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramAssociation.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramAssociation.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramAssociation.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramAssociation.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramAssociation.WrittenLearningPlanDate IS 'The date the initial Written Learning Plan was approved. Note: A new Written
                  Learning Plan date indicating preparation of a new plan must be submitted
                  each academic (fiscal) year.';

-- Extended Properties [az].[StudentDropOutRecoveryProgramMonthlyUpdate] --
COMMENT ON TABLE az.StudentDropOutRecoveryProgramMonthlyUpdate IS '';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramMonthlyUpdate.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramMonthlyUpdate.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramMonthlyUpdate.MonthDescriptorId IS 'the month for which the progress update is reported';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramMonthlyUpdate.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramMonthlyUpdate.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramMonthlyUpdate.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramMonthlyUpdate.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramMonthlyUpdate.RevisedWrittenLearningPlanDate IS 'The Revised Learning Plan Date is used when plan requires changes
                  to  the initial written plan.';
COMMENT ON COLUMN az.StudentDropOutRecoveryProgramMonthlyUpdate.SatisfactoryProgress IS 'Indicates whether student maintained satisfactory progress during
                  the month prior to this record. This data must be submitted each
                  month that the student is enrolled in the DRP regardless of the
                  student''s progress. This field is nullable.  If no data is submitted,
                  it will be NULL.  If the LEA/School submits data it will be a
                  0 or a 1 where 0 = Unsatisfactory and 1 = Satisfactory';

-- Extended Properties [az].[StudentEducationOrganizationAssociationAZTribalAffiliation] --
COMMENT ON TABLE az.StudentEducationOrganizationAssociationAZTribalAffiliation IS 'An American Indian tribe with which an individual is affiliated.';
COMMENT ON COLUMN az.StudentEducationOrganizationAssociationAZTribalAffiliation.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentEducationOrganizationAssociationAZTribalAffiliation.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentEducationOrganizationAssociationAZTribalAffiliation.TribalAffiliationDescriptorId IS 'An American Indian tribe with which an individual is affiliated.';
COMMENT ON COLUMN az.StudentEducationOrganizationAssociationAZTribalAffiliation.OtherAffiliation IS 'Tribal affiliation(s) other than Arizona’s 22 federally recognized tribes.';

-- Extended Properties [az].[StudentNeed] --
COMMENT ON TABLE az.StudentNeed IS 'This entity represents a need for a student';
COMMENT ON COLUMN az.StudentNeed.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentNeed.StudentNeedDescriptorId IS 'The student need descriptor code';
COMMENT ON COLUMN az.StudentNeed.StudentNeedEntryDate IS 'The date the student began the state of having the Need.';
COMMENT ON COLUMN az.StudentNeed.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentNeed.StudentNeedExitDate IS 'The date the student exited the state of having the Need.';
COMMENT ON COLUMN az.StudentNeed.PrimaryStudentNeedIndicator IS 'Indicates if the SPED Need being serviced is the Primary Need.';
COMMENT ON COLUMN az.StudentNeed.PrimaryNightTimeResidenceDescriptorId IS 'The Primary Night time residence descriptor associated with student
                  who have been designated as Homeless.';

-- Extended Properties [az].[StudentNeedCategoryDescriptor] --
COMMENT ON TABLE az.StudentNeedCategoryDescriptor IS 'This descriptor defines a student need category.';
COMMENT ON COLUMN az.StudentNeedCategoryDescriptor.StudentNeedCategoryDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [az].[StudentNeedDescriptor] --
COMMENT ON TABLE az.StudentNeedDescriptor IS 'This descriptor defines a characteristic of a student need.';
COMMENT ON COLUMN az.StudentNeedDescriptor.StudentNeedDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';
COMMENT ON COLUMN az.StudentNeedDescriptor.StudentNeedCategoryDescriptorId IS 'This descriptor defines a category of a student need.';

-- Extended Properties [az].[StudentProgramAttendanceEventTimeLog] --
COMMENT ON TABLE az.StudentProgramAttendanceEventTimeLog IS 'This event entity adds the time component to a student program attendance participating';
COMMENT ON COLUMN az.StudentProgramAttendanceEventTimeLog.AttendanceBeginTime IS 'The time the student began attending this program service.';
COMMENT ON COLUMN az.StudentProgramAttendanceEventTimeLog.AttendanceEventCategoryDescriptorId IS 'A code describing the attendance event, for example:
        Present
        Unexcused absence
        Excused absence
        Tardy.';
COMMENT ON COLUMN az.StudentProgramAttendanceEventTimeLog.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentProgramAttendanceEventTimeLog.EventDate IS 'Date for this attendance event.';
COMMENT ON COLUMN az.StudentProgramAttendanceEventTimeLog.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentProgramAttendanceEventTimeLog.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN az.StudentProgramAttendanceEventTimeLog.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN az.StudentProgramAttendanceEventTimeLog.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentProgramAttendanceEventTimeLog.AttendanceEndTime IS 'The time the student stopped attending this program service.';

-- Extended Properties [az].[StudentSchoolAssociationExtension] --
COMMENT ON TABLE az.StudentSchoolAssociationExtension IS '';
COMMENT ON COLUMN az.StudentSchoolAssociationExtension.EntryDate IS 'The month, day, and year on which an individual enters and begins to receive instructional services in a school.';
COMMENT ON COLUMN az.StudentSchoolAssociationExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.StudentSchoolAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentSchoolAssociationExtension.ExitWithdrawReasonDescriptorId IS 'Withdrawal Reasons are a secondary reason for the withdrawal (the
                  primary reason being the Withdrawal Activity Code). Withdrawal Reasons
                  are optional, and will not apply to the great majority of students
                  who withdraw from school prior to the last scheduled day of session';
COMMENT ON COLUMN az.StudentSchoolAssociationExtension.MembershipTypeDescriptorId IS 'Membership Type identifies whether a school has primary responsibility
                  for managing a specific student''s curriculum or not. The ''P''code value
                  will allow the reporting of students who are enrolled in a SPED program
                  but not enrolled in a school.';

-- Extended Properties [az].[StudentSchoolAssociationLocalEducationAgency] --
COMMENT ON TABLE az.StudentSchoolAssociationLocalEducationAgency IS 'This association represents any special enrollment characteristics of the student school association';
COMMENT ON COLUMN az.StudentSchoolAssociationLocalEducationAgency.EntryDate IS 'The month, day, and year on which an individual enters and begins to receive instructional services in a school.';
COMMENT ON COLUMN az.StudentSchoolAssociationLocalEducationAgency.MembershipResponsibilityDescriptorId IS 'The membership responsibility descriptor';
COMMENT ON COLUMN az.StudentSchoolAssociationLocalEducationAgency.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.StudentSchoolAssociationLocalEducationAgency.StartDate IS 'The start date of the association';
COMMENT ON COLUMN az.StudentSchoolAssociationLocalEducationAgency.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentSchoolAssociationLocalEducationAgency.EndDate IS 'The end date of the association';
COMMENT ON COLUMN az.StudentSchoolAssociationLocalEducationAgency.LocalEducationAgencyId IS 'The identifier assigned to a local education agency.';

-- Extended Properties [az].[StudentSchoolAssociationMembershipFTE] --
COMMENT ON TABLE az.StudentSchoolAssociationMembershipFTE IS 'This association represents the full-time equivalency of the student school association';
COMMENT ON COLUMN az.StudentSchoolAssociationMembershipFTE.EntryDate IS 'The month, day, and year on which an individual enters and begins to receive instructional services in a school.';
COMMENT ON COLUMN az.StudentSchoolAssociationMembershipFTE.FTEStartDate IS 'The start date for the StudentSchoolAssociationMembership';
COMMENT ON COLUMN az.StudentSchoolAssociationMembershipFTE.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.StudentSchoolAssociationMembershipFTE.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentSchoolAssociationMembershipFTE.FTEEndDate IS 'The end date for the StudentSchoolAssociationMembership';
COMMENT ON COLUMN az.StudentSchoolAssociationMembershipFTE.MembershipFTEDescriptorId IS 'The membership full-time equivalency descriptor';

-- Extended Properties [az].[StudentSchoolAssociationSpecialEnrollment] --
COMMENT ON TABLE az.StudentSchoolAssociationSpecialEnrollment IS 'This association represents any special enrollment characteristics of the student school association';
COMMENT ON COLUMN az.StudentSchoolAssociationSpecialEnrollment.EntryDate IS 'The month, day, and year on which an individual enters and begins to receive instructional services in a school.';
COMMENT ON COLUMN az.StudentSchoolAssociationSpecialEnrollment.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.StudentSchoolAssociationSpecialEnrollment.SpecialEnrollmentStartDate IS 'The start date for the StudentSchoolAssociationSpecialEnrollment';
COMMENT ON COLUMN az.StudentSchoolAssociationSpecialEnrollment.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentSchoolAssociationSpecialEnrollment.SpecialEnrollmentEndDate IS 'The end date for the StudentSchoolAssociationSpecialEnrollment';
COMMENT ON COLUMN az.StudentSchoolAssociationSpecialEnrollment.SpecialEnrollmentDescriptorId IS 'The special enrollment descriptor';

-- Extended Properties [az].[StudentSchoolAssociationTuitionPayer] --
COMMENT ON TABLE az.StudentSchoolAssociationTuitionPayer IS 'This association represents the tuition payer codes of the student school association';
COMMENT ON COLUMN az.StudentSchoolAssociationTuitionPayer.EntryDate IS 'The month, day, and year on which an individual enters and begins to receive instructional services in a school.';
COMMENT ON COLUMN az.StudentSchoolAssociationTuitionPayer.PayerStartDate IS 'The start date for the StudentSchoolAssociationTuitionPayer';
COMMENT ON COLUMN az.StudentSchoolAssociationTuitionPayer.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.StudentSchoolAssociationTuitionPayer.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentSchoolAssociationTuitionPayer.PayerEndDate IS 'The end date for the StudentSchoolAssociationTuitionPayer';
COMMENT ON COLUMN az.StudentSchoolAssociationTuitionPayer.TuitionPayerDescriptorId IS 'The Tuition Payer descriptor';

-- Extended Properties [az].[StudentSchoolAttendanceEventExtension] --
COMMENT ON TABLE az.StudentSchoolAttendanceEventExtension IS '';
COMMENT ON COLUMN az.StudentSchoolAttendanceEventExtension.AttendanceEventCategoryDescriptorId IS 'A code describing the attendance event, for example:
        Present
        Unexcused absence
        Excused absence
        Tardy.';
COMMENT ON COLUMN az.StudentSchoolAttendanceEventExtension.EventDate IS 'Date for this attendance event.';
COMMENT ON COLUMN az.StudentSchoolAttendanceEventExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.StudentSchoolAttendanceEventExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN az.StudentSchoolAttendanceEventExtension.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN az.StudentSchoolAttendanceEventExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentSchoolAttendanceEventExtension.InstructionalMinutes IS 'The amount of time, in minutes, that the student received instruction during the reported attendance period and the ''In Attendance'' code is used';

-- Extended Properties [az].[StudentSectionAssociationExtension] --
COMMENT ON TABLE az.StudentSectionAssociationExtension IS '';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.BeginDate IS 'Month, day, and year of the Student''s entry or assignment to the Section.';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.LocalCourseCode IS 'The local code assigned by the School that identifies the course offering provided for the instruction of students.';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.SectionIdentifier IS 'The local identifier assigned to a section.';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.SessionName IS 'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.Note IS 'Any Clarifying information for this course section';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.CourseEntryDescriptorId IS 'The way the student entered this course section, either as a new
                enrollee or as a transfer from another section at the same school';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.CourseExitDescriptorId IS 'The type of exit the student had from this course section';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.DualCredit IS 'A flag indicating if this student is earning Dual Credit in a Dual
                Credit Course.';
COMMENT ON COLUMN az.StudentSectionAssociationExtension.ConcurrentEnrollment IS 'A flag indicating if this student is concurrently enrolled in a
                course that offers concurrent enrollment';

-- Extended Properties [az].[StudentSpecialEducationProgramAssociationAssessmentOutcome] --
COMMENT ON TABLE az.StudentSpecialEducationProgramAssociationAssessmentOutcome IS 'This entity collection represents the SPED outcomes of students at an education organization.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationAssessmentOutcome.AssessmentCategoryDescriptorId IS 'This descriptor holds the category of an assessment based on format and content.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationAssessmentOutcome.AssessmentPeriodDescriptorId IS 'This descriptor holds the period of time window in which an assessment is supposed to be administered (e.g., Beginning of Year, Middle of Year, End of Year).';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationAssessmentOutcome.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationAssessmentOutcome.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationAssessmentOutcome.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationAssessmentOutcome.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationAssessmentOutcome.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationAssessmentOutcome.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationAssessmentOutcome.AssessmentOutcomesSummaryDescriptorId IS 'This descriptor holds the outcome of an Assesment based on the Assessment Category';

-- Extended Properties [az].[StudentSpecialEducationProgramAssociationExtension] --
COMMENT ON TABLE az.StudentSpecialEducationProgramAssociationExtension IS '';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationExtension.BeginDate IS 'The earliest date the student is involved with the program. Typically, this is the date the student becomes eligible for the program.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationExtension.ProgramEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationExtension.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN az.StudentSpecialEducationProgramAssociationExtension.MainSPEDSchool IS 'A flag indicating if this is Primary school for SPED concurrency or not';

-- Extended Properties [az].[TuitionPayerDescriptor] --
COMMENT ON TABLE az.TuitionPayerDescriptor IS 'This descriptor defines the tuition payer codes';
COMMENT ON COLUMN az.TuitionPayerDescriptor.TuitionPayerDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

