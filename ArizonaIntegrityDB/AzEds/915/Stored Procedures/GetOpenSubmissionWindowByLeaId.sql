/************************************************************
**Procedure Name: 915.GetOpenSubmissionWindowByLeaId
**
**Author: Vinoth K
**
**Description:  Gets all the Post Submission window for the given TrackLEA to show the status on System Status page
**	
**Revision History:
**	Who				When		What
**	Vinoth K		03/08/2018	Initial Creation
**	Vinoth K		03/21/2018	Going forward LEA is stored at 915 request level, so no need to join with calendar request
***************************************************************/

CREATE PROC [915].[GetOpenSubmissionWindowByLeaId]
	@FiscalYear INT,
	@TrackLocalEducationAgencyId INT

AS
BEGIN

	 SELECT count(*)
		FROM [AzEds].[915].[Request] r 
		--inner join 
		--[AzEds].[915].[CalendarRequest] cr on r.RequestId=cr.RequestId 
		WHERE r.FiscalYear = @FiscalYear 
		AND (GetUTCDate() BETWEEN r.BeginDtm AND r.EndDtm OR r.BeginDtm >= GetUTCDate())
		AND RequestStatusId = 1
		AND RequestTypeId = 2
		AND r.LocalEducationAgencyId = @TrackLocalEducationAgencyId
END

GO

