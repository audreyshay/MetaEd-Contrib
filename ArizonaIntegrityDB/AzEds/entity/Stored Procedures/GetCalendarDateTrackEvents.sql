/************************************************************
**Author: Chris Mullert
**
**Description:  Gets the CalendarDates and events by EducationOrganizationId and fiscal year
**				Used by ACE Calc Engine ONLY
**	
**Revision History:
**	Who			When		What
**	CM		09/10/2018	Initial Creation
**  CM		04/03/2019  Adding calendarCode
***************************************************************/
CREATE PROC [entity].[GetCalendarDateTrackEvents] 
AS
BEGIN
	SELECT 
		  ce.[EducationOrganizationId]
		, ce.[FiscalYear]
		, ce.[Date]
		, CASE tet.IsInstructional
			WHEN 1 THEN 1 
			ELSE 3
		  END AS CalendarEventTypeId  -- transistion to TrackEventTypeId when more time.
		, ce.TrackLocalEducationAgencyId
		--, ce.[TrackNumber]
		, CASE ce.TrackNumber
			WHEN -2 THEN ce.CalendarCode
			ELSE CAST(ce.TrackNumber AS nvarchar(60))
		  END AS CalendarCode
	FROM 
		entity.[CalendarDateTrackEvent] ce
			JOIN config.FiscalYear fy ON ce.FiscalYear = fy.FiscalYear AND fy.IsActive = 1
			JOIN entity.TrackEventType tet ON ce.TrackEventTypeId = tet.TrackEventTypeId
			JOIN entity.TrackStatus ts on ts.FiscalYear = ce.FiscalYear 
				AND IsCertified = 1 
				AND IsValid = 1 
				AND IsADEApproved = 1 
				AND ts.EducationOrganizationId = ce.EducationOrganizationId
				AND ts.TrackNumber = ce.TrackNumber
				AND ts.CalendarCode = ce.CalendarCode
				AND ts.TrackLocalEducationAgencyId = ce.TrackLocalEducationAgencyId
		WHERE ce.FiscalYear >= 2019
UNION ALL
	SELECT 
		  ce.[EducationOrganizationId]
		, ce.[FiscalYear]
		, ce.[Date]
		, CASE tet.IsInstructional
			WHEN 1 THEN 1 
			ELSE 3
		  END AS CalendarEventTypeId  -- transistion to TrackEventTypeId when more time.
		, ce.TrackLocalEducationAgencyId
		--, ce.[TrackNumber]
		, CASE ce.TrackNumber
			WHEN -2 THEN ce.CalendarCode
			ELSE CAST(ce.TrackNumber AS nvarchar(60))
		  END AS CalendarCode
	FROM 
		entity.[CalendarDateTrackEvent] ce
			JOIN config.FiscalYear fy ON ce.FiscalYear = fy.FiscalYear AND fy.IsActive = 1
			JOIN entity.TrackEventType tet ON ce.TrackEventTypeId = tet.TrackEventTypeId
		WHERE ce.FiscalYear < 2019

	order by date
END
GO

