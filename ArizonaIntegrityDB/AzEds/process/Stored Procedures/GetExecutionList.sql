/************************************************************
**Procedure Name: process.GetExecutionList
**
**Author: Pallavi Mecconda
**
**Description:  Gets list of Executions that matches the parameters
**	
**Revision History:
**	Who			When		What
**	PM			06/12/2015	Initial Creation
**  KK          09/01/2015  Added reference execution Id and DataCaptureDate
**  MK			11/17/2015  Allowing the start date to be null
***************************************************************/
CREATE PROCEDURE [process].[GetExecutionList]
	@processTypeId INT
   ,@startDate DateTime = null -- null start date gets all dates for relative criteria
   ,@endDate DateTime = null
   ,@initiatedBy NVARCHAR(100) = NULL
   ,@statusTypeID INT = 0 -- 0 or null gets all status types
AS
BEGIN
	SELECT 
		  e.ExecutionId
		, e.ProcessTypeId
		, e.ExecutionTypeId
		, e.InitiatedDateTime
		, e.StartDateTime
		, e.EndDateTime
		, e.CancelledDateTime
		, e.InitiatedByUserName
		, e.CancelledByUserName
		, e.FiscalYear
		, e.StatusTypeId
		, e.ReferenceExecutionId
		, er.InitiatedDateTime as DataCaptureDate
	FROM  process.Execution e
	LEFT OUTER JOIN process.Execution er   ON e.ReferenceExecutionId = er.ExecutionId
	WHERE e.ProcessTypeId = @processTypeId
		  AND (@startDate is NULL OR ISNULL(e.StartDateTime, e.InitiatedDateTime) >= @startDate)
		  AND (@endDate IS NULL OR e.EndDateTime <= @endDate)
		  AND (@initiatedBy IS NULL OR e.InitiatedByUserName like '%'+@initiatedBy+'%')
		  AND (ISNULL(@statusTypeID, 0) = 0 OR e.StatusTypeId = @statusTypeID)
END