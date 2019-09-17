/************************************************************ 
**Procedure Name: process.GetMessageIdsForExecutionId 
** 
**Author: Rohith Chintamaneni 
** 
**Description:  Gets the message ids for the execution id
**   
**Revision History: 
**  Who      When    What 
**  RC      11/05/2015  Initial Creation 
***************************************************************/ 
CREATE PROCEDURE [process].[GetMessageIdsForExecutionId] @ExecutionID INT
                                                              
AS 
  BEGIN 
     
	 Select ExecutionId,
			MessageId 
	 from  [process].[MessageLog]
	 Where [ExecutionId] = @ExecutionID



  END 