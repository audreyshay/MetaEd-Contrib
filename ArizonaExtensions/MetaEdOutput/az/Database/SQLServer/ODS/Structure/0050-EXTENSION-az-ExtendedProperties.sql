-- Extended Properties [az].[AbsenceAmountDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Absence Amounts must be less than or equal to the  Student Membership
                FTE, since absences are measured in quarter day increments.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'AbsenceAmountDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'AbsenceAmountDescriptor', @level2type=N'COLUMN', @level2name=N'AbsenceAmountDescriptorId'
GO

-- Extended Properties [az].[CalendarExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CalendarExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the Calendar.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'CalendarCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year associated with the Calendar.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'CalendarLocalEducationAgencyId'
GO

-- Extended Properties [az].[CourseEntryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The way the student entered this course, either as a
                  new enrollee or as a transfer from another section at the same
                  school', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseEntryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseEntryDescriptor', @level2type=N'COLUMN', @level2name=N'CourseEntryDescriptorId'
GO

-- Extended Properties [az].[CourseExitDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of exit the student had from this course section.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseExitDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseExitDescriptor', @level2type=N'COLUMN', @level2name=N'CourseExitDescriptorId'
GO

-- Extended Properties [az].[CourseOfferingCourseSchedule] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CourseSchedule for given course', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Schedule date for the course.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'ScheduleDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Instructional minutes planned for given ScheduledDate', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'InstructionalMinutesPlanned'
GO

-- Extended Properties [az].[CourseOfferingExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end of course assesment code. Submitted for courses that end with Assessment testing', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'EndOfCourseAssessmentCodeDescriptorId'
GO

-- Extended Properties [az].[EducationLevelDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines education level of a staff who is asscoiated with education organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'EducationLevelDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'EducationLevelDescriptor', @level2type=N'COLUMN', @level2name=N'EducationLevelDescriptorId'
GO

-- Extended Properties [az].[EndOfCourseAssessmentCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Submitted for courses that end with Assessment testing', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'EndOfCourseAssessmentCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'EndOfCourseAssessmentCodeDescriptor', @level2type=N'COLUMN', @level2name=N'EndOfCourseAssessmentCodeDescriptorId'
GO

-- Extended Properties [az].[ExitWithdrawReasonDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Withdrawal Reasons are a secondary reason for the withdrawal (the
                primary reason being the Withdrawal Activity Code). Withdrawal
                Reasons are optional, and will not apply to the great majority
                of students who withdraw from school prior to the last scheduled
                day of session.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'ExitWithdrawReasonDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'ExitWithdrawReasonDescriptor', @level2type=N'COLUMN', @level2name=N'ExitWithdrawReasonDescriptorId'
GO

-- Extended Properties [az].[MembershipFTEDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the full-time equivalency codes', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'MembershipFTEDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'MembershipFTEDescriptor', @level2type=N'COLUMN', @level2name=N'MembershipFTEDescriptorId'
GO

-- Extended Properties [az].[MembershipResponsibilityDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines types of responsibility a local education agency may have for a student school association(e.g., funding).', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'MembershipResponsibilityDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'MembershipResponsibilityDescriptor', @level2type=N'COLUMN', @level2name=N'MembershipResponsibilityDescriptorId'
GO

-- Extended Properties [az].[MembershipTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Membership Type identifies whether a school has primary responsibility
                for managing a specific student''s curriculum or not. The ''P'' code
                value will allow the reporting of students who are enrolled in
                a SPED program but not enrolled in a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'MembershipTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'MembershipTypeDescriptor', @level2type=N'COLUMN', @level2name=N'MembershipTypeDescriptorId'
GO

-- Extended Properties [az].[MonthDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month number descriptor', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'MonthDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'MonthDescriptor', @level2type=N'COLUMN', @level2name=N'MonthDescriptorId'
GO

-- Extended Properties [az].[NumberOfInstructionalDaysInWeekDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the number of instructional days for a week in calendar track (e.g., three days per week, fours days per week, five days per week).', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'NumberOfInstructionalDaysInWeekDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'NumberOfInstructionalDaysInWeekDescriptor', @level2type=N'COLUMN', @level2name=N'NumberOfInstructionalDaysInWeekDescriptorId'
GO

-- Extended Properties [az].[PrimaryNightTimeResidenceDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Primary Nighttime residence is a field associated with students
                who have been designated as Homeless.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'PrimaryNightTimeResidenceDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'PrimaryNightTimeResidenceDescriptor', @level2type=N'COLUMN', @level2name=N'PrimaryNightTimeResidenceDescriptorId'
GO

-- Extended Properties [az].[SectionExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Report the days on which the course/section meets. MTWRF if meets
                every day, MWF if the course/section meets every other day. If
                the course is on a block schedule, use AB.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'TimetableDayIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is a free field that may contain up to 250 characters.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'Note'
GO

-- Extended Properties [az].[SectionExternalProviderTeacher] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A collection fo external teachers assigned to a section', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If the course is being provided by an external organization, e.g.
                  a distance education or virtual course, the name of that providing
                  organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'ExternalProviderName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If the course is being provided by an external provider, the first
                  or given name of the provider''s primary instructor.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'ProviderTeacherFirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If the course is being provided by an external provider, the last,
                  family, or surname of the provider''s primary instructor.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'ProviderTeacherLastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of position the Staff member holds in the specific class/section;
                    for example:

                    Teacher of Record, Assistant Teacher, Support Teacher, Substitute Teacher...', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'ClassroomPositionDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The first date the teacher was associated with the section.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The last date the teacher was associated with the section.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'EndDate'
GO

-- Extended Properties [az].[SectionGradeLevel] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The grade level associated with the section.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionGradeLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The grade level associated with the current section', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'GradeLevelDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'SessionName'
GO

-- Extended Properties [az].[SpecialEnrollmentDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes special enrollment codes', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SpecialEnrollmentDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'SpecialEnrollmentDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialEnrollmentDescriptorId'
GO

-- Extended Properties [az].[StaffEducationOrganizationEmploymentAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationEmploymentAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationEmploymentAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reflects the type of employment or contract; for example:
        Probationary
        Contractual
        Substitute/temporary
        Tenured or permanent
        Volunteer/no contract
        ...', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationEmploymentAssociationExtension', @level2type=N'COLUMN', @level2name=N'EmploymentStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual was hired for a position.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationEmploymentAssociationExtension', @level2type=N'COLUMN', @level2name=N'HireDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationEmploymentAssociationExtension', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'It defines the staff education level', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationEmploymentAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationLevelDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'It is benefit percentage.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationEmploymentAssociationExtension', @level2type=N'COLUMN', @level2name=N'Benefits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Salary defined for a staff.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationEmploymentAssociationExtension', @level2type=N'COLUMN', @level2name=N'Salary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ratio between the hours of work expected in a position and the hours of work normally expected in a full-time position in the same setting.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationEmploymentAssociationExtension', @level2type=N'COLUMN', @level2name=N'FullTimeEquivalencyOther'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Purchased Services Personnel (PSP) employees.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationEmploymentAssociationExtension', @level2type=N'COLUMN', @level2name=N'PSP'
GO

-- Extended Properties [az].[StudentDropOutRecoveryProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the initial Written Learning Plan was approved. Note: A new Written
                  Learning Plan date indicating preparation of a new plan must be submitted
                  each academic (fiscal) year.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'WrittenLearningPlanDate'
GO

-- Extended Properties [az].[StudentDropOutRecoveryProgramMonthlyUpdate] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the month for which the progress update is reported', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'MonthDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Revised Learning Plan Date is used when plan requires changes
                  to  the initial written plan.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'RevisedWrittenLearningPlanDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether student maintained satisfactory progress during
                  the month prior to this record. This data must be submitted each
                  month that the student is enrolled in the DRP regardless of the
                  student''s progress. This field is nullable.  If no data is submitted,
                  it will be NULL.  If the LEA/School submits data it will be a
                  0 or a 1 where 0 = Unsatisfactory and 1 = Satisfactory', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'SatisfactoryProgress'
GO

-- Extended Properties [az].[StudentNeed] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents a need for a student', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The student need descriptor code', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'StudentNeedDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the student began the state of having the Need.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'StudentNeedEntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the student exited the state of having the Need.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'StudentNeedExitDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the SPED Need being serviced is the Primary Need.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'PrimaryStudentNeedIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Primary Night time residence descriptor associated with student
                  who have been designated as Homeless.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'PrimaryNightTimeResidenceDescriptorId'
GO

-- Extended Properties [az].[StudentNeedCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines a category of a student need.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeedCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeedCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'StudentNeedCategoryDescriptorId'
GO

-- Extended Properties [az].[StudentNeedDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines a characteristic of a student need', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeedDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeedDescriptor', @level2type=N'COLUMN', @level2name=N'StudentNeedDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentNeedDescriptor', @level2type=N'COLUMN', @level2name=N'StudentNeedCategoryDescriptorId'
GO

-- Extended Properties [az].[StudentProgramAttendanceEventTimeLog] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This event entity adds the time component to a student program attendance participating', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time the student began attending this program service.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'AttendanceBeginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A code describing the attendance event, for example:
        Present
        Unexcused absence
        Excused absence
        Tardy.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'AttendanceEventCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date for this attendance event.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'EventDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time the student stopped attending this program service.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'AttendanceEndTime'
GO

-- Extended Properties [az].[StudentSchoolAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Withdrawal Reasons are a secondary reason for the withdrawal (the
                  primary reason being the Withdrawal Activity Code). Withdrawal Reasons
                  are optional, and will not apply to the great majority of students
                  who withdraw from school prior to the last scheduled day of session', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'ExitWithdrawReasonDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Membership Type identifies whether a school has primary responsibility
                  for managing a specific student''s curriculum or not. The ''P''code value
                  will allow the reporting of students who are enrolled in a SPED program
                  but not enrolled in a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'MembershipTypeDescriptorId'
GO

-- Extended Properties [az].[StudentSchoolAssociationLocalEducationAgency] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents any special enrollment characteristics of the student school association', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The membership responsibility descriptor', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'MembershipResponsibilityDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date of the association', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date of the association', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO

-- Extended Properties [az].[StudentSchoolAssociationMembershipFTE] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents the full-time equivalency of the student school association', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date for the StudentSchoolAssociationMembership', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'FTEStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date for the StudentSchoolAssociationMembership', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'FTEEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The membership full-time equivalency descriptor', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'MembershipFTEDescriptorId'
GO

-- Extended Properties [az].[StudentSchoolAssociationSpecialEnrollment] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents any special enrollment characteristics of the student school association', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date for the StudentSchoolAssociationSpecialEnrollment', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'SpecialEnrollmentStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date for the StudentSchoolAssociationSpecialEnrollment', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'SpecialEnrollmentEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The special enrollment descriptor', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'SpecialEnrollmentDescriptorId'
GO

-- Extended Properties [az].[StudentSchoolAssociationTuitionPayer] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents the tuition payer codes of the student school association', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date for the StudentSchoolAssociationTuitionPayer', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'PayerStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date for the StudentSchoolAssociationTuitionPayer', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'PayerEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Tuition Payer descriptor', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'TuitionPayerDescriptorId'
GO

-- Extended Properties [az].[StudentSchoolAttendanceEventExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A code describing the attendance event, for example:
        Present
        Unexcused absence
        Excused absence
        Tardy.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'AttendanceEventCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date for this attendance event.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'EventDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount of time, in minutes, that the student received instruction during the reported attendance period and the ''In Attendance'' code is used', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'InstructionalMinutes'
GO

-- Extended Properties [az].[StudentSectionAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the Student''s entry or assignment to the Section.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Any Clarifying information for this course section', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The way the student entered this course section, either as a new
                enrollee or as a transfer from another section at the same school', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'CourseEntryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of exit the student had from this course section', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'CourseExitDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A flag indicating if this student is earning Dual Credit in a Dual
                Credit Course.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'DualCredit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A flag indicating if this student is concurrently enrolled in a
                course that offers concurrent enrollment', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'ConcurrentEnrollment'
GO

-- Extended Properties [az].[StudentSpecialEducationProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A flag indicating if this is Primary school for SPED concurrency or not', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'MainSPEDSchool'
GO

-- Extended Properties [az].[TuitionPayerDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the tuition payer codes', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'TuitionPayerDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'az', @level1type=N'TABLE', @level1name=N'TuitionPayerDescriptor', @level2type=N'COLUMN', @level2name=N'TuitionPayerDescriptorId'
GO

