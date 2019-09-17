
/************************************************************
**Procedure Name: ace.GetAOIAnnualRequiredTime
**
**Author: Kalyani Kankatala
**
**Description:  Gets the AOI(Arizona Online Instructions) minutes required by grade and fiscalyear
**	
**Revision History:
**	Who			When		What
**	KK		06/18/2015	Initial Creation
**	PM		07/22/2015	Updated it to match the table name change
**
***************************************************************/
CREATE PROC [config].[GetAOIRequiredMinutes] 
   
AS
BEGIN

	SELECT
			 AOI.GradeLevelTypeId,GL.CodeValue as GradeLevelCodeValue, AOI.AnnualRequiredHours,AOI.AnnualRequiredMinutes,
			 AOI.AverageDailyRequiredMinutes, AOI.FiscalYear  
			 FROM AOIRequiredMinutes as AOI
			 JOIN entity.GradeLevelType as GL
			 ON AOI.GradeLevelTypeId=GL.GradeLevelTypeId
			
END



