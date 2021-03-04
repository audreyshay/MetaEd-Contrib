-- Extended Properties [edfixcrdc].[AlternativeStatusDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The alternative status of the school, such as academic or discipline.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'AlternativeStatusDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'AlternativeStatusDescriptor', @level2type=N'COLUMN', @level2name=N'AlternativeStatusDescriptorId'
GO

-- Extended Properties [edfixcrdc].[ClassGroup] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A collection of students at a community provider location.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the class/group of students.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroup', @level2type=N'COLUMN', @level2name=N'ClassGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a CommunityProvider.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroup', @level2type=N'COLUMN', @level2name=N'CommunityProviderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroup', @level2type=N'COLUMN', @level2name=N'CommunityProviderLocationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether a class or group serves children with special needs.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroup', @level2type=N'COLUMN', @level2name=N'SpecialNeedsProvidedIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The maximum number of students this class group can accomodate at any given time.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroup', @level2type=N'COLUMN', @level2name=N'Capacity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of days per week this class/group meets.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroup', @level2type=N'COLUMN', @level2name=N'DaysAvailablePerWeek'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of hours per day the class/group meets.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroup', @level2type=N'COLUMN', @level2name=N'HoursAvailablePerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The services provided to students at this class/group.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroup', @level2type=N'COLUMN', @level2name=N'ServiceDescriptorId'
GO

-- Extended Properties [edfixcrdc].[ClassGroupCourse] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The course being offered by the ClassGroup.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupCourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the class/group of students.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupCourse', @level2type=N'COLUMN', @level2name=N'ClassGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a CommunityProvider.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupCourse', @level2type=N'COLUMN', @level2name=N'CommunityProviderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupCourse', @level2type=N'COLUMN', @level2name=N'CommunityProviderLocationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a course.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupCourse', @level2type=N'COLUMN', @level2name=N'CourseCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupCourse', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether a class or group serves children with special needs.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupCourse', @level2type=N'COLUMN', @level2name=N'SpecialNeedsProvidedIndicator'
GO

-- Extended Properties [edfixcrdc].[ClassGroupMeetingTime] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The times and days of week this class/group is in session.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupMeetingTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the class/group of students.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupMeetingTime', @level2type=N'COLUMN', @level2name=N'ClassGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a CommunityProvider.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupMeetingTime', @level2type=N'COLUMN', @level2name=N'CommunityProviderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupMeetingTime', @level2type=N'COLUMN', @level2name=N'CommunityProviderLocationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates meeting day.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupMeetingTime', @level2type=N'COLUMN', @level2name=N'MeetingDayDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether a class or group serves children with special needs.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupMeetingTime', @level2type=N'COLUMN', @level2name=N'SpecialNeedsProvidedIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time of day a class/group starts providing services.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupMeetingTime', @level2type=N'COLUMN', @level2name=N'StartTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time of day a class/group stops providing services.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ClassGroupMeetingTime', @level2type=N'COLUMN', @level2name=N'StopTime'
GO

-- Extended Properties [edfixcrdc].[CommunityProviderLocation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents physical locations where services are provided by Community Providers.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a CommunityProvider.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'CommunityProviderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'CommunityProviderLocationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of the range of ages of students that this provider location can accommodate.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'AgeRangeDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The youngest age of students accepted at this location.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'YoungestAgeAccepted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The oldest age of students accepted at this location.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'OldestAgeAccepted'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The maximum number of students this provider location can accommodate at any given time.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'Capacity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether a provider location serves children with special needs.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'SpecialNeedsProvidedIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time of day this provider location begins providing services.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'TimeOpen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The time of day this provider location stops providing services.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'TimeClose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of address listed for the community provider location.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'AddressTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The street number and street name or post office box number of an address.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'StreetNumberName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The street number and street name or post office box number of an address.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'ApartmentRoomSuiteNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of the building on the site, if more than one building shares the same address.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'BuildingSiteNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the city in which an address is located.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The abbreviation for the state (within the United States) or outlying area in which an address is located.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'StateAbbreviationDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The five or nine digit zip code or overseas postal code portion of an address.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'PostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the county, parish, borough, or comparable unit (within a state) in which an address is located.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'NameOfCounty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Federal Information Processing Standards (FIPS) numeric code for the county issued by the National Institute of Standards and Technology (NIST). Counties are considered to be the ''first-order subdivisions'' of each State and statistically equivalent entity, regardless of their local designations (county, parish, borough, etc.). Counties in different States will have the same code. A unique county number is created when combined with the 2-digit FIPS State Code', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocation', @level2type=N'COLUMN', @level2name=N'CountyFIPSCode'
GO

-- Extended Properties [edfixcrdc].[CommunityProviderLocationInstructionalCalendar] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the span of time a community provider is open to provide instruction to students who are under the direction and guidance of teachers and/or administration.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocationInstructionalCalendar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a CommunityProvider.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocationInstructionalCalendar', @level2type=N'COLUMN', @level2name=N'CommunityProviderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocationInstructionalCalendar', @level2type=N'COLUMN', @level2name=N'CommunityProviderLocationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier for the instructional year.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocationInstructionalCalendar', @level2type=N'COLUMN', @level2name=N'SchoolYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day and year of the first day of the instructional calendar.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocationInstructionalCalendar', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Month, day and year of the last day of the instuctional calendar.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocationInstructionalCalendar', @level2type=N'COLUMN', @level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total number of instructional days in the intructional calendar.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'CommunityProviderLocationInstructionalCalendar', @level2type=N'COLUMN', @level2name=N'TotalInstructionalDaysPerYear'
GO

-- Extended Properties [edfixcrdc].[MeetingDayDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates meeting day.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'MeetingDayDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'MeetingDayDescriptor', @level2type=N'COLUMN', @level2name=N'MeetingDayDescriptorId'
GO

-- Extended Properties [edfixcrdc].[ProgramCostDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the cost of a program that is offered by the Education Organization.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ProgramCostDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ProgramCostDescriptor', @level2type=N'COLUMN', @level2name=N'ProgramCostDescriptorId'
GO

-- Extended Properties [edfixcrdc].[ProgramExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ProgramExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ProgramExtension', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ProgramExtension', @level2type=N'COLUMN', @level2name=N'ProgramName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of program.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ProgramExtension', @level2type=N'COLUMN', @level2name=N'ProgramTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines the cost of a program that is offered by the Education Organization', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'ProgramExtension', @level2type=N'COLUMN', @level2name=N'ProgramCostDescriptorId'
GO

-- Extended Properties [edfixcrdc].[RestraintCategoryDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the categories of the restraint administered.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'RestraintCategoryDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'RestraintCategoryDescriptor', @level2type=N'COLUMN', @level2name=N'RestraintCategoryDescriptorId'
GO

-- Extended Properties [edfixcrdc].[RestraintEventRestraintCategory] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The category of the restraint administered.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'RestraintEventRestraintCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The category of the restraint administered.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'RestraintEventRestraintCategory', @level2type=N'COLUMN', @level2name=N'RestraintCategoryDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to a restraint event by a school, school system, state, or other agency or entity.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'RestraintEventRestraintCategory', @level2type=N'COLUMN', @level2name=N'RestraintEventIdentifier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'RestraintEventRestraintCategory', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'RestraintEventRestraintCategory', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO

-- Extended Properties [edfixcrdc].[SchoolExtension] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'SchoolExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'SchoolExtension', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The alternative status of the school, such as academic or discipline', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'SchoolExtension', @level2type=N'COLUMN', @level2name=N'AlternativeStatusDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the population of students who attend an ungraded school', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'SchoolExtension', @level2type=N'COLUMN', @level2name=N'UngradedDetailDescriptorId'
GO

-- Extended Properties [edfixcrdc].[SchoolTechnology] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Technology related information needed for CRDC at school level.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'SchoolTechnology'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a school.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'SchoolTechnology', @level2type=N'COLUMN', @level2name=N'SchoolId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Is the school connected to the internet through fiber-optic connection?', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'SchoolTechnology', @level2type=N'COLUMN', @level2name=N'FiberOpticConnection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Does the school have Wi-Fi access in every classroom?', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'SchoolTechnology', @level2type=N'COLUMN', @level2name=N'AllClassroomsHaveWiFi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Does the school allow students to take home school-issued devices that can be used to access the internet for student learning?', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'SchoolTechnology', @level2type=N'COLUMN', @level2name=N'StudentsTakeHomeDevice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Does the school allow students to bring to the school student-owned devices that can be used to access the internet for student learning?', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'SchoolTechnology', @level2type=N'COLUMN', @level2name=N'StudentsBringOwnDevice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of Wi-Fi enabled devices provided by the school to students for student learning use', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'SchoolTechnology', @level2type=N'COLUMN', @level2name=N'WiFiDeviceCount'
GO

-- Extended Properties [edfixcrdc].[StudentClassGroupAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity tracks student enrollment in class/groups at community providers.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentClassGroupAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the student began participating in a class/group.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentClassGroupAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name of the class/group of students.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentClassGroupAssociation', @level2type=N'COLUMN', @level2name=N'ClassGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a CommunityProvider.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentClassGroupAssociation', @level2type=N'COLUMN', @level2name=N'CommunityProviderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentClassGroupAssociation', @level2type=N'COLUMN', @level2name=N'CommunityProviderLocationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether a class or group serves children with special needs.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentClassGroupAssociation', @level2type=N'COLUMN', @level2name=N'SpecialNeedsProvidedIndicator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentClassGroupAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the student stopped participating in a class/group.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentClassGroupAssociation', @level2type=N'COLUMN', @level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The reason the student stopped participating in a class/group.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentClassGroupAssociation', @level2type=N'COLUMN', @level2name=N'ReasonExitedDescriptorId'
GO

-- Extended Properties [edfixcrdc].[StudentCommunityProviderLocationAssociation] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity tracks student attendance events such as absent, tardy, etc. at a community provider location level.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentCommunityProviderLocationAssociation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the student began participating at a provider location.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentCommunityProviderLocationAssociation', @level2type=N'COLUMN', @level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to a CommunityProvider.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentCommunityProviderLocationAssociation', @level2type=N'COLUMN', @level2name=N'CommunityProviderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentCommunityProviderLocationAssociation', @level2type=N'COLUMN', @level2name=N'CommunityProviderLocationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentCommunityProviderLocationAssociation', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which the student stopped participating at a provider location.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentCommunityProviderLocationAssociation', @level2type=N'COLUMN', @level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The reason the child left the community provider.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentCommunityProviderLocationAssociation', @level2type=N'COLUMN', @level2name=N'ReasonExitedDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The status of the student''s enrollment by the Community Provider Loaction.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'StudentCommunityProviderLocationAssociation', @level2type=N'COLUMN', @level2name=N'EnrollmentStatus'
GO

-- Extended Properties [edfixcrdc].[UngradedDetailDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the population of students who attend an ungraded school.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'UngradedDetailDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'edfixcrdc', @level1type=N'TABLE', @level1name=N'UngradedDetailDescriptor', @level2type=N'COLUMN', @level2name=N'UngradedDetailDescriptorId'
GO

