/************************************************************
**Table Type Name: process.ProcessSubTypeTableType
**
**Author: Pallavi Mecconda
**
**Description:  Creates ProcessSubTypeTableType type. 
**				used to update list of Process Sub Types selected for Execution
**	
**Revision History:
**	Who			When		What
**	PM			06/09/2015	Initial Creation
**
***************************************************************/
CREATE TYPE [process].[ProcessSubTypeTableType] AS TABLE
(
	ProcessSubTypeId INT
)
