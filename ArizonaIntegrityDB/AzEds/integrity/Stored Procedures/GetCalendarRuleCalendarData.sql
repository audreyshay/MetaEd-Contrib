/**************************************************************************************
**Procedure Name:
**      [integrity].[GetCalendarRuleCalendarData]
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**	Get active calendar track events for a fiscal year
**               
**Implementation:
**	Used to get calendars for Calendarintegrityprocessing
**
**Revision History:
**	Who					When		What
**	Pratibha Kanyar		08/21/2017	Initial Creation
**  Vinoth A			09/26/2017	Modified the SP to include the common View to accept the Execution ID and Message ID
**  Vinoth A			10/23/2017	Modified the SP to fetch th Track event type ID instead of description 
***************************************************************************************/
CREATE PROCEDURE [integrity].[GetCalendarRuleCalendarData]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)  

AS 
BEGIN 

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  

	SELECT DISTINCT
			cd.EducationOrganizationId	AS SchoolId,
			cd.TrackLocalEducationAgencyId,
			cd.TrackNumber,	
			cd.[Date],	
			tet.TrackEventTypeId				AS TrackEventTypeId,
			cd.EventDuration					 
	FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih
	
	inner join entity.CalendarDateTrackEvent cd 
			ON cd.FiscalYear =ih.FiscalYear
					AND cd.TrackNumber = ih.TrackNumber
					AND cd.TrackLocalEducationAgencyId = ih.TrackLocalEducationAgencyId
					AND cd.EducationOrganizationId=ih.Schoolid
	
	JOIN entity.Track t
		ON cd.EducationOrganizationId = t.EducationOrganizationId
			AND cd.FiscalYear = t.FiscalYear
			AND cd.TrackNumber = t.TrackNumber
			AND cd.TrackLocalEducationAgencyId = t.TrackLocalEducationAgencyId

	LEFT JOIN [entity].[TrackEventType] tet
		ON tet.TrackEventTypeId = cd.TrackEventTypeId
	
	WHERE ih.Executionid = @executionid AND ih.messageid = @messageid

    ORDER BY SchoolId,
			 cd.trackNumber,	
			 cd.TrackLocalEducationAgencyId,
			 cd.Date

	SET TRANSACTION ISOLATION LEVEL READ COMMITTED
  END