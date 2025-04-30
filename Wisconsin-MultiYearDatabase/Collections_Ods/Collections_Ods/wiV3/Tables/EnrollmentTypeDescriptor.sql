CREATE TABLE [wiV3].[EnrollmentTypeDescriptor](
	[EnrollmentTypeDescriptorId] [int] NOT NULL,
 CONSTRAINT [EnrollmentTypeDescriptor_PK] PRIMARY KEY CLUSTERED 
(
	[EnrollmentTypeDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [wiV3].[EnrollmentTypeDescriptor]  WITH CHECK ADD  CONSTRAINT [FK_EnrollmentTypeDescriptor_Descriptor] FOREIGN KEY([EnrollmentTypeDescriptorId])
REFERENCES [edfiV3].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [wiV3].[EnrollmentTypeDescriptor] CHECK CONSTRAINT [FK_EnrollmentTypeDescriptor_Descriptor]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'wiV3', @level1type=N'TABLE',@level1name=N'EnrollmentTypeDescriptor', @level2type=N'COLUMN',@level2name=N'EnrollmentTypeDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The enrollment type.' , @level0type=N'SCHEMA',@level0name=N'wiV3', @level1type=N'TABLE',@level1name=N'EnrollmentTypeDescriptor'
GO
