/******************************************************************************************
**Procedure Name:
**      [report].[GetAggregationIdRunDate]
**
**Author:
**      Pratibha kanyar
**
**Description:  
**	Gets Execution Ids and Initiated Time for Aggregation process
**               
**Input:
**	@FiscalYear   - Fiscal Year the report is executed for
**
**Returns:
**
**Implementation:
**	Used for ACE15ACE Errors report
**
**Revision History:
**	Who				When		What
**	P Kanyar		05/13/2016	Initial Creation
**  L Ranginani		06/03/2016  Removed the failed StatusTypeID
**  Amit Verma		09/02/2016	Deducted the 7 hours from the InitiatedDateTime
***********************************************************************************************/
CREATE PROC [report].[GetAggregationIdRunDate]
	@FiscalYear int
	
AS
BEGIN

SET NOCOUNT ON;

	SELECT	
		 ExecutionId
		,InitiatedDateTime
		,CONVERT (VARCHAR(10),E.ExecutionId) + ' - ' + CONVERT (VARCHAR(10), DATEADD("hh", -7,E.InitiatedDateTime), 101) AS AggregationRun
	FROM 
		process.Execution E with (nolock)
	WHERE 
		ProcessTypeId = 2						--Aggregation type
			AND StatusTypeId  = 6			-- completed status
			AND FiscalYear = @FiscalYear
	ORDER BY 
		ExecutionId DESC
END