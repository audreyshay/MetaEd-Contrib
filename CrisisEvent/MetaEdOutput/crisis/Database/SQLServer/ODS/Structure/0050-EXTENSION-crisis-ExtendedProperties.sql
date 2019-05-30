-- Extended Properties [crisis].[CrisisDetails] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information about the specific crisis that occurred.', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'CrisisDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The specific event that occurred', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'CrisisDetails', @level2type=N'COLUMN', @level2name=N'CrisisEventDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of crisis event that occurred', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'CrisisDetails', @level2type=N'COLUMN', @level2name=N'CrisisTypeDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'First date that the crisis occurred', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'CrisisDetails', @level2type=N'COLUMN', @level2name=N'CrisisStartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Description of the event', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'CrisisDetails', @level2type=N'COLUMN', @level2name=N'CrisisDesription'
GO

-- Extended Properties [crisis].[CrisisEventDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The specific event that occurred.', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'CrisisEventDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'CrisisEventDescriptor', @level2type=N'COLUMN', @level2name=N'CrisisEventDescriptorId'
GO

-- Extended Properties [crisis].[CrisisTypeDescriptor] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The type of crisis event that occurred.', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'CrisisTypeDescriptor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'CrisisTypeDescriptor', @level2type=N'COLUMN', @level2name=N'CrisisTypeDescriptorId'
GO

-- Extended Properties [crisis].[StudentEducationOrganizationAssociationStudentCrisisEvent] --
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Information on the crisis that has affected a student.', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationStudentCrisisEvent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The specific event that affected the student', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationStudentCrisisEvent', @level2type=N'COLUMN', @level2name=N'CrisisEventDescriptorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The identifier assigned to an education organization.', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationStudentCrisisEvent', @level2type=N'COLUMN', @level2name=N'EducationOrganizationId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a student.', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationStudentCrisisEvent', @level2type=N'COLUMN', @level2name=N'StudentUSI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication that the student was displaced from their home due to the crisis. The student may or may not be considered homeless due to the displacement.', @level0type=N'SCHEMA', @level0name=N'crisis', @level1type=N'TABLE', @level1name=N'StudentEducationOrganizationAssociationStudentCrisisEvent', @level2type=N'COLUMN', @level2name=N'DisplacedStudentIndicator'
GO

