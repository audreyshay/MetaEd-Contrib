/************************************************************
**Author: Chris Mullert
**
**Description:  Gets the CalendarDates and events by EducationOrganizationId and fiscal year
**				Used by ACE Calc Engine ONLY
**	
**Revision History:
**	Who			When		What
**	CM		09/10/2018	Initial Creation
***************************************************************/
CREATE PROC [ace].[GetCalendarDateTrackEvents] 
AS
BEGIN
	SELECT 
		  ce.[EducationOrganizationId]
		, ce.[FiscalYear]
		, ce.[Date]
		, CASE tet.IsInstructional
			WHEN 1 THEN 1 -- instructional
			ELSE 3		  -- holiday, non-instructional
		  END AS CalendarEventTypeId  -- transistion to TrackEventTypeId when more time.
		, ce.TrackLocalEducationAgencyId
		, ce.[TrackNumber]
	FROM 
		entity.[CalendarDateTrackEvent] ce
			JOIN config.FiscalYear fy ON ce.FiscalYear = fy.FiscalYear AND fy.IsActive = 1
			JOIN entity.TrackEventType tet ON ce.TrackEventTypeId = tet.TrackEventTypeId
	order by date
END