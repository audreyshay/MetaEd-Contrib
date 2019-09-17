/************************************************************
**Procedure Name: process.GetExecutionEducationOrgIds
**
**Author: kalyani kankatala
**
**Description:  Gets list of EducationalOrganizations selected that matches the parameter executionId
**	
**Revision History:
**	Who			When		What
**	KK			06/22/2015	Initial Creation
**
***************************************************************/
CREATE PROCEDURE [process].[GetExecutionEducationOrgIds]
	@executionId INT
   
AS
BEGIN
	SELECT ExecutionId
		  ,EducationOrganizationId
		  ,FiscalYear
	FROM process.ExecutionEducationOrganization
	WHERE ExecutionId = @executionId
END