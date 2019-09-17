/****** Object:  UserDefinedTableType [integrity].[IntegrityHistoryDataXMLTableType]    Script Date: 3/16/2016 4:15:51 PM ******/
CREATE TYPE [integrity].[IntegrityHistoryDataXMLTableType] AS TABLE(
	[DataXml] [nvarchar](max) NOT NULL,
	[IntegrityHistoryId] [bigint] NOT NULL,
	[FiscalYear] [int] NULL
)
GO
