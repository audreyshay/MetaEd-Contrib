CREATE TABLE [entity].[Program] (
    [FiscalYear]              INT           NOT NULL,
    [EducationOrganizationId] INT           NOT NULL,
    [ProgramTypeId]           INT           NOT NULL,
    [ProgramName]             NVARCHAR (60) NOT NULL,
	[IsApproved]			  bit			NOT NULL DEFAULT ((0)),
	[ApprovedLastModfiedDate] datetime		NULL,
    CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [EducationOrganizationId] ASC, [ProgramTypeId] ASC, [ProgramName] ASC),
    CONSTRAINT [FK_Program_EducationOrganization] FOREIGN KEY ([EducationOrganizationId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]),
    CONSTRAINT [FK_Program_ProgramType] FOREIGN KEY ([ProgramTypeId]) REFERENCES [entity].[ProgramType] ([ProgramTypeId])
);

