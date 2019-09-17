/************************************************************
**Procedure Name: ace.GetMaxLimitedAverageDailyMembershipByGrade
**
**Author: Kalyani Kankatala
**
**Description:  Gets the  Maximum Limited Average Daily Membership by Grade
**	
**Revision History:
**	Who			When		What
**	KK		07/15/2015	Initial Creation
**	PM		07/23/2015	updated due to table rename
**
***************************************************************/
CREATE PROC [ace].[GetMaxLimitedAverageDailyMembershipByGrade] 
  
AS
BEGIN

SELECT GradeLevelTypeId,MaxLimitedAverageDailyMembership, FiscalYear
FROM ace.MaxLimitedAverageDailyMembershipByGrade

END