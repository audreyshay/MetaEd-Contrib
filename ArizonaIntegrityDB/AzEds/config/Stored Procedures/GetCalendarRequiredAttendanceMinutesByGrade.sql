
/************************************************************
**Procedure Name: config.GetCalendarRequiredAttendanceMinutesByGrade
**
**Author: Venugopal Metukuru
**
**Description:  Gets the RequiredAttendanceMinutesByGrade for calendar certification
**	
**Revision History:
**	Who			When		What
**	VM		03/29/2019	   Initial Creation
***************************************************************/

CREATE PROC [config].[GetCalendarRequiredAttendanceMinutesByGrade](@FiscalYear INT)
AS
   BEGIN
         SELECT 
		RequiredAttendanceMinutesByGradeId,
		ram.FiscalYear,
		ram.GradeLevelTypeId,
		AnnualRequiredHours,
		WeeklyRequiredMinutes,
		Is200DayCalendar,
		ram.CreateDate,
		glt.CodeValue,
		glt.[Description],
		glt.GradeLevelDescriptorId
	FROM 
		config.RequiredAttendanceMinutesByGrade ram
		JOIN entity.GradeLevelType glt ON ram.GradeLevelTypeId = glt.GradeLevelTypeId
              WHERE ram.FiscalYear = @FiscalYear
     END;