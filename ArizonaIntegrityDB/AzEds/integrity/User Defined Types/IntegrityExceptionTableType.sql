CREATE TYPE integrity.IntegrityExceptionTableType AS TABLE(
	IntegrityHistoryId bigint NOT NULL,
	ExceptionMessageCode nvarchar(50) NOT NULL,
	ExceptionSeverityId int NOT NULL,
	[ExceptionDetails] [nvarchar](max),
	[Actual] [nvarchar](max),
	[Expected] [nvarchar](max)
)
GO


