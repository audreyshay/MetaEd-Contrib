
/********************************************************************************************************
**Procedure Name:
**      process.UpdateExecutionStatus
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Save Execution status 
**               
**Input:
**       ExectionID, StatusTypeId, UpdateStatusOnly
**
**Output:
**	None
**
**Returns:
**
**Implementation:
**	Used by AzEDS Integrity and ACE Calculation  
**
**Revision History:
**	Who						When		What
**	Viju Viswanathan		07/09/2015	Initial Creation
**	Jeff Stokes				11/20/2015	Reworked it to allow an update of the appropriate DateTime Field based upon the Status Passed in.
**	Britto Augustine		09/28/2016	Changed proc to set start time for Initializing Status as well. Also added the @UpdateStatusOnly flag logic
**********************************************************************************************************/
CREATE PROCEDURE [process].[UpdateExecutionStatus]
	@ExecutionID INT,
	@StatusTypeId INT,
	@UpdateStatusOnly BIT = 0
AS
BEGIN
	SET NOCOUNT ON;

	IF @UpdateStatusOnly = 1
		UPDATE
			[process].[Execution]
			SET 
				[StatusTypeId]  = @StatusTypeId
		WHERE
			[ExecutionID] = @ExecutionID		
	ELSE
		UPDATE
			[process].[Execution]
			SET 
				[StatusTypeId]  = @StatusTypeId,
				[InitiatedDateTime] = CASE WHEN (@StatusTypeId = 1) THEN getutcdate() ELSE [InitiatedDateTime] END,
				[StartDateTime] = CASE WHEN (@StatusTypeId = 2 OR @StatusTypeId = 3) THEN getutcdate() ELSE [StartDateTime] END,
				[EndDateTime] = CASE WHEN (@StatusTypeId = 5 OR @StatusTypeId = 6) THEN getutcdate() ELSE [EndDateTime] END,
				[CancelledDateTime] = CASE WHEN (@StatusTypeId = 4) THEN getutcdate() ELSE [CancelledDateTime] END
		WHERE
			[ExecutionID] = @ExecutionID		
END