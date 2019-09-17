CREATE TABLE [integrity].[IntegrityResultType]
(
	[IntegrityResultTypeId] INT IDENTITY (1, 1) NOT NULL, 
    [Description] NVARCHAR(1024) NOT NULL,
	CONSTRAINT [PK_IntegrityResultType] PRIMARY KEY CLUSTERED ([IntegrityResultTypeId] ASC),
)
