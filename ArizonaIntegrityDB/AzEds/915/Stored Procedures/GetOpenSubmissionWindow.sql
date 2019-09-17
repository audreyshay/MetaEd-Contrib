/************************************************************
**Procedure Name: 915.GetOpenSubmissionWindow
**
**Author: Vinoth K
**
**Description:  Gets all the Open window for the given School ID, Fiscal Year, TrackLEA,Track Number
**     
**Revision History:
**     Who                        When          What
**     Vinoth K             02/07/2018    Initial Creation
**	   Vinoth K				03/21/2018	  Going forward LEA is stored at 915 request level, so no need to join with calendar request
**	   Vinoth K				02/11/2018	  As part of 2020, we are adding the calendar code which is not part of 2020.
**	   Vinoth K				05/20/2019	  As part of 2020, we are adding the calendar type which is not part of 2020.
**
***************************************************************/
--declare     @FiscalYear INT = 2019

CREATE PROC [915].[GetOpenSubmissionWindow]
       @FiscalYear INT,
       @SchoolId INT,
       @TrackLocalEducationAgencyId INT,
       @TrackNumberDescriptorId INT,
	   @CalendarCode VARCHAR(60) = NULL,
	   @CalendarType Varchar(50) = NULL
AS
BEGIN

If @FiscalYear <=2019

	BEGIN
       SELECT count(*) As IsWindowOpen
              FROM [AzEds].[915].[Request] r 
              inner join 
              [AzEds].[915].[CalendarRequest] cr on r.RequestId=cr.RequestId 
              inner join leadata.[Descriptor] d ON d.DescriptorId = @TrackNumberDescriptorId
              WHERE r.FiscalYear = @FiscalYear 
              AND (GetUTCDate() BETWEEN r.BeginDtm AND r.EndDtm OR r.BeginDtm >= GetUTCDate())
              AND RequestStatusId = 1
              AND RequestTypeId = 2
              AND r.LocalEducationAgencyId =@TrackLocalEducationAgencyId
              AND cr.TrackNumber = TRY_CAST(d.CodeValue AS INT) 
              AND cr.SchoolId = @SchoolId
	END
ELSE
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
			  and cr.CalendarType = @CalendarType
	END

END

GO
