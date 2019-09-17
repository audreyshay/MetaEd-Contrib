
/************************************************************
**Procedure Name: process.UpdateExecutionStatus
**
**Author: Rohith Chintamaneni
**
**Description:  updates the Execution status to In-Progress and Returns the execution ID
**	
**Revision History:
**	Who			When		What
**	RC			06/30/2015	Initial Creation
**
***************************************************************/
CREATE PROCEDURE [integrity].[GetIntegrityExecutionID]
	
AS
BEGIN
	
	declare @executionID int

	Select top 1 @executionID =  executionid from [process].[Execution]
	where processTypeID = 1 and StatusTypeID = 1-- for IntegrityOnly whose status is in IN-QUEUE
	order by initiatedDatetime asc

	update [process].[Execution]
	set StatusTypeID = 3 -- updating status to In-Progress
	where executionid = @executionID

	Select @executionID as ExecutionID

END
