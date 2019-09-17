
/************************************************************
**Procedure Name: leadata.vw_PostedCalendarTypeCounts
**
**Author: Venugopal Metukuru
**
**Description:  Gets the actual CalendarType count posted for Lea and school
**	
**Revision History:
**	Who			When		What
**	VM		 08/02/2019	Initial Creation

***************************************************************/

CREATE VIEW [leadata].[vw_PostedCalendarTypeCounts]
AS
     SELECT TrackLocalEducationAgencyId
          , EducationOrganizationId
          , fiscalyear
          , CalendarType
          , COUNT(*) AS PostedCalendarTypeCount
     FROM entity.Track (nolock) where FiscalYear >= 2020
     GROUP BY TrackLocalEducationAgencyId
            , EducationOrganizationId
            , fiscalyear
            , CalendarType;