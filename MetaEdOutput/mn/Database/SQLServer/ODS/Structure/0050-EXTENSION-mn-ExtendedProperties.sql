-- Extended Properties [mn].[AncestryEthnicOriginDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ancestry ethnic origins that pertain to the general racial categories with which the individual identifies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AncestryEthnicOriginDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AncestryEthnicOriginDescriptor', @level2type=N'COLUMN', @level2name=N'AncestryEthnicOriginDescriptorId'
GO

-- Extended Properties [mn].[AssessmentCharacteristicDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Generic characteristics about an Assessment other than Accommodations.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AssessmentCharacteristicDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AssessmentCharacteristicDescriptor', @level2type=N'COLUMN', @level2name=N'AssessmentCharacteristicDescriptorId'
GO

-- Extended Properties [mn].[AssessmentFormatDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Format for which an assessment was administered. E.g., O-Online or P-Paper', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AssessmentFormatDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AssessmentFormatDescriptor', @level2type=N'COLUMN', @level2name=N'AssessmentFormatDescriptorId'
GO

-- Extended Properties [mn].[AssessmentStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The state of a student assessment. E.g.,
      Student has submitted a response for all scored items OR
      Student has submitted a response to at least one scored item, but not all scored items', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AssessmentStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AssessmentStatusDescriptor', @level2type=N'COLUMN', @level2name=N'AssessmentStatusDescriptorId'
GO

-- Extended Properties [mn].[AssessmentTierDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tier descriptor for Assessment or Objective Assessment. E.g., Listening, Reading, Speaking, Writing', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AssessmentTierDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AssessmentTierDescriptor', @level2type=N'COLUMN', @level2name=N'AssessmentTierDescriptorId'
GO

-- Extended Properties [mn].[AssessmentToolDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Assessment tool. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AssessmentToolDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'AssessmentToolDescriptor', @level2type=N'COLUMN', @level2name=N'AssessmentToolDescriptorId'
GO

-- Extended Properties [mn].[CalendarExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CalendarExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the Calendar.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'CalendarCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year associated with the Calendar.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Calendar description.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'CalendarDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Days in session.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'DaysInSession'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total number of Instructional days during the current school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'InstructionalDays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kindergarten Schedule', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'KindergartenScheduleDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Length of Day.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CalendarExtension', @level2type=N'COLUMN', @level2name=N'LengthOfDay'
GO

-- Extended Properties [mn].[CareerClusterDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Career cluster defines the industry or occupational focus for a career pathways program, plan of study, or course.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CareerClusterDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CareerClusterDescriptor', @level2type=N'COLUMN', @level2name=N'CareerClusterDescriptorId'
GO

-- Extended Properties [mn].[ClassPeriodExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ClassPeriodExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ClassPeriodExtension', @level2type=N'COLUMN', @level2name=N'ClassPeriodName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ClassPeriodExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Class period description.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ClassPeriodExtension', @level2type=N'COLUMN', @level2name=N'ClassPeriodDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Class period type. E.g., Before School, During School, After School, Evening School', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ClassPeriodExtension', @level2type=N'COLUMN', @level2name=N'ClassPeriodTypeDescriptorId'
GO

-- Extended Properties [mn].[ClassPeriodTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Class period type. E.g., Before School, During School, After School, Evening School', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ClassPeriodTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ClassPeriodTypeDescriptor', @level2type=N'COLUMN', @level2name=N'ClassPeriodTypeDescriptorId'
GO

-- Extended Properties [mn].[ClassroomVolunteerDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Classification of classroon volunteer capacity of a parent. E.g., Full-time volunteer or part-time volunteer. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ClassroomVolunteerDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ClassroomVolunteerDescriptor', @level2type=N'COLUMN', @level2name=N'ClassroomVolunteerDescriptorId'
GO

-- Extended Properties [mn].[CourseAssessmentTool] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Assessment tool that has been implemented for the course. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseAssessmentTool'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Assessment tool.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseAssessmentTool', @level2type=N'COLUMN', @level2name=N'AssessmentToolDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a course.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseAssessmentTool', @level2type=N'COLUMN', @level2name=N'CourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseAssessmentTool', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status of implementation of the assessment tool.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseAssessmentTool', @level2type=N'COLUMN', @level2name=N'ImplementationStatusDescriptorId'
GO

-- Extended Properties [mn].[CourseCourseAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Supports associations from State, District, and College courses.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseCourseAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a course.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseCourseAssociation', @level2type=N'COLUMN', @level2name=N'CourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseCourseAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a course.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseCourseAssociation', @level2type=N'COLUMN', @level2name=N'ToCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseCourseAssociation', @level2type=N'COLUMN', @level2name=N'ToCourseEducationOrganizationId'
GO

-- Extended Properties [mn].[CourseCurriculumUsed] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Curriculum as implemented for the course. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseCurriculumUsed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a course.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseCurriculumUsed', @level2type=N'COLUMN', @level2name=N'CourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of curriculum used in an early learning classroom or group.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseCurriculumUsed', @level2type=N'COLUMN', @level2name=N'CurriculumUsedDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseCurriculumUsed', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status of implementation of the curriculum used.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseCurriculumUsed', @level2type=N'COLUMN', @level2name=N'ImplementationStatusDescriptorId'
GO

-- Extended Properties [mn].[CourseExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a course.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'CourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Classification of instruction site for Early Education. E.g., child''s home or care center.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'EarlyEducationCourseLocationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The upper limit of this course within a sequence. E.g., (1 of N)', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'SequenceLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Locality of entity who''s learning standard is addressed by this course. E.g., State, Federal, or Local.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'StandardAddressedDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Career cluster defines the industry or occupational focus for a career pathways program, plan of study, or course.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'CareerClusterDescriptorId'
GO

-- Extended Properties [mn].[CourseLevelType] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ''type level'' of which the course is associated. E.g, Advanced, Articulated, Basic, Dual, General, No credit, Occupational', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseLevelType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a course.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseLevelType', @level2type=N'COLUMN', @level2name=N'CourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ''type level'' of which the course is associated. E.g, Advanced, Articulated, Basic, Dual, General, No credit, Occupational', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseLevelType', @level2type=N'COLUMN', @level2name=N'CourseLevelTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseLevelType', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO

-- Extended Properties [mn].[CourseLevelTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ''type level'' of which the course is associated. E.g, Advanced, Articulated, Basic, Dual, General, No credit, Occupational', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseLevelTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseLevelTypeDescriptor', @level2type=N'COLUMN', @level2name=N'CourseLevelTypeDescriptorId'
GO

-- Extended Properties [mn].[CourseOfferingExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Instruction minutes per term.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingExtension', @level2type=N'COLUMN', @level2name=N'InstructionMinutesPerTerm'
GO

-- Extended Properties [mn].[CourseOfferingInstructionalApproach] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Instructional approach as implemented for the course offering. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingInstructionalApproach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Instructional approach.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingInstructionalApproach', @level2type=N'COLUMN', @level2name=N'InstructionalApproachDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingInstructionalApproach', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingInstructionalApproach', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingInstructionalApproach', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingInstructionalApproach', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status of implementation of the instructional approach.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingInstructionalApproach', @level2type=N'COLUMN', @level2name=N'ImplementationStatusDescriptorId'
GO

-- Extended Properties [mn].[CourseOfferingSiteBasedInitiative] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Site-based initiative as implemented for the course offering. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingSiteBasedInitiative'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Site-based initiative.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'SiteBasedInitiativeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status of implementation of the site-based initiative.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseOfferingSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'ImplementationStatusDescriptorId'
GO

-- Extended Properties [mn].[CourseProgram] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Program associated to the course. General purpose but intially extended for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseProgram'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a course.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseProgram', @level2type=N'COLUMN', @level2name=N'CourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseProgram', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseProgram', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'CourseProgram', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO

-- Extended Properties [mn].[DistrictTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A two digit numeric code representing the MARSS district type.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'DistrictTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'DistrictTypeDescriptor', @level2type=N'COLUMN', @level2name=N'DistrictTypeDescriptorId'
GO

-- Extended Properties [mn].[EarlyChildhoodScreenerDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor contains codes indicating who completed a screening for a student in the Early Childhood Screening program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'EarlyChildhoodScreenerDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'EarlyChildhoodScreenerDescriptor', @level2type=N'COLUMN', @level2name=N'EarlyChildhoodScreenerDescriptorId'
GO

-- Extended Properties [mn].[EarlyChildhoodScreeningExitStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Early Childhood Screening Exit Status.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'EarlyChildhoodScreeningExitStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'EarlyChildhoodScreeningExitStatusDescriptor', @level2type=N'COLUMN', @level2name=N'EarlyChildhoodScreeningExitStatusDescriptorId'
GO

-- Extended Properties [mn].[EarlyEducationCourseLocationDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Classification of instruction site for Early Education. E.g., child''s home or care center.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'EarlyEducationCourseLocationDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'EarlyEducationCourseLocationDescriptor', @level2type=N'COLUMN', @level2name=N'EarlyEducationCourseLocationDescriptorId'
GO

-- Extended Properties [mn].[EdFiSubmissionAccessDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether a district is approved to submit data.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'EdFiSubmissionAccessDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'EdFiSubmissionAccessDescriptor', @level2type=N'COLUMN', @level2name=N'EdFiSubmissionAccessDescriptorId'
GO

-- Extended Properties [mn].[ExamReimbursementRequest] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Exam reimbursement request (formerly known as Graduate Required Records).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ExamReimbursementRequest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ExamReimbursementRequest', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ExamReimbursementRequest', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date student took the test.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ExamReimbursementRequest', @level2type=N'COLUMN', @level2name=N'TestedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Test that requires reimbursement. E.g., ACT, ACT plus Writing, SAT, SAT with Essay.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ExamReimbursementRequest', @level2type=N'COLUMN', @level2name=N'AssessmentCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reimbursement was requested.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ExamReimbursementRequest', @level2type=N'COLUMN', @level2name=N'ReimbursementRequested'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reimbursement for a student determined by the district as ''unable to pay''.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ExamReimbursementRequest', @level2type=N'COLUMN', @level2name=N'UnableToPay'
GO

-- Extended Properties [mn].[FundingSourceDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Funding source.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'FundingSourceDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'FundingSourceDescriptor', @level2type=N'COLUMN', @level2name=N'FundingSourceDescriptorId'
GO

-- Extended Properties [mn].[GeneralEnrollmentDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'General type of enrollment for a student. E.g., R-Regular, N-Nonpublic, H-Homeschool', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GeneralEnrollmentDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GeneralEnrollmentDescriptor', @level2type=N'COLUMN', @level2name=N'GeneralEnrollmentDescriptorId'
GO

-- Extended Properties [mn].[GiftedTalentedParticipationDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor contains Gifted and Talented Program codes.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GiftedTalentedParticipationDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GiftedTalentedParticipationDescriptor', @level2type=N'COLUMN', @level2name=N'GiftedTalentedParticipationDescriptorId'
GO

-- Extended Properties [mn].[GradeExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the Student''s entry or assignment to the Section.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of grade reported (e.g., Exam, Final, Grading Period).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'GradeTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the period for which grades are reported.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'GradingPeriodDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the grading period school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'GradingPeriodSchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The sequential order of this period relative to other periods.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'GradingPeriodSequence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'College credit earned.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'CollegeCreditEarned'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'College grade earned.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'CollegeGradeEarned'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'College credit earned.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'LocalCreditEarned'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor holds the description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'GradeExtension', @level2type=N'COLUMN', @level2name=N'AcademicSubjectDescriptorId'
GO

-- Extended Properties [mn].[ImplementationStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status of project implementation of various type. E.g., Beginning, Expanding, or Maintaining. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ImplementationStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ImplementationStatusDescriptor', @level2type=N'COLUMN', @level2name=N'ImplementationStatusDescriptorId'
GO

-- Extended Properties [mn].[InstructionalApproachDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Instructional approach. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'InstructionalApproachDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'InstructionalApproachDescriptor', @level2type=N'COLUMN', @level2name=N'InstructionalApproachDescriptorId'
GO

-- Extended Properties [mn].[InstructionalDeliveryModeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The delivery mode of instuction. E.g, On-ground, Online, etc', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'InstructionalDeliveryModeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'InstructionalDeliveryModeDescriptor', @level2type=N'COLUMN', @level2name=N'InstructionalDeliveryModeDescriptorId'
GO

-- Extended Properties [mn].[KindergartenScheduleDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor contains Kindergarten Schedule codes used to verify data reported for transportation reimbursement reports to the legislature.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'KindergartenScheduleDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'KindergartenScheduleDescriptor', @level2type=N'COLUMN', @level2name=N'KindergartenScheduleDescriptorId'
GO

-- Extended Properties [mn].[LocalEducationAgencyExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyExtension', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The two digit numeric code representing the MARSS district type.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyExtension', @level2type=N'COLUMN', @level2name=N'DistrictTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether a district is approved to submit data.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'LocalEducationAgencyExtension', @level2type=N'COLUMN', @level2name=N'EdFiSubmissionAccessDescriptorId'
GO

-- Extended Properties [mn].[MembershipAttendanceUnitDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor indicates whether Membership and Attendance totals are being reported in terms of Days or Hours.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'MembershipAttendanceUnitDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'MembershipAttendanceUnitDescriptor', @level2type=N'COLUMN', @level2name=N'MembershipAttendanceUnitDescriptorId'
GO

-- Extended Properties [mn].[OptOutIndicatorsDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor contains Opt Out indicators.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'OptOutIndicatorsDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'OptOutIndicatorsDescriptor', @level2type=N'COLUMN', @level2name=N'OptOutIndicatorsDescriptorId'
GO

-- Extended Properties [mn].[ParentExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ParentExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a parent.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ParentExtension', @level2type=N'COLUMN', @level2name=N'ParentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the parent was born.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ParentExtension', @level2type=N'COLUMN', @level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Classification of classroon volunteer capacity of a parent. E.g., Full-time volunteer or part-time volunteer. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ParentExtension', @level2type=N'COLUMN', @level2name=N'ClassroomVolunteerDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The extent of formal instruction an parent has received (e.g., the highest grade in school completed or its equivalent or the highest degree received).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ParentExtension', @level2type=N'COLUMN', @level2name=N'HighestCompletedLevelOfEducationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Annual income of the household in monetary units.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ParentExtension', @level2type=N'COLUMN', @level2name=N'HouseholdIncome'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of people in the household.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ParentExtension', @level2type=N'COLUMN', @level2name=N'HouseholdSize'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Is parent is receiving interpreter assistance?', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ParentExtension', @level2type=N'COLUMN', @level2name=N'ReceivingInterpreterAssistance'
GO

-- Extended Properties [mn].[ParentIdentificationCode] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Miscellaneous parent Identification Code. E.g., MARSS ID of of a related student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ParentIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Miscellaneous parent Identification Code. E.g., MARSS ID of of a related student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ParentIdentificationCode', @level2type=N'COLUMN', @level2name=N'IdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a parent.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ParentIdentificationCode', @level2type=N'COLUMN', @level2name=N'ParentUSI'
GO

-- Extended Properties [mn].[PrecodeTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of pre-code record. For example, MCA/MTAS, ACCESS/ALT-ACCESS', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'PrecodeTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'PrecodeTypeDescriptor', @level2type=N'COLUMN', @level2name=N'PrecodeTypeDescriptorId'
GO

-- Extended Properties [mn].[SchoolClassificationDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The numeric code representing the MARSS school classification.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SchoolClassificationDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SchoolClassificationDescriptor', @level2type=N'COLUMN', @level2name=N'SchoolClassificationDescriptorId'
GO

-- Extended Properties [mn].[SchoolExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SchoolExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SchoolExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The numeric code representing the MARSS school classification.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SchoolExtension', @level2type=N'COLUMN', @level2name=N'SchoolClassificationDescriptorId'
GO

-- Extended Properties [mn].[SectionEnrollmentTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Section enrollment type.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SectionEnrollmentTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SectionEnrollmentTypeDescriptor', @level2type=N'COLUMN', @level2name=N'SectionEnrollmentTypeDescriptorId'
GO

-- Extended Properties [mn].[SectionExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SectionExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The delivery mode of instuction. E.g, On-ground, Online, etc', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'InstructionalDeliveryModeDescriptorId'
GO

-- Extended Properties [mn].[SessionExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SessionExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SessionExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SessionExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SessionExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total days in session.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SessionExtension', @level2type=N'COLUMN', @level2name=N'DaysInSession'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Term number.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SessionExtension', @level2type=N'COLUMN', @level2name=N'TermNumber'
GO

-- Extended Properties [mn].[ShippingInstructionDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shipping instructions such as Labels, Shipping Date, Shipping Preference', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ShippingInstructionDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'ShippingInstructionDescriptor', @level2type=N'COLUMN', @level2name=N'ShippingInstructionDescriptorId'
GO

-- Extended Properties [mn].[SiteBasedInitiativeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Site-based initiative. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SiteBasedInitiativeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SiteBasedInitiativeDescriptor', @level2type=N'COLUMN', @level2name=N'SiteBasedInitiativeDescriptorId'
GO

-- Extended Properties [mn].[SpecialEducationEvaluationStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indicator of the students'' need for and participation in special education programs during this enrollment period.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SpecialEducationEvaluationStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'SpecialEducationEvaluationStatusDescriptor', @level2type=N'COLUMN', @level2name=N'SpecialEducationEvaluationStatusDescriptorId'
GO

-- Extended Properties [mn].[StandardAddressedDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Locality of entity who''s learning standard is addressed. E.g., State, Federal, or Local.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StandardAddressedDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StandardAddressedDescriptor', @level2type=N'COLUMN', @level2name=N'StandardAddressedDescriptorId'
GO

-- Extended Properties [mn].[StateAidCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State Aid Category is used to determine which district generates state aid for
students and which state aid students are eligible to generate.  It is also used to validate
DISTRICT NUMBER/TYPE and STUDENT RESIDENT DISTRICT NUMBER/TYPE.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StateAidCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StateAidCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'StateAidCategoryDescriptorId'
GO

-- Extended Properties [mn].[Student21stCenturyLearningCenterGrantProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents Students in the 21st Century Community Learning Centers Grant Program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'Student21stCenturyLearningCenterGrantProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'Student21stCenturyLearningCenterGrantProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'Student21stCenturyLearningCenterGrantProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'Student21stCenturyLearningCenterGrantProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'Student21stCenturyLearningCenterGrantProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'Student21stCenturyLearningCenterGrantProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'Student21stCenturyLearningCenterGrantProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attendance days', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'Student21stCenturyLearningCenterGrantProgramAssociation', @level2type=N'COLUMN', @level2name=N'AttendanceDays'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Attendance hours', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'Student21stCenturyLearningCenterGrantProgramAssociation', @level2type=N'COLUMN', @level2name=N'AttendanceHours'
GO

-- Extended Properties [mn].[StudentADSISProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents Students in the Alternative Delivery of Specialized Instruction (ADSIS) Program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentADSISProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentADSISProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentADSISProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentADSISProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentADSISProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentADSISProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentADSISProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [mn].[StudentAssessmentCharacteristic] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Generic characteristics about an Assessment other than Accommodations.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentCharacteristic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Generic characteristics about an Assessment other than Accommodations.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentCharacteristic', @level2type=N'COLUMN', @level2name=N'AssessmentCharacteristicDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentCharacteristic', @level2type=N'COLUMN', @level2name=N'AssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Namespace for the Assessment.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentCharacteristic', @level2type=N'COLUMN', @level2name=N'Namespace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment administered to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentCharacteristic', @level2type=N'COLUMN', @level2name=N'StudentAssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentCharacteristic', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [mn].[StudentAssessmentExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension', @level2type=N'COLUMN', @level2name=N'AssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Namespace for the Assessment.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension', @level2type=N'COLUMN', @level2name=N'Namespace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment administered to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension', @level2type=N'COLUMN', @level2name=N'StudentAssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Format for which an assessment was administered. E.g., Online or Paper', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension', @level2type=N'COLUMN', @level2name=N'AssessmentFormatDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension', @level2type=N'COLUMN', @level2name=N'SiteEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tier descriptor for Assessment. E.g., Listening, Reading, Speaking, Writing', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension', @level2type=N'COLUMN', @level2name=N'AssessmentTierDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CAT Student Test ID', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension', @level2type=N'COLUMN', @level2name=N'CatStudentTestId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'General type of enrollment for a student. E.g., R-Regular, N-Nonpublic, H-Homeschool', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension', @level2type=N'COLUMN', @level2name=N'GeneralEnrollmentDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Learning locator code', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension', @level2type=N'COLUMN', @level2name=N'LearningLocatorCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Total recorded time duration in seconds', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentExtension', @level2type=N'COLUMN', @level2name=N'TimeOnTest'
GO

-- Extended Properties [mn].[StudentAssessmentPrecode] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pre-code information for assessment vendor', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecode', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of pre-code record. For example, MCA/MTAS, ACCESS/ALT-ACCESS', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecode', @level2type=N'COLUMN', @level2name=N'PrecodeTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecode', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecode', @level2type=N'COLUMN', @level2name=N'SiteEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of pre-code site record. For example, MCA/MTAS, ACCESS/ALT-ACCESS', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecode', @level2type=N'COLUMN', @level2name=N'SitePrecodeTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Refers to the test name of the assessment taken by the student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecode', @level2type=N'COLUMN', @level2name=N'AssessmentTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The grade level tested for student when assessed.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecode', @level2type=N'COLUMN', @level2name=N'AssessedGradeLevelDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The grade level for which student is enrolled.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecode', @level2type=N'COLUMN', @level2name=N'EnrolledGradeLevelDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Student enrollment at the time of assessment pre-coding. For example H-Homeschool, N-Nonpublic, R-Regular', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecode', @level2type=N'COLUMN', @level2name=N'GeneralEnrollmentDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'District use special sort order', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecode', @level2type=N'COLUMN', @level2name=N'CustomGroup'
GO

-- Extended Properties [mn].[StudentAssessmentPrecodeAcademicSubject] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeAcademicSubject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language) of an assessment.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeAcademicSubject', @level2type=N'COLUMN', @level2name=N'AcademicSubjectDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeAcademicSubject', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of pre-code record. For example, MCA/MTAS, ACCESS/ALT-ACCESS', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeAcademicSubject', @level2type=N'COLUMN', @level2name=N'PrecodeTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeAcademicSubject', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [mn].[StudentAssessmentPrecodeAccommodation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The specific type of special variation used in how an examination is presented, how it is administered, or how the test taker is allowed to respond. This generally refers to changes that do not substantially alter what the examination measures. The proper use of accommodations does not substantially change academic level or performance criteria. For example:
        Braille
        Enlarged monitor view
        Extra time
        Large Print
        Setting
        Oral Administration
        ...', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeAccommodation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The specific type of special variation used in how an examination is presented, how it is administered, or how the test taker is allowed to respond. This generally refers to changes that do not substantially alter what the examination measures. The proper use of accommodations does not substantially change academic level or performance criteria. For example:
        Braille
        Enlarged monitor view
        Extra time
        Large Print
        Setting
        Oral Administration
        ...', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeAccommodation', @level2type=N'COLUMN', @level2name=N'AccommodationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeAccommodation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of pre-code record. For example, MCA/MTAS, ACCESS/ALT-ACCESS', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeAccommodation', @level2type=N'COLUMN', @level2name=N'PrecodeTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeAccommodation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [mn].[StudentAssessmentPrecodeSite] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pre-code assessment administration site and organization information', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSite'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSite', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of pre-code site record. For example, MCA/MTAS, ACCESS/ALT-ACCESS', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSite', @level2type=N'COLUMN', @level2name=N'PrecodeTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Title of administrative contact', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSite', @level2type=N'COLUMN', @level2name=N'ContactTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email address or login of administrative contact', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSite', @level2type=N'COLUMN', @level2name=N'ContactElectronicMailAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First name of administrative contact', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSite', @level2type=N'COLUMN', @level2name=N'ContactFirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last name of administrative contact', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSite', @level2type=N'COLUMN', @level2name=N'ContactLastSurname'
GO

-- Extended Properties [mn].[StudentAssessmentPrecodeSiteContactTelephone] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The telephone number(s) for the administrative contact, and extension if applicable.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteContactTelephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteContactTelephone', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of pre-code site record. For example, MCA/MTAS, ACCESS/ALT-ACCESS', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteContactTelephone', @level2type=N'COLUMN', @level2name=N'PrecodeTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of communication number listed for an individual or organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteContactTelephone', @level2type=N'COLUMN', @level2name=N'TelephoneNumberTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The telephone number including the area code, and extension, if applicable.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteContactTelephone', @level2type=N'COLUMN', @level2name=N'TelephoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The order of priority assigned to telephone numbers to define which number to attempt first, second, etc.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteContactTelephone', @level2type=N'COLUMN', @level2name=N'OrderOfPriority'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication that the telephone number is technically capable of sending and receiving Short Message Service (SMS) text messages.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteContactTelephone', @level2type=N'COLUMN', @level2name=N'TextMessageCapabilityIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication that the telephone number should not be published.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteContactTelephone', @level2type=N'COLUMN', @level2name=N'DoNotPublishIndicator'
GO

-- Extended Properties [mn].[StudentAssessmentPrecodeSiteShippingInstruction] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shipping instructions such as Labels, Shipping Date, Shipping Preference', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteShippingInstruction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteShippingInstruction', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Type of pre-code site record. For example, MCA/MTAS, ACCESS/ALT-ACCESS', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteShippingInstruction', @level2type=N'COLUMN', @level2name=N'PrecodeTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Shipping instructions such as Labels, Shipping Date, Shipping Preference', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentPrecodeSiteShippingInstruction', @level2type=N'COLUMN', @level2name=N'ShippingInstructionDescriptorId'
GO

-- Extended Properties [mn].[StudentAssessmentStudentObjectiveAssessmentExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The student''s score and/or performance levels earned for an ObjectiveAssessment.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentStudentObjectiveAssessmentExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentStudentObjectiveAssessmentExtension', @level2type=N'COLUMN', @level2name=N'AssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a space, room, site, building, individual, organization, program, or institution by a school, school system, a state, or other agency or entity.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentStudentObjectiveAssessmentExtension', @level2type=N'COLUMN', @level2name=N'IdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Namespace for the Assessment.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentStudentObjectiveAssessmentExtension', @level2type=N'COLUMN', @level2name=N'Namespace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an assessment administered to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentStudentObjectiveAssessmentExtension', @level2type=N'COLUMN', @level2name=N'StudentAssessmentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentStudentObjectiveAssessmentExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Grade level for the objective assessment.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentStudentObjectiveAssessmentExtension', @level2type=N'COLUMN', @level2name=N'ClusterGradeLevelDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Format for which an objective assessment was administered. E.g., Paper', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentStudentObjectiveAssessmentExtension', @level2type=N'COLUMN', @level2name=N'AssessmentFormatDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The state of a student assessment. E.g.,
        Student has submitted a response for all scored items OR
        Student has submitted a response to at least one scored item, but not all scored items', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentStudentObjectiveAssessmentExtension', @level2type=N'COLUMN', @level2name=N'AssessmentStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tier descriptor for objective assessment. E.g., Listening, Reading, Speaking, Writing', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentAssessmentStudentObjectiveAssessmentExtension', @level2type=N'COLUMN', @level2name=N'AssessmentTierDescriptorId'
GO

-- Extended Properties [mn].[StudentCEISProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents Students in the Coordinated Early Intervening Service Program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentCEISProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentCEISProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentCEISProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentCEISProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentCEISProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentCEISProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentCEISProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [mn].[StudentDistanceLearnerProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents Students in the Distance Learner Program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentDistanceLearnerProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentDistanceLearnerProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentDistanceLearnerProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentDistanceLearnerProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentDistanceLearnerProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentDistanceLearnerProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentDistanceLearnerProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [mn].[StudentEarlyChildhoodScreeningProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents Students in the Early Childhood Screening Association Program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodScreeningProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodScreeningProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodScreeningProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodScreeningProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodScreeningProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodScreeningProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodScreeningProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Early Childhood Screening Exit Status.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodScreeningProgramAssociation', @level2type=N'COLUMN', @level2name=N'EarlyChildhoodScreeningExitStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor contains codes indicating who completed a screening for a student in the Early Childhood Screening program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodScreeningProgramAssociation', @level2type=N'COLUMN', @level2name=N'EarlyChildhoodScreenerDescriptorId'
GO

-- Extended Properties [mn].[StudentEarlyEducationProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents Students in an Early Education Program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates a student''s service attendance hours.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'ServiceAttendanceHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates a student''s service membership hours.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociation', @level2type=N'COLUMN', @level2name=N'ServiceMembershipHours'
GO

-- Extended Properties [mn].[StudentEarlyEducationProgramAssociationFundingSource] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Funding source.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociationFundingSource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociationFundingSource', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociationFundingSource', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Funding source.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociationFundingSource', @level2type=N'COLUMN', @level2name=N'FundingSourceDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociationFundingSource', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociationFundingSource', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociationFundingSource', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEarlyEducationProgramAssociationFundingSource', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [mn].[StudentEducationOrganizationAssociationAncestryEthnicOrigin] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ancestry ethnic origins that pertain to the general racial categories with which the individual identifies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationAncestryEthnicOrigin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ancestry ethnic origins that pertain to the general racial categories with which the individual identifies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationAncestryEthnicOrigin', @level2type=N'COLUMN', @level2name=N'AncestryEthnicOriginDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationAncestryEthnicOrigin', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationAncestryEthnicOrigin', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [mn].[StudentEducationOrganizationAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A name given to an individual at birth, baptism, or during another naming ceremony, or through legal change.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A secondary name given to an individual at birth, baptism, or during another naming ceremony.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'MiddleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name borne in common by members of a family.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'LastSurname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An appendage, if any, used to denote an individual''s generation in his family (e.g., Jr., Sr., III).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'GenerationCodeSuffix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual was born.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The city the student was born in.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'BirthCity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The abbreviation for the name of the state (within the United States) or extra-state jurisdiction in which an individual was born.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'BirthStateAbbreviationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For students born outside of the U.S., the Province or jurisdiction in which an individual is born.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'BirthInternationalProvince'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The country in which an individual is born. It is strongly recommended that entries use only ISO 3166 2-letter country codes.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'BirthCountryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For students born outside of the U.S., the date the student entered the U.S.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'DateEnteredUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicator of whether the student was born with other siblings (i.e., twins, triplets, etc.)', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'MultipleBirthStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A person''s gender at birth.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'BirthSexDescriptorId'
GO

-- Extended Properties [mn].[StudentEducationOrganizationAssociationOptOutIndicators] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Opt Out Indicators.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationOptOutIndicators'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationOptOutIndicators', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Opt Out Indicators.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationOptOutIndicators', @level2type=N'COLUMN', @level2name=N'OptOutIndicatorsDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationOptOutIndicators', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [mn].[StudentGiftedTalentedProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents Students in the Gifted Talented Program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentGiftedTalentedProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentGiftedTalentedProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentGiftedTalentedProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentGiftedTalentedProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentGiftedTalentedProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentGiftedTalentedProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentGiftedTalentedProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Gifted Talented Participation Descriptor.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentGiftedTalentedProgramAssociation', @level2type=N'COLUMN', @level2name=N'GiftedTalentedParticipationDescriptorId'
GO

-- Extended Properties [mn].[StudentPSEOConcurrentProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents Students in the PSEO Concurrent Enrollment Program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOConcurrentProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOConcurrentProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOConcurrentProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOConcurrentProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOConcurrentProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOConcurrentProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOConcurrentProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [mn].[StudentPSEOProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents Students in the PSEO Program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates PSEO High School Hours.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentPSEOProgramAssociation', @level2type=N'COLUMN', @level2name=N'PSEOHighSchoolHours'
GO

-- Extended Properties [mn].[StudentSAAPProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents Students in a State Approved Alternative Program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSAAPProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSAAPProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSAAPProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSAAPProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSAAPProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSAAPProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSAAPProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State-approved alternative programs (SAAP) that also have a state-approved Independent Study
(IS) component use this flag to identify independent study participants.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSAAPProgramAssociation', @level2type=N'COLUMN', @level2name=N'IndependentStudyIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SAAP Credits.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSAAPProgramAssociation', @level2type=N'COLUMN', @level2name=N'SAAPCredits'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indicator representing a Student who is enrolled less than full-time at a traditional school and who is also enrolled at a State Approved Alternative Program (SAAP).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSAAPProgramAssociation', @level2type=N'COLUMN', @level2name=N'SAAPConcurrentIndicator'
GO

-- Extended Properties [mn].[StudentSchoolAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Homebound Service Indicator is used to validate Membership Days for students who have no Attendance Days. It is an indication of whether students were medically confined to their home and received instruction in the home during the enrollment period.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'HomeboundServiceIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indicator of the students'' need for and participation in special education programs during this enrollment period.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'SpecialEducationEvaluationStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'ResidentLocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indicator representing a Student  who qualifies as a Special Pupil for Care and Treatment at some time during the school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'SpecialPupilIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'State Aid Category.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationExtension', @level2type=N'COLUMN', @level2name=N'StateAidCategoryDescriptorId'
GO

-- Extended Properties [mn].[StudentSchoolAssociationMembership] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Membership.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembership'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembership', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembership', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembership', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Days or Hours.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembership', @level2type=N'COLUMN', @level2name=N'MembershipAttendanceUnitDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total number of Instructional Days or Hours during which students were enrolled in the school during the current school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembership', @level2type=N'COLUMN', @level2name=N'Membership'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total number of Instructional Days or Hours during which students attended school during the current school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembership', @level2type=N'COLUMN', @level2name=N'Attendance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Percent Enrolled', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationMembership', @level2type=N'COLUMN', @level2name=N'PercentEnrolled'
GO

-- Extended Properties [mn].[StudentSchoolAssociationTransportation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Transportation.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTransportation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual enters and begins to receive instructional services in a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTransportation', @level2type=N'COLUMN', @level2name=N'EntryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTransportation', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTransportation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Student''s to and from Transportation Category for the regular school term.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTransportation', @level2type=N'COLUMN', @level2name=N'TransportationCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSchoolAssociationTransportation', @level2type=N'COLUMN', @level2name=N'TransportingLocalEducationAgencyId'
GO

-- Extended Properties [mn].[StudentSection504PlanProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Students who have a Section 504 plan.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSection504PlanProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSection504PlanProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSection504PlanProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSection504PlanProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSection504PlanProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSection504PlanProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSection504PlanProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [mn].[StudentSectionAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the Student''s entry or assignment to the Section.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a course.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'CollegeCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'CollegeCourseEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Section enrollment type.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationExtension', @level2type=N'COLUMN', @level2name=N'SectionEnrollmentTypeDescriptorId'
GO

-- Extended Properties [mn].[StudentSectionAssociationInstructionalApproach] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Instructional approach as implemented for the student section association. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationInstructionalApproach'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the Student''s entry or assignment to the Section.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationInstructionalApproach', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Instructional approach.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationInstructionalApproach', @level2type=N'COLUMN', @level2name=N'InstructionalApproachDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationInstructionalApproach', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationInstructionalApproach', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationInstructionalApproach', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationInstructionalApproach', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationInstructionalApproach', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationInstructionalApproach', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status of implementation of the instructional approach.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationInstructionalApproach', @level2type=N'COLUMN', @level2name=N'ImplementationStatusDescriptorId'
GO

-- Extended Properties [mn].[StudentSectionAssociationSiteBasedInitiative] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Site-based initiative as implemented for the student section association. General purpose but intially implemented for Early Education.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationSiteBasedInitiative'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the Student''s entry or assignment to the Section.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Site-based initiative.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'SiteBasedInitiativeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status of implementation of the site-based initiative.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSectionAssociationSiteBasedInitiative', @level2type=N'COLUMN', @level2name=N'ImplementationStatusDescriptorId'
GO

-- Extended Properties [mn].[StudentSpecialEducationProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Special Education Service Hours.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'SpecialEducationServiceHours'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'PlacingLocalEducationAgencyId'
GO

-- Extended Properties [mn].[TransportationCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Student''s to and from Transportation Category for the regular school term.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'TransportationCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'mn', @level1type=N'TABLE', @level1name=N'TransportationCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'TransportationCategoryDescriptorId'
GO

