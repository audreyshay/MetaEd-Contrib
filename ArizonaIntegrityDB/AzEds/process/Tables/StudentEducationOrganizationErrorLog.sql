

CREATE TABLE [process].[StudentEducationOrganizationErrorLog](
	[StudentEducationOrganizationErrorLogId] [int] IDENTITY(1,1) NOT NULL,
	[ExecutionId] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[LogDateTime] [datetime] NOT NULL,
	[Message] [nvarchar](2000) NOT NULL,
	CONSTRAINT [PK_StudentEducationOrganizationErrorLog] PRIMARY KEY CLUSTERED 
	(
		[StudentEducationOrganizationErrorLogId] ASC
	), 
	CONSTRAINT [FK_PK_StudentEducationOrganizationErrorLog_EducationOrganization] FOREIGN KEY([EducationOrganizationId], [FiscalYear])
		REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]),
	CONSTRAINT [FK_PK_StudentEducationOrganizationErrorLog_Student] FOREIGN KEY([StudentUSI])
		REFERENCES [leadata].[Student] ([StudentUSI]),
	CONSTRAINT [FK_StudentEducationOrganizationErrorLog_Execution] FOREIGN KEY([ExecutionId])
		REFERENCES [process].[Execution] ([ExecutionId])		
); 

GO
