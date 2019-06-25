ALTER TABLE [edfixcrdc].[AlternativeStatusDescriptor] WITH CHECK ADD CONSTRAINT [FK_AlternativeStatusDescriptor_Descriptor] FOREIGN KEY ([AlternativeStatusDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixcrdc].[ClassGroup] WITH CHECK ADD CONSTRAINT [FK_ClassGroup_CommunityProviderLocation] FOREIGN KEY ([CommunityProviderId], [CommunityProviderLocationId])
REFERENCES [edfixcrdc].[CommunityProviderLocation] ([CommunityProviderId], [CommunityProviderLocationId])
GO

CREATE NONCLUSTERED INDEX [FK_ClassGroup_CommunityProviderLocation]
ON [edfixcrdc].[ClassGroup] ([CommunityProviderId] ASC, [CommunityProviderLocationId] ASC)
GO

ALTER TABLE [edfixcrdc].[ClassGroup] WITH CHECK ADD CONSTRAINT [FK_ClassGroup_ServiceDescriptor] FOREIGN KEY ([ServiceDescriptorId])
REFERENCES [edfi].[ServiceDescriptor] ([ServiceDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ClassGroup_ServiceDescriptor]
ON [edfixcrdc].[ClassGroup] ([ServiceDescriptorId] ASC)
GO

ALTER TABLE [edfixcrdc].[ClassGroupCourse] WITH CHECK ADD CONSTRAINT [FK_ClassGroupCourse_ClassGroup] FOREIGN KEY ([ClassGroupName], [CommunityProviderId], [CommunityProviderLocationId], [SpecialNeedsProvidedIndicator])
REFERENCES [edfixcrdc].[ClassGroup] ([ClassGroupName], [CommunityProviderId], [CommunityProviderLocationId], [SpecialNeedsProvidedIndicator])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ClassGroupCourse_ClassGroup]
ON [edfixcrdc].[ClassGroupCourse] ([ClassGroupName] ASC, [CommunityProviderId] ASC, [CommunityProviderLocationId] ASC, [SpecialNeedsProvidedIndicator] ASC)
GO

ALTER TABLE [edfixcrdc].[ClassGroupCourse] WITH CHECK ADD CONSTRAINT [FK_ClassGroupCourse_Course] FOREIGN KEY ([CourseCode], [EducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_ClassGroupCourse_Course]
ON [edfixcrdc].[ClassGroupCourse] ([CourseCode] ASC, [EducationOrganizationId] ASC)
GO

ALTER TABLE [edfixcrdc].[ClassGroupMeetingTime] WITH CHECK ADD CONSTRAINT [FK_ClassGroupMeetingTime_ClassGroup] FOREIGN KEY ([ClassGroupName], [CommunityProviderId], [CommunityProviderLocationId], [SpecialNeedsProvidedIndicator])
REFERENCES [edfixcrdc].[ClassGroup] ([ClassGroupName], [CommunityProviderId], [CommunityProviderLocationId], [SpecialNeedsProvidedIndicator])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ClassGroupMeetingTime_ClassGroup]
ON [edfixcrdc].[ClassGroupMeetingTime] ([ClassGroupName] ASC, [CommunityProviderId] ASC, [CommunityProviderLocationId] ASC, [SpecialNeedsProvidedIndicator] ASC)
GO

ALTER TABLE [edfixcrdc].[ClassGroupMeetingTime] WITH CHECK ADD CONSTRAINT [FK_ClassGroupMeetingTime_MeetingDayDescriptor] FOREIGN KEY ([MeetingDayDescriptorId])
REFERENCES [edfixcrdc].[MeetingDayDescriptor] ([MeetingDayDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ClassGroupMeetingTime_MeetingDayDescriptor]
ON [edfixcrdc].[ClassGroupMeetingTime] ([MeetingDayDescriptorId] ASC)
GO

ALTER TABLE [edfixcrdc].[CommunityProviderLocation] WITH CHECK ADD CONSTRAINT [FK_CommunityProviderLocation_AddressTypeDescriptor] FOREIGN KEY ([AddressTypeDescriptorId])
REFERENCES [edfi].[AddressTypeDescriptor] ([AddressTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CommunityProviderLocation_AddressTypeDescriptor]
ON [edfixcrdc].[CommunityProviderLocation] ([AddressTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixcrdc].[CommunityProviderLocation] WITH CHECK ADD CONSTRAINT [FK_CommunityProviderLocation_CommunityProvider] FOREIGN KEY ([CommunityProviderId])
REFERENCES [edfi].[CommunityProvider] ([CommunityProviderId])
GO

CREATE NONCLUSTERED INDEX [FK_CommunityProviderLocation_CommunityProvider]
ON [edfixcrdc].[CommunityProviderLocation] ([CommunityProviderId] ASC)
GO

ALTER TABLE [edfixcrdc].[CommunityProviderLocation] WITH CHECK ADD CONSTRAINT [FK_CommunityProviderLocation_StateAbbreviationDescriptor] FOREIGN KEY ([StateAbbreviationDescriptorId])
REFERENCES [edfi].[StateAbbreviationDescriptor] ([StateAbbreviationDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CommunityProviderLocation_StateAbbreviationDescriptor]
ON [edfixcrdc].[CommunityProviderLocation] ([StateAbbreviationDescriptorId] ASC)
GO

ALTER TABLE [edfixcrdc].[CommunityProviderLocationInstructionalCalendar] WITH CHECK ADD CONSTRAINT [FK_CommunityProviderLocationInstructionalCalendar_CommunityProviderLocation] FOREIGN KEY ([CommunityProviderId], [CommunityProviderLocationId])
REFERENCES [edfixcrdc].[CommunityProviderLocation] ([CommunityProviderId], [CommunityProviderLocationId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixcrdc].[CommunityProviderLocationInstructionalCalendar] WITH CHECK ADD CONSTRAINT [FK_CommunityProviderLocationInstructionalCalendar_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_CommunityProviderLocationInstructionalCalendar_SchoolYearType]
ON [edfixcrdc].[CommunityProviderLocationInstructionalCalendar] ([SchoolYear] ASC)
GO

ALTER TABLE [edfixcrdc].[MeetingDayDescriptor] WITH CHECK ADD CONSTRAINT [FK_MeetingDayDescriptor_Descriptor] FOREIGN KEY ([MeetingDayDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixcrdc].[ProgramCostDescriptor] WITH CHECK ADD CONSTRAINT [FK_ProgramCostDescriptor_Descriptor] FOREIGN KEY ([ProgramCostDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixcrdc].[ProgramExtension] WITH CHECK ADD CONSTRAINT [FK_ProgramExtension_Program] FOREIGN KEY ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixcrdc].[ProgramExtension] WITH CHECK ADD CONSTRAINT [FK_ProgramExtension_ProgramCostDescriptor] FOREIGN KEY ([ProgramCostDescriptorId])
REFERENCES [edfixcrdc].[ProgramCostDescriptor] ([ProgramCostDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProgramExtension_ProgramCostDescriptor]
ON [edfixcrdc].[ProgramExtension] ([ProgramCostDescriptorId] ASC)
GO

ALTER TABLE [edfixcrdc].[RestraintCategoryDescriptor] WITH CHECK ADD CONSTRAINT [FK_RestraintCategoryDescriptor_Descriptor] FOREIGN KEY ([RestraintCategoryDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixcrdc].[RestraintEventRestraintCategory] WITH CHECK ADD CONSTRAINT [FK_RestraintEventRestraintCategory_RestraintCategoryDescriptor] FOREIGN KEY ([RestraintCategoryDescriptorId])
REFERENCES [edfixcrdc].[RestraintCategoryDescriptor] ([RestraintCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_RestraintEventRestraintCategory_RestraintCategoryDescriptor]
ON [edfixcrdc].[RestraintEventRestraintCategory] ([RestraintCategoryDescriptorId] ASC)
GO

ALTER TABLE [edfixcrdc].[RestraintEventRestraintCategory] WITH CHECK ADD CONSTRAINT [FK_RestraintEventRestraintCategory_RestraintEvent] FOREIGN KEY ([RestraintEventIdentifier], [SchoolId], [StudentUSI])
REFERENCES [edfi].[RestraintEvent] ([RestraintEventIdentifier], [SchoolId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_RestraintEventRestraintCategory_RestraintEvent]
ON [edfixcrdc].[RestraintEventRestraintCategory] ([RestraintEventIdentifier] ASC, [SchoolId] ASC, [StudentUSI] ASC)
GO

ALTER TABLE [edfixcrdc].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_AlternativeStatusDescriptor] FOREIGN KEY ([AlternativeStatusDescriptorId])
REFERENCES [edfixcrdc].[AlternativeStatusDescriptor] ([AlternativeStatusDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SchoolExtension_AlternativeStatusDescriptor]
ON [edfixcrdc].[SchoolExtension] ([AlternativeStatusDescriptorId] ASC)
GO

ALTER TABLE [edfixcrdc].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixcrdc].[SchoolExtension] WITH CHECK ADD CONSTRAINT [FK_SchoolExtension_UngradedDetailDescriptor] FOREIGN KEY ([UngradedDetailDescriptorId])
REFERENCES [edfixcrdc].[UngradedDetailDescriptor] ([UngradedDetailDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_SchoolExtension_UngradedDetailDescriptor]
ON [edfixcrdc].[SchoolExtension] ([UngradedDetailDescriptorId] ASC)
GO

ALTER TABLE [edfixcrdc].[SchoolTechnology] WITH CHECK ADD CONSTRAINT [FK_SchoolTechnology_School] FOREIGN KEY ([SchoolId])
REFERENCES [edfi].[School] ([SchoolId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixcrdc].[StudentClassGroupAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentClassGroupAssociation_ClassGroup] FOREIGN KEY ([ClassGroupName], [CommunityProviderId], [CommunityProviderLocationId], [SpecialNeedsProvidedIndicator])
REFERENCES [edfixcrdc].[ClassGroup] ([ClassGroupName], [CommunityProviderId], [CommunityProviderLocationId], [SpecialNeedsProvidedIndicator])
GO

CREATE NONCLUSTERED INDEX [FK_StudentClassGroupAssociation_ClassGroup]
ON [edfixcrdc].[StudentClassGroupAssociation] ([ClassGroupName] ASC, [CommunityProviderId] ASC, [CommunityProviderLocationId] ASC, [SpecialNeedsProvidedIndicator] ASC)
GO

ALTER TABLE [edfixcrdc].[StudentClassGroupAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentClassGroupAssociation_ReasonExitedDescriptor] FOREIGN KEY ([ReasonExitedDescriptorId])
REFERENCES [edfi].[ReasonExitedDescriptor] ([ReasonExitedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentClassGroupAssociation_ReasonExitedDescriptor]
ON [edfixcrdc].[StudentClassGroupAssociation] ([ReasonExitedDescriptorId] ASC)
GO

ALTER TABLE [edfixcrdc].[StudentClassGroupAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentClassGroupAssociation_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentClassGroupAssociation_Student]
ON [edfixcrdc].[StudentClassGroupAssociation] ([StudentUSI] ASC)
GO

ALTER TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentCommunityProviderLocationAssociation_CommunityProviderLocation] FOREIGN KEY ([CommunityProviderId], [CommunityProviderLocationId])
REFERENCES [edfixcrdc].[CommunityProviderLocation] ([CommunityProviderId], [CommunityProviderLocationId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCommunityProviderLocationAssociation_CommunityProviderLocation]
ON [edfixcrdc].[StudentCommunityProviderLocationAssociation] ([CommunityProviderId] ASC, [CommunityProviderLocationId] ASC)
GO

ALTER TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentCommunityProviderLocationAssociation_ReasonExitedDescriptor] FOREIGN KEY ([ReasonExitedDescriptorId])
REFERENCES [edfi].[ReasonExitedDescriptor] ([ReasonExitedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCommunityProviderLocationAssociation_ReasonExitedDescriptor]
ON [edfixcrdc].[StudentCommunityProviderLocationAssociation] ([ReasonExitedDescriptorId] ASC)
GO

ALTER TABLE [edfixcrdc].[StudentCommunityProviderLocationAssociation] WITH CHECK ADD CONSTRAINT [FK_StudentCommunityProviderLocationAssociation_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentCommunityProviderLocationAssociation_Student]
ON [edfixcrdc].[StudentCommunityProviderLocationAssociation] ([StudentUSI] ASC)
GO

ALTER TABLE [edfixcrdc].[UngradedDetailDescriptor] WITH CHECK ADD CONSTRAINT [FK_UngradedDetailDescriptor_Descriptor] FOREIGN KEY ([UngradedDetailDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

