/**************************************************************************
**Procedure Name: staging.MergeCalendarDate
**
**Author: Pratibha Kanyar
**
**Description: Merges rows from staging.CalendarDate into entity.CalendarDate   
**    
**Input: None
**
**Output: None
**
**Returns: @@Error
**
**Implementation: Called from CalendarDate ETL package
**
**Revision History:
**	P Kanyar		03/28/2017	Initial Creation
**
**************************************************************************/
CREATE PROC [Staging].[MergeCalendarDate]

AS
BEGIN

SET NOCOUNT ON;

	WITH CalendarDateCTE
	AS
	(
		SELECT
			 [EducationOrganizationId]
			,[FiscalYear]
			,[Date]
		FROM
			staging.CalendarDate
	)
	MERGE entity.CalendarDate WITH (HOLDLOCK) AS Dest
		USING CalendarDateCTE
			ON CalendarDateCTE.[EducationOrganizationId] = Dest.[EducationOrganizationId]
					AND CalendarDateCTE.[FiscalYear] = Dest.[FiscalYear]
					AND CalendarDateCTE.[Date] = Dest.[Date]


		WHEN NOT MATCHED THEN
			INSERT
				(
				   [EducationOrganizationId]
				  ,[FiscalYear]
				  ,[Date]
				)
			VALUES
				(
				   CalendarDateCTE.[EducationOrganizationId]
				  ,CalendarDateCTE.[FiscalYear]
				  ,CalendarDateCTE.[Date]
				);
	    
    RETURN(@@ERROR)

/*End MergeCalendarDate*/
END