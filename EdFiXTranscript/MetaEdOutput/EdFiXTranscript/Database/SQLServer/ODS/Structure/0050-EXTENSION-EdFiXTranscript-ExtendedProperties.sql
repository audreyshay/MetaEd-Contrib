-- Extended Properties [edfixtranscript].[CourseTranscript] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity is the final record of a student''s performance in their courses at the end of a semester or school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'CourseAttemptResultDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'CourseIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'CourseIdentificationSystemDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'AttemptedCredits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'AttemptedCreditTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'AttemptedCreditConversion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'EarnedCredits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'EarnedCreditTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'EarnedCreditConversion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Student''s grade level at time of course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'WhenTakenGradeLevelDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The method the credits were earned (e.g., Classroom, Examination, Transfer).', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'MethodCreditEarnedDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The final indicator of student performance in a class as submitted by the instructor.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'FinalLetterGradeEarned'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The final indicator of student performance in a class as submitted by the instructor.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'FinalNumericGradeEarned'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates that an academic course has been repeated by a student and how that repeat is to be computed in the student''s academic grade average.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'CourseRepeatCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The descriptive name given to a course of study offered in a school or other institution or organization. In departmentalized classes at the elementary, secondary, and postsecondary levels (and for staff development activities), this refers to the name by which a course is identified (e.g., American History, English III). For elementary and other non-departmentalized classes, it refers to any portion of the instruction for which a grade or report is assigned (e.g., reading, composition, spelling, language arts).', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'CourseTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The descriptive name given to a course of study offered in the school, if different from the CourseTitle.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'AlternativeCourseTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'ExternalEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The organization code or name assigning the course identification code.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'AssigningOrganizationIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The URL for the course catalog that defines the course identification code.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscript', @level2type=N'COLUMN', @level2name=N'CourseCatalogURL'
GO

-- Extended Properties [edfixtranscript].[CourseTranscriptAcademicSubject] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The subject area for the course transcript credits awarded in the course transcript.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAcademicSubject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The subject area for the course transcript credits awarded in the course transcript.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAcademicSubject', @level2type=N'COLUMN', @level2name=N'AcademicSubjectDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAcademicSubject', @level2type=N'COLUMN', @level2name=N'CourseAttemptResultDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAcademicSubject', @level2type=N'COLUMN', @level2name=N'CourseIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAcademicSubject', @level2type=N'COLUMN', @level2name=N'CourseIdentificationSystemDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAcademicSubject', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAcademicSubject', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAcademicSubject', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAcademicSubject', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO

-- Extended Properties [edfixtranscript].[CourseTranscriptAlternativeCourseIdentificationCode] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code that identifies the course, course offering, the code from an external educational organization, or other alternate course code.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAlternativeCourseIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAlternativeCourseIdentificationCode', @level2type=N'COLUMN', @level2name=N'CourseAttemptResultDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAlternativeCourseIdentificationCode', @level2type=N'COLUMN', @level2name=N'CourseIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAlternativeCourseIdentificationCode', @level2type=N'COLUMN', @level2name=N'CourseIdentificationSystemDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAlternativeCourseIdentificationCode', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAlternativeCourseIdentificationCode', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAlternativeCourseIdentificationCode', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAlternativeCourseIdentificationCode', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAlternativeCourseIdentificationCode', @level2type=N'COLUMN', @level2name=N'IdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The organization code or name assigning the Identification Code.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAlternativeCourseIdentificationCode', @level2type=N'COLUMN', @level2name=N'AssigningOrganizationIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The URL for the course catalog that defines the course identification code.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptAlternativeCourseIdentificationCode', @level2type=N'COLUMN', @level2name=N'CourseCatalogURL'
GO

-- Extended Properties [edfixtranscript].[CourseTranscriptCourse] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The course recorded in the course transcript entry.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCourse', @level2type=N'COLUMN', @level2name=N'CourseAttemptResultDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCourse', @level2type=N'COLUMN', @level2name=N'CourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCourse', @level2type=N'COLUMN', @level2name=N'CourseEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCourse', @level2type=N'COLUMN', @level2name=N'CourseIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCourse', @level2type=N'COLUMN', @level2name=N'CourseIdentificationSystemDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCourse', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCourse', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCourse', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCourse', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO

-- Extended Properties [edfixtranscript].[CourseTranscriptCreditCategory] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A categorization for the course transcript credits awarded in the course transcript.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCreditCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCreditCategory', @level2type=N'COLUMN', @level2name=N'CourseAttemptResultDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCreditCategory', @level2type=N'COLUMN', @level2name=N'CourseIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCreditCategory', @level2type=N'COLUMN', @level2name=N'CourseIdentificationSystemDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A categorization for the course transcript credits awarded in the course transcript.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCreditCategory', @level2type=N'COLUMN', @level2name=N'CreditCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCreditCategory', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCreditCategory', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCreditCategory', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptCreditCategory', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO

-- Extended Properties [edfixtranscript].[CourseTranscriptEarnedAdditionalCredits] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of additional credits a student attempted and could earn for successfully completing a given course (e.g., dual credit, AP, IB).', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptEarnedAdditionalCredits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptEarnedAdditionalCredits', @level2type=N'COLUMN', @level2name=N'AdditionalCreditTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptEarnedAdditionalCredits', @level2type=N'COLUMN', @level2name=N'CourseAttemptResultDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptEarnedAdditionalCredits', @level2type=N'COLUMN', @level2name=N'CourseIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptEarnedAdditionalCredits', @level2type=N'COLUMN', @level2name=N'CourseIdentificationSystemDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptEarnedAdditionalCredits', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptEarnedAdditionalCredits', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptEarnedAdditionalCredits', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptEarnedAdditionalCredits', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value of credits or units of value awarded for the completion of a course', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'CourseTranscriptEarnedAdditionalCredits', @level2type=N'COLUMN', @level2name=N'Credits'
GO

-- Extended Properties [edfixtranscript].[StudentAcademicRecord] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This educational entity represents the cumulative record of academic achievement for a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'CumulativeEarnedCredits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'CumulativeEarnedCreditTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'CumulativeEarnedCreditConversion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'CumulativeAttemptedCredits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'CumulativeAttemptedCreditTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'CumulativeAttemptedCreditConversion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month and year the student is projected to graduate.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'ProjectedGraduationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'SessionEarnedCredits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'SessionEarnedCreditTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'SessionEarnedCreditConversion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'SessionAttemptedCredits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of credits or units of value awarded for the completion of a course.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'SessionAttemptedCreditTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecord', @level2type=N'COLUMN', @level2name=N'SessionAttemptedCreditConversion'
GO

-- Extended Properties [edfixtranscript].[StudentAcademicRecordAcademicHonor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Academic distinctions earned by or awarded to the student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A designation of the type of academic distinctions earned by or awarded to the student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'AcademicHonorCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of the type of academic distinctions earned by or awarded to the individual.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'HonorDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The title assigned to the achievement.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'AchievementTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The category of achievement attributed to the learner.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'AchievementCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The system that defines the categories by which an achievement is attributed to the learner.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'AchievementCategorySystem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the agent, entity, or institution issuing the element.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'IssuerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Uniform Resource Locator (URL) from which the award was issued.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'IssuerOriginURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The criteria for competency-based completion of the achievement/award.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'Criteria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Uniform Resource Locator (URL) for the unique address of a web page describing the competency-based completion criteria for the achievement/award.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'CriteriaURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A statement or reference describing the evidence that the learner met the criteria for attainment of the Achievement.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'EvidenceStatement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Uniform Resource Locator (URL) for the unique address of an image representing an award or badge associated with the Achievement.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'ImageURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the honor was awarded or earned.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'HonorAwardDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date on which the award expires.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordAcademicHonor', @level2type=N'COLUMN', @level2name=N'HonorAwardExpiresDate'
GO

-- Extended Properties [edfixtranscript].[StudentAcademicRecordClassRanking] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The academic rank information of a student in relation to his or her graduating class.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordClassRanking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordClassRanking', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordClassRanking', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordClassRanking', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordClassRanking', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The academic rank of a student in relation to his or her graduating class (e.g., 1st, 2nd, 3rd).', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordClassRanking', @level2type=N'COLUMN', @level2name=N'ClassRank'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total number of students in the student''s graduating class.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordClassRanking', @level2type=N'COLUMN', @level2name=N'TotalNumberInClass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The academic percentage rank of a student in relation to his or her graduating class (e.g., 95%, 80%, 50%).', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordClassRanking', @level2type=N'COLUMN', @level2name=N'PercentageRanking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date class ranking was determined.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordClassRanking', @level2type=N'COLUMN', @level2name=N'ClassRankingDate'
GO

-- Extended Properties [edfixtranscript].[StudentAcademicRecordDiploma] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Diploma(s) earned by the student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the student met  graduation requirements and was awarded a diploma.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'DiplomaAwardDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'DiplomaTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The title assigned to the achievement.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'AchievementTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The category of achievement attributed to the learner.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'AchievementCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The system that defines the categories by which an achievement is attributed to the learner.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'AchievementCategorySystem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the agent, entity, or institution issuing the element.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'IssuerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Uniform Resource Locator (URL) from which the award was issued.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'IssuerOriginURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The criteria for competency-based completion of the achievement/award.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'Criteria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Uniform Resource Locator (URL) for the unique address of a web page describing the competency-based completion criteria for the achievement/award.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'CriteriaURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A statement or reference describing the evidence that the learner met the criteria for attainment of the Achievement.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'EvidenceStatement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Uniform Resource Locator (URL) for the unique address of an image representing an award or badge associated with the Achievement.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'ImageURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The level of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.
        Minimum high school program
        Recommended high school program
        Distinguished Achievement Program.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'DiplomaLevelDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicated a student who reached a state-defined threshold of vocational education and who attained a high school diploma or its recognized state equivalent or GED.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'CTECompleter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of diploma given to the student for accomplishments.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'DiplomaDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date on which the award expires.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordDiploma', @level2type=N'COLUMN', @level2name=N'DiplomaAwardExpiresDate'
GO

-- Extended Properties [edfixtranscript].[StudentAcademicRecordGradePointAverage] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The grade point average for an individual computed as the grade points earned divided by the number of credits attempted.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordGradePointAverage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordGradePointAverage', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The system used for calculating the grade point average for an individual.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordGradePointAverage', @level2type=N'COLUMN', @level2name=N'GradePointAverageTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordGradePointAverage', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordGradePointAverage', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordGradePointAverage', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicator of whether or not the Grade Point Average value is cumulative.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordGradePointAverage', @level2type=N'COLUMN', @level2name=N'IsCumulative'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The value of the grade points earned divided by the number of credits attempted.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordGradePointAverage', @level2type=N'COLUMN', @level2name=N'GradePointAverageValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The maximum value for the grade point average.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordGradePointAverage', @level2type=N'COLUMN', @level2name=N'MaxGradePointAverageValue'
GO

-- Extended Properties [edfixtranscript].[StudentAcademicRecordRecognition] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Recognitions given to the student for accomplishments in a co-curricular or extracurricular activity.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The nature of recognition given to the learner for accomplishments in a co-curricular, or extra-curricular activity.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'RecognitionTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The title assigned to the achievement.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'AchievementTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The category of achievement attributed to the learner.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'AchievementCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The system that defines the categories by which an achievement is attributed to the learner.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'AchievementCategorySystem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the agent, entity, or institution issuing the element.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'IssuerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Uniform Resource Locator (URL) from which the award was issued.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'IssuerOriginURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The criteria for competency-based completion of the achievement/award.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'Criteria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Uniform Resource Locator (URL) for the unique address of a web page describing the competency-based completion criteria for the achievement/award.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'CriteriaURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A statement or reference describing the evidence that the learner met the criteria for attainment of the Achievement.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'EvidenceStatement'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Uniform Resource Locator (URL) for the unique address of an image representing an award or badge associated with the Achievement.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'ImageURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of the type of academic distinctions earned by or awarded to the individual.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'RecognitionDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the recognition was awarded or earned.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'RecognitionAwardDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date on which the award expires.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordRecognition', @level2type=N'COLUMN', @level2name=N'RecognitionAwardExpiresDate'
GO

-- Extended Properties [edfixtranscript].[StudentAcademicRecordReportCard] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Report cards for the student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordReportCard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordReportCard', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the period for which grades are reported.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordReportCard', @level2type=N'COLUMN', @level2name=N'GradingPeriodDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordReportCard', @level2type=N'COLUMN', @level2name=N'GradingPeriodSchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the grading period school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordReportCard', @level2type=N'COLUMN', @level2name=N'GradingPeriodSchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The sequential order of this period relative to other periods.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordReportCard', @level2type=N'COLUMN', @level2name=N'GradingPeriodSequence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordReportCard', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordReportCard', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The term for the session during the school year.', @level0type=N'SCHEMA', @level0name=N'edfixtranscript', @level1type=N'TABLE', @level1name=N'StudentAcademicRecordReportCard', @level2type=N'COLUMN', @level2name=N'TermDescriptorId'
GO

