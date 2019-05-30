ALTER TABLE [crisis].[CrisisDetails] WITH CHECK ADD CONSTRAINT [FK_CrisisDetails_CrisisEventDescriptor] FOREIGN KEY ([CrisisEventDescriptorId])
REFERENCES [crisis].[CrisisEventDescriptor] ([CrisisEventDescriptorId])
GO

ALTER TABLE [crisis].[CrisisDetails] WITH CHECK ADD CONSTRAINT [FK_CrisisDetails_CrisisTypeDescriptor] FOREIGN KEY ([CrisisTypeDescriptorId])
REFERENCES [crisis].[CrisisTypeDescriptor] ([CrisisTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CrisisDetails_CrisisTypeDescriptor]
ON [crisis].[CrisisDetails] ([CrisisTypeDescriptorId] ASC)
GO

ALTER TABLE [crisis].[CrisisEventDescriptor] WITH CHECK ADD CONSTRAINT [FK_CrisisEventDescriptor_Descriptor] FOREIGN KEY ([CrisisEventDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [crisis].[CrisisTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_CrisisTypeDescriptor_Descriptor] FOREIGN KEY ([CrisisTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [crisis].[StudentEducationOrganizationAssociationStudentCrisisEvent] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_CrisisEventDescriptor] FOREIGN KEY ([CrisisEventDescriptorId])
REFERENCES [crisis].[CrisisEventDescriptor] ([CrisisEventDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_CrisisEventDescriptor]
ON [crisis].[StudentEducationOrganizationAssociationStudentCrisisEvent] ([CrisisEventDescriptorId] ASC)
GO

ALTER TABLE [crisis].[StudentEducationOrganizationAssociationStudentCrisisEvent] WITH CHECK ADD CONSTRAINT [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_StudentEducationOrganizationAssociation] FOREIGN KEY ([EducationOrganizationId], [StudentUSI])
REFERENCES [edfi].[StudentEducationOrganizationAssociation] ([EducationOrganizationId], [StudentUSI])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentEducationOrganizationAssociationStudentCrisisEvent_StudentEducationOrganizationAssociation]
ON [crisis].[StudentEducationOrganizationAssociationStudentCrisisEvent] ([EducationOrganizationId] ASC, [StudentUSI] ASC)
GO

