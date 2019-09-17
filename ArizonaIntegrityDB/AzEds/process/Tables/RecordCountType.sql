CREATE TABLE [process].[RecordCountType]
(
	[RecordCountTypeId] INT IDENTITY(1,1) NOT NULL, 
    [Description] NVARCHAR(1024) NOT NULL,
	CONSTRAINT [PK_RecordCountType] PRIMARY KEY CLUSTERED ([RecordCountTypeId] ASC)
)
