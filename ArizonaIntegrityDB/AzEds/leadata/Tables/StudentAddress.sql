CREATE TABLE [leadata].[StudentAddress]
(
	[StudentUSI] [int] NOT NULL,
	[EducationOrganizationid] [int] CONSTRAINT [StudentAddress_DF_EducationOrganizationid] DEFAULT 79275 NOT NULL,
	[AddressTypeId] [int] NOT NULL,
	[StateAbbreviationTypeId] [int] NOT NULL,
	[AddressTypeCodeValue] [nvarchar](50) NOT NULL,
	[AddressTypeDescription] [nvarchar](1024) NOT NULL,
	[StreetNumberName] [nvarchar](150) NULL,
	[ApartmentRoomSuiteNumber] [nvarchar](50) NULL,
	[BuildingSiteNumber] [nvarchar](20) NULL,
	[City] [nvarchar](30) NULL,
	[PostalCode] [nvarchar](17) NOT NULL,
	[NameOfCounty] [nvarchar](30) NULL,
	[CountyFIPSCode] [nvarchar](5) NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL CONSTRAINT [StudentAddress_DF_LoadDate]  DEFAULT (getutcdate()),
	[HashValue]	[binary](64)	  CONSTRAINT [StudentAddress_DF_HashValue] DEFAULT (00) NOT NULL,
 CONSTRAINT [PK_StudentAddress] PRIMARY KEY CLUSTERED 
(
	[StudentUSI] ASC,
	[EducationOrganizationid] ASC,
	[AddressTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[StudentAddress]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentAddress_StateAbbreviationType_StateAbbreviationTypeId] FOREIGN KEY([StateAbbreviationTypeId])
REFERENCES [leadata].[StateAbbreviationType] ([StateAbbreviationTypeId])
GO

ALTER TABLE [leadata].[StudentAddress] CHECK CONSTRAINT [FK_StudentAddress_StateAbbreviationType_StateAbbreviationTypeId]
GO

ALTER TABLE [leadata].[StudentAddress]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentAddress_Student_StudentUSI] FOREIGN KEY([StudentUSI])
REFERENCES [leadata].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentAddress] CHECK CONSTRAINT [FK_StudentAddress_Student_StudentUSI]
GO