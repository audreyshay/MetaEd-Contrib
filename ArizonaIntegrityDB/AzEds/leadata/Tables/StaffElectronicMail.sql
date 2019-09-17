CREATE TABLE [leadata].[StaffElectronicMail](
	[ElectronicMailTypeDescriptorId] [int] NOT NULL,
	[StaffUSI] [int] NOT NULL,
	[ElectronicMailAddress] [nvarchar](128) NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
	[HashValue] [binary](64) NOT NULL,
 CONSTRAINT [StaffElectronicMail_PK] PRIMARY KEY CLUSTERED 
(
	[ElectronicMailTypeDescriptorId] ASC,
	[StaffUSI] ASC
)
) ON [PRIMARY]
GO

ALTER TABLE [leadata].[StaffElectronicMail]  WITH CHECK ADD  CONSTRAINT [FK_StaffElectronicMail_Staff] FOREIGN KEY([StaffUSI])
REFERENCES [leadata].[Staff] ([StaffUSI])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StaffElectronicMail] CHECK CONSTRAINT [FK_StaffElectronicMail_Staff]
GO

ALTER TABLE [leadata].[StaffElectronicMail] ADD  CONSTRAINT [StaffElectronicMail_DF_LoadDate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[StaffElectronicMail] ADD  CONSTRAINT [StaffElectronicMail_DF_HashValue]  DEFAULT ((0)) FOR [HashValue]
GO
