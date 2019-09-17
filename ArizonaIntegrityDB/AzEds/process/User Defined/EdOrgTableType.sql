/************************************************************
**Table Type Name: process.EdOrgTableType
**
**Author: Pallavi Mecconda
**
**Description:  Creates EdOrgTableType type. 
**				used to update list of Ed Org selected for Execution
**	
**Revision History:
**	Who			When		What
**	PM			06/09/2015	Initial Creation
**
***************************************************************/
CREATE TYPE [process].[EdOrgTableType] AS TABLE
(
	EducationOrganizationId INT,
	FiscalYear INT
)
