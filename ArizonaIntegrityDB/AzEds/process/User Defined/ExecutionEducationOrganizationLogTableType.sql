
CREATE TYPE [process].[ExecutionEducationOrganizationLogTableType] AS TABLE(
	[ExecutionId] [int] NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[RecordCountTypeId] [int] NULL,
	[RecordCount] [int] NULL
)



