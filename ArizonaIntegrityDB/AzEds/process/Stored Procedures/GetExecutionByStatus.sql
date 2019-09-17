/********************************************************************************************************
**Procedure Name:
**      process.GetExecutionByStatus
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Get the execution data by status
**               
**Input:
**       Execution status type
**
**Output:
**	Execution data
**
**Returns:
**
**Implementation:
**	Used by AzEDS ACE Calculation  
**
**Revision History:
**	Who						When		What
**	Viju Viswanathan		07/15/2015	Initial Creation
**	Viju Viswanathan		08/26/2015	Added new parameter ProcessTypeId
**	Rohith Chintamaneni		11/06/2015	Making is optional as Publisher- integrity process will not look at this parameter
**  Rohith Chintamaneni		03/08/2018	Including DataLoadType in the Get Proc
**********************************************************************************************************/
CREATE PROCEDURE [process].[GetExecutionByStatus]
	@StatusTypeId INT,
	@ProcessTypeId INT = Null

AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT
		ex.ExecutionId
      ,ex.ProcessTypeId
      ,ex.ExecutionTypeId
      ,ex.InitiatedDateTime
      ,ex.StartDateTime
      ,ex.EndDateTime
      ,ex.CancelledDateTime
      ,ex.InitiatedByUserName
      ,ex.CancelledByUserName
      ,ex.FiscalYear
      ,ex.StatusTypeId
      ,ex.Comment
      ,ex.ReferenceExecutionId
	  ,exref.InitiatedDateTime as DataCaptureDate
	  ,ex.DataLoadTypeId
  FROM process.Execution  ex
	LEFT JOIN
		process.Execution exref
	ON exref.ExecutionId = ex.ReferenceExecutionId

	WHERE
		ex.StatusTypeId = @StatusTypeId
		AND (@ProcessTypeId is null OR ex.ProcessTypeId = @ProcessTypeId)
END
GO


