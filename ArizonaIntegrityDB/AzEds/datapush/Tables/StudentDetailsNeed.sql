CREATE TABLE [datapush].[StudentDetailsNeed](
	[ID] [int] NOT NULL,
	[NeedId] [int] NOT NULL,
	[XSDID] [varchar](50) NULL,
	CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED ([ID] ASC),
	CONSTRAINT [FK_StudentDetailsNeed_ID] FOREIGN KEY([ID]) REFERENCES leadata.StudentNeedDescriptor ([StudentNeedDescriptorId])
) 