/************************************************************
**Procedure Name: process.GetRecordCountForExecution
**
**Author: kalyani kankatala
**
**Description:  Gets sum of Records processed for Processtype(Aggregation-Regular,SPED,ELL) that matches the parameter executionId and processtype
**	
**Revision History:
**	Who			When		What
**	KK			06/22/2015	Initial Creation
**
***************************************************************/
CREATE PROCEDURE [process].[GetRecordCountForExecution]
	@executionId INT
	--@processTypeId INT
AS
BEGIN
	SELECT SUM(RecordCount)
	FROM process.ExecutionEducationOrganizationLog 
	WHERE ExecutionId=@executionId
	AND RecordCountTypeId in (4,5,6,7,8,9)
	--AND ProcessType=@processTypeId
END