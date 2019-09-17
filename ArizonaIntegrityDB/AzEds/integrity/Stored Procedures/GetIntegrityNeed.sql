/************************************************************
**Procedure Name: Integrity.GetIntegrityNeed
**
**Author: Rohith Chintamaneni
**
**Description:  Gets the IntegrityNeed for each RuleType
**	
**Revision History:
**	Who			When		What
**	RC			06/30/2015	Initial Creation
**	RC			10/6/2015	Bringing only those records that will be processed for that process.[ExecutionProcessSubType] associated with that execution
***************************************************************/
CREATE PROCEDURE [integrity].[GetIntegrityNeed]
	@ExecutionID INT
AS
BEGIN

	SELECT IntegrityNeedId, INS.FiscalYear, INS.IntegrityRuleTypeId, INS.IsIntegrityNeeded, INS.StudentUSI, INS.SchoolId, INS.SchoolEntryDate
	FROM [integrity].[IntegrityNeed] INS
	INNER JOIN [integrity].[IntegrityRuleType] IRT on IRT.IntegrityRuleTypeId = INS.IntegrityRuleTypeId
	INNER JOIN [process].[ExecutionProcessSubType] EPT on EPT.ProcessSubTypeId = IRT.IntegrityTypeId
	INNER JOIN [process].Execution E on EPT.ExecutionID = E.ExecutionID
	WHERE  E.ExecutionId = @ExecutionId and INS.[IsIntegrityNeeded] = 1 
	ORDER BY INS.IntegrityRuleTypeId, INS.StudentUSI

END


