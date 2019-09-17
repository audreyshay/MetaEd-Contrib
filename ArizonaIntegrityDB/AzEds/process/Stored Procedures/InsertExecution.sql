/************************************************************
**Procedure Name: process.InsertExecution
**
**Author: Pallavi Mecconda
**
**Description:  Saves Execution record - including the process types and ed org when available
**	
**Revision History:
**	Who			When		What
**	PM			06/03/2015	Initial Creation
**	VIJU		07/13/2015	Modified to add Reference ExecutionId
**	VIJU		07/29/2015	Modified to add ExecutionId as output parameter
**  B Augustine 06/15/2017  Added dataLoadTypeId parameter
***************************************************************/
CREATE PROC [process].[InsertExecution] 
	@processTypeId INT
   ,@executionTypeId INT
   ,@initiatedDateTime DateTime = null
   ,@initiatedByUserName NVARCHAR(100)
   ,@fiscalYear INT
   ,@comment NVARCHAR(MAX)
   ,@edOrgList EdOrgTableType READONLY
   ,@processSubTypeList ProcessSubTypeTableType READONLY
   ,@referenceExecutionId INT = null
   ,@executionId INT = 0 OUTPUT
   ,@dataLoadTypeId INT = 3
AS
BEGIN
	
	SET NOCOUNT ON;	

	INSERT INTO [process].[Execution]
           ([ProcessTypeId]
           ,[ExecutionTypeId]
           ,[InitiatedDateTime]
           ,[InitiatedByUserName]
           ,[FiscalYear]
           ,[StatusTypeId]
           ,[Comment]
		   ,[ReferenceExecutionId]
		   ,[DataLoadTypeId])
     VALUES
           (@processTypeId
           ,@executionTypeId
           ,ISNULL(@initiatedDateTime,GETDATE())
           ,@initiatedByUserName
           ,@fiscalYear
           ,1
           ,@comment
		   ,@referenceExecutionId
		   ,@dataLoadTypeId)

	SET @executionId = SCOPE_IDENTITY()

	INSERT INTO ExecutionEducationOrganization(ExecutionId, EducationOrganizationId, FiscalYear)
	SELECT @executionId, EducationOrganizationId, FiscalYear 
	FROM @edOrgList	

	INSERT INTO ExecutionProcessSubType(ExecutionId, ProcessSubTypeId)
	SELECT @executionId, ProcessSubTypeId 
	FROM @processSubTypeList

END