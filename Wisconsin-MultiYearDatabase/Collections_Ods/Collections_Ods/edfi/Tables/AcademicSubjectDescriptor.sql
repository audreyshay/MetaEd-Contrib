CREATE TABLE [edfi].[AcademicSubjectDescriptor](
	[AcademicSubjectDescriptorId] [int] NOT NULL,
	[AcademicSubjectTypeId] [int] NOT NULL,
 CONSTRAINT [PK_AcademicSubjectDescriptor] PRIMARY KEY CLUSTERED 
(
	[AcademicSubjectDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[AcademicSubjectDescriptor] ADD CONSTRAINT [FK_AcademicSubjectDescriptor_AcademicSubjectType_AcademicSubjectTypeId] FOREIGN KEY([AcademicSubjectTypeId])
REFERENCES [edfi].[AcademicSubjectType] ([AcademicSubjectTypeId])
GO

ALTER TABLE [edfi].[AcademicSubjectDescriptor] ADD CONSTRAINT [FK_AcademicSubjectDescriptor_Descriptor_DescriptorId] FOREIGN KEY([AcademicSubjectDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'AcademicSubjectDescriptor', @level2type=N'COLUMN',@level2name=N'AcademicSubjectDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for AcademicSubject' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'AcademicSubjectDescriptor', @level2type=N'COLUMN',@level2name=N'AcademicSubjectTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor holds the description of the content or subject area (e.g., arts, mathematics, reading, stenography, or a foreign language).' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'AcademicSubjectDescriptor'
GO



