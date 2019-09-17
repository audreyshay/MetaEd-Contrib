CREATE TYPE [process].[StudentEducationOrganizationErrorLogTableType] AS TABLE(
	[ExecutionId] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[LogDateTime] [datetime] NOT NULL,
	[Message] [nvarchar](2000) NOT NULL
)