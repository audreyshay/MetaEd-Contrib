CREATE TABLE [edfi].[ClassroomPositionDescriptor](
	[ClassroomPositionDescriptorId] [int] NOT NULL,
	[ClassroomPositionTypeId] [int] NULL,
 CONSTRAINT [PK_ClassroomPositionDescriptor] PRIMARY KEY CLUSTERED 
(
	[ClassroomPositionDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[ClassroomPositionDescriptor] ADD CONSTRAINT [FK_ClassroomPositionDescriptor_ClassroomPositionType_ClassroomPositionTypeId] FOREIGN KEY([ClassroomPositionTypeId])
REFERENCES [edfi].[ClassroomPositionType] ([ClassroomPositionTypeId])
GO

ALTER TABLE [edfi].[ClassroomPositionDescriptor] ADD CONSTRAINT [FK_ClassroomPositionDescriptor_Descriptor_DescriptorId] FOREIGN KEY([ClassroomPositionDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'ClassroomPositionDescriptor', @level2type=N'COLUMN',@level2name=N'ClassroomPositionDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for ClassroomPosition' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'ClassroomPositionDescriptor', @level2type=N'COLUMN',@level2name=N'ClassroomPositionTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the type of position the staff member holds in a specific class/section.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'ClassroomPositionDescriptor'
GO

