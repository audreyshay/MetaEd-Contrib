/************************************************************************************************************************
**Procedure Name: [ace].[vw_ACEExecution]
**
**Author: Britto Augustine
**
**Description: View to get the ACE execution id and corresponding ADM Integrity Execution id and the Integrity start date as data capture date.
**			   View is used by other ace views,reconcilaition reports and dashboard
**	
**Revision History:
**	Who						When		What
**	Britto Augustine		08/19/2016	Initial Creation
**  
***************************************************************************************************************************/
CREATE VIEW [ace].[vw_ACEExecution]
	AS 
		
	SELECT 
		AE.ExecutionId			as 'ACEExecutionId', 
		IE.ExecutionId			as 'ADMIntegrityExecutionId',
		IE.InitiatedDateTime	as 'DataCaptureDateTime'
	FROM process.Execution AE		--ACE execution
	JOIN process.Execution IE		--Integrity Execution
		ON IE.ExecutionId = AE.ReferenceExecutionId
	   AND AE.ProcessTypeId = 2					-- ACE process type
	   AND AE.StatusTypeId = 6					-- ACE Successfull
	   AND IE.ProcessTypeId = 1					-- ADM Integrity process type
	   AND IE.StatusTypeId = 6					-- ADM Integrity Successfull

GO
