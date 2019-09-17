/************************************************************
**Procedure Name: config.GetRequiredAttendanceMinutesByGrade
**
**Author: Kalyani Kankatala
**
**Description:  Gets the RequiredAttendanceMinutesByGrade
**	
**Revision History:
**	Who			When		What
**	KK		07/22/2015	Initial Creation
**	CM		01/29/2018	Calendar UI changes
**
***************************************************************/
CREATE PROC [config].[GetRequiredAttendanceMinutesByGrade]
  
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
END