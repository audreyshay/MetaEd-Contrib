/********************************************************************************************************
**Procedure Name:
**      process.StudentEducationOrganizationErrorLog
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Inserts Log
**               
**Input:
**       process.StudentEducationOrganizationErrorLogTableType User Defined Table type
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
CREATE PROCEDURE [process].[InsertStudentEducationOrganizationErrorLog]
	@StudentEducationOrganizationErrorLog AS process.StudentEducationOrganizationErrorLogTableType READONLY
AS
BEGIN
	SET NOCOUNT ON;
	--Insert the Exectution Log	

			INSERT INTO [process].[StudentEducationOrganizationErrorLog]
				SELECT	[ExecutionId],
						[StudentUSI],
						[EducationOrganizationId],
						[FiscalYear],
						[LogDateTime],
						[Message]
				FROM	@StudentEducationOrganizationErrorLog;
END