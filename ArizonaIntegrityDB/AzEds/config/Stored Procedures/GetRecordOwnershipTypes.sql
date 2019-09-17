/************************************************************
**Procedure Name: config.GetRecordOwnershipTypeList
**
**Author: Britto Augustine
**
**Description:  Gets the record ownership type id and the aggregate root entity name list. 
**				USed by REST API to map the aggregate root entity name to record owenrship id so it can insert into recordownership table
**	
**Revision History:
**	Who				When		What
**	B Augustine		05/23/2017	Initial Creation
**  Vinoth K		02/04/2019  We are adding the Student education Organization resources back for 2020, as root entity is same for 2017 Student DOR
								as well as Student education Organization for 2020. So we need to add the fiscal year condition to get the two different list.
								Rest API 5.0 onwards FY param will be send the values, pervious years will not be pass any value to avoid any redpeloyment code on pervious year code
								which will be default to null.

***************************************************************/
CREATE PROC [config].[GetRecordOwnershipTypes]
@FiscalYear INT = NULL
AS
BEGIN

IF (@FiscalYear IS NULL)
	BEGIN
		 SELECT 
			rort.RecordOwnershipTypeId,  
			ro.Description as RecordOwnershipDescription,
			rort.ResourceTypeId,
			rt.AggregateRootEntityName
		 FROM [leadata].[RecordOwnershipTypeResourceTypeAssociation] rort (nolock)
		 JOIN [config].[ResourceType] (nolock) rt
		   ON rt.ResourceTypeId = rort.ResourceTypeId
		 JOIN [leadata].[RecordOwnershipType] ro (nolock)
		   ON ro.RecordOwnershipTypeId = rort.RecordOwnershipTypeId
	 		where  BeginFiscalYear <2020 or BeginFiscalYear is nuLL


	END
ELSE
	BEGIN
		SELECT 
			rort.RecordOwnershipTypeId,  
			ro.Description as RecordOwnershipDescription,
			rort.ResourceTypeId,
			rt.AggregateRootEntityName
		 FROM [leadata].[RecordOwnershipTypeResourceTypeAssociation] rort (nolock)
		 JOIN [config].[ResourceType] (nolock) rt
		   ON rt.ResourceTypeId = rort.ResourceTypeId
		 JOIN [leadata].[RecordOwnershipType] ro (nolock)
		   ON ro.RecordOwnershipTypeId = rort.RecordOwnershipTypeId
	 		where  BeginFiscalYear is NULL
			or @FiscalYear BETWEEN [BeginFiscalYear] AND ISNULL([EndFiscalYear], 9999)
	END
	 
END
