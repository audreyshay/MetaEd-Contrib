/************************************************************
**Procedure Name: ace.GetMaxLimitedAverageDailyMembership
**
**Author: Kalyani Kankatala
**
**Description:  Gets the Maximum Limited Average Daily Membership values
**	
**Revision History:
**	Who			When		What
**	KK		07/15/2015	Initial Creation
**  PM      07/23/2015	updated due to table rename
**
***************************************************************/
CREATE PROC [ace].[GetMaxLimitedAverageDailyMembership] 
  
AS
BEGIN

SELECT MaxLimitedAverageDailyMembershipId
	, SchoolTypeId,MaxLimitedAverageDailyMembership AS MaxLimitedAverageDailyMembershipValue
	, IsCTECentral
	, IsConcurrent
	, FiscalYear
	, ISNULL(GcdLevel, 0) AS GcdLevel
FROM ace.MaxLimitedAverageDailyMembership

END