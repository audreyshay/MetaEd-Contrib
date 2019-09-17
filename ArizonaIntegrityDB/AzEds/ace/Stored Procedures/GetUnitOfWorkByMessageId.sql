/********************************************************************************************************
**Procedure Name:
**      ace.GetUnitOfWorkByMessageId
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Get the GetUnitOfWork for ACE calculation
**               
**Input:
**       ExecutionId, MessageId
**
**Output:
**	This procedure returns Unit of Work for ACE
**
**Returns:
**
**Implementation:
**	Used to get Unit of work for ACE calculation
**
**Revision History:
**	Who					When		What
**	Viju Viswanathan	05/12/2016	Initial Creation
**********************************************************************************************************/
CREATE PROCEDURE [ace].[GetUnitOfWorkByMessageId]
	@ExecutionId INT, 
	@MessageId NVARCHAR(36)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT StudentUSI, SchoolId, ADM, SPED, ELL  FROM  [ace].[UnitOfWork] 
		WHERE	[ExecutionId] = @ExecutionId AND
				[MessageId] = @MessageId
		ORDER BY  StudentUSI, SchoolId

END