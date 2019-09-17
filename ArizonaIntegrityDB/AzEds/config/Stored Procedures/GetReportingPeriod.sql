/************************************************************
**Procedure Name: config.GetReportingPeriod
**
**Author: Kalyani Kankatala
**
**Description:  Gets the Reporting periods 
**	
**Revision History:
**	Who			When		What
**	KK		06/19/2015	Initial Creation
**  CM		9/7/2016	Added UseInACE field - temporary until agg/lim can be changed to handle RP5&6 existing in the table without harm.
***************************************************************/
CREATE PROC [config].[GetReportingPeriod] 
   
AS
BEGIN

	 SELECT FiscalYear, ReportingPeriodId, [Description], ReportingPeriodDays, StartDayNumber, EndDayNumber, IncludeInCummulative, IsOnlyFor200DayCalendar, IsAnnual, SortOrder
	 FROM config.ReportingPeriod  
	 WHERE UseInACE = 1
	 
			
END
