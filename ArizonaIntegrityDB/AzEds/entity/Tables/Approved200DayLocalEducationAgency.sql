CREATE TABLE [entity].[Approved200DayLocalEducationAgency]
(
	[LocalEducationAgencyId]             INT NOT NULL,
    [FiscalYear]                         INT NOT NULL,
	CONSTRAINT [PK_Approved200DayLocalEducationAgency] PRIMARY KEY CLUSTERED ([LocalEducationAgencyId] ASC, [FiscalYear] ASC)
)
