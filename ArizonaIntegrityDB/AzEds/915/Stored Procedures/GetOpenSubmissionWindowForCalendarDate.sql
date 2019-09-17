/************************************************************
**Procedure Name: 915.GetOpenSubmissionWindowForCalendarDate
**
**Author: Vinoth K
**
**Description:  Gets all the Post Submission window for the given school and calendarcode to check the status on Rest API for calendar date
**	
**Revision History:
**	Who				When		What
**	Vinoth K		05/20/2019	Initial Creation
***************************************************************/
CREATE PROC [915].[GetOpenSubmissionWindowForCalendarDate]
       @FiscalYear INT,
       @SchoolId INT,
       @TrackLocalEducationAgencyId INT,
       @TrackNumberDescriptorId INT,
	   @CalendarCode VARCHAR(60) = NULL
AS
BEGIN
		SELECT count(*) As IsWindowOpen
              FROM [AzEds].[915].[Request] r 
              inner join 
              [AzEds].[915].[CalendarRequest] cr on r.RequestId=cr.RequestId 
              WHERE r.FiscalYear = @FiscalYear 
              AND (GetUTCDate() BETWEEN r.BeginDtm AND r.EndDtm OR r.BeginDtm >= GetUTCDate())
              AND RequestStatusId = 1
              AND RequestTypeId = 2
              AND cr.SchoolId = @SchoolId
			  AND cr.CalendarCode = @CalendarCode
END
