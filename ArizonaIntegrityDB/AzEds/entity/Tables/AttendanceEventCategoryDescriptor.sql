CREATE TABLE [entity].[AttendanceEventCategoryDescriptor](
	[FiscalYear] [int] NOT NULL,
	[AttendanceEventCategoryDescriptorId] [int] NOT NULL,
	[AttendanceEventCategoryTypeId] [int] NOT NULL,
 CONSTRAINT [PK_AttendanceEventCategoryDescriptor] PRIMARY KEY CLUSTERED 
([FiscalYear], [AttendanceEventCategoryDescriptorId])WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [entity].[AttendanceEventCategoryDescriptor]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceEventCategoryDescriptor_AttendanceEventCategoryType_AttendanceEventCategoryTypeId] FOREIGN KEY([FiscalYear],[AttendanceEventCategoryTypeId])
REFERENCES [entity].[AttendanceEventCategoryType] ([FiscalYear], [AttendanceEventCategoryTypeId])
GO

ALTER TABLE [entity].[AttendanceEventCategoryDescriptor] CHECK CONSTRAINT [FK_AttendanceEventCategoryDescriptor_AttendanceEventCategoryType_AttendanceEventCategoryTypeId]
GO

ALTER TABLE [entity].[AttendanceEventCategoryDescriptor]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceEventCategoryDescriptor_Descriptor_DescriptorId] FOREIGN KEY([FiscalYear], [AttendanceEventCategoryDescriptorId])
REFERENCES [leadata].[Descriptor] ([FiscalYear], [DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [entity].[AttendanceEventCategoryDescriptor] CHECK CONSTRAINT [FK_AttendanceEventCategoryDescriptor_Descriptor_DescriptorId]
GO
