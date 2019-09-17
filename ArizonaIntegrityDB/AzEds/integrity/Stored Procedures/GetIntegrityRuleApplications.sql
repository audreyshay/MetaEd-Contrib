-- =============================================
--Author: rchinta     
--Create date: 07/17/2015
--Description:  Get Rule Applications
-- to run SP : exec [Integrity].[GetIntegrityRuleApplications] 
-- RC  6/23/2016 - Adding IntegrityRuleType and joining to FIScalYear table to Get rule app for that FY only
-- RC  8/29/2016 - joining to Executionid's FiscalYear and Pulling rule app based on Executionid
-- BA  7/22/2017 - changed logic to join on ExecutionProcessSubType to filter the rule apps relavant for the execution
-- =============================================
CREATE PROCEDURE [integrity].[GetIntegrityRuleApplications] 
@executionid int
AS
BEGIN

		SELECT		
			  RuleApplicationName, 
              IRT.IntegrityRuleTypeId,
			  IRT.Description as IntegrityType,
			  IRT.IntegrityRuleEntityName  
			  FROM process.Execution (nolock) E
			  INNER JOIN process.ExecutionProcessSubType EPST
						ON EPST.ExecutionId = E.ExecutionId
			  INNER JOIN integrity.IntegrityType (nolock) IT
						ON IT.IntegrityTypeId = EPST.ProcessSubTypeId
			  INNER JOIN integrity.integrityRuletype (nolock)  IRT
						ON IRT.IntegrityTypeId = IT.IntegrityTypeId
			  INNER JOIN integrity.IntegrityRuleApplication (nolock) IRA 
						ON	IRA.IntegrityRuleTypeId = IRT.IntegrityRuleTypeId
						AND IRA.FiscalYear = E.FiscalYear 
		WHERE E.ExecutionId = @executionid

END
GO