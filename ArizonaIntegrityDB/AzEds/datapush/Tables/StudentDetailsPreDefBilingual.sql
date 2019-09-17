CREATE TABLE [datapush].[StudentDetailsPreDefBilingual]
(
	[ID] INT NOT NULL,
	[PreDefBilingualID] INT NOT NULL,
	[XSDID] [varchar](50) NULL,
    CONSTRAINT [PK_StudentDetailsPreDefBilingual] PRIMARY KEY CLUSTERED ([ID] ASC,[PreDefBilingualID] ASC)
)