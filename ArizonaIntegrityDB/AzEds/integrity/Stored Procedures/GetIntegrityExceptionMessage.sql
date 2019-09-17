/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetIntegrityExceptionMessage]
**
**Author:
**      Vinoth
**
**Description:  
**	Get Integrity Exception Message for integrity Dynamic rule processing  
**               
**Input:
**
**Output:
**	Integrity Exception Message for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Integrity Exception Message for integrity processing  
**
**Revision History:
**	Who					When		What
**	Vinoth				11/21/2017	Initial Creation
**  
*******************************************************************************************************************/

CREATE PROCEDURE [integrity].[GetIntegrityExceptionMessage]
AS
BEGIN
	
	Select ExceptionMessageCode,Description from [integrity].[IntegrityExceptionMessage]

END


GO
