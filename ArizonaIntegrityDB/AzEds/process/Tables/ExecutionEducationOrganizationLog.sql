
CREATE TABLE [process].[ExecutionEducationOrganizationLog](
	[ExecutionId] [int] NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[RecordCountTypeId] [int] NOT NULL,
	[RecordCount] [int] NULL,
	 CONSTRAINT [PK_ExecutionEducationOrganizationLog] PRIMARY KEY CLUSTERED 
	(
		[ExecutionId] ASC,
		[EducationOrganizationId] ASC,
		[FiscalYear] ASC,
		[RecordCountTypeId] ASC
	),
	CONSTRAINT [FK_ExecutionEducationOrganizationLog_EducationOrganization] FOREIGN KEY([EducationOrganizationId], [FiscalYear])
		REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]),
	CONSTRAINT [FK_ExecutionEducationOrganizationLog_Execution] FOREIGN KEY([ExecutionId])
		REFERENCES [process].[Execution] ([ExecutionId]),
	CONSTRAINT [FK_ExecutionEducationOrganizationLog_RecordCountType] FOREIGN KEY([RecordCountTypeId])
		REFERENCES [process].[RecordCountType] ([RecordCountTypeId])
);

GO
