CREATE TABLE [leadata].[StudentCharacteristic]
(
	[StudentUSI] [int] NOT NULL,
	[StudentCharacteristicDescriptorId] [int] NOT NULL,
	[EducationOrganizationid] [int] CONSTRAINT [StudentCharacteristic_DF_EducationOrganizationid] DEFAULT 79275 NOT NULL,
	[DesignatedBy] [nvarchar](60) NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifieddate] [datetime] NOT NULL CONSTRAINT [StudentCharacteristic_DF_SourceLastModifieddate]  DEFAULT (getutcdate()),
	[LoadDate] [datetime] NOT NULL CONSTRAINT [StudentCharacteristic_DF_LoadDate]  DEFAULT (getutcdate()),
	[HashValue]	[binary](64)	  CONSTRAINT [StudentCharacteristic_DF_HashValue] DEFAULT (00) NOT NULL,
 CONSTRAINT [PK_StudentCharacteristic] PRIMARY KEY CLUSTERED 
(
	[StudentUSI] ASC,
	[StudentCharacteristicDescriptorId] ASC,
	[EducationOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[StudentCharacteristic]  WITH CHECK ADD  CONSTRAINT [FK_StudentCharacteristic_Student_StudentUSI] FOREIGN KEY([StudentUSI])
REFERENCES [leadata].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentCharacteristic] CHECK CONSTRAINT [FK_StudentCharacteristic_Student_StudentUSI]
GO

ALTER TABLE [leadata].[StudentCharacteristic]  WITH CHECK ADD  CONSTRAINT [FK_StudentCharacteristic_StudentCharacteristicDescriptor_StudentCharacteristicDescriptorId] FOREIGN KEY([StudentCharacteristicDescriptorId])
REFERENCES [leadata].[StudentCharacteristicDescriptor] ([StudentCharacteristicDescriptorId])
GO

ALTER TABLE [leadata].[StudentCharacteristic] CHECK CONSTRAINT [FK_StudentCharacteristic_StudentCharacteristicDescriptor_StudentCharacteristicDescriptorId]
GO

--ALTER TABLE [leadata].[StudentCharacteristic]  WITH CHECK ADD  CONSTRAINT [FK_StudentCharacteristic_EducationOrganization] FOREIGN KEY([EducationOrganizationId])
--REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId])
--ON DELETE CASCADE
--GO

--ALTER TABLE [leadata].[StudentCharacteristic] CHECK CONSTRAINT [FK_StudentCharacteristic_EducationOrganization]
--GO

