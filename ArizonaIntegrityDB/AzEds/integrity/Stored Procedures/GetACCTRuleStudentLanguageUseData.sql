/********************************************************************************************************
**Procedure Name:
**      integrity.GetACCTRuleStudentLanguageUseData
**
**Author:
**      Vinoth K
**
**Description:  
**	Get Student Language use  Data for integrity processing  
**               
**Input:
**
**Output:
**	Student Language use Information Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Student Language use Data for integrity processing  
**
**Revision History:
**	Who					When		What
**	Vinoth K			08/27/2018	Initial Creation
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[GetACCTRuleStudentLanguageUseData]
	@ExecutionId int,
	@MessageId as [nvarchar](36)
AS

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  

BEGIN 
	--Student Accountability Information Data
	SELECT DISTINCT 
		S.StudentUSI,
		SL.LanguageDescriptorId,
		SL.LanguageUseTypeId                    
	FROM  
	    [integrity].[vw_GetIntegrityHistoryPerExecution] ih
		
		JOIN leadata.Student S ON 
			(
				ih.StudentUSI = S.StudentUSI AND
				ih.IntegrityRuleTypeId in (3,15)  -- Bring data only for Accountability and Accountability Non-Payment
			)
		JOIN leadata.StudentLanguageUse SL ON
			(S.StudentUSI = SL.StudentUSI)
		
	WHERE  
		ih.Executionid = @ExecutionId AND 
		ih.messageid = @MessageId	
END
GO


