

/************************************************************
**Procedure Name: [leadata].[GetCalendarTypeOverrides]
**
**Author: Venugopal Metukuru
**
**Description:  Gets exitsing count CalendarType for given lea/school/Calendartype
**	
**Revision History:
**	Who			When		What
**	VM		 08/05/2019	Initial Creation
**  SK		 08/26/2019 Modifed to get the PostedCalendarTypeCount not only when there is a record in config.CalendarOverride table
***************************************************************/

CREATE PROCEDURE [leadata].[GetCalendarTypeOverridesByLeaSchool](@FiscalYear INT,
                                                                @LeaId      INT,
                                                                @SchoolId   INT)
AS
     BEGIN
         DECLARE @SchoolCTDS NVARCHAR(12);
         DECLARE @LeaCTDS NVARCHAR(12);
         DECLARE @LeaName NVARCHAR(100);
         DECLARE @SchooName NVARCHAR(100);
         SELECT @SchoolCTDS = CTDS
              , @SchooName = NameOfInstitution
         FROM [report].[vw_FormattedEducationorganizationCTDS]
         WHERE EducationOrganizationId = @SchoolId
               AND FiscalYear = @FiscalYear;
         SELECT @LeaCTDS = CTDS
              , @LeaName = NameOfInstitution
         FROM [report].[vw_FormattedEducationorganizationCTDS]
         WHERE EducationOrganizationId = @LeaId
               AND FiscalYear = @FiscalYear;
         DECLARE @LeaOverrides AS TABLE
         (CalendarTypeOverrideId INT,
          [CalendarType]         VARCHAR(100),
          [MaxAllowedCounts]     INT
         );
		 IF Object_id('tempdb..#postedCalendarCountsRecords') IS NOT NULL
			DROP TABLE #postedCalendarCountsRecords

			SELECT * INTO #postedCalendarCountsRecords FROM [leadata].[vw_PostedCalendarTypeCounts]
				  WHERE FiscalYear = @FiscalYear AND TrackLocalEducationAgencyId = @LeaId AND EducationOrganizationId = @SchoolId

         ---------IF any calendarType override exists for lea and school 
         IF EXISTS
         (
             SELECT 1
             FROM config.CalendarTypeOverride(nolock)
             WHERE FiscalYear = @FiscalYear
                   AND LocalEducationAgencyId = @LeaId
                   AND SchoolId = @SchoolId
         )
             BEGIN
                 INSERT INTO @LeaOverrides
                        SELECT [CalendarTypeOverrideId]
                             , [CalendarType]
                             , [Counts]
                        FROM config.CalendarTypeOverride(nolock)
                        WHERE FiscalYear = @FiscalYear
                              AND LocalEducationAgencyId = @LeaId
                              AND SchoolId = @SchoolId;
                 INSERT INTO @LeaOverrides
                        SELECT [CalendarTypeOverrideId]
                             , [CalendarType]
                             , [Counts]
                        FROM config.CalendarTypeOverride(nolock)
                        WHERE FiscalYear = @FiscalYear
                              AND LocalEducationAgencyId = 79275
                              AND SchoolId = 79275
                              AND CalendarType NOT IN
                        (
                            SELECT [CalendarType]
                            FROM @LeaOverrides
                        );
                 SELECT cov.[CalendarTypeOverrideId]
                      , cov.[FiscalYear]
                      , @LeaId AS LocalEducationAgencyId
                      , @SchoolId AS SchoolId
                      , RTRIM(cov.[CalendarType]) AS CalendarType
                      , cov.[MaxAllowedCounts]
                      --, cov.[PostedCalendarTypeCount]
					  , CASE WHEN vpct.TrackLocalEducationAgencyId IS NULL THEN cov.PostedCalendarTypeCount
							 ELSE vpct.PostedCalendarTypeCount  END AS 'PostedCalendarTypeCount'
                      , cov.[DefaultConfig]
                      , @SchoolCTDS AS SchoolCTDS
                      , @SchooName AS 'SchoolNameOfInstitution'
                      , @LeaName AS LocalEducationAgencyNameOfInstitution
                      , @LeaCTDS AS LocalEducationAgencyCTDS
                      , cov.[LastModifiedBy]
                      , cov.[LastModifiedDtm]
                 FROM [leadata].[vw_CalendarTypeOverrides] cov
                      JOIN @LeaOverrides lo
                            ON lo.CalendarTypeOverrideId = cov.CalendarTypeOverrideId
							LEFT JOIN #postedCalendarCountsRecords vpct
				  ON cov.CalendarType = vpct.CalendarType
             END;
         ELSE
         ---------IF No calendarType override exists for lea and school  Get All default ones
             BEGIN
                SELECT cov.[CalendarTypeOverrideId]
                      , cov.[FiscalYear]
                      , @LeaId AS LocalEducationAgencyId
                      , @SchoolId AS SchoolId
                      , RTRIM(cov.[CalendarType]) AS CalendarType
                      , cov.[MaxAllowedCounts]
                      , CASE WHEN vpct.TrackLocalEducationAgencyId IS NULL THEN cov.PostedCalendarTypeCount
							 ELSE vpct.PostedCalendarTypeCount
					  END AS 'PostedCalendarTypeCount'
                      , cov.[DefaultConfig]
                      , @SchoolCTDS AS SchoolCTDS
                      , @SchooName AS 'SchoolNameOfInstitution'
                      , @LeaName AS LocalEducationAgencyNameOfInstitution
                      , @LeaCTDS AS LocalEducationAgencyCTDS
                      , cov.[LastModifiedBy]
                      , cov.[LastModifiedDtm]
                 FROM [leadata].[vw_CalendarTypeOverrides] cov
				 LEFT JOIN  #postedCalendarCountsRecords vpct
				  ON cov.CalendarType = vpct.CalendarType
                 WHERE defaultconfig = 1
             END;
     END;