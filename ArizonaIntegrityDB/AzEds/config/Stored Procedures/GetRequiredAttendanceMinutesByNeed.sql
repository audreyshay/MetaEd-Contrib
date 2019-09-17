/************************************************************
**Procedure Name: config.GetRequiredAttendanceMinutesByNeed
**
**Author: Kalyani Kankatala
**
**Description:  Gets the RequiredAttendanceMinutesByNeed
**	
**Revision History:
**	Who			When		What
**	KK		07/22/2015	Initial Creation
**
***************************************************************/
CREATE PROC [config].[GetRequiredAttendanceMinutesByNeed]
  
AS
BEGIN


SELECT 

		 RequiredAttendanceMinutesByNeedId,FiscalYear,StudentNeedDescriptorId,WeeklyRequiredMinutes,CreateDate
FROM 

config.RequiredAttendanceMinutesByNeed


END