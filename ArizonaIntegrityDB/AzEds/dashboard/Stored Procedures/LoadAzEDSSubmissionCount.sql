
/************************************************************************************************************************
**Procedure Name: dashboard.LoadAzEDSSubmissionCount
**
**Author: Britto Augustine
**
**Description: gets the total and sucessfull counts of REST API submissions from LEALogging transactionlog table for previous day 
**			   and loads the dashboard.AzEDSSubmissions table.
**			   called by the AzEDS nightly processing job after Integrity is completed
**	
**Revision History:
**	Who						When		What
**	Britto Augustine		08/19/2016	Initial Creation
**
***************************************************************************************************************************/
CREATE PROC dashboard.LoadAzEDSSubmissionCount
AS
BEGIN

	declare @FromDate as date
	set @FromDate = dateadd(dd, -1, convert(date, getutcdate())) 

	declare @ToDate as date
	set @ToDate = convert(date, getutcdate()) 

	declare @CurrentDateTime as datetime
	set @CurrentDateTime = GETDATE()

	delete from [dashboard].[AzEDSSubmissions]
	where SubmissionDate >= @FromDate and SubmissionDate < @ToDate

	;with cteTotalSubmissions as
	(
		--get total submission count
		select FiscalYear, convert(date, RequestDate) as SubmissionDate, LocalEducationAgencyId, Count(*) as RecordCount
		from LEALogging.process.TransactionLog tl WITH (NOLOCK)
		where RequestDate >= @FromDate and RequestDate < @ToDate
		  and LocalEducationAgencyId is not null
		group by FiscalYear, convert(date, RequestDate), LocalEducationAgencyId
	),
	cteSuccessfulSubmissions as
	(
		--get successful submission count
		select FiscalYear, convert(date, RequestDate) as SubmissionDate, LocalEducationAgencyId, Count(*) as RecordCount
		from LEALogging.process.TransactionLog tl WITH (NOLOCK)
		where RequestDate >= @FromDate and RequestDate < @ToDate
		  and ResponseStatusCodeId between 200 and 299
		  and LocalEducationAgencyId is not null
		group by FiscalYear, convert(date, RequestDate), LocalEducationAgencyId
	)
	insert into [dashboard].[AzEDSSubmissions]
		(FiscalYear, SubmissionDate, SubmittedByLocalEducationAgencyId, TotalSubmissions, SuccessfulSubmissions, CreateDate)
	select ts.FiscalYear, ts.SubmissionDate, ts.LocalEducationAgencyId,
			   isnull(ts.RecordCount, 0) as TotalSubmissions,
			   isnull(ss.RecordCount, 0) as SuccessfulSubmissions,
			   @CurrentDateTime
	from cteTotalSubmissions ts
	left join cteSuccessfulSubmissions ss
		 on ts.FiscalYear = ss.FiscalYear
	    and ts.SubmissionDate = ss.SubmissionDate
	    and ts.LocalEducationAgencyId = ss.LocalEducationAgencyId

END
