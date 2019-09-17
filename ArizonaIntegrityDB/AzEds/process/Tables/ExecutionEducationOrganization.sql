CREATE TABLE [process].[ExecutionEducationOrganization] (
    [ExecutionId]             INT NOT NULL,
    [EducationOrganizationId] INT NOT NULL,
    [FiscalYear]              INT NOT NULL,
    CONSTRAINT [PK_ExecutionEducationOrganization] PRIMARY KEY CLUSTERED ([ExecutionId] ASC, [EducationOrganizationId] ASC, [FiscalYear] ASC),
    CONSTRAINT [FK_ExecutionEducationOrganization_EducationOrganization] FOREIGN KEY ([EducationOrganizationId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear]),
    CONSTRAINT [FK_ExecutionEducationOrganization_Execution] FOREIGN KEY ([ExecutionId]) REFERENCES [process].[Execution] ([ExecutionId])
);




GO



GO


