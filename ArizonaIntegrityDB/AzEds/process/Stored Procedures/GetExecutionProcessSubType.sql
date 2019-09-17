/************************************************************
**Procedure Name: process.GetExecutionProcessSubType
**
**Author: kalyani kankatala
**
**Description:  Gets list of ProcessSubTypes(Regular,SPED,ELL) that matches the parameter executionId
**	
**Revision History:
**	Who			When		What
**	KK			06/22/2015	Initial Creation
**
***************************************************************/
CREATE PROCEDURE [process].[GetExecutionProcessSubType]
	@executionId INT
   
AS
BEGIN
	SELECT ExecutionId
      ,ProcessSubTypeId
	FROM process.ExecutionProcessSubType 
	WHERE ExecutionId=@executionId
END