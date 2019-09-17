


/************************************************************
**Procedure Name: leadata.vw_CalendarTypeOverrides
**
**Author: Venugopal Metukuru
**
**Description:  Gets the actual CalendarType count posted for Lea and school
**	
**Revision History:
**	Who			When		What
**	VM		 08/02/2019	Initial Creation

***************************************************************/

CREATE VIEW [leadata].[vw_CalendarTypeOverrides]
AS
     SELECT co.CalendarTypeOverrideId
          , co.FiscalYear
          , co.LocalEducationAgencyId
          , co.SchoolId
          , co.CalendarType
          , co.Counts AS 'MaxAllowedCounts'
          , CASE
                WHEN vwac.PostedCalendarTypeCount IS NULL
                THEN 0
                ELSE vwac.PostedCalendarTypeCount
            END AS PostedCalendarTypeCount
          , CASE
                WHEN co.LocalEducationAgencyId = 79275
                THEN 1
                ELSE 0
            END AS DefaultConfig
          , eosc.CTDS AS 'SchoolCTDS'
          , eosc.NameOfInstitution AS 'SchoolNameOfInstitution'
          , eoso.NameOfInstitution AS 'LocalEducationAgencyNameOfInstitution'
          , eoso.CTDS AS 'LocalEducationAgencyCTDS'
		,co.LastModifiedBy
		,co.LastModifiedDtm
     FROM config.CalendarTypeOverride co
          JOIN [entity].[EducationOrganization] eosc
                ON eosc.EducationOrganizationId = co.SchoolId
                   AND eosc.FiscalYear = co.FiscalYear
          JOIN [entity].[EducationOrganization] eoso
                ON eoso.EducationOrganizationId = co.LocalEducationAgencyId
                   AND eoso.FiscalYear = co.FiscalYear
          LEFT JOIN [leadata].[vw_PostedCalendarTypeCounts] vwac
                ON co.LocalEducationAgencyId = vwac.TrackLocalEducationAgencyId
                   AND co.SchoolId = vwac.EducationOrganizationId
                   AND co.FiscalYear = vwac.fiscalyear
                   AND co.CalendarType = vwac.CalendarType;