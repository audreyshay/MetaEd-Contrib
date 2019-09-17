CREATE TABLE [process].[DataLoadType]
(
    [DataLoadTypeId] INT NOT NULL, 
    [Description]     NVARCHAR (1024) NOT NULL,
	CONSTRAINT [PK_DataLoadType] PRIMARY KEY CLUSTERED ([DataLoadTypeId] ASC)
)