/************************************************************
**Procedure Name: process.GetExecution
**
**Author: Kalyani Kankatala
**
**Description:  Gets the specific Execution that matches the parameter executionId
**	
**Revision History:
**	Who			When		What
**	KK			06/22/2015	Initial Creation
**	VIJU		07/16/2015	Modified to add ReferenceExecutionId 
**							information whenever available
***************************************************************/
CREATE PROCEDURE [process].[GetExecution]
	@executionId INT
  
AS
BEGIN
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
  FROM process.Execution  ex
	LEFT JOIN
		process.Execution exref
	ON exref.ExecutionId = ex.ReferenceExecutionId

	WHERE ex.ExecutionId = @executionId
		 
END
