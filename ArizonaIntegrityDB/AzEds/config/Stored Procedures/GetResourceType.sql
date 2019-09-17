/************************************************************
**Procedure Name: config.GetResourceType
**
**Author: Britto Augustine
**
**Description:  Gets the resource types 
**	
**Revision History:
**	Who				When		What
**	B Augustine		07/14/2015	Initial Creation
**  B Augustine     4/5/2017    Added no lock, because I noticed that some calls to this proc 
**                              from the REST API were taking too long
**  B Augustine     5/23/2017   added addtional column AggregateRootEntityName
**  M Killens       12/12/2017  Adding fiscal year
**  Vinoth K        03/06/2019  Adding the Request Type which helps API to determin what kind of request type this resource belongs too.
***************************************************************/
CREATE PROC [config].[GetResourceType]
   @FiscalYear INT = NULL
AS
BEGIN

	 SELECT 
		[ResourceTypeId],  
		[Resource],
		[RequestBodyPropertyNameToExtractEducationOrganizationId],
		[AggregateRootEntityName],
		[BeginFiscalYear],
		[EndFiscalYear],
		[RequestTypeId]
	 FROM [config].[ResourceType] rt (nolock)
	WHERE @FiscalYear BETWEEN ISNULL([BeginFiscalYear], @FiscalYear) AND ISNULL([EndFiscalYear], 9999) 	
END