 CREATE TABLE [leadata].[StudentCharacteristicPeriod]
  ( 
	[BeginDate] [date] NOT NULL,
	[EducationOrganizationid] [int] CONSTRAINT [StudentCharacteristicPeriod_DF_EducationOrganizationid] DEFAULT 79275 NOT NULL,
	[StudentCharacteristicDescriptorId] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[EndDate] [date] NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[SourceLastModifiedDate] [datetime] CONSTRAINT [StudentCharacteristicPeriod_DF_SourceLastModifiedDate]  DEFAULT (getutcdate()) NOT NULL,
	[LoadDate] [datetime]  CONSTRAINT [StudentCharacteristicPeriod_DF_LoadDate]  DEFAULT (getutcdate()) NOT NULL,
	[HashValue]	[binary](64) CONSTRAINT [StudentCharacteristicPeriod_DF_HashValue] DEFAULT (00) NOT NULL,
	CONSTRAINT [StudentCharacteristicPeriod_PK] PRIMARY KEY CLUSTERED 
	(
		[BeginDate] ASC,
		[EducationOrganizationId] ASC,
		[StudentCharacteristicDescriptorId] ASC,
		[StudentUSI] ASC
	)
) 
GO

ALTER TABLE [leadata].[StudentCharacteristicPeriod]  WITH CHECK ADD  CONSTRAINT [FK_StudentCharacteristicPeriod_StudentCharacteristic] FOREIGN KEY([StudentUSI], [StudentCharacteristicDescriptorId],[EducationOrganizationId] )
REFERENCES [leadata].[StudentCharacteristic] ([StudentUSI], [StudentCharacteristicDescriptorId],[EducationOrganizationId])
GO

ALTER TABLE [leadata].[StudentCharacteristicPeriod] CHECK CONSTRAINT [FK_StudentCharacteristicPeriod_StudentCharacteristic]
GO
