CREATE TABLE [edfi].[StaffIdentificationSystemDescriptor](
	[StaffIdentificationSystemTypeId] [int] NULL,
	[StaffIdentificationSystemDescriptorId] [int] NOT NULL,
 CONSTRAINT [PK_StaffIdentificationSystemDescriptor] PRIMARY KEY CLUSTERED 
(
	[StaffIdentificationSystemDescriptorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[StaffIdentificationSystemDescriptor] ADD CONSTRAINT [FK_StaffIdentificationSystemDescriptor_Descriptor_DescriptorId] FOREIGN KEY([StaffIdentificationSystemDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
GO
ALTER TABLE [edfi].[StaffIdentificationSystemDescriptor] ADD CONSTRAINT [FK_StaffIdentificationSystemDescriptor_StaffIdentificationSystemType_StaffIdentificationSystemTypeId] FOREIGN KEY([StaffIdentificationSystemTypeId])
REFERENCES [edfi].[StaffIdentificationSystemType] ([StaffIdentificationSystemTypeId])
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for StaffIdentificationSystem' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationSystemDescriptor', @level2type=N'COLUMN',@level2name=N'StaffIdentificationSystemTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationSystemDescriptor', @level2type=N'COLUMN',@level2name=N'StaffIdentificationSystemDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This descriptor defines the originating record system and code that is used for record-keeping purposes of the staff.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'StaffIdentificationSystemDescriptor'
GO


