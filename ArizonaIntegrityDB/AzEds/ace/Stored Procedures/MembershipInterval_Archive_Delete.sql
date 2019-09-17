/*************************************************************************************************************************
**Procedure Name: ace.MembershipInterval_Archive_Delete
**
**Author: Amit Verma
**
**Description: DeleteMembershipIntervalAndSummary SP if InsertMembershipIntervalAndSummaryArchive SP is successfully run 
**Revision History:
**	Who			When		What
**	Amit Verma	11/09/2016	Initial Creation
***************************************************************************************************************************/
CREATE PROC [ace].[MembershipInterval_Archive_Delete]
AS
BEGIN

	DECLARE @Executions ace.ExecutionIdList
	DECLARE  @ret INT
	
	INSERT @Executions (ExecutionID)
	SELECT DISTINCT TOP 10  ex.ExecutionId 
	FROM [process].[Execution] ex
	     JOIN ace.MembershipSummary ms
		   ON ex.ExecutionId = ms.ExecutionId
		      AND ex.FiscalYear = ms.FiscalYear
	          AND ex.ProcessTypeId = 2
	          AND InitiatedDateTime < '2016-10-01'--CONVERT(DATE,CONVERT(NVARCHAR(2),DATEPART(MONTH,GETDATE()) - 1)+'-01-'+ CONVERT (NVARCHAR(4),DATENAME(YEAR,GETDATE())))
	ORDER BY ex.ExecutionId  ASC 
	
	  
	EXEC ace.InsertMembershipIntervalAndSummaryArchive @Executions,@return_value = @ret OUTPUT;
	SELECT @ret
	IF @ret = 0
	BEGIN
	   PRINT 'Error :('
	   RETURN
	END
	ELSE
		BEGIN
			EXEC [ace].[DeleteMembershipIntervalAndSummary] @Executions
		END

END
