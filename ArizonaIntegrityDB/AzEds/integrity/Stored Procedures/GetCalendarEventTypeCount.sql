/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetCalendarEventTypeCount]
**
**Author:
**     Vinoth K
**
**Description:  
**           Get School Calendar Type count which is used in rule app 
**               
**Input:
**
**Output:
**           School Calendar Event type acutal and expected count by School and LEA
**
**Returns:
**
**Revision History:
**           Who                      When                    What
**			Vinoth K                04/1/2019         Initial Creation

****************************************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetCalendarEventTypeCount]
                @ExecutionId as int
AS
BEGIN 

      SET NOCOUNT ON;
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  

	   			DECLARE @FiscalYear INT
			 
			SELECT @FiscalYear= FiscalYear FROM process.Execution
			WHERE ExecutionId = @ExecutionId

	   SELECT
			  tr.CalendarType
			, tr.EducationOrganizationId AS SchoolId
			, tr.TrackLocalEducationAgencyId
			, tr.FiscalYear
			, "ExpectedCount"=
			  CASE
						WHEN ct.counts IS NULL
						THEN cto.Counts
						ELSE ct.counts
						   END
			, tr.actual AS ActualCount
		FROM
          [config].[CalendarTypeOverride] ct
		RIGHT JOIN
                    (
                              SELECT
                                        t.CalendarType
                                      , EducationOrganizationId
                                      , TrackLocalEducationAgencyId
                                      , t.FiscalYear
                                      , COUNT(*) AS actual
                              FROM
                                        entity.Track t
                              GROUP BY
                                        t.CalendarType
                                      , t.EducationOrganizationId
                                      , t.TrackLocalEducationAgencyId
                                      , t.FiscalYear
                    )
                    AS tr
          ON
                    ct.CalendarType               =tr.CalendarType
                    AND ct.SchoolId               =tr.EducationOrganizationId
                    AND ct.LocalEducationAgencyId =tr.TrackLocalEducationAgencyId
                    AND ct.FiscalYear             =tr.FiscalYear
          LEFT JOIN
                    [config].[CalendarTypeOverride] cto
          ON
                    cto.CalendarType               =tr.CalendarType
                    AND cto.FiscalYear             =tr.FiscalYear
                    AND cto.LocalEducationAgencyId =79275			--State ID
                    AND cto.SchoolId               =79275			--State ID
WHERE
          tr.FiscalYear=@FiscalYear


END