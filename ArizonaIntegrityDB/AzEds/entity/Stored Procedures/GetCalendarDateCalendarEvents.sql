/************************************************************
**Procedure Name: entity.GetCalendarDateCalendarEvents
**
**Author: Kalyani Kankatala
**
**Description:  Gets the CalendarDates and events by EducationOrganizationId and fiscal year
**				Used by ACE Calc Engine
**	
**Revision History:
**	Who			When		What
**	KK		06/16/2015	Initial Creation
**  KK      07/21/2015  Modified by removing the params
**  Chris M 05/05/2017  changed for [TrackEventTypeId] column name change
***************************************************************/
CREATE PROC [entity].[GetCalendarDateCalendarEvents] 
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
	order by date
END
