CREATE TABLE [datapush].[StudentDetailsGradeLevelType]
(
	[ID] INT NOT NULL,
	[GradeLevelTypeId] INT NOT NULL,
	[XSDID] [varchar](50) NULL,
    CONSTRAINT [PK_StudentDetailsGradeLevelType] PRIMARY KEY CLUSTERED ([ID] ASC,[GradeLevelTypeId] ASC)
)