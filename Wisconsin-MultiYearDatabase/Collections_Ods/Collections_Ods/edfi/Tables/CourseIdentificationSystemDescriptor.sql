CREATE TABLE [edfi].[CourseIdentificationSystemDescriptor](
	[CourseIdentificationSystemTypeId] [int] NULL,
	[CourseIdentificationSystemDescriptorId] [int] NOT NULL,
 CONSTRAINT [PK_CourseIdentificaitonSystemDescriptor] PRIMARY KEY CLUSTERED 
(
	[CourseIdentificationSystemDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[CourseIdentificationSystemDescriptor] ADD CONSTRAINT [FK_CourseIdentificationDescriptor_Descriptor] FOREIGN KEY([CourseIdentificationSystemDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
GO

ALTER TABLE [edfi].[CourseIdentificationSystemDescriptor] ADD CONSTRAINT [FK_CourseIdentificationSystemDescriptor_CourseIdentificationSystemType] FOREIGN KEY([CourseIdentificationSystemTypeId])
REFERENCES [edfi].[CourseIdentificationSystemType] ([CourseIdentificationSystemTypeId])
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for CourseCodeSystem' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseIdentificationSystemDescriptor', @level2type=N'COLUMN',@level2name=N'CourseIdentificationSystemTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseIdentificationSystemDescriptor', @level2type=N'COLUMN',@level2name=N'CourseIdentificationSystemDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines a standard code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseIdentificationSystemDescriptor'
GO



