-- Extended Properties [edfixcrdc].[AlternativeStatusDescriptor] --
COMMENT ON TABLE edfixcrdc.AlternativeStatusDescriptor IS 'The alternative status of the school, such as academic or discipline.';
COMMENT ON COLUMN edfixcrdc.AlternativeStatusDescriptor.AlternativeStatusDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [edfixcrdc].[ClassGroup] --
COMMENT ON TABLE edfixcrdc.ClassGroup IS 'A collection of students at a community provider location.';
COMMENT ON COLUMN edfixcrdc.ClassGroup.ClassGroupName IS 'The name of the class/group of students.';
COMMENT ON COLUMN edfixcrdc.ClassGroup.CommunityProviderId IS 'The identifier assigned to a CommunityProvider.';
COMMENT ON COLUMN edfixcrdc.ClassGroup.CommunityProviderLocationId IS 'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.';
COMMENT ON COLUMN edfixcrdc.ClassGroup.SpecialNeedsProvidedIndicator IS 'An indication of whether a class or group serves children with special needs.';
COMMENT ON COLUMN edfixcrdc.ClassGroup.Capacity IS 'The maximum number of students this class group can accomodate at any given time.';
COMMENT ON COLUMN edfixcrdc.ClassGroup.DaysAvailablePerWeek IS 'The number of days per week this class/group meets.';
COMMENT ON COLUMN edfixcrdc.ClassGroup.HoursAvailablePerDay IS 'The number of hours per day the class/group meets.';
COMMENT ON COLUMN edfixcrdc.ClassGroup.ServiceDescriptorId IS 'The services provided to students at this class/group.';

-- Extended Properties [edfixcrdc].[ClassGroupCourse] --
COMMENT ON TABLE edfixcrdc.ClassGroupCourse IS 'The course being offered by the ClassGroup.';
COMMENT ON COLUMN edfixcrdc.ClassGroupCourse.ClassGroupName IS 'The name of the class/group of students.';
COMMENT ON COLUMN edfixcrdc.ClassGroupCourse.CommunityProviderId IS 'The identifier assigned to a CommunityProvider.';
COMMENT ON COLUMN edfixcrdc.ClassGroupCourse.CommunityProviderLocationId IS 'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.';
COMMENT ON COLUMN edfixcrdc.ClassGroupCourse.CourseCode IS 'A unique alphanumeric code assigned to a course.';
COMMENT ON COLUMN edfixcrdc.ClassGroupCourse.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixcrdc.ClassGroupCourse.SpecialNeedsProvidedIndicator IS 'An indication of whether a class or group serves children with special needs.';

-- Extended Properties [edfixcrdc].[ClassGroupMeetingTime] --
COMMENT ON TABLE edfixcrdc.ClassGroupMeetingTime IS 'The times and days of week this class/group is in session.';
COMMENT ON COLUMN edfixcrdc.ClassGroupMeetingTime.ClassGroupName IS 'The name of the class/group of students.';
COMMENT ON COLUMN edfixcrdc.ClassGroupMeetingTime.CommunityProviderId IS 'The identifier assigned to a CommunityProvider.';
COMMENT ON COLUMN edfixcrdc.ClassGroupMeetingTime.CommunityProviderLocationId IS 'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.';
COMMENT ON COLUMN edfixcrdc.ClassGroupMeetingTime.MeetingDayDescriptorId IS 'Indicates meeting day.';
COMMENT ON COLUMN edfixcrdc.ClassGroupMeetingTime.SpecialNeedsProvidedIndicator IS 'An indication of whether a class or group serves children with special needs.';
COMMENT ON COLUMN edfixcrdc.ClassGroupMeetingTime.StartTime IS 'The time of day a class/group starts providing services.';
COMMENT ON COLUMN edfixcrdc.ClassGroupMeetingTime.StopTime IS 'The time of day a class/group stops providing services.';

-- Extended Properties [edfixcrdc].[CommunityProviderLocation] --
COMMENT ON TABLE edfixcrdc.CommunityProviderLocation IS 'This entity represents physical locations where services are provided by Community Providers.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.CommunityProviderId IS 'The identifier assigned to a CommunityProvider.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.CommunityProviderLocationId IS 'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.AgeRangeDescription IS 'An indication of the range of ages of students that this provider location can accommodate.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.YoungestAgeAccepted IS 'The youngest age of students accepted at this location.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.OldestAgeAccepted IS 'The oldest age of students accepted at this location.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.Capacity IS 'The maximum number of students this provider location can accommodate at any given time.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.SpecialNeedsProvidedIndicator IS 'An indication of whether a provider location serves children with special needs.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.TimeOpen IS 'The time of day this provider location begins providing services.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.TimeClose IS 'The time of day this provider location stops providing services.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.AddressTypeDescriptorId IS 'The type of address listed for the community provider location.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.StreetNumberName IS 'The street number and street name or post office box number of an address.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.ApartmentRoomSuiteNumber IS 'The street number and street name or post office box number of an address.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.BuildingSiteNumber IS 'The number of the building on the site, if more than one building shares the same address.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.City IS 'The name of the city in which an address is located.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.StateAbbreviationDescriptorId IS 'The abbreviation for the state (within the United States) or outlying area in which an address is located.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.PostalCode IS 'The five or nine digit zip code or overseas postal code portion of an address.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.NameOfCounty IS 'The name of the county, parish, borough, or comparable unit (within a state) in which an address is located.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocation.CountyFIPSCode IS 'The Federal Information Processing Standards (FIPS) numeric code for the county issued by the National Institute of Standards and Technology (NIST). Counties are considered to be the ''first-order subdivisions'' of each State and statistically equivalent entity, regardless of their local designations (county, parish, borough, etc.). Counties in different States will have the same code. A unique county number is created when combined with the 2-digit FIPS State Code';

-- Extended Properties [edfixcrdc].[CommunityProviderLocationInstructionalCalendar] --
COMMENT ON TABLE edfixcrdc.CommunityProviderLocationInstructionalCalendar IS 'Identifies the span of time a community provider is open to provide instruction to students who are under the direction and guidance of teachers and/or administration.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocationInstructionalCalendar.CommunityProviderId IS 'The identifier assigned to a CommunityProvider.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocationInstructionalCalendar.CommunityProviderLocationId IS 'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocationInstructionalCalendar.SchoolYear IS 'The identifier for the instructional year.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocationInstructionalCalendar.BeginDate IS 'Month, day and year of the first day of the instructional calendar.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocationInstructionalCalendar.EndDate IS 'Month, day and year of the last day of the instuctional calendar.';
COMMENT ON COLUMN edfixcrdc.CommunityProviderLocationInstructionalCalendar.TotalInstructionalDaysPerYear IS 'The total number of instructional days in the intructional calendar.';

-- Extended Properties [edfixcrdc].[MeetingDayDescriptor] --
COMMENT ON TABLE edfixcrdc.MeetingDayDescriptor IS 'Indicates meeting day.';
COMMENT ON COLUMN edfixcrdc.MeetingDayDescriptor.MeetingDayDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [edfixcrdc].[ProgramCostDescriptor] --
COMMENT ON TABLE edfixcrdc.ProgramCostDescriptor IS 'This descriptor defines the cost of a program that is offered by the Education Organization.';
COMMENT ON COLUMN edfixcrdc.ProgramCostDescriptor.ProgramCostDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [edfixcrdc].[ProgramExtension] --
COMMENT ON TABLE edfixcrdc.ProgramExtension IS '';
COMMENT ON COLUMN edfixcrdc.ProgramExtension.EducationOrganizationId IS 'The identifier assigned to an education organization.';
COMMENT ON COLUMN edfixcrdc.ProgramExtension.ProgramName IS 'The formal name of the Program of instruction, training, services, or benefits available through federal, state, or local agencies.';
COMMENT ON COLUMN edfixcrdc.ProgramExtension.ProgramTypeDescriptorId IS 'The type of program.';
COMMENT ON COLUMN edfixcrdc.ProgramExtension.ProgramCostDescriptorId IS 'Defines the cost of a program that is offered by the Education Organization';

-- Extended Properties [edfixcrdc].[RestraintCategoryDescriptor] --
COMMENT ON TABLE edfixcrdc.RestraintCategoryDescriptor IS 'This descriptor defines the categories of the restraint administered.';
COMMENT ON COLUMN edfixcrdc.RestraintCategoryDescriptor.RestraintCategoryDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

-- Extended Properties [edfixcrdc].[RestraintEventRestraintCategory] --
COMMENT ON TABLE edfixcrdc.RestraintEventRestraintCategory IS 'The category of the restraint administered.';
COMMENT ON COLUMN edfixcrdc.RestraintEventRestraintCategory.RestraintCategoryDescriptorId IS 'The category of the restraint administered.';
COMMENT ON COLUMN edfixcrdc.RestraintEventRestraintCategory.RestraintEventIdentifier IS 'A unique number or alphanumeric code assigned to a restraint event by a school, school system, state, or other agency or entity.';
COMMENT ON COLUMN edfixcrdc.RestraintEventRestraintCategory.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN edfixcrdc.RestraintEventRestraintCategory.StudentUSI IS 'A unique alphanumeric code assigned to a student.';

-- Extended Properties [edfixcrdc].[SchoolExtension] --
COMMENT ON TABLE edfixcrdc.SchoolExtension IS '';
COMMENT ON COLUMN edfixcrdc.SchoolExtension.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN edfixcrdc.SchoolExtension.AlternativeStatusDescriptorId IS 'The alternative status of the school, such as academic or discipline';
COMMENT ON COLUMN edfixcrdc.SchoolExtension.UngradedDetailDescriptorId IS 'Description of the population of students who attend an ungraded school';

-- Extended Properties [edfixcrdc].[SchoolTechnology] --
COMMENT ON TABLE edfixcrdc.SchoolTechnology IS 'Technology related information needed for CRDC at school level.';
COMMENT ON COLUMN edfixcrdc.SchoolTechnology.SchoolId IS 'The identifier assigned to a school.';
COMMENT ON COLUMN edfixcrdc.SchoolTechnology.FiberOpticConnection IS 'Is the school connected to the internet through fiber-optic connection?';
COMMENT ON COLUMN edfixcrdc.SchoolTechnology.AllClassroomsHaveWiFi IS 'Does the school have Wi-Fi access in every classroom?';
COMMENT ON COLUMN edfixcrdc.SchoolTechnology.StudentsTakeHomeDevice IS 'Does the school allow students to take home school-issued devices that can be used to access the internet for student learning?';
COMMENT ON COLUMN edfixcrdc.SchoolTechnology.StudentsBringOwnDevice IS 'Does the school allow students to bring to the school student-owned devices that can be used to access the internet for student learning?';
COMMENT ON COLUMN edfixcrdc.SchoolTechnology.WiFiDeviceCount IS 'Number of Wi-Fi enabled devices provided by the school to students for student learning use';

-- Extended Properties [edfixcrdc].[StudentClassGroupAssociation] --
COMMENT ON TABLE edfixcrdc.StudentClassGroupAssociation IS 'This entity tracks student enrollment in class/groups at community providers.';
COMMENT ON COLUMN edfixcrdc.StudentClassGroupAssociation.BeginDate IS 'The month, day, and year on which the student began participating in a class/group.';
COMMENT ON COLUMN edfixcrdc.StudentClassGroupAssociation.ClassGroupName IS 'The name of the class/group of students.';
COMMENT ON COLUMN edfixcrdc.StudentClassGroupAssociation.CommunityProviderId IS 'The identifier assigned to a CommunityProvider.';
COMMENT ON COLUMN edfixcrdc.StudentClassGroupAssociation.CommunityProviderLocationId IS 'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.';
COMMENT ON COLUMN edfixcrdc.StudentClassGroupAssociation.SpecialNeedsProvidedIndicator IS 'An indication of whether a class or group serves children with special needs.';
COMMENT ON COLUMN edfixcrdc.StudentClassGroupAssociation.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixcrdc.StudentClassGroupAssociation.EndDate IS 'The month, day, and year on which the student stopped participating in a class/group.';
COMMENT ON COLUMN edfixcrdc.StudentClassGroupAssociation.ReasonExitedDescriptorId IS 'The reason the student stopped participating in a class/group.';

-- Extended Properties [edfixcrdc].[StudentCommunityProviderLocationAssociation] --
COMMENT ON TABLE edfixcrdc.StudentCommunityProviderLocationAssociation IS 'This entity tracks student attendance events such as absent, tardy, etc. at a community provider location level.';
COMMENT ON COLUMN edfixcrdc.StudentCommunityProviderLocationAssociation.BeginDate IS 'The month, day, and year on which the student began participating at a provider location.';
COMMENT ON COLUMN edfixcrdc.StudentCommunityProviderLocationAssociation.CommunityProviderId IS 'The identifier assigned to a CommunityProvider.';
COMMENT ON COLUMN edfixcrdc.StudentCommunityProviderLocationAssociation.CommunityProviderLocationId IS 'A unique number or alphanumeric code assigned to an education organization by a school, school system, a state, or other agency or entity.';
COMMENT ON COLUMN edfixcrdc.StudentCommunityProviderLocationAssociation.StudentUSI IS 'A unique alphanumeric code assigned to a student.';
COMMENT ON COLUMN edfixcrdc.StudentCommunityProviderLocationAssociation.EndDate IS 'The month, day, and year on which the student stopped participating at a provider location.';
COMMENT ON COLUMN edfixcrdc.StudentCommunityProviderLocationAssociation.ReasonExitedDescriptorId IS 'The reason the child left the community provider.';
COMMENT ON COLUMN edfixcrdc.StudentCommunityProviderLocationAssociation.EnrollmentStatus IS 'The status of the student''s enrollment by the Community Provider Loaction.';

-- Extended Properties [edfixcrdc].[UngradedDetailDescriptor] --
COMMENT ON TABLE edfixcrdc.UngradedDetailDescriptor IS 'Description of the population of students who attend an ungraded school.';
COMMENT ON COLUMN edfixcrdc.UngradedDetailDescriptor.UngradedDetailDescriptorId IS 'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.';

