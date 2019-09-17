/********************************************************************************************************
**Procedure Name:
**      process.InsertExecutionEducationOrganizationLog
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Inserts Log
**               
**Input:
**       process.ExecutionEducationOrganizationLogTableType User Defined Table type
**
**Output:
**	None
**
**Returns:
**
**Implementation:
**	Used by AzEDS ACE Calculation  
**
**Revision History:
**	Who						When		What
**	Viju Viswanathan		07/06/2015	Initial Creation
**********************************************************************************************************/
CREATE PROCEDURE [process].[InsertExecutionEducationOrganizationLog]
	@ExecutionEducationOrganizationLog AS process.ExecutionEducationOrganizationLogTableType READONLY
AS
BEGIN
	SET NOCOUNT ON;
	--Insert the Execution Education Organization Error Log	
	MERGE INTO [process].[ExecutionEducationOrganizationLog] AS TAR
		USING @ExecutionEducationOrganizationLog AS SRC
	ON TAR.[ExecutionId] = SRC.[ExecutionId]
		AND TAR.[EducationOrganizationId] = SRC.[EducationOrganizationId]
		AND TAR.[FiscalYear] = SRC.[FiscalYear]
		AND TAR.[RecordCountTypeId] = SRC.[RecordCountTypeId]
	WHEN MATCHED THEN 
		UPDATE SET TAR.[RecordCount] = TAR.[RecordCount] + SRC.[RecordCount]
	WHEN NOT MATCHED  BY TARGET THEN
		INSERT (ExecutionId, 
				EducationOrganizationId, 
				FiscalYear, 
				RecordCountTypeId, 
				RecordCount
				)
		VALUES (SRC.ExecutionId, 
				SRC.EducationOrganizationId, 
				SRC.FiscalYear, 
				SRC.RecordCountTypeId, 
				SRC.RecordCount
				);
END