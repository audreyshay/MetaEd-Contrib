CREATE TABLE [entity].[CalendarDate] (
    [EducationOrganizationId] INT  NOT NULL,
    [FiscalYear]              INT  NOT NULL,
    [Date]                    DATE NOT NULL,
    CONSTRAINT [PK_CalendarDate] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC, [FiscalYear] ASC, [Date] ASC),
    CONSTRAINT [FK_CalendarDate_EducationOrganization] FOREIGN KEY ([EducationOrganizationId], [FiscalYear]) REFERENCES [entity].[EducationOrganization] ([EducationOrganizationId], [FiscalYear])
);




GO


