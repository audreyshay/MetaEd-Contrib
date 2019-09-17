/************************************************************
**Procedure Name: ace.DeleteMembershipIntervalAndSummary
**
**Author: Viju Viswanathan
**
**Description: Delete membership interval and membership summary
**			   for the list of executions provided.
**Revision History:
**	Who			When		What
**	VV			11/02/2016	Initial Creation
***************************************************************/
CREATE PROC [ace].[DeleteMembershipIntervalAndSummary]	
	@ExecutionId AS ace.ExecutionIdList READONLY
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @r INT; 

	--deleting records in chunks of 100000 to prevent locking of table for a long time and to prevent sql log file growth.
	SET @r = 1;
	WHILE @r > 0
	BEGIN
		DELETE TOP (100000) ladm
		FROM ace.LimitedAverageDailyMembership ladm
		JOIN ace.MembershipInterval mi
		ON ladm.MembershipIntervalId = mi.MembershipIntervalId
		JOIN @ExecutionId e 
		ON mi.ExecutionId = e.ExecutionId
		 
		SET @r = @@ROWCOUNT;		 
	END

	SET @r = 1;
	WHILE @r > 0
	BEGIN
		DELETE TOP (100000) mi
		FROM ace.MembershipInterval mi
		JOIN @ExecutionId e 
		ON mi.ExecutionId = e.ExecutionId
		 
		SET @r = @@ROWCOUNT;		 
	END

	SET @r = 1;
	WHILE @r > 0
	BEGIN
		DELETE  TOP (100000) ms
		FROM ace.MembershipSummary ms
		JOIN @ExecutionId e 
		ON ms.ExecutionId = e.ExecutionId
		 
		SET @r = @@ROWCOUNT;		 
	END

	SET @r = 1;
	WHILE @r > 0
	BEGIN
		DELETE  TOP (100000) uow
		FROM ace.UnitOfWork uow
		JOIN @ExecutionId e 
		ON uow.ExecutionId = e.ExecutionId
		 
		SET @r = @@ROWCOUNT;		 
	END

END





