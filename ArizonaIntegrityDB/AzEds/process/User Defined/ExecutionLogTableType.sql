
CREATE TYPE [process].[ExecutionLogTableType] AS TABLE(
	[ExecutionId] [int] NOT NULL,
	[LogDateTime] [datetime] NOT NULL,
	[Message] [nvarchar](1000) NOT NULL
)


