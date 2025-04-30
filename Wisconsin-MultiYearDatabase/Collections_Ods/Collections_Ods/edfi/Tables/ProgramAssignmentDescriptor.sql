CREATE TABLE [edfi].[ProgramAssignmentDescriptor](
	[ProgramAssignmentDescriptorId] [int] NOT NULL,
	[ProgramAssignmentTypeId] [int] NULL,
 CONSTRAINT [PK_ProgramAssignmentDescriptor] PRIMARY KEY CLUSTERED 
(
	[ProgramAssignmentDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[ProgramAssignmentDescriptor]  ADD CONSTRAINT [FK_ProgramAssignmentDescriptor_Descriptor_DescriptorId] FOREIGN KEY([ProgramAssignmentDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfi].[ProgramAssignmentDescriptor]  ADD CONSTRAINT [FK_ProgramAssignmentDescriptor_ProgramAssignmentType_ProgramAssignmentTypeId] FOREIGN KEY([ProgramAssignmentTypeId])
REFERENCES [edfi].[ProgramAssignmentType] ([ProgramAssignmentTypeId])
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'ProgramAssignmentDescriptor', @level2type=N'COLUMN',@level2name=N'ProgramAssignmentDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for ProgramAssignment' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'ProgramAssignmentDescriptor', @level2type=N'COLUMN',@level2name=N'ProgramAssignmentTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the name of the education program for which a teacher is assigned to a school.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'ProgramAssignmentDescriptor'
GO


