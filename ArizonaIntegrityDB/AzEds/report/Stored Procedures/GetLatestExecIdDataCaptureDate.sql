/*************************************************************************************
**Procedure Name:
**      report.GetLatestExecIdDataCaptureDate
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  modified to get Latest Integrity Execution ID and Data Capture Date
**	 
**Input:
**	
**Output:
**  
**Returns:
**	@@Error
**
**Implementation:
**	Called from Integrity data Verfication report (INTEG15 Report) 
**
**Revision History:
**	P Kanyar	05/24/2016	Initial creation
**	P Kanyar	05/25/2016	Changed UTC to AZ time for Data Capture Date
**	P Kanyar	10/05/2016	Updated to bring latest Integrity Execution Id & DataCaptureDate
**	B Augustine	10/25/2016	Added processTypeId Parameter and getting date directly from process.execution table
**
**************************************************************************************/	

CREATE PROC [report].[GetLatestExecIdDataCaptureDate]	
	@FiscalYear INT,
	@ProcessTypeId as INT
AS
BEGIN

SET NOCOUNT ON;

	DECLARE @LatestExecutionDateTime as datetime

	-- get latest Integrity execution date time
	SELECT @LatestExecutionDateTime = dateadd(hh, -7, MAX(IE.InitiatedDateTime))
	FROM process.Execution IE		 
	WHERE IE.ProcessTypeId = @ProcessTypeId	 
	  AND IE.StatusTypeId = 6					 --successful 
	  AND IE.FiscalYear = @FiscalYear

	-- convert the last integrity execution date time to AZ time and return it for report format
	SELECT CONVERT(varchar(10), @LatestExecutionDateTime, 101) + ' ' + RIGHT(CONVERT(varchar(30), @LatestExecutionDateTime, 100), 7) AS 'DataCaptureDate'

END