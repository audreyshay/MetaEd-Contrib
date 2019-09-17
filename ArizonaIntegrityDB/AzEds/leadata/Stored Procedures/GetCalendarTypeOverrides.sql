
/************************************************************
**Procedure Name: [leadata].[GetCalendarTypeOverrides]
**
**Author: Venugopal Metukuru
**
**Description:  Gets exitsing count CalendarType for given lea/school/Calendartype
**	
**Revision History:
**	Who			When		What
**	VM		 08/02/2019	Initial Creation

***************************************************************/

CREATE PROCEDURE [leadata].[GetCalendarTypeOverrides] @FiscalYear INT
AS
     BEGIN
         IF(@fiscalYear = 0)
             BEGIN
                 SET @fiscalYear = config.CurrentFiscalYear();
             END;
         SELECT [CalendarTypeOverrideId]
              , [FiscalYear]
              , [LocalEducationAgencyId]
              , [SchoolId]
              , [CalendarType]
              , [MaxAllowedCounts]
              , [PostedCalendarTypeCount]
              , [DefaultConfig]
              , [SchoolCTDS]
              , [SchoolNameOfInstitution]
              , [LocalEducationAgencyNameOfInstitution]
              , [LocalEducationAgencyCTDS]
		    ,[LastModifiedBy]
		    ,[LastModifiedDtm]
         FROM [AzEds].[leadata].[vw_CalendarTypeOverrides] co
         WHERE co.FiscalYear = @FiscalYear;
     END;