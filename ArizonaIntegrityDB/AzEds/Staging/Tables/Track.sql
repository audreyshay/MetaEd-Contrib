CREATE TABLE [Staging].[Track]
(
	[EducationOrganizationId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[TrackNumber] [int] NOT NULL,
	[TrackLocalEducationAgencyId] [int] NOT NULL,
	[TrackName] [nvarchar](60) NULL,
	[BeginDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[TotalInstructionalDays] [int] NOT NULL,
	[NumberOfSessionDaysInWeek] [int] NOT NULL DEFAULT ((5)),
	[IsActive] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC,[FiscalYear] ASC,[TrackNumber] ASC,[TrackLocalEducationAgencyId] ASC)
)