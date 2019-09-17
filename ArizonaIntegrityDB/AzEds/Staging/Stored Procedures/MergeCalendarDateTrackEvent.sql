/**************************************************************************
**Procedure Name: staging.MergeCalendarDateTrackEvent
**
**Author: Pratibha Kanyar
**
**Description: Merges rows from staging.CalendarDateTrackEvent
**			   into entity.CalendarDateTrackEvent
**      
**Input: None
**
**Output: None
**
**Returns: @@Error
**
**Implementation:
**	Called from CalendarDateTrackEvent ETL package
**
**Revision History:
**	P Kanyar		03/28/2017	Initial Creation
**	P Kanyar		09/29/2017	Added logic for delete
**	P Kanyar		10/11/2017	Fixed logic for delete to not delete other FYs' data
**
**************************************************************************/
CREATE PROC [Staging].[MergeCalendarDateTrackEvent]
AS
BEGIN
	SET NOCOUNT ON;

	WITH CDTE_cte 
	AS 
	 (
	   SELECT 
			 [EducationOrganizationId]
			,[FiscalYear]
			,[Date]
			,[TrackEventTypeId]
			,[TrackNumber]
			,[TrackLocalEducationAgencyId]
			,[EventDuration]
	   FROM 
		 staging.CalendarDateTrackEvent
	 )

	 MERGE entity.CalendarDateTrackEvent WITH(HOLDLOCK) AS dest
	 USING CDTE_cte AS src
	 	 ON	src.[EducationOrganizationId]= dest.[EducationOrganizationId]
			AND src.[FiscalYear] = dest.[FiscalYear]
			AND src.[Date] = dest.[Date]
			AND src.[TrackEventTypeId] = dest.[TrackEventTypeId]
			AND src.[TrackNumber] = dest.[TrackNumber]
			AND src.[TrackLocalEducationAgencyId] = dest.[TrackLocalEducationAgencyId]

	  WHEN MATCHED THEN 
		UPDATE SET
			[EventDuration] = src.[EventDuration]
			
	  WHEN NOT MATCHED THEN
	     INSERT
		    (
				 [EducationOrganizationId]
				,[FiscalYear]
				,[Date]
				,[TrackEventTypeId]
				,[TrackNumber]
				,[TrackLocalEducationAgencyId]
				,[EventDuration]
			)

		 VALUES
		   (
		       src.[EducationOrganizationId]
			  ,src.[FiscalYear]
			  ,src.[Date]
			  ,src.[TrackEventTypeId]
			  ,src.[TrackNumber]
			  ,src.[TrackLocalEducationAgencyId]
			  ,src.[EventDuration]
		   )

		WHEN NOT MATCHED BY SOURCE 
		AND DEST.[FiscalYear] = (SELECT DISTINCT [FiscalYear] FROM staging.CalendarDateTrackEvent)
		THEN
		DELETE ; 

    RETURN(@@ERROR)

	/*End MergeCalendarDateCalendarEvent*/
END