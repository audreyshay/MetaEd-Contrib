
/************************************************************
**Procedure Name: process.GetRequestsByLeaId
**
**Author: Venugopal Metukuru
**
**Description:  Gets exitsing count CalendarType for given lea/school/Calendartype
**	
**Revision History:
**	Who			When		What
**	VM		 03/25/2018	Initial Creation

***************************************************************/

CREATE PROCEDURE [915].[GetCalendarTypeCount] @fiscalYear                  INT,
                                             @TrackLocalEducationAgencyId INT,
                                             @SchoolId                    INT,
                                             @CalendarType                VARCHAR(100)
AS
     BEGIN
         SELECT PostedCalendarTypeCount AS CalendarTypeCount
         FROM [leadata].[vw_PostedCalendarTypeCounts]
         WHERE fiscalyear = @fiscalYear
               AND TrackLocalEducationAgencyId = @TrackLocalEducationAgencyId
               AND EducationOrganizationId = @SchoolId
               AND @CalendarType IS NOT NULL
               AND CalendarType = @CalendarType;
     END;