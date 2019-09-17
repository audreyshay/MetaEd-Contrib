CREATE TABLE [entity].[ProgramService](
	[FiscalYear] [int] NOT NULL,
	[EducationOrganizationId] [int] NOT NULL,
	[ProgramTypeId] [int] NOT NULL,
	[ServiceDescriptorId] [int] NOT NULL,
	[ProgramName] [nvarchar](60) NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [ProgramService_DF_CreateDate]  DEFAULT (getdate()),
	CONSTRAINT [PK_ProgramService] PRIMARY KEY CLUSTERED (	[FiscalYear] ASC,	[EducationOrganizationId] ASC,	[ProgramTypeId] ASC,	[ServiceDescriptorId] ASC,	[ProgramName] ASC)
	);