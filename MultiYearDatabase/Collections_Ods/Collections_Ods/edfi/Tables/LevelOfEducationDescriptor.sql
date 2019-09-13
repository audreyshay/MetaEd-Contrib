CREATE TABLE [edfi].[LevelOfEducationDescriptor](
	[LevelOfEducationDescriptorId] [int] NOT NULL,
	[LevelOfEducationTypeId] [int] NULL,
 CONSTRAINT [PK_LevelOfEducationDescriptor] PRIMARY KEY CLUSTERED 
(
	[LevelOfEducationDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[LevelOfEducationDescriptor] ADD CONSTRAINT [FK_LevelOfEducationDescriptor_Descriptor_DescriptorId] FOREIGN KEY([LevelOfEducationDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfi].[LevelOfEducationDescriptor] ADD CONSTRAINT [FK_LevelOfEducationDescriptor_LevelOfEducationType_LevelOfEducationTypeId] FOREIGN KEY([LevelOfEducationTypeId])
REFERENCES [edfi].[LevelOfEducationType] ([LevelOfEducationTypeId])
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'LevelOfEducationDescriptor', @level2type=N'COLUMN',@level2name=N'LevelOfEducationDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for LevelOfEducation' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'LevelOfEducationDescriptor', @level2type=N'COLUMN',@level2name=N'LevelOfEducationTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the different levels of education achievable.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'LevelOfEducationDescriptor'
GO
