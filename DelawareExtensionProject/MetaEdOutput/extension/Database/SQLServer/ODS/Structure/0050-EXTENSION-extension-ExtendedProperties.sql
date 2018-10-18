-- Extended Properties [extension].[AcceptanceStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the status of the college acceptance.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AcceptanceStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AcceptanceStatusDescriptor', @level2type=N'COLUMN', @level2name=N'AcceptanceStatusDescriptorId'
GO

-- Extended Properties [extension].[AllegedBullyingVictim] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This represents the victims of alleged bullying incidents.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictim'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date of the alleged bullying incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictim', @level2type=N'COLUMN', @level2name=N'AllegedIncidentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictim', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictim', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the follow up detail regarding the alleged bullying incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictim', @level2type=N'COLUMN', @level2name=N'FollowupComment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the alleged bullying incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictim', @level2type=N'COLUMN', @level2name=N'IncidentDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the location where alleged bullying incident occurred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictim', @level2type=N'COLUMN', @level2name=N'IncidentLocationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if student was involved in multiple prior alleged bullying incidents.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictim', @level2type=N'COLUMN', @level2name=N'MultiplePriorEvent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the reason for the alleged bullying incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictim', @level2type=N'COLUMN', @level2name=N'ReasonIncidentRelatedToDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the date on which the alleged bullying incident was reported.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictim', @level2type=N'COLUMN', @level2name=N'ReportDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the person who reported the alleged bullying incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictim', @level2type=N'COLUMN', @level2name=N'ReportedBy'
GO

-- Extended Properties [extension].[AllegedBullyingVictimBullyingCategory] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of bullying.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictimBullyingCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date of the alleged bullying incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictimBullyingCategory', @level2type=N'COLUMN', @level2name=N'AllegedIncidentDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of bullying.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictimBullyingCategory', @level2type=N'COLUMN', @level2name=N'BullyingCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictimBullyingCategory', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AllegedBullyingVictimBullyingCategory', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [extension].[APExamCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the type of AP exam.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'APExamCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'APExamCodeDescriptor', @level2type=N'COLUMN', @level2name=N'APExamCodeDescriptorId'
GO

-- Extended Properties [extension].[AttendanceConfigurationCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the period type that is used for taking attendance.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AttendanceConfigurationCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'AttendanceConfigurationCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'AttendanceConfigurationCategoryDescriptorId'
GO

-- Extended Properties [extension].[BullyingCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of bullying.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'BullyingCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'BullyingCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'BullyingCategoryDescriptorId'
GO

-- Extended Properties [extension].[CalendarDateExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CalendarDateExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the Calendar.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CalendarDateExtension', @level2type=N'COLUMN', @level2name=N'CalendarCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year of the CalendarEvent.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CalendarDateExtension', @level2type=N'COLUMN', @level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CalendarDateExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year associated with the Calendar.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CalendarDateExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code for specifying the cycle day.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CalendarDateExtension', @level2type=N'COLUMN', @level2name=N'CycleDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the value of membership for the day.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CalendarDateExtension', @level2type=N'COLUMN', @level2name=N'MembershipDayValue'
GO

-- Extended Properties [extension].[CertificateCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of certificate achieved.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CertificateCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CertificateCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'CertificateCategoryDescriptorId'
GO

-- Extended Properties [extension].[CertificationDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the type of career pathway certification acheived.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CertificationDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CertificationDescriptor', @level2type=N'COLUMN', @level2name=N'CertificationDescriptorId'
GO

-- Extended Properties [extension].[ChoiceCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the choice type for choice transfer.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ChoiceCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ChoiceCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'ChoiceCategoryDescriptorId'
GO

-- Extended Properties [extension].[CIPCourse] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies courses that are CIP.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CIPCourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code for the CIP course.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CIPCourse', @level2type=N'COLUMN', @level2name=N'CIPCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the pathway.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CIPCourse', @level2type=N'COLUMN', @level2name=N'Pathway'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the funding level.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CIPCourse', @level2type=N'COLUMN', @level2name=N'FundingLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the cluster.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CIPCourse', @level2type=N'COLUMN', @level2name=N'Cluster'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the name of the course.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CIPCourse', @level2type=N'COLUMN', @level2name=N'CourseName'
GO

-- Extended Properties [extension].[ClassPeriodCycle] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates a cycle day.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ClassPeriodCycle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ClassPeriodCycle', @level2type=N'COLUMN', @level2name=N'ClassPeriodName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code for the cycle.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ClassPeriodCycle', @level2type=N'COLUMN', @level2name=N'CycleDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ClassPeriodCycle', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A number indicating the order of this scheduling time unit in the entire day.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ClassPeriodCycle', @level2type=N'COLUMN', @level2name=N'Timeslot'
GO

-- Extended Properties [extension].[ClassPeriodExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ClassPeriodExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the portion of a typical daily session in which students receive instruction in a specified subject (e.g., morning, sixth period, block period, or AB schedules).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ClassPeriodExtension', @level2type=N'COLUMN', @level2name=N'ClassPeriodName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ClassPeriodExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number indicating the order that the period should be listed.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ClassPeriodExtension', @level2type=N'COLUMN', @level2name=N'AttendancePeriodOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the attendance period.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ClassPeriodExtension', @level2type=N'COLUMN', @level2name=N'Description'
GO

-- Extended Properties [extension].[CoreSubjectDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify a core subject.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CoreSubjectDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CoreSubjectDescriptor', @level2type=N'COLUMN', @level2name=N'CoreSubjectDescriptorId'
GO

-- Extended Properties [extension].[CourseExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a course.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'CourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The current status of the course.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code for the AP exam.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'APExamCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the number of times allowed in the hall per week for the course.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'AveragePassTimeMinutesPerWeek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the core subject associated with the course.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'CoreSubjectDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The fraction of a year for the Coop or DO student (i.e. 1.0 for full year, .50 for half year).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'FractionOfYearOffered'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the minutes per week the course meets.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'MinutesPerWeekAverage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the status of the service of the secondary staff in the classroom.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'SecondaryStaffClassroomServiceStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the specialty requirement for the staff teaching the course.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'StaffCredentialFieldDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the specialty requirement for the secondary staff teaching the course.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'SecondaryStaffCredentialFieldDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the role of the secondary staff for the course.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'SecondaryStaffRoleDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CourseExtension', @level2type=N'COLUMN', @level2name=N'UnitCountExceptionSchoolId'
GO

-- Extended Properties [extension].[CycleDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the cycle day.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CycleDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'CycleDescriptor', @level2type=N'COLUMN', @level2name=N'CycleDescriptorId'
GO

-- Extended Properties [extension].[DiplomaCertificateCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether special education student is persuing a diploma or certificate.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DiplomaCertificateCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DiplomaCertificateCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'DiplomaCertificateCategoryDescriptorId'
GO

-- Extended Properties [extension].[DisciplineDispositionDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the offender action disposition.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineDispositionDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineDispositionDescriptor', @level2type=N'COLUMN', @level2name=N'DisciplineDispositionDescriptorId'
GO

-- Extended Properties [extension].[DisciplineIncidentCode] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This represents the additional attributes required for the Behavior descriptor.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the type of behavior or discipline incident code.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentCode', @level2type=N'COLUMN', @level2name=N'BehaviorDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the incident behavior is a felony.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentCode', @level2type=N'COLUMN', @level2name=N'Felony'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if incident behavior requires a victim.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentCode', @level2type=N'COLUMN', @level2name=N'VictimRequired'
GO

-- Extended Properties [extension].[DisciplineIncidentExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code identifying the time frame for the incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'IncidentTimeFrameDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the badge number of the responding officer to the incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'LawEnforcementBadgeNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the police department to which the incident was reported.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'LawEnforcementDepartment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date on which incident was reported to police.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'LawEnforcementNotifyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of police officer who responded to the complaint.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'LawEnforcementOfficerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the table row was last changed.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'DisciplineIncidentLastModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the person who last changed the table row.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'DisciplineIncidentChangeUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the person who created the table row.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentExtension', @level2type=N'COLUMN', @level2name=N'DisciplineIncidentCreationUID'
GO

-- Extended Properties [extension].[DisciplineIncidentReason] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the category the incident relates to.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentReason'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentReason', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the category the incident is related to.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentReason', @level2type=N'COLUMN', @level2name=N'IncidentRelatedToDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentReason', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the person who last changed the table row.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentReason', @level2type=N'COLUMN', @level2name=N'IncidentRelatedToChangeUID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the table row was last changed.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentReason', @level2type=N'COLUMN', @level2name=N'IncidentRelatedToLastModifiedDate'
GO

-- Extended Properties [extension].[DisciplineIncidentReferral] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of referral made for the incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentReferral'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentReferral', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of referral made for the incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentReferral', @level2type=N'COLUMN', @level2name=N'ReferralDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIncidentReferral', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO

-- Extended Properties [extension].[DisciplineIssue] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This represents discipline issues entered through the teacher access center.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number that identifies the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'IssueIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the issue occurred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'IssueDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the location of the incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'IssueIncidentLocationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the type that classifies the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'IssueCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the teacher has resolved the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'IssueResolved'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whwere the issue occurred. Used for further validation of the Issue_source_detail.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'IssueSourceDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Provides detail of where the issue occurred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'IssueSourceDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the status of the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'IssueStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the description of the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The course session that goes with the issue_source_detail (section_key) when issue source = ''C''.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssue', @level2type=N'COLUMN', @level2name=N'CourseSession'
GO

-- Extended Properties [extension].[DisciplineIssueAction] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This represents the action associated with a discipline issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueAction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Allows multiple corrective action to be inserted under the same date.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueAction', @level2type=N'COLUMN', @level2name=N'EnteredSequence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number that identifies the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueAction', @level2type=N'COLUMN', @level2name=N'IssueIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueAction', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end date of an assigned action.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueAction', @level2type=N'COLUMN', @level2name=N'ActionEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start date of an assigned action.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueAction', @level2type=N'COLUMN', @level2name=N'ActionStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the corrective action was actually completed by the student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueAction', @level2type=N'COLUMN', @level2name=N'ActionCompleted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This represents the comments concerning the action.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueAction', @level2type=N'COLUMN', @level2name=N'Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the code of the corrective action.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueAction', @level2type=N'COLUMN', @level2name=N'IssueActionCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if parent or guardian was contacted regarding the issue and the action.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueAction', @level2type=N'COLUMN', @level2name=N'ParentsContacted'
GO

-- Extended Properties [extension].[DisciplineIssueRefer] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This represents the referral information on discipline issues that were referred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRefer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number that identifies the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRefer', @level2type=N'COLUMN', @level2name=N'IssueIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date the referral was sent.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRefer', @level2type=N'COLUMN', @level2name=N'ReferDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Allows multiple referrals for the same issue on the same date.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRefer', @level2type=N'COLUMN', @level2name=N'ReferSequence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRefer', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the status of the referral.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRefer', @level2type=N'COLUMN', @level2name=N'ReferIssueStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Provides the description of the referral.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRefer', @level2type=N'COLUMN', @level2name=N'Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRefer', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO

-- Extended Properties [extension].[DisciplineIssueRelated] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier of the related issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRelated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number that identifies the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRelated', @level2type=N'COLUMN', @level2name=N'IssueIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier of the related issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRelated', @level2type=N'COLUMN', @level2name=N'RelatedIssueIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRelated', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the table row was last changed.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueRelated', @level2type=N'COLUMN', @level2name=N'RelatedLastModifiedDate'
GO

-- Extended Properties [extension].[DisciplineIssueStudent] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This represents the student associated with the discipline issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueStudent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number that identifies the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueStudent', @level2type=N'COLUMN', @level2name=N'IssueIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueStudent', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueStudent', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'provides description of the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueStudent', @level2type=N'COLUMN', @level2name=N'Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates how the disciplinarian thinks the student was involved in the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueStudent', @level2type=N'COLUMN', @level2name=N'AdminAssignedStudentParticipationCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates how the teacher thinks the student was involved in the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'DisciplineIssueStudent', @level2type=N'COLUMN', @level2name=N'StudentParticipationCodeDescriptorId'
GO

-- Extended Properties [extension].[FerpaOptOutDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the type of opt out for FERPA.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'FerpaOptOutDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'FerpaOptOutDescriptor', @level2type=N'COLUMN', @level2name=N'FerpaOptOutDescriptorId'
GO

-- Extended Properties [extension].[FollowupCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code for the follow-up after medical exam or visit.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'FollowupCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'FollowupCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'FollowupCategoryDescriptorId'
GO

-- Extended Properties [extension].[FundingNeedsCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the categories for the funding need.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'FundingNeedsCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'FundingNeedsCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'FundingNeedsCategoryDescriptorId'
GO

-- Extended Properties [extension].[GradeTypeDetail] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity identifies additional information that is required to identify the grade type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradeTypeDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code used to represent the mark type.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradeTypeDetail', @level2type=N'COLUMN', @level2name=N'GradeTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The order the mark type should appear in.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradeTypeDetail', @level2type=N'COLUMN', @level2name=N'GradeTypeOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates when the mark is captured: once a year, once at each marking period, or once at each IPR run', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradeTypeDetail', @level2type=N'COLUMN', @level2name=N'GradeTypeWhenTakenDescriptorId'
GO

-- Extended Properties [extension].[GradeTypeWhenTakenDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify when a mark is captured.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradeTypeWhenTakenDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradeTypeWhenTakenDescriptor', @level2type=N'COLUMN', @level2name=N'GradeTypeWhenTakenDescriptorId'
GO

-- Extended Properties [extension].[GradingPeriodExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradingPeriodExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the period for which grades are reported.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradingPeriodExtension', @level2type=N'COLUMN', @level2name=N'GradingPeriodDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The sequential order of this period relative to other periods.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradingPeriodExtension', @level2type=N'COLUMN', @level2name=N'PeriodSequence'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradingPeriodExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the grading period school year.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradingPeriodExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The end-week number for the marking period.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradingPeriodExtension', @level2type=N'COLUMN', @level2name=N'EndWeek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The start-week number for the marking period.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'GradingPeriodExtension', @level2type=N'COLUMN', @level2name=N'StartWeek'
GO

-- Extended Properties [extension].[ImmunizationCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the immunization shot.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ImmunizationCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ImmunizationCodeDescriptor', @level2type=N'COLUMN', @level2name=N'ImmunizationCodeDescriptorId'
GO

-- Extended Properties [extension].[IncidentRelatedToDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify what the incident is related to.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IncidentRelatedToDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IncidentRelatedToDescriptor', @level2type=N'COLUMN', @level2name=N'IncidentRelatedToDescriptorId'
GO

-- Extended Properties [extension].[IncidentTimeFrameDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the incident timeframe.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IncidentTimeFrameDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IncidentTimeFrameDescriptor', @level2type=N'COLUMN', @level2name=N'IncidentTimeFrameDescriptorId'
GO

-- Extended Properties [extension].[InjuryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the injuries during an incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'InjuryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'InjuryDescriptor', @level2type=N'COLUMN', @level2name=N'InjuryDescriptorId'
GO

-- Extended Properties [extension].[IssueActionCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the corrective action to the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IssueActionCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IssueActionCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'IssueActionCategoryDescriptorId'
GO

-- Extended Properties [extension].[IssueCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the issue categories.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IssueCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IssueCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'IssueCategoryDescriptorId'
GO

-- Extended Properties [extension].[IssueSourceDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the source where the issue occurred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IssueSourceDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IssueSourceDescriptor', @level2type=N'COLUMN', @level2name=N'IssueSourceDescriptorId'
GO

-- Extended Properties [extension].[IssueStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the status of the issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IssueStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'IssueStatusDescriptor', @level2type=N'COLUMN', @level2name=N'IssueStatusDescriptorId'
GO

-- Extended Properties [extension].[LevelDetail] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the detail associated with a level number.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LevelDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the identifying number for the level', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LevelDetail', @level2type=N'COLUMN', @level2name=N'LevelNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LevelDetail', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the explanation for the level number', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LevelDetail', @level2type=N'COLUMN', @level2name=N'LevelDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether mark is considered passing.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LevelDetail', @level2type=N'COLUMN', @level2name=N'PassingMark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the point value for the mark associated with a level number.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LevelDetail', @level2type=N'COLUMN', @level2name=N'PointValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the mark associated with a level number.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LevelDetail', @level2type=N'COLUMN', @level2name=N'Mark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the value printed on the report card for the mark assocaited with a level number.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LevelDetail', @level2type=N'COLUMN', @level2name=N'ReportCardPrintValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the value printed on the transcript for the mark assocaited with a level number.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'LevelDetail', @level2type=N'COLUMN', @level2name=N'TranscriptPrintValue'
GO

-- Extended Properties [extension].[MedicalAlert] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that describe a person''s known medical conditions.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalAlert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the medical alert code.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalAlert', @level2type=N'COLUMN', @level2name=N'MedicalAlertCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the code represents a sensitive medical alert and should only be displayed for users with the proper security.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalAlert', @level2type=N'COLUMN', @level2name=N'Sensitive'
GO

-- Extended Properties [extension].[MedicalAlertCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that describe a person''s known medical conditions.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalAlertCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalAlertCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'MedicalAlertCategoryDescriptorId'
GO

-- Extended Properties [extension].[MedicalDispositionDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the medical disposition.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalDispositionDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalDispositionDescriptor', @level2type=N'COLUMN', @level2name=N'MedicalDispositionDescriptorId'
GO

-- Extended Properties [extension].[MedicalOfficeVisit] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds information on a person''s visit to the medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the person came to the medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisit', @level2type=N'COLUMN', @level2name=N'OfficeInDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisit', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisit', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the person left the medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisit', @level2type=N'COLUMN', @level2name=N'OfficeOutDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisit', @level2type=N'COLUMN', @level2name=N'SchoolOfServiceSchoolId'
GO

-- Extended Properties [extension].[MedicalOfficeVisitContactType] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of contact made resulting from person visiting medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitContactType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of contact made resulting from person visiting medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitContactType', @level2type=N'COLUMN', @level2name=N'ContactTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the person came to the medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitContactType', @level2type=N'COLUMN', @level2name=N'OfficeInDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitContactType', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitContactType', @level2type=N'COLUMN', @level2name=N'PersonId'
GO

-- Extended Properties [extension].[MedicalOfficeVisitMedicalDisposition] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the medical disposition.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalDisposition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the medical disposition.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalDisposition', @level2type=N'COLUMN', @level2name=N'MedicalDispositionDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the person came to the medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalDisposition', @level2type=N'COLUMN', @level2name=N'OfficeInDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalDisposition', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalDisposition', @level2type=N'COLUMN', @level2name=N'PersonId'
GO

-- Extended Properties [extension].[MedicalOfficeVisitMedicalTreatmentCode] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code for the treatment given to person visiting medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalTreatmentCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code for the treatment given to person visiting medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalTreatmentCode', @level2type=N'COLUMN', @level2name=N'MedicalTreatmentCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the person came to the medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalTreatmentCode', @level2type=N'COLUMN', @level2name=N'OfficeInDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalTreatmentCode', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalTreatmentCode', @level2type=N'COLUMN', @level2name=N'PersonId'
GO

-- Extended Properties [extension].[MedicalOfficeVisitMedicalVisitReason] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The reason for visiting the medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalVisitReason'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The reason for visiting the medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalVisitReason', @level2type=N'COLUMN', @level2name=N'MedicalVisitReasonDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the person came to the medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalVisitReason', @level2type=N'COLUMN', @level2name=N'OfficeInDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalVisitReason', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalOfficeVisitMedicalVisitReason', @level2type=N'COLUMN', @level2name=N'PersonId'
GO

-- Extended Properties [extension].[MedicalReferralFollowUp] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Referral followup information for a person for a specific type of exam.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalReferralFollowUp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code for the follow-up after medical exam or visit.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalReferralFollowUp', @level2type=N'COLUMN', @level2name=N'FollowupCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of medical test or exam.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalReferralFollowUp', @level2type=N'COLUMN', @level2name=N'MedicalTestCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalReferralFollowUp', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalReferralFollowUp', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The datetime of the exam associated with this referral.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalReferralFollowUp', @level2type=N'COLUMN', @level2name=N'TestDate'
GO

-- Extended Properties [extension].[MedicalScreening] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A person was screened for a particular issue.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalScreening'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Screening type', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalScreening', @level2type=N'COLUMN', @level2name=N'MedicalTestCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalScreening', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalScreening', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date screening occurred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalScreening', @level2type=N'COLUMN', @level2name=N'TestDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If true, then indicates this screening is for the athletic exam.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalScreening', @level2type=N'COLUMN', @level2name=N'AthleticStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Grade level if person is student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalScreening', @level2type=N'COLUMN', @level2name=N'GradeLevelDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalScreening', @level2type=N'COLUMN', @level2name=N'SchoolOfServiceSchoolId'
GO

-- Extended Properties [extension].[MedicalTestCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of medical test or exam.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalTestCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalTestCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'MedicalTestCategoryDescriptorId'
GO

-- Extended Properties [extension].[MedicalTreatmentCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the treatment given.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalTreatmentCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalTreatmentCodeDescriptor', @level2type=N'COLUMN', @level2name=N'MedicalTreatmentCodeDescriptorId'
GO

-- Extended Properties [extension].[MedicalVisitReasonDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identity the reason for visiting the medical office.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalVisitReasonDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicalVisitReasonDescriptor', @level2type=N'COLUMN', @level2name=N'MedicalVisitReasonDescriptorId'
GO

-- Extended Properties [extension].[MedicationBox] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents an indiviudal medicane for a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicationBox'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicationBox', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Unique ID for the medication, with the district prepended.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicationBox', @level2type=N'COLUMN', @level2name=N'MedicationBoxId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the code for the medication.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicationBox', @level2type=N'COLUMN', @level2name=N'MedicationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is the description of the medication.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'MedicationBox', @level2type=N'COLUMN', @level2name=N'MedicationDescription'
GO

-- Extended Properties [extension].[NonStudent] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines demographic information for people involved in incidents who are not students.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identification number for the non student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'NonStudentLocalId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A prefix used to denote the title, degree, position, or seniority of the person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'PersonalTitlePrefix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A name given to an individual at birth, baptism, or during another naming ceremony, or through legal change.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'FirstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A secondary name given to an individual at birth, baptism, or during another naming ceremony.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'MiddleName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name borne in common by members of a family.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'LastSurname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An appendage, if any, used to denote an individual''s generation in his family (e.g., Jr., Sr., III).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'GenerationCodeSuffix'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The person''s maiden name.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'MaidenName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual was born.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'BirthDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The city the student was born in.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'BirthCity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The abbreviation for the name of the state (within the United States) or extra-state jurisdiction in which an individual was born.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'BirthStateAbbreviationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For students born outside of the U.S., the Province or jurisdiction in which an individual is born.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'BirthInternationalProvince'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The country in which an individual is born. It is strongly recommended that entries use only ISO 3166 2-letter country codes.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'BirthCountryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For students born outside of the U.S., the date the student entered the U.S.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'DateEnteredUS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicator of whether the student was born with other siblings (i.e., twins, triplets, etc.)', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'MultipleBirthStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A person''s gender at birth.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'BirthSexDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if non student is of Hispanic origin.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'HispanicLatinoEthnicity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gender of the non student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'SexDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudent', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO

-- Extended Properties [extension].[NonStudentEthnicity] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code for the ethnicity of the non student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentEthnicity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentEthnicity', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identification number for the non student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentEthnicity', @level2type=N'COLUMN', @level2name=N'NonStudentLocalId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code for the race', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentEthnicity', @level2type=N'COLUMN', @level2name=N'RaceDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Order in which a individual''s race is identified.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentEthnicity', @level2type=N'COLUMN', @level2name=N'RaceOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The percentage that the individual identifies self with a race.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentEthnicity', @level2type=N'COLUMN', @level2name=N'RacePercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the equivalent federal code for the race/ethnicity of an individual.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentEthnicity', @level2type=N'COLUMN', @level2name=N'FederalRaceDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the table row was last changed.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentEthnicity', @level2type=N'COLUMN', @level2name=N'EthnicityLastModifiedDate'
GO

-- Extended Properties [extension].[NonStudentPersonalIdentificationDocument] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The documents presented as evident to verify one''s personal identity; for example: drivers license, passport, birth certificate, etc.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentPersonalIdentificationDocument'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The primary function of the document used for establishing identity.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentPersonalIdentificationDocument', @level2type=N'COLUMN', @level2name=N'IdentificationDocumentUseDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentPersonalIdentificationDocument', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identification number for the non student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentPersonalIdentificationDocument', @level2type=N'COLUMN', @level2name=N'NonStudentLocalId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The category of the document relative to its purpose.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentPersonalIdentificationDocument', @level2type=N'COLUMN', @level2name=N'PersonalInformationVerificationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The title of the document given by the issuer.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentPersonalIdentificationDocument', @level2type=N'COLUMN', @level2name=N'DocumentTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The day when the document  expires, if null then never expires.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentPersonalIdentificationDocument', @level2type=N'COLUMN', @level2name=N'DocumentExpirationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The unique identifier on the issuer''s identification system.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentPersonalIdentificationDocument', @level2type=N'COLUMN', @level2name=N'IssuerDocumentIdentificationCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the entity or institution that issued the document.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentPersonalIdentificationDocument', @level2type=N'COLUMN', @level2name=N'IssuerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Country of origin of the document. It is strongly recommended that entries use only ISO 3166 2-letter country codes.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NonStudentPersonalIdentificationDocument', @level2type=N'COLUMN', @level2name=N'IssuerCountryDescriptorId'
GO

-- Extended Properties [extension].[NotificationMethodDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the method of notification.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NotificationMethodDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'NotificationMethodDescriptor', @level2type=N'COLUMN', @level2name=N'NotificationMethodDescriptorId'
GO

-- Extended Properties [extension].[ParentAddressExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent''s address, if different from the student address.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ParentAddressExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of address listed for an individual or organization.    For example:  Physical Address, Mailing Address, Home Address, etc.)', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ParentAddressExtension', @level2type=N'COLUMN', @level2name=N'AddressTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a parent.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ParentAddressExtension', @level2type=N'COLUMN', @level2name=N'ParentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The apartment or housing complex name.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ParentAddressExtension', @level2type=N'COLUMN', @level2name=N'Complex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the housing development.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ParentAddressExtension', @level2type=N'COLUMN', @level2name=N'Development'
GO

-- Extended Properties [extension].[ParticipationCodeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This indicates the type of participant in a discipline incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ParticipationCodeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ParticipationCodeDescriptor', @level2type=N'COLUMN', @level2name=N'ParticipationCodeDescriptorId'
GO

-- Extended Properties [extension].[Person] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines all the individuals associated with an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Person'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Person', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Person', @level2type=N'COLUMN', @level2name=N'PersonId'
GO

-- Extended Properties [extension].[PersonCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO

-- Extended Properties [extension].[PersonDisciplineAction] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the actions assigned to an offender.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineAction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the action number that was created for the student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineAction', @level2type=N'COLUMN', @level2name=N'ActionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineAction', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineAction', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineAction', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The scheduled end date for the action.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineAction', @level2type=N'COLUMN', @level2name=N'ActionEndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The scheduled start date for the action.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineAction', @level2type=N'COLUMN', @level2name=N'ActionStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The actual duration of the action.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineAction', @level2type=N'COLUMN', @level2name=N'ActualActionDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The scheduled duration of the action.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineAction', @level2type=N'COLUMN', @level2name=N'ScheduledActionDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code for the reason for any difference in the scheduled duration and actual duration of the action.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineAction', @level2type=N'COLUMN', @level2name=N'DisciplineActionLengthDifferenceReasonDescriptorId'
GO

-- Extended Properties [extension].[PersonDisciplineActionDiscipline] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code that represents the action assigned to the offender.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDiscipline'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the action number that was created for the student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'ActionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code that represents the action assigned to the offender.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'DisciplineDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDiscipline', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO

-- Extended Properties [extension].[PersonDisciplineActionDisciplineDisposition] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code that indicates if and how the action was completed.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDisciplineDisposition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the action number that was created for the student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDisciplineDisposition', @level2type=N'COLUMN', @level2name=N'ActionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code that indicates if and how the action was completed.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDisciplineDisposition', @level2type=N'COLUMN', @level2name=N'DisciplineDispositionDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDisciplineDisposition', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDisciplineDisposition', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionDisciplineDisposition', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO

-- Extended Properties [extension].[PersonDisciplineActionPersonDisciplineIncidentAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reference to the discipline incident associated with the discipline action.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionPersonDisciplineIncidentAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the action number that was created for the student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionPersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'ActionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionPersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code of the participant in the discipline incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionPersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'ParticipationCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionPersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionPersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineActionPersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO

-- Extended Properties [extension].[PersonDisciplineIncidentAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association indicates those persons who were victims, offenders and witnesses for a discipline incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code of the participant in the discipline incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'ParticipationCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code for the type of victim.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociation', @level2type=N'COLUMN', @level2name=N'VictimCategoryDescriptorId'
GO

-- Extended Properties [extension].[PersonDisciplineIncidentAssociationOffenderBehavior] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Describes the behavior by category and provides a detailed description.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationOffenderBehavior'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of behavior committed by the offender.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationOffenderBehavior', @level2type=N'COLUMN', @level2name=N'BehaviorDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationOffenderBehavior', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code of the participant in the discipline incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationOffenderBehavior', @level2type=N'COLUMN', @level2name=N'ParticipationCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationOffenderBehavior', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationOffenderBehavior', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationOffenderBehavior', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the offense or incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationOffenderBehavior', @level2type=N'COLUMN', @level2name=N'BehaviorDetailDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Offense number that corresponds to the incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationOffenderBehavior', @level2type=N'COLUMN', @level2name=N'OffenseNumber'
GO

-- Extended Properties [extension].[PersonDisciplineIncidentAssociationVictimInjury] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of injury receied by the victim.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationVictimInjury'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A locally assigned unique identifier (within the school or school district) to identify each specific DisciplineIncident or occurrence. The same identifier should be used to document the entire DisciplineIncident even if it included multiple offenses and multiple offenders.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationVictimInjury', @level2type=N'COLUMN', @level2name=N'IncidentIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of injury receied by the victim.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationVictimInjury', @level2type=N'COLUMN', @level2name=N'InjuryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code of the participant in the discipline incident.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationVictimInjury', @level2type=N'COLUMN', @level2name=N'ParticipationCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationVictimInjury', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationVictimInjury', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonDisciplineIncidentAssociationVictimInjury', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO

-- Extended Properties [extension].[PersonImmunization] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonImmunization'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the immunization shot.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonImmunization', @level2type=N'COLUMN', @level2name=N'ImmunizationCodeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the date of the immunziation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonImmunization', @level2type=N'COLUMN', @level2name=N'ImmunizationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonImmunization', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonImmunization', @level2type=N'COLUMN', @level2name=N'PersonId'
GO

-- Extended Properties [extension].[PersonMedicalAlert] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that describe a person''s known medical conditions.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicalAlert'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the medical alert code.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicalAlert', @level2type=N'COLUMN', @level2name=N'MedicalAlertCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicalAlert', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicalAlert', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the start date of a medical alert.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicalAlert', @level2type=N'COLUMN', @level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the end date for a medical alert.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicalAlert', @level2type=N'COLUMN', @level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Comments on medical conditions and alerts.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicalAlert', @level2type=N'COLUMN', @level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The sequence number for prioritizing medical alerts.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicalAlert', @level2type=N'COLUMN', @level2name=N'Sequence'
GO

-- Extended Properties [extension].[PersonMedicationBoxAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association indicates a medication from a box issued to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociation', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Unique ID for the medication, with the district prepended.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociation', @level2type=N'COLUMN', @level2name=N'MedicationBoxId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociation', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociation', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If Medication is Required.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociation', @level2type=N'COLUMN', @level2name=N'MedicationRequired'
GO

-- Extended Properties [extension].[PersonMedicationBoxAssociationIssue] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Collection of Issue times.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociationIssue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date issued.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociationIssue', @level2type=N'COLUMN', @level2name=N'IssueDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociationIssue', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Unique ID for the medication, with the district prepended.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociationIssue', @level2type=N'COLUMN', @level2name=N'MedicationBoxId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociationIssue', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PersonMedicationBoxAssociationIssue', @level2type=N'COLUMN', @level2name=N'PersonId'
GO

-- Extended Properties [extension].[PostSecondaryDetail] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This represents the post secondary event deatil such as college application.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of post secondary event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetail', @level2type=N'COLUMN', @level2name=N'PostSecondaryEventCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetail', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the school year student applied for college.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetail', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetail', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the reason student did not apply to 4 or more colleges.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetail', @level2type=N'COLUMN', @level2name=N'ReasonNotApplied4PlusCollegeDescriptorId'
GO

-- Extended Properties [extension].[PostSecondaryDetailInstitution] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the college student applied to.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetailInstitution'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of post secondary event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetailInstitution', @level2type=N'COLUMN', @level2name=N'PostSecondaryEventCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The ID of the post secondary institution.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetailInstitution', @level2type=N'COLUMN', @level2name=N'PostSecondaryInstitutionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetailInstitution', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the school year student applied for college.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetailInstitution', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetailInstitution', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the acceptance status of the post secondary institution for the student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetailInstitution', @level2type=N'COLUMN', @level2name=N'AcceptanceStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'indicates the date the student transcript was mailed to the post secondary instituion.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetailInstitution', @level2type=N'COLUMN', @level2name=N'DateTranscriptMailed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if student plans to attend the post secondary institution.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'PostSecondaryDetailInstitution', @level2type=N'COLUMN', @level2name=N'PlansToAttend'
GO

-- Extended Properties [extension].[ReasonNotApplied4PlusCollegeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the reason for not applying to four or more colleges.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ReasonNotApplied4PlusCollegeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ReasonNotApplied4PlusCollegeDescriptor', @level2type=N'COLUMN', @level2name=N'ReasonNotApplied4PlusCollegeDescriptorId'
GO

-- Extended Properties [extension].[ReferralDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes to indicate to whom the incident will be reported or referred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ReferralDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ReferralDescriptor', @level2type=N'COLUMN', @level2name=N'ReferralDescriptorId'
GO

-- Extended Properties [extension].[Regulation619ComplianceReasonDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the reason for compliance or non-compliance to Regulation 619.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Regulation619ComplianceReasonDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Regulation619ComplianceReasonDescriptor', @level2type=N'COLUMN', @level2name=N'Regulation619ComplianceReasonDescriptorId'
GO

-- Extended Properties [extension].[RestraintEventCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the category of the restraint event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintEventCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintEventCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'RestraintEventCategoryDescriptorId'
GO

-- Extended Properties [extension].[RestraintSeclusion] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is documentation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the restraint secluson event occurred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'EventDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the time of day the event occurred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'EventTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of the restraint or seclusion performed.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'RestraintEventCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the behavior that caused the restraint secluson event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'RestraintEventReasonDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the additional detail regrading the restraint seclusion event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'AdditionalDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the detail regrading the behaviour during the restraint seclusion event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'BehaviorDuringRestraintDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the description of changes for the restraint seclusion event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'ChangeDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the detail of the de-escalation technique used in the restraint seclusion event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'DeescalationTechniqueDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies where the restraint seclusion event occurred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'IncidentLocationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the date on which the restraint secluson event was reported.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'RestraintReportDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the length in minutes of the restarint secluson event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'RestarintDuration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the number of times a restraint secluson event occurred in a day.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'ConsecutiveRestraintCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the method of notification used for notifying parent or guardian about the restraint secluson event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'NotificationMethodDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the non violent technique detail regrading the restraint seclusion event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'NonViolentTechniqueDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the parent or guradian was notified about the restarint secluson event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'ParentGuardianNotified'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the date on which the parent or guardian was notified.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'ParentGuardianNotifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the time of day the parent or guardian was notified about the restarint secluson event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'ParentGuardianNotifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the policy Change detail regrading the restraint seclusion event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'PolicyChangeDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the event details prior to the restraint seclusion event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'PriorToEventDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if staff was injured during the restarint secluson event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'StaffInjured'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the treatment provided to staff injured during restraint secluson event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'StaffTreatmentDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the traing detail for staff involved in restraint seclusion event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'StaffTrainingDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if student was injured during the restarint secluson event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'StudentInjured'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the treatment provided to student injured during restarint secluson event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'StudentTreatmentDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the student interview detail regrading the restraint seclusion event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'StudentInterviewDetail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of support plan change.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'SupportPlanChangeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if crisis response team was used during the restarint secluson event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'UsedCrisisResponseTeam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the witness interview detail regrading the restraint seclusion event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusion', @level2type=N'COLUMN', @level2name=N'WitnessInterviewDetail'
GO

-- Extended Properties [extension].[RestraintSeclusionStaffProvidingRestraint] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the staff responsible for providing restarint.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusionStaffProvidingRestraint'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the restraint secluson event occurred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusionStaffProvidingRestraint', @level2type=N'COLUMN', @level2name=N'EventDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the time of day the event occurred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusionStaffProvidingRestraint', @level2type=N'COLUMN', @level2name=N'EventTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of the restraint or seclusion performed.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusionStaffProvidingRestraint', @level2type=N'COLUMN', @level2name=N'RestraintEventCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the behavior that caused the restraint secluson event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusionStaffProvidingRestraint', @level2type=N'COLUMN', @level2name=N'RestraintEventReasonDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusionStaffProvidingRestraint', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusionStaffProvidingRestraint', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusionStaffProvidingRestraint', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the staff providing restraint utilized a trained action technique.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'RestraintSeclusionStaffProvidingRestraint', @level2type=N'COLUMN', @level2name=N'TrainedActionTechnique'
GO

-- Extended Properties [extension].[SchoolExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SchoolExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SchoolExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the period type that is used for taking attendance.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SchoolExtension', @level2type=N'COLUMN', @level2name=N'AttendanceConfigurationCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the school has a unit count exception', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SchoolExtension', @level2type=N'COLUMN', @level2name=N'UnitCountException'
GO

-- Extended Properties [extension].[SectionExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the part of the course section.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'CourseSchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the identifying number for the level', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionExtension', @level2type=N'COLUMN', @level2name=N'CourseLevelNumber'
GO

-- Extended Properties [extension].[SectionMarkingPeriod] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The marking periods that the class meets.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionMarkingPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code for a marking period when the class meets.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionMarkingPeriod', @level2type=N'COLUMN', @level2name=N'GradingPeriodDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionMarkingPeriod', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionMarkingPeriod', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionMarkingPeriod', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionMarkingPeriod', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionMarkingPeriod', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of seats used for the session in the specified marking period.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionMarkingPeriod', @level2type=N'COLUMN', @level2name=N'UsedSeat'
GO

-- Extended Properties [extension].[SectionSubjectArea] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Subject areas that the course meets as part of graduation requirements.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionSubjectArea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The code of the subject area the course meets.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionSubjectArea', @level2type=N'COLUMN', @level2name=N'AcademicSubjectDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local code assigned by the School that identifies the course offering provided for the instruction of students.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionSubjectArea', @level2type=N'COLUMN', @level2name=N'LocalCourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionSubjectArea', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionSubjectArea', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The local identifier assigned to a section.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionSubjectArea', @level2type=N'COLUMN', @level2name=N'SectionIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionSubjectArea', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The order of the subject area.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionSubjectArea', @level2type=N'COLUMN', @level2name=N'SubjectOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the table row was last changed.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SectionSubjectArea', @level2type=N'COLUMN', @level2name=N'SubjectAreaLastModifiedDate'
GO

-- Extended Properties [extension].[ServiceStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the status of the service.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ServiceStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'ServiceStatusDescriptor', @level2type=N'COLUMN', @level2name=N'ServiceStatusDescriptorId'
GO

-- Extended Properties [extension].[StaffEducationOrganizationAssignmentAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the start or effective date of a staff member''s employment, contract, or relationship with the LEA.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The titles of employment, official status, or rank of education staff.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'StaffClassificationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the availability of staff member for maintaining student attendance and scheduling courses.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffEducationOrganizationAssignmentAssociationExtension', @level2type=N'COLUMN', @level2name=N'Active'
GO

-- Extended Properties [extension].[StaffExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffExtension', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffExtension', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffExtension', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The enumeration items defining the racial categories which most clearly reflects the individual''s recognition of his or her community or with which the individual most identifies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffExtension', @level2type=N'COLUMN', @level2name=N'FederalRaceDescriptorId'
GO

-- Extended Properties [extension].[StaffProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Start date for the association of staff to this program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StaffUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the language taught by the staff participating in the language immersion program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ImmersionLanguageDescriptorId'
GO

-- Extended Properties [extension].[StaffRoleDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that identify the role of the staff for a course.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffRoleDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StaffRoleDescriptor', @level2type=N'COLUMN', @level2name=N'StaffRoleDescriptorId'
GO

-- Extended Properties [extension].[Student504ProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents the 504 program(S) that a student participates in or receives services from.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if student receives an accommodation plan.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation', @level2type=N'COLUMN', @level2name=N'AccommodatioPlan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the disability.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation', @level2type=N'COLUMN', @level2name=N'DisabilityDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the initial DNQ date.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation', @level2type=N'COLUMN', @level2name=N'InitialDNQDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the last evaluation date.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation', @level2type=N'COLUMN', @level2name=N'LastEvaluationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the meeting date.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'Student504ProgramAssociation', @level2type=N'COLUMN', @level2name=N'MeetingDate'
GO

-- Extended Properties [extension].[StudentCTEProgramAssociationCTEProgramExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The career cluster representing the career path of the Vocational/Career Tech concentrator.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A sequence of courses within an area of interest that is a student''s educational road map to a chosen career.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'CareerPathwayDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if this pathway is the concentrator.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'PathwayConcentrator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the results of the end of pathway assessment.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'EndOfPathwayTechnicalSkillsAssessmentDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the certification received for the pathway.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'FirstCertificationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the certification received for the pathway.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'SecondCertificationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the certification received for the pathway.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentCTEProgramAssociationCTEProgramExtension', @level2type=N'COLUMN', @level2name=N'ThirdCertificationDescriptorId'
GO

-- Extended Properties [extension].[StudentEarlyChildhoodProgramAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This association represents the early childhood program(S) that a student participates in or receives services from.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the average days per week student participates in the early childhood program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'AverageDaysPerWeek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the average hours per day student participates in the early childhood program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'AverageHoursPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if student participates in other early childhood program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'OtherEarlyChildhoodProgram'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if student is home based.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'HomeBased'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the student is determined eligible for regulation 619.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'Regulation619DeterminedEligible'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the date student was referred to Part C for regulation 619.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'Regulation619PartCReferralDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the date student was referred to regulation 619.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'Regulation619ReferralDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the transition conference date for student for regulation 619.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'Regulation619TransitionConferenceDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifiies the compliance or non-complaince reason for reguation 619.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEarlyChildhoodProgramAssociation', @level2type=N'COLUMN', @level2name=N'Regulation619ComplianceReasonDescriptorId'
GO

-- Extended Properties [extension].[StudentEducationOrganizationAssociationAddressExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The set of elements that describes an address, including the street address, city, state, and ZIP code.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationAddressExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of address listed for an individual or organization.    For example:  Physical Address, Mailing Address, Home Address, etc.)', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationAddressExtension', @level2type=N'COLUMN', @level2name=N'AddressTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationAddressExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationAddressExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The apartment or housing complex name.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationAddressExtension', @level2type=N'COLUMN', @level2name=N'Complex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the housing development.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationAddressExtension', @level2type=N'COLUMN', @level2name=N'Development'
GO

-- Extended Properties [extension].[StudentEducationOrganizationAssociationEthnicity] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the additional attributes that identify the race/ethnicity of an individual.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationEthnicity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationEthnicity', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the code for the race', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationEthnicity', @level2type=N'COLUMN', @level2name=N'RaceDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationEthnicity', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Order in which a individual''s race is identified.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationEthnicity', @level2type=N'COLUMN', @level2name=N'RaceOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The percentage that the individual identifies self with a race.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationEthnicity', @level2type=N'COLUMN', @level2name=N'RacePercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the equivalent federal code for the race/ethnicity of an individual.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationEthnicity', @level2type=N'COLUMN', @level2name=N'FederalRaceDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The date and time the table row was last changed.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationEthnicity', @level2type=N'COLUMN', @level2name=N'EthnicityLastModifiedDate'
GO

-- Extended Properties [extension].[StudentEducationOrganizationAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of choice transfer, if student transfered.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'ChoiceCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the FERPA privacy flag for student''s name.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'FerpaName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the FERPA privacy flag for student''s address.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'FerpaAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the FERPA privacy flag for student''s phone number.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'FerpaPhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the FERPA privacy flag for student''s photo.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'FerpaPhoto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates code for opting out of the FERPA privacy.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationExtension', @level2type=N'COLUMN', @level2name=N'FerpaOptOutDescriptorId'
GO

-- Extended Properties [extension].[StudentEducationOrganizationAssociationMultiliteracy] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the student received a multiliteracy award.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationMultiliteracy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the name of the assessment taken to receive the multiliteracy award.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationMultiliteracy', @level2type=N'COLUMN', @level2name=N'AssessmentTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of certificate received with the multiliteracy award.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationMultiliteracy', @level2type=N'COLUMN', @level2name=N'CertificateCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationMultiliteracy', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the language associated with the multiliteracy award.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationMultiliteracy', @level2type=N'COLUMN', @level2name=N'LanguageDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationMultiliteracy', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if the certificate issued was confirmed by the DOE.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationMultiliteracy', @level2type=N'COLUMN', @level2name=N'CertificateIssueConfirm'
GO

-- Extended Properties [extension].[StudentEducationOrganizationAssociationScholarship] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if a student received a scholarship for college.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationScholarship'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationScholarship', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The amount received for the scholarship', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationScholarship', @level2type=N'COLUMN', @level2name=N'ScholarshipAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the scholarship.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationScholarship', @level2type=N'COLUMN', @level2name=N'ScholarshipName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationScholarship', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [extension].[StudentEducationOrganizationResponsibilityAssociationTransfer] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the school transfer information for a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationResponsibilityAssociationTransfer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day, and year of the start date of an education organization''s responsibility for a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationResponsibilityAssociationTransfer', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationResponsibilityAssociationTransfer', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the name of the education organization student transferred from.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationResponsibilityAssociationTransfer', @level2type=N'COLUMN', @level2name=N'ExternalEducationOrganizationName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indications of an education organization''s responsibility for a student, such as accountability, attendance, funding, etc.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationResponsibilityAssociationTransfer', @level2type=N'COLUMN', @level2name=N'ResponsibilityDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationResponsibilityAssociationTransfer', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the GradeLevel when student transferred.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationResponsibilityAssociationTransfer', @level2type=N'COLUMN', @level2name=N'GradeLevelDescriptorId'
GO

-- Extended Properties [extension].[StudentExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier assigned to a person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentExtension', @level2type=N'COLUMN', @level2name=N'PersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of person.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentExtension', @level2type=N'COLUMN', @level2name=N'PersonCategoryDescriptorId'
GO

-- Extended Properties [extension].[StudentLanguageInstructionProgramAssociationLanguageImmersion] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies students participating in a language immersion program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationLanguageImmersion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationLanguageImmersion', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationLanguageImmersion', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the language student is taking/took to participate in language immersion program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationLanguageImmersion', @level2type=N'COLUMN', @level2name=N'ImmersionLanguageDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationLanguageImmersion', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationLanguageImmersion', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationLanguageImmersion', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationLanguageImmersion', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This identifies the comment associated with the language immersion.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationLanguageImmersion', @level2type=N'COLUMN', @level2name=N'Comment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the grade level when student participated in language immersion program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationLanguageImmersion', @level2type=N'COLUMN', @level2name=N'GradeLevelDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the school year when student participated in language immersion program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentLanguageInstructionProgramAssociationLanguageImmersion', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO

-- Extended Properties [extension].[StudentParentAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentParentAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a parent.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentParentAssociationExtension', @level2type=N'COLUMN', @level2name=N'ParentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentParentAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of contact it is for this student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentParentAssociationExtension', @level2type=N'COLUMN', @level2name=N'ContactTypeDescriptorId'
GO

-- Extended Properties [extension].[StudentSchoolAttendanceEventExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A code describing the attendance event, for example:
        Present
        Unexcused absence
        Excused absence
        Tardy.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'AttendanceEventCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date for this attendance event.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'EventDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the school year.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the calendar for the academic session (e.g., 2010/11, 2011 Summer).', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'SessionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The periods or minutes the student is absent.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'AbsentTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of periods or number of minutes that the student was scheduled for the day.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSchoolAttendanceEventExtension', @level2type=N'COLUMN', @level2name=N'ScheduledTime'
GO

-- Extended Properties [extension].[StudentSpecialEducationProgramAssociationExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the Student first received services.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramEducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether student is working towards a diploma or certificate.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'DiplomaCertificateCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether student is not counted for December 1.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'SpecialEducationFundingCountException'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates whether student receives special education DSTP accomodation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'DSTPAccommodation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if student is eligible for special education, but is not receiving services.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EligbleNotReceivingService'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates if student was evaluated for special education disability, but has no disability.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'EvaluatedNoDisability'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the category of the funding need.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'FundingNeedsCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the date when the initail consent was given to evaluate.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'InitialConsentToEvaluateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the date of the initial evaluation.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'InitialEvaluationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the last date a specialist evelauation was done.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'LastSpecialistEvaluationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the percentage of time spent out of regular class.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'PercentOutOfRegularClass'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the initiation date for PPPS ISp.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'PPPSISPInitiationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the PPPS meeeting date.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'PPPSMeetingDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the special education service status.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentSpecialEducationProgramAssociationExtension', @level2type=N'COLUMN', @level2name=N'ServiceStatusDescriptorId'
GO

-- Extended Properties [extension].[StudentTransportation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This represents the travel information for student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a local education agency.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'LocalEducationAgencyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the day of the week on which student is transported.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'TravelDayOfWeekDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'identifies the direction in which student is transported.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'TravelDirectionDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the segment number associated with the specified travel day.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'TravelSegment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the number identifying the travel trip for the student.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'TravelTrip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the type of travel.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'TravelCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the bus number for the travel segment.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'BusNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the bus route number for the travel segment.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'BusRouteNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the shuttle stop for the travel segment.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'ShuttleStop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description associated with the stop for the segment.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'StopDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the bus stop number for the travel segment.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'StopNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the stop time for the travel segment.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'StudentTransportation', @level2type=N'COLUMN', @level2name=N'StopTime'
GO

-- Extended Properties [extension].[SubjectAreaCode] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This identifies additional attributes required for the academic subject.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SubjectAreaCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The description of the content of the subject area.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SubjectAreaCode', @level2type=N'COLUMN', @level2name=N'AcademicSubjectDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Exact subject area code used in PerformancePLUS.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SubjectAreaCode', @level2type=N'COLUMN', @level2name=N'PerfPlusCode'
GO

-- Extended Properties [extension].[SupportPlanChangeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the types of changes for the support plan.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SupportPlanChangeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'SupportPlanChangeDescriptor', @level2type=N'COLUMN', @level2name=N'SupportPlanChangeDescriptorId'
GO

-- Extended Properties [extension].[TravelCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes that describe the students'' method of travel to and from school.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TravelCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TravelCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'TravelCategoryDescriptorId'
GO

-- Extended Properties [extension].[TravelDayOfWeekDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the day of the week the travel record applies.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TravelDayOfWeekDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TravelDayOfWeekDescriptor', @level2type=N'COLUMN', @level2name=N'TravelDayOfWeekDescriptorId'
GO

-- Extended Properties [extension].[TravelDirectionDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the direction of the travel segment.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TravelDirectionDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TravelDirectionDescriptor', @level2type=N'COLUMN', @level2name=N'TravelDirectionDescriptorId'
GO

-- Extended Properties [extension].[TreatmentDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the level of treatment provided.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TreatmentDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'TreatmentDescriptor', @level2type=N'COLUMN', @level2name=N'TreatmentDescriptorId'
GO

-- Extended Properties [extension].[VictimCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the codes for the victim types.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'VictimCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'extension', @level1type=N'TABLE', @level1name=N'VictimCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'VictimCategoryDescriptorId'
GO

