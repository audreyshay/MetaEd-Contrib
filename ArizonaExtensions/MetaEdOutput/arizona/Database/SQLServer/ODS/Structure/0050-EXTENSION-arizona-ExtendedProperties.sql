-- Extended Properties [arizona].[AbsenceAmountDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Absence Amounts must be less than or equal to the  Student Membership
                FTE, since absences are measured in quarter day increments.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'AbsenceAmountDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'AbsenceAmountDescriptor', @level2type=N'COLUMN', @level2name=N'AbsenceAmountDescriptorId'
GO

-- Extended Properties [arizona].[CalendarDateTrackEvent] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The calendar track event associated with a calendar date.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CalendarDateTrackEvent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year of the CalendarDate.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CalendarDateTrackEvent', @level2type=N'COLUMN', @level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of scheduled or unscheduled event for the day. For example:

                    Instructional day

                    Teacher only day

                    Holiday

                    Make-up day

                    Weather day

                    Student late arrival/early dismissal.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CalendarDateTrackEvent', @level2type=N'COLUMN', @level2name=N'TrackEventDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CalendarDateTrackEvent', @level2type=N'COLUMN', @level2name=N'TrackLocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The track number descriptor (e.g. 01, 02, 03 etc.)', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CalendarDateTrackEvent', @level2type=N'COLUMN', @level2name=N'TrackNumberDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CalendarDateTrackEvent', @level2type=N'COLUMN', @level2name=N'TrackSchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount of time for the event as recognized by the school: 1 day = 1,
                    1/2 day = 0.5, 1/3 day = 0.33.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CalendarDateTrackEvent', @level2type=N'COLUMN', @level2name=N'EventDuration'
GO

-- Extended Properties [arizona].[CourseEntryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The way the student entered this course, either as a
                  new enrollee or as a transfer from another section at the same
                  school', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseEntryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseEntryDescriptor', @level2type=N'COLUMN', @level2name=N'CourseEntryDescriptorId'
GO

-- Extended Properties [arizona].[CourseExitDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of exit the student had from this course section.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseExitDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseExitDescriptor', @level2type=N'COLUMN', @level2name=N'CourseExitDescriptorId'
GO

-- Extended Properties [arizona].[CourseOfferingCourseSchedule] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CourseSchedule for given course', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Schedule date for the course.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'ScheduleDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Instructional minutes planned for given ScheduledDate', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingCourseSchedule', @level2type=N'COLUMN', @level2name=N'InstructionalMinutesPlanned'
GO

-- Extended Properties [arizona].[CourseOfferingExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end of course assesment code. Submitted for courses that end with Assessment testing', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'EndOfCourseAssessmentCodeDescriptorId'
GO

-- Extended Properties [arizona].[EndOfCourseAssessmentCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Submitted for courses that end with Assessment testing', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'EndOfCourseAssessmentCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'EndOfCourseAssessmentCodeDescriptor', @level2type=N'COLUMN', @level2name=N'EndOfCourseAssessmentCodeDescriptorId'
GO

-- Extended Properties [arizona].[ExitWithdrawReasonDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Withdrawal Reasons are a secondary reason for the withdrawal (the
                primary reason being the Withdrawal Activity Code). Withdrawal
                Reasons are optional, and will not apply to the great majority
                of students who withdraw from school prior to the last scheduled
                day of session.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'ExitWithdrawReasonDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'ExitWithdrawReasonDescriptor', @level2type=N'COLUMN', @level2name=N'ExitWithdrawReasonDescriptorId'
GO

-- Extended Properties [arizona].[MembershipFTEDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes the full-time equivalency codes', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'MembershipFTEDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'MembershipFTEDescriptor', @level2type=N'COLUMN', @level2name=N'MembershipFTEDescriptorId'
GO

-- Extended Properties [arizona].[MembershipResponsibilityDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines types of responsibility a local education agency may have for a student school association(e.g., funding).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'MembershipResponsibilityDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'MembershipResponsibilityDescriptor', @level2type=N'COLUMN', @level2name=N'MembershipResponsibilityDescriptorId'
GO

-- Extended Properties [arizona].[MembershipTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Membership Type identifies whether a school has primary responsibility
                for managing a specific student''s curriculum or not. The ''P'' code
                value will allow the reporting of students who are enrolled in
                a SPED program but not enrolled in a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'MembershipTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'MembershipTypeDescriptor', @level2type=N'COLUMN', @level2name=N'MembershipTypeDescriptorId'
GO

-- Extended Properties [arizona].[MonthDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month number descriptor', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'MonthDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'MonthDescriptor', @level2type=N'COLUMN', @level2name=N'MonthDescriptorId'
GO

-- Extended Properties [arizona].[NumberOfInstructionalDaysInWeekDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the number of instructional days for a week in calendar track (e.g., three days per week, fours days per week, five days per week).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'NumberOfInstructionalDaysInWeekDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'NumberOfInstructionalDaysInWeekDescriptor', @level2type=N'COLUMN', @level2name=N'NumberOfInstructionalDaysInWeekDescriptorId'
GO

-- Extended Properties [arizona].[PrimaryNightTimeResidenceDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Primary Nighttime residence is a field associated with students
                who have been designated as Homeless.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'PrimaryNightTimeResidenceDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'PrimaryNightTimeResidenceDescriptor', @level2type=N'COLUMN', @level2name=N'PrimaryNightTimeResidenceDescriptorId'
GO

-- Extended Properties [arizona].[SectionCourseCharacteristic] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A collection of course level characteristics for a section', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionCourseCharacteristic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the nature and difficulty of instruction', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionCourseCharacteristic', @level2type=N'COLUMN', @level2name=N'CourseLevelCharacteristicDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionCourseCharacteristic', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionCourseCharacteristic', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionCourseCharacteristic', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionCourseCharacteristic', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionCourseCharacteristic', @level2type=N'COLUMN', @level2name=N'SessionName'
GO

-- Extended Properties [arizona].[SectionExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Report the days on which the course/section meets. MTWRF if meets
                every day, MWF if the course/section meets every other day. If
                the course is on a block schedule, use AB.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'TimetableDayIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is a free field that may contain up to 250 characters.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'Note'
GO

-- Extended Properties [arizona].[SectionExternalProviderTeacher] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A collection fo external teachers assigned to a section', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If the course is being provided by an external organization, e.g.
                  a distance education or virtual course, the name of that providing
                  organization.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'ExternalProviderName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If the course is being provided by an external provider, the first
                  or given name of the provider''s primary instructor.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'ProviderTeacherFirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If the course is being provided by an external provider, the last,
                  family, or surname of the provider''s primary instructor.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'ProviderTeacherLastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of position the Staff member holds in the specific class/section;
                    for example:

                    Teacher of Record, Assistant Teacher, Support Teacher, Substitute Teacher...', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'ClassroomPositionDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The first date the teacher was associated with the section.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The last date the teacher was associated with the section.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionExternalProviderTeacher', @level2type=N'COLUMN', @level2name=N'EndDate'
GO

-- Extended Properties [arizona].[SectionGradeLevel] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The grade level associated with the section.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionGradeLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The grade level associated with the current section', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'GradeLevelDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SectionGradeLevel', @level2type=N'COLUMN', @level2name=N'SessionName'
GO

-- Extended Properties [arizona].[SessionExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SessionExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SessionExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SessionExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SessionExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Session Type is a code indicating whether the session in which
                the course is conducted is a Semester, Trimester, Quarter, Full
                Year. Can be thought of as ''term definition''.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SessionExtension', @level2type=N'COLUMN', @level2name=N'SessionTypeDescriptorId'
GO

-- Extended Properties [arizona].[SessionTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Session Type is a code indicating whether the session in which
                the course is conducted is a Semester, Trimester, Quarter, Full
                Year. Can be thought of as ''term definition''', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SessionTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SessionTypeDescriptor', @level2type=N'COLUMN', @level2name=N'SessionTypeDescriptorId'
GO

-- Extended Properties [arizona].[SpecialEnrollmentDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor describes special enrollment codes', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SpecialEnrollmentDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'SpecialEnrollmentDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialEnrollmentDescriptorId'
GO

-- Extended Properties [arizona].[StudentDropOutRecoveryProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the initial Written Learning Plan was approved. Note: A new Written
                  Learning Plan date indicating preparation of a new plan must be submitted
                  each academic (fiscal) year.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramAssociation', @level2type=N'COLUMN', @level2name=N'WrittenLearningPlanDate'
GO

-- Extended Properties [arizona].[StudentDropOutRecoveryProgramMonthlyUpdate] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'the month for which the progress update is reported', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'MonthDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Revised Learning Plan Date is used when plan requires changes
                  to  the initial written plan.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'RevisedWrittenLearningPlanDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether student maintained satisfactory progress during
                  the month prior to this record. This data must be submitted each
                  month that the student is enrolled in the DRP regardless of the
                  student''s progress. This field is nullable.  If no data is submitted,
                  it will be NULL.  If the LEA/School submits data it will be a
                  0 or a 1 where 0 = Unsatisfactory and 1 = Satisfactory', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentDropOutRecoveryProgramMonthlyUpdate', @level2type=N'COLUMN', @level2name=N'SatisfactoryProgress'
GO

-- Extended Properties [arizona].[StudentExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A name borne in common by members of a tribe or clan. This  is
                  used for matching purposes only. Note: Name provided by Tribe,
                  not name of Tribe.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentExtension', @level2type=N'COLUMN', @level2name=N'TribalName'
GO

-- Extended Properties [arizona].[StudentNeed] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents a need for a student', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The student need descriptor code', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'StudentNeedDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the student began the state of having the Need.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'StudentNeedEntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the student exited the state of having the Need.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'StudentNeedExitDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the SPED Need being serviced is the Primary Need.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'PrimaryStudentNeedIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Primary Night time residence descriptor associated with student
                  who have been designated as Homeless.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeed', @level2type=N'COLUMN', @level2name=N'PrimaryNightTimeResidenceDescriptorId'
GO

-- Extended Properties [arizona].[StudentNeedCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines a category of a student need.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeedCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeedCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'StudentNeedCategoryDescriptorId'
GO

-- Extended Properties [arizona].[StudentNeedDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines a characteristic of a student need', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeedDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeedDescriptor', @level2type=N'COLUMN', @level2name=N'StudentNeedDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentNeedDescriptor', @level2type=N'COLUMN', @level2name=N'StudentNeedCategoryDescriptorId'
GO

-- Extended Properties [arizona].[StudentProgramAttendanceEventTimeLog] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This event entity adds the time component to a student program attendance participating', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time the student began attending this program service.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'AttendanceBeginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A code describing the attendance event, for example:
        Present
        Unexcused absence
        Excused absence
        Tardy.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'AttendanceEventCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date for this attendance event.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'EventDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time the student stopped attending this program service.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentProgramAttendanceEventTimeLog', @level2type=N'COLUMN', @level2name=N'AttendanceEndTime'
GO

-- Extended Properties [arizona].[StudentSchoolAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Withdrawal Reasons are a secondary reason for the withdrawal (the
                  primary reason being the Withdrawal Activity Code). Withdrawal Reasons
                  are optional, and will not apply to the great majority of students
                  who withdraw from school prior to the last scheduled day of session', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'ExitWithdrawReasonDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Membership Type identifies whether a school has primary responsibility
                  for managing a specific student''s curriculum or not. The ''P''code value
                  will allow the reporting of students who are enrolled in a SPED program
                  but not enrolled in a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'MembershipTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'TrackSchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The track number descriptor (e.g. 01, 02, 03 etc.)', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'TrackNumberDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'TrackLocalEducationAgencyId'
GO

-- Extended Properties [arizona].[StudentSchoolAssociationLocalEducationAgency] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association indicates any relationship between a student school association and a Local Education Agency', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The membership responsibility descriptor', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'MembershipResponsibilityDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date of the association', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date of the association', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationLocalEducationAgency', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO

-- Extended Properties [arizona].[StudentSchoolAssociationMembershipFTE] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents the full-time equivalency of the student school association', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date for the StudentSchoolAssociationMembership', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'FTEStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date for the StudentSchoolAssociationMembership', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'FTEEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The membership full-time equivalency descriptor', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembershipFTE', @level2type=N'COLUMN', @level2name=N'MembershipFTEDescriptorId'
GO

-- Extended Properties [arizona].[StudentSchoolAssociationSpecialEnrollment] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents any special enrollment characteristics of the student school association', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date for the StudentSchoolAssociationSpecialEnrollment', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'SpecialEnrollmentStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date for the StudentSchoolAssociationSpecialEnrollment', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'SpecialEnrollmentEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The special enrollment descriptor', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationSpecialEnrollment', @level2type=N'COLUMN', @level2name=N'SpecialEnrollmentDescriptorId'
GO

-- Extended Properties [arizona].[StudentSchoolAssociationTuitionPayer] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents the tuition payer codes of the student school association', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date for the StudentSchoolAssociationTuitionPayer', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'PayerStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date for the StudentSchoolAssociationTuitionPayer', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'PayerEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Tuition Payer descriptor', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTuitionPayer', @level2type=N'COLUMN', @level2name=N'TuitionPayerDescriptorId'
GO

-- Extended Properties [arizona].[StudentSchoolAttendanceEventExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A code describing the attendance event, for example:
        Present
        Unexcused absence
        Excused absence
        Tardy.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'AttendanceEventCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date for this attendance event.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'EventDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Absence Amount descriptor. Absence Amounts must be less than or equal to the  Student Membership FTE, since absences are measured in quarter day increments.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'AbsenceAmountDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount of time, in minutes, that the student received instruction during the reported attendance period and the ''In Attendance'' code is used', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'InstructionalMinutes'
GO

-- Extended Properties [arizona].[StudentSectionAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the Student''s entry or assignment to the Section.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Any Clarifying information for this course section', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'Note'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The way the student entered this course section, either as a new
                enrollee or as a transfer from another section at the same school', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'CourseEntryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of exit the student had from this course section', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'CourseExitDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A flag indicating if this student is earning Dual Credit in a Dual
                Credit Course.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'DualCredit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A flag indicating if this student is concurrently enrolled in a
                course that offers concurrent enrollment', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'ConcurrentEnrollment'
GO

-- Extended Properties [arizona].[Track] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This represents a calendar track for a school', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'Track'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'Track', @level2type=N'COLUMN', @level2name=N'TrackLocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The track number descriptor (e.g. 01, 02, 03 etc.)', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'Track', @level2type=N'COLUMN', @level2name=N'TrackNumberDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'Track', @level2type=N'COLUMN', @level2name=N'TrackSchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The first date of the track', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'Track', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The last date of the track', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'Track', @level2type=N'COLUMN', @level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total number of instructional days in the school calendar.
                  National Education Data Model (NEDM): Total Days in Session', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'Track', @level2type=N'COLUMN', @level2name=N'TotalInstructionalDays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of instructional days in a week descriptor (e.g. 3, 4, 5)', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'Track', @level2type=N'COLUMN', @level2name=N'NumberOfInstructionalDaysInWeekDescriptorId'
GO

-- Extended Properties [arizona].[TrackEventDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the types of scheduled or unscheduled event for the day
                  (e.g., Instructional day, Teacher only day, Holiday, Make-up day, Weather day,
                  Student late arrival/early dismissal day).', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'TrackEventDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'TrackEventDescriptor', @level2type=N'COLUMN', @level2name=N'TrackEventDescriptorId'
GO

-- Extended Properties [arizona].[TrackNumberDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the allowed track numbers (e.g., 01, 02, 03, 04, 05, 06)', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'TrackNumberDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'TrackNumberDescriptor', @level2type=N'COLUMN', @level2name=N'TrackNumberDescriptorId'
GO

-- Extended Properties [arizona].[TuitionPayerDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the tuition payer codes', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'TuitionPayerDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'arizona', @level1type=N'TABLE', @level1name=N'TuitionPayerDescriptor', @level2type=N'COLUMN', @level2name=N'TuitionPayerDescriptorId'
GO

