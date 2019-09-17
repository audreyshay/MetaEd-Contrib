CREATE TABLE [Staging].[CalendarDate]
(
	[EducationOrganizationId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_CalendarDate] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC,	[FiscalYear] ASC, [Date] ASC)
) 