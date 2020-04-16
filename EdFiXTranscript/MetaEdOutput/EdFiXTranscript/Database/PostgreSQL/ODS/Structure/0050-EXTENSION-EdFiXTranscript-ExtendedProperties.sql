-- Extended Properties [edfixtranscript].[CourseTranscript] --
COMMENT ON TABLE edfixtranscript.CourseTranscript IS 'This entity is the final record of a student''s performance in their courses at the end of a semester or school year.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.CourseAttemptResultDescriptorId IS 'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.CourseIdentificationCode IS 'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.CourseIdentificationSystemDescriptorId IS 'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.AttemptedCredits IS 'The value of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.AttemptedCreditTypeDescriptorId IS 'The type of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.AttemptedCreditConversion IS 'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.EarnedCredits IS 'The value of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.EarnedCreditTypeDescriptorId IS 'The type of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.EarnedCreditConversion IS 'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.WhenTakenGradeLevelDescriptorId IS 'Student''s grade level at time of course.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.MethodCreditEarnedDescriptorId IS 'The method the credits were earned (e.g., Classroom, Examination, Transfer).';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.FinalLetterGradeEarned IS 'The final indicator of student performance in a class as submitted by the instructor.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.FinalNumericGradeEarned IS 'The final indicator of student performance in a class as submitted by the instructor.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.CourseRepeatCodeDescriptorId IS 'Indicates that an academic course has been repeated by a student and how that repeat is to be computed in the student''s academic grade average.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.CourseTitle IS 'The descriptive name given to a course of study offered in a school or other institution or organization. In departmentalized classes at the elementary, secondary, and postsecondary levels (and for staff development activities), this refers to the name by which a course is identified (e.g., American History, English III). For elementary and other non-departmentalized classes, it refers to any portion of the instruction for which a grade or report is assigned (e.g., reading, composition, spelling, language arts).';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.AlternativeCourseTitle IS 'The descriptive name given to a course of study offered in the school, if different from the CourseTitle.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.ExternalEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.AssigningOrganizationIdentificationCode IS 'The organization code or name assigning the course identification code.';
COMMENT ON COLUMN edfixtranscript.CourseTranscript.CourseCatalogURL IS 'The URL for the course catalog that defines the course identification code.';

-- Extended Properties [edfixtranscript].[CourseTranscriptAcademicSubject] --
COMMENT ON TABLE edfixtranscript.CourseTranscriptAcademicSubject IS 'The subject area for the course transcript credits awarded in the course transcript.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAcademicSubject.AcademicSubjectDescriptorId IS 'The subject area for the course transcript credits awarded in the course transcript.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAcademicSubject.CourseAttemptResultDescriptorId IS 'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAcademicSubject.CourseIdentificationCode IS 'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAcademicSubject.CourseIdentificationSystemDescriptorId IS 'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAcademicSubject.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAcademicSubject.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAcademicSubject.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAcademicSubject.TermDescriptorId IS 'The term for the session during the school year.';

-- Extended Properties [edfixtranscript].[CourseTranscriptAlternativeCourseIdentificationCode] --
COMMENT ON TABLE edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode IS 'The code that identifies the course, course offering, the code from an external educational organization, or other alternate course code.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode.AlternativeCourseIdentificationSystemDescriptorId IS 'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode.CourseAttemptResultDescriptorId IS 'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode.CourseIdentificationCode IS 'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode.CourseIdentificationSystemDescriptorId IS 'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode.AlternativeIdentificationCode IS 'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode.AssigningOrganizationIdentificationCode IS 'The organization code or name assigning the Identification Code.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptAlternativeCourseIdentificationCode.CourseCatalogURL IS 'The URL for the course catalog that defines the course identification code.';

-- Extended Properties [edfixtranscript].[CourseTranscriptCourse] --
COMMENT ON TABLE edfixtranscript.CourseTranscriptCourse IS 'The course recorded in the course transcript entry.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCourse.CourseAttemptResultDescriptorId IS 'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCourse.CourseCode IS 'A unique alphanumeric code assigned to a course.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCourse.CourseEducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCourse.CourseIdentificationCode IS 'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCourse.CourseIdentificationSystemDescriptorId IS 'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCourse.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCourse.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCourse.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCourse.TermDescriptorId IS 'The term for the session during the school year.';

-- Extended Properties [edfixtranscript].[CourseTranscriptCreditCategory] --
COMMENT ON TABLE edfixtranscript.CourseTranscriptCreditCategory IS 'A categorization for the course transcript credits awarded in the course transcript.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCreditCategory.CourseAttemptResultDescriptorId IS 'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCreditCategory.CourseIdentificationCode IS 'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCreditCategory.CourseIdentificationSystemDescriptorId IS 'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCreditCategory.CreditCategoryDescriptorId IS 'A categorization for the course transcript credits awarded in the course transcript.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCreditCategory.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCreditCategory.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCreditCategory.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptCreditCategory.TermDescriptorId IS 'The term for the session during the school year.';

-- Extended Properties [edfixtranscript].[CourseTranscriptEarnedAdditionalCredits] --
COMMENT ON TABLE edfixtranscript.CourseTranscriptEarnedAdditionalCredits IS 'The number of additional credits a student attempted and could earn for successfully completing a given course (e.g., dual credit, AP, IB).';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptEarnedAdditionalCredits.AdditionalCreditTypeDescriptorId IS 'The type of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptEarnedAdditionalCredits.CourseAttemptResultDescriptorId IS 'The result from the student''s attempt to take the course, for example:
        Pass
        Fail
        Incomplete
        Withdrawn.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptEarnedAdditionalCredits.CourseIdentificationCode IS 'A unique number or alphanumeric code assigned to a course by a school, school system, state, or other agency or entity. For multi-part course codes, concatenate the parts separated by a "/". For example, consider the following SCED code-    subject = 20 Math    course = 272 Geometry    level = G General    credits = 1.00   course sequence 1 of 1- would be entered as 20/272/G/1.00/1 of 1.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptEarnedAdditionalCredits.CourseIdentificationSystemDescriptorId IS 'A system that is used to identify the organization of subject matter and related learning experiences provided for the instruction of students.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptEarnedAdditionalCredits.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptEarnedAdditionalCredits.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptEarnedAdditionalCredits.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptEarnedAdditionalCredits.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN edfixtranscript.CourseTranscriptEarnedAdditionalCredits.Credits IS 'The value of credits or units of value awarded for the completion of a course';

-- Extended Properties [edfixtranscript].[StudentAcademicRecord] --
COMMENT ON TABLE edfixtranscript.StudentAcademicRecord IS 'This educational entity represents the cumulative record of academic achievement for a student.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.CumulativeEarnedCredits IS 'The value of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.CumulativeEarnedCreditTypeDescriptorId IS 'The type of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.CumulativeEarnedCreditConversion IS 'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.CumulativeAttemptedCredits IS 'The value of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.CumulativeAttemptedCreditTypeDescriptorId IS 'The type of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.CumulativeAttemptedCreditConversion IS 'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.ProjectedGraduationDate IS 'The month and year the student is projected to graduate.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.SessionEarnedCredits IS 'The value of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.SessionEarnedCreditTypeDescriptorId IS 'The type of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.SessionEarnedCreditConversion IS 'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.SessionAttemptedCredits IS 'The value of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.SessionAttemptedCreditTypeDescriptorId IS 'The type of credits or units of value awarded for the completion of a course.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecord.SessionAttemptedCreditConversion IS 'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.';

-- Extended Properties [edfixtranscript].[StudentAcademicRecordAcademicHonor] --
COMMENT ON TABLE edfixtranscript.StudentAcademicRecordAcademicHonor IS 'Academic distinctions earned by or awarded to the student.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.AcademicHonorCategoryDescriptorId IS 'A designation of the type of academic distinctions earned by or awarded to the student.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.HonorDescription IS 'A description of the type of academic distinctions earned by or awarded to the individual.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.AchievementTitle IS 'The title assigned to the achievement.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.AchievementCategoryDescriptorId IS 'The category of achievement attributed to the learner.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.AchievementCategorySystem IS 'The system that defines the categories by which an achievement is attributed to the learner.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.IssuerName IS 'The name of the agent, entity, or institution issuing the element.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.IssuerOriginURL IS 'The Uniform Resource Locator (URL) from which the award was issued.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.Criteria IS 'The criteria for competency-based completion of the achievement/award.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.CriteriaURL IS 'The Uniform Resource Locator (URL) for the unique address of a web page describing the competency-based completion criteria for the achievement/award.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.EvidenceStatement IS 'A statement or reference describing the evidence that the learner met the criteria for attainment of the Achievement.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.ImageURL IS 'The Uniform Resource Locator (URL) for the unique address of an image representing an award or badge associated with the Achievement.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.HonorAwardDate IS 'The date the honor was awarded or earned.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordAcademicHonor.HonorAwardExpiresDate IS 'Date on which the award expires.';

-- Extended Properties [edfixtranscript].[StudentAcademicRecordClassRanking] --
COMMENT ON TABLE edfixtranscript.StudentAcademicRecordClassRanking IS 'The academic rank information of a student in relation to his or her graduating class.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordClassRanking.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordClassRanking.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordClassRanking.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordClassRanking.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordClassRanking.ClassRank IS 'The academic rank of a student in relation to his or her graduating class (e.g., 1st, 2nd, 3rd).';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordClassRanking.TotalNumberInClass IS 'The total number of students in the student''s graduating class.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordClassRanking.PercentageRanking IS 'The academic percentage rank of a student in relation to his or her graduating class (e.g., 95%, 80%, 50%).';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordClassRanking.ClassRankingDate IS 'Date class ranking was determined.';

-- Extended Properties [edfixtranscript].[StudentAcademicRecordDiploma] --
COMMENT ON TABLE edfixtranscript.StudentAcademicRecordDiploma IS 'Diploma(s) earned by the student.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.DiplomaAwardDate IS 'The month, day, and year on which the student met  graduation requirements and was awarded a diploma.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.DiplomaTypeDescriptorId IS 'The type of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.AchievementTitle IS 'The title assigned to the achievement.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.AchievementCategoryDescriptorId IS 'The category of achievement attributed to the learner.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.AchievementCategorySystem IS 'The system that defines the categories by which an achievement is attributed to the learner.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.IssuerName IS 'The name of the agent, entity, or institution issuing the element.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.IssuerOriginURL IS 'The Uniform Resource Locator (URL) from which the award was issued.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.Criteria IS 'The criteria for competency-based completion of the achievement/award.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.CriteriaURL IS 'The Uniform Resource Locator (URL) for the unique address of a web page describing the competency-based completion criteria for the achievement/award.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.EvidenceStatement IS 'A statement or reference describing the evidence that the learner met the criteria for attainment of the Achievement.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.ImageURL IS 'The Uniform Resource Locator (URL) for the unique address of an image representing an award or badge associated with the Achievement.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.DiplomaLevelDescriptorId IS 'The level of diploma/credential that is awarded to a student in recognition of his/her completion of the curricular requirements.
        Minimum high school program
        Recommended high school program
        Distinguished Achievement Program.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.CTECompleter IS 'Indicated a student who reached a state-defined threshold of vocational education and who attained a high school diploma or its recognized state equivalent or GED.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.DiplomaDescription IS 'The description of diploma given to the student for accomplishments.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordDiploma.DiplomaAwardExpiresDate IS 'Date on which the award expires.';

-- Extended Properties [edfixtranscript].[StudentAcademicRecordGradePointAverage] --
COMMENT ON TABLE edfixtranscript.StudentAcademicRecordGradePointAverage IS 'The grade point average for an individual computed as the grade points earned divided by the number of credits attempted.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordGradePointAverage.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordGradePointAverage.GradePointAverageTypeDescriptorId IS 'The system used for calculating the grade point average for an individual.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordGradePointAverage.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordGradePointAverage.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordGradePointAverage.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordGradePointAverage.IsCumulative IS 'Indicator of whether or not the Grade Point Average value is cumulative.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordGradePointAverage.GradePointAverageValue IS 'The value of the grade points earned divided by the number of credits attempted.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordGradePointAverage.MaxGradePointAverageValue IS 'The maximum value for the grade point average.';

-- Extended Properties [edfixtranscript].[StudentAcademicRecordRecognition] --
COMMENT ON TABLE edfixtranscript.StudentAcademicRecordRecognition IS 'Recognitions given to the student for accomplishments in a co-curricular or extracurricular activity.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.RecognitionTypeDescriptorId IS 'The nature of recognition given to the learner for accomplishments in a co-curricular, or extra-curricular activity.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.SchoolYear IS 'The identifier for the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.TermDescriptorId IS 'The term for the session during the school year.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.AchievementTitle IS 'The title assigned to the achievement.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.AchievementCategoryDescriptorId IS 'The category of achievement attributed to the learner.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.AchievementCategorySystem IS 'The system that defines the categories by which an achievement is attributed to the learner.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.IssuerName IS 'The name of the agent, entity, or institution issuing the element.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.IssuerOriginURL IS 'The Uniform Resource Locator (URL) from which the award was issued.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.Criteria IS 'The criteria for competency-based completion of the achievement/award.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.CriteriaURL IS 'The Uniform Resource Locator (URL) for the unique address of a web page describing the competency-based completion criteria for the achievement/award.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.EvidenceStatement IS 'A statement or reference describing the evidence that the learner met the criteria for attainment of the Achievement.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.ImageURL IS 'The Uniform Resource Locator (URL) for the unique address of an image representing an award or badge associated with the Achievement.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.RecognitionDescription IS 'A description of the type of academic distinctions earned by or awarded to the individual.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.RecognitionAwardDate IS 'The date the recognition was awarded or earned.';
COMMENT ON COLUMN edfixtranscript.StudentAcademicRecordRecognition.RecognitionAwardExpiresDate IS 'Date on which the award expires.';

