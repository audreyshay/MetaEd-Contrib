CREATE TABLE [Staging].[CalendarDateTrackEvent]
(
	[EducationOrganizationId] [int] NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[TrackEventTypeId] [int] NOT NULL,
	[TrackNumber] [int] NOT NULL,
	[TrackLocalEducationAgencyId] [int] NOT NULL,
	[EventDuration] [decimal](3, 2) NOT NULL,
 CONSTRAINT [PK_CalendarDateCalendarEvent] PRIMARY KEY CLUSTERED ([EducationOrganizationId] ASC,[FiscalYear] ASC,[Date] ASC,[TrackEventTypeId] ASC,[TrackNumber] ASC,[TrackLocalEducationAgencyId] ASC)
)