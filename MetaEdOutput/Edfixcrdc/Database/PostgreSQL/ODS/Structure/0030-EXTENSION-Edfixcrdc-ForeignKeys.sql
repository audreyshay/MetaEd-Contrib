ALTER TABLE edfixcrdc.AlternativeStatusDescriptor ADD CONSTRAINT FK_df1227_Descriptor FOREIGN KEY (AlternativeStatusDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE edfixcrdc.ClassGroup ADD CONSTRAINT FK_fe2d34_CommunityProviderLocation FOREIGN KEY (CommunityProviderId, CommunityProviderLocationId)
REFERENCES edfixcrdc.CommunityProviderLocation (CommunityProviderId, CommunityProviderLocationId)
;

CREATE INDEX FK_fe2d34_CommunityProviderLocation
ON edfixcrdc.ClassGroup (CommunityProviderId ASC, CommunityProviderLocationId ASC);

ALTER TABLE edfixcrdc.ClassGroup ADD CONSTRAINT FK_fe2d34_ServiceDescriptor FOREIGN KEY (ServiceDescriptorId)
REFERENCES edfi.ServiceDescriptor (ServiceDescriptorId)
;

CREATE INDEX FK_fe2d34_ServiceDescriptor
ON edfixcrdc.ClassGroup (ServiceDescriptorId ASC);

ALTER TABLE edfixcrdc.ClassGroupCourse ADD CONSTRAINT FK_7b2149_ClassGroup FOREIGN KEY (ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator)
REFERENCES edfixcrdc.ClassGroup (ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator)
ON DELETE CASCADE
;

CREATE INDEX FK_7b2149_ClassGroup
ON edfixcrdc.ClassGroupCourse (ClassGroupName ASC, CommunityProviderId ASC, CommunityProviderLocationId ASC, SpecialNeedsProvidedIndicator ASC);

ALTER TABLE edfixcrdc.ClassGroupCourse ADD CONSTRAINT FK_7b2149_Course FOREIGN KEY (CourseCode, EducationOrganizationId)
REFERENCES edfi.Course (CourseCode, EducationOrganizationId)
;

CREATE INDEX FK_7b2149_Course
ON edfixcrdc.ClassGroupCourse (CourseCode ASC, EducationOrganizationId ASC);

ALTER TABLE edfixcrdc.ClassGroupMeetingTime ADD CONSTRAINT FK_1e9aa3_ClassGroup FOREIGN KEY (ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator)
REFERENCES edfixcrdc.ClassGroup (ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator)
ON DELETE CASCADE
;

CREATE INDEX FK_1e9aa3_ClassGroup
ON edfixcrdc.ClassGroupMeetingTime (ClassGroupName ASC, CommunityProviderId ASC, CommunityProviderLocationId ASC, SpecialNeedsProvidedIndicator ASC);

ALTER TABLE edfixcrdc.ClassGroupMeetingTime ADD CONSTRAINT FK_1e9aa3_MeetingDayDescriptor FOREIGN KEY (MeetingDayDescriptorId)
REFERENCES edfixcrdc.MeetingDayDescriptor (MeetingDayDescriptorId)
;

CREATE INDEX FK_1e9aa3_MeetingDayDescriptor
ON edfixcrdc.ClassGroupMeetingTime (MeetingDayDescriptorId ASC);

ALTER TABLE edfixcrdc.CommunityProviderLocation ADD CONSTRAINT FK_dc2dd0_AddressTypeDescriptor FOREIGN KEY (AddressTypeDescriptorId)
REFERENCES edfi.AddressTypeDescriptor (AddressTypeDescriptorId)
;

CREATE INDEX FK_dc2dd0_AddressTypeDescriptor
ON edfixcrdc.CommunityProviderLocation (AddressTypeDescriptorId ASC);

ALTER TABLE edfixcrdc.CommunityProviderLocation ADD CONSTRAINT FK_dc2dd0_CommunityProvider FOREIGN KEY (CommunityProviderId)
REFERENCES edfi.CommunityProvider (CommunityProviderId)
;

CREATE INDEX FK_dc2dd0_CommunityProvider
ON edfixcrdc.CommunityProviderLocation (CommunityProviderId ASC);

ALTER TABLE edfixcrdc.CommunityProviderLocation ADD CONSTRAINT FK_dc2dd0_StateAbbreviationDescriptor FOREIGN KEY (StateAbbreviationDescriptorId)
REFERENCES edfi.StateAbbreviationDescriptor (StateAbbreviationDescriptorId)
;

CREATE INDEX FK_dc2dd0_StateAbbreviationDescriptor
ON edfixcrdc.CommunityProviderLocation (StateAbbreviationDescriptorId ASC);

ALTER TABLE edfixcrdc.CommunityProviderLocationInstructionalCalendar ADD CONSTRAINT FK_8d9b94_CommunityProviderLocation FOREIGN KEY (CommunityProviderId, CommunityProviderLocationId)
REFERENCES edfixcrdc.CommunityProviderLocation (CommunityProviderId, CommunityProviderLocationId)
ON DELETE CASCADE
;

ALTER TABLE edfixcrdc.CommunityProviderLocationInstructionalCalendar ADD CONSTRAINT FK_8d9b94_SchoolYearType FOREIGN KEY (SchoolYear)
REFERENCES edfi.SchoolYearType (SchoolYear)
;

CREATE INDEX FK_8d9b94_SchoolYearType
ON edfixcrdc.CommunityProviderLocationInstructionalCalendar (SchoolYear ASC);

ALTER TABLE edfixcrdc.MeetingDayDescriptor ADD CONSTRAINT FK_eda8dc_Descriptor FOREIGN KEY (MeetingDayDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE edfixcrdc.ProgramCostDescriptor ADD CONSTRAINT FK_18d844_Descriptor FOREIGN KEY (ProgramCostDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE edfixcrdc.ProgramExtension ADD CONSTRAINT FK_9e5e55_Program FOREIGN KEY (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
REFERENCES edfi.Program (EducationOrganizationId, ProgramName, ProgramTypeDescriptorId)
ON DELETE CASCADE
;

ALTER TABLE edfixcrdc.ProgramExtension ADD CONSTRAINT FK_9e5e55_ProgramCostDescriptor FOREIGN KEY (ProgramCostDescriptorId)
REFERENCES edfixcrdc.ProgramCostDescriptor (ProgramCostDescriptorId)
;

CREATE INDEX FK_9e5e55_ProgramCostDescriptor
ON edfixcrdc.ProgramExtension (ProgramCostDescriptorId ASC);

ALTER TABLE edfixcrdc.RestraintCategoryDescriptor ADD CONSTRAINT FK_fab563_Descriptor FOREIGN KEY (RestraintCategoryDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

ALTER TABLE edfixcrdc.RestraintEventRestraintCategory ADD CONSTRAINT FK_abb4eb_RestraintCategoryDescriptor FOREIGN KEY (RestraintCategoryDescriptorId)
REFERENCES edfixcrdc.RestraintCategoryDescriptor (RestraintCategoryDescriptorId)
;

CREATE INDEX FK_abb4eb_RestraintCategoryDescriptor
ON edfixcrdc.RestraintEventRestraintCategory (RestraintCategoryDescriptorId ASC);

ALTER TABLE edfixcrdc.RestraintEventRestraintCategory ADD CONSTRAINT FK_abb4eb_RestraintEvent FOREIGN KEY (RestraintEventIdentifier, SchoolId, StudentUSI)
REFERENCES edfi.RestraintEvent (RestraintEventIdentifier, SchoolId, StudentUSI)
ON DELETE CASCADE
;

CREATE INDEX FK_abb4eb_RestraintEvent
ON edfixcrdc.RestraintEventRestraintCategory (RestraintEventIdentifier ASC, SchoolId ASC, StudentUSI ASC);

ALTER TABLE edfixcrdc.SchoolExtension ADD CONSTRAINT FK_2199be_AlternativeStatusDescriptor FOREIGN KEY (AlternativeStatusDescriptorId)
REFERENCES edfixcrdc.AlternativeStatusDescriptor (AlternativeStatusDescriptorId)
;

CREATE INDEX FK_2199be_AlternativeStatusDescriptor
ON edfixcrdc.SchoolExtension (AlternativeStatusDescriptorId ASC);

ALTER TABLE edfixcrdc.SchoolExtension ADD CONSTRAINT FK_2199be_School FOREIGN KEY (SchoolId)
REFERENCES edfi.School (SchoolId)
ON DELETE CASCADE
;

ALTER TABLE edfixcrdc.SchoolExtension ADD CONSTRAINT FK_2199be_UngradedDetailDescriptor FOREIGN KEY (UngradedDetailDescriptorId)
REFERENCES edfixcrdc.UngradedDetailDescriptor (UngradedDetailDescriptorId)
;

CREATE INDEX FK_2199be_UngradedDetailDescriptor
ON edfixcrdc.SchoolExtension (UngradedDetailDescriptorId ASC);

ALTER TABLE edfixcrdc.SchoolTechnology ADD CONSTRAINT FK_2474e7_School FOREIGN KEY (SchoolId)
REFERENCES edfi.School (SchoolId)
ON DELETE CASCADE
;

ALTER TABLE edfixcrdc.StudentClassGroupAssociation ADD CONSTRAINT FK_19dc94_ClassGroup FOREIGN KEY (ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator)
REFERENCES edfixcrdc.ClassGroup (ClassGroupName, CommunityProviderId, CommunityProviderLocationId, SpecialNeedsProvidedIndicator)
;

CREATE INDEX FK_19dc94_ClassGroup
ON edfixcrdc.StudentClassGroupAssociation (ClassGroupName ASC, CommunityProviderId ASC, CommunityProviderLocationId ASC, SpecialNeedsProvidedIndicator ASC);

ALTER TABLE edfixcrdc.StudentClassGroupAssociation ADD CONSTRAINT FK_19dc94_ReasonExitedDescriptor FOREIGN KEY (ReasonExitedDescriptorId)
REFERENCES edfi.ReasonExitedDescriptor (ReasonExitedDescriptorId)
;

CREATE INDEX FK_19dc94_ReasonExitedDescriptor
ON edfixcrdc.StudentClassGroupAssociation (ReasonExitedDescriptorId ASC);

ALTER TABLE edfixcrdc.StudentClassGroupAssociation ADD CONSTRAINT FK_19dc94_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
;

CREATE INDEX FK_19dc94_Student
ON edfixcrdc.StudentClassGroupAssociation (StudentUSI ASC);

ALTER TABLE edfixcrdc.StudentCommunityProviderLocationAssociation ADD CONSTRAINT FK_050b9a_CommunityProviderLocation FOREIGN KEY (CommunityProviderId, CommunityProviderLocationId)
REFERENCES edfixcrdc.CommunityProviderLocation (CommunityProviderId, CommunityProviderLocationId)
;

CREATE INDEX FK_050b9a_CommunityProviderLocation
ON edfixcrdc.StudentCommunityProviderLocationAssociation (CommunityProviderId ASC, CommunityProviderLocationId ASC);

ALTER TABLE edfixcrdc.StudentCommunityProviderLocationAssociation ADD CONSTRAINT FK_050b9a_ReasonExitedDescriptor FOREIGN KEY (ReasonExitedDescriptorId)
REFERENCES edfi.ReasonExitedDescriptor (ReasonExitedDescriptorId)
;

CREATE INDEX FK_050b9a_ReasonExitedDescriptor
ON edfixcrdc.StudentCommunityProviderLocationAssociation (ReasonExitedDescriptorId ASC);

ALTER TABLE edfixcrdc.StudentCommunityProviderLocationAssociation ADD CONSTRAINT FK_050b9a_Student FOREIGN KEY (StudentUSI)
REFERENCES edfi.Student (StudentUSI)
;

CREATE INDEX FK_050b9a_Student
ON edfixcrdc.StudentCommunityProviderLocationAssociation (StudentUSI ASC);

ALTER TABLE edfixcrdc.UngradedDetailDescriptor ADD CONSTRAINT FK_3a434d_Descriptor FOREIGN KEY (UngradedDetailDescriptorId)
REFERENCES edfi.Descriptor (DescriptorId)
ON DELETE CASCADE
;

