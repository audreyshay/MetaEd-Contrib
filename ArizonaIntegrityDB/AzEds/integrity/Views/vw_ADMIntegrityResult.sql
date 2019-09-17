/******************************************************************************************
** Script Name:[integrity].[vw_ADMIntegrityResult] 
**
** Author: Britto A
**
** Description: View to mark a student IntegrityPassed for ADM, STATE SPED, STATE ELL
**       
** Revision History: Created -Britto A

** Pratibha K	03/19/2018	Added cteExecutionList to get latest execids for 915 & Statewide for each FY.
** Pratibha K	04/19/2018	Removed cteExecutionList logic since the integrity history will be cleaned (rolled back the change)
** Pratibha K	04/25/2018	Added DRP IntegrityRuleType in ADMIntegrityResult to mark the student, ADM passed or failed 
** Amit R		06/04/2018  Added where clause to exclude IntegrityResultType = 3 records from History
********************************************************************************************/
CREATE VIEW [integrity].[vw_ADMIntegrityResult] 
AS
	--rank the integrity history by desc order of integrityhistoryid, so we can look at the latest integrity history result.
	--reason for ranking is so when delta or 915 integrity is run then the older results go to the bottom and the newer ones are on top
	WITH cteRankedADMIntegrityHistory AS
	(
		SELECT
			Row_Number() OVER(Partition by ind.FiscalYear, ind.IntegrityRuleTypeId, ind.StudentUSI, ind.SchoolId, ind.SchoolEntryDate order by ih.IntegrityHistoryId desc) AS RankNumber,
			ih.IntegrityHistoryId, ind.IntegrityNeedId, ind.IntegrityRuleTypeId, ih.IntegrityResultTypeId, ih.FiscalYear, ind.StudentUSI, ind.SchoolId, ind.SchoolEntryDate 
		FROM integrity.IntegrityHistory as ih
			JOIN integrity.IntegrityNeed as ind
				ON ind.IntegrityNeedId = ih.IntegrityNeedId
			   AND ind.FiscalYear = ih.FiscalYear
			JOIN integrity.IntegrityRuleType irt
				ON irt.IntegrityRuleTypeId = ind.IntegrityRuleTypeId
               AND irt.IntegrityTypeId IN (4,5,6) and ih.IntegrityResultTypeId <> 3  --All State Funding Integrity rules: Membership, Attendance, Accountability, State ELL, State SPED, DRP , GCD etc. 
	),

	--from the above rankedIntegrityHistory transform the result type id to pass or fail for top ranked ADM rules records
	cteADMIntegrityResut as 
	(
		SELECT FiscalYear, StudentUSI, SchoolId, 
				CASE WHEN MAX(IntegrityResultTypeId) = 2 
							THEN 0 
							ELSE 1 
						END AS IsStateFundingADMIntegrityPassed
		FROM cteRankedADMIntegrityHistory
		WHERE RankNumber = 1 
			AND IntegrityRuleTypeId in (1,2,3,4)					--membership, attendance, accountability, DRP rules
			AND IntegrityResultTypeId in (1,2)						--from the ranked dataset ignore no data result type (3)
		GROUP BY FiscalYear, StudentUSI, SchoolId
	),

	--from the above rankedIntegrityHistory transform the result type id to pass or fail for top ranked SPED rules records
	cteSPEDIntegrityResut as 
	(
		SELECT FiscalYear, StudentUSI, SchoolId, 
				CASE WHEN MAX(IntegrityResultTypeId) = 2 
							THEN 0 
							ELSE 1 
						END AS IsStateFundingSPEDIntegrityPassed
		FROM cteRankedADMIntegrityHistory
		WHERE RankNumber = 1 
			AND IntegrityRuleTypeId = 6								--State SPED rules
			AND IntegrityResultTypeId in (1,2)						--from the ranked dataset ignore no data result type (3)
		GROUP BY FiscalYear, StudentUSI, SchoolId
	),

	--from the above rankedIntegrityHistory transform the result type id to pass or fail for top ranked ELL rules records
	cteELLIntegrityResut as 
	(
		SELECT FiscalYear, StudentUSI, SchoolId, 
				CASE WHEN MAX(IntegrityResultTypeId) = 2 
							THEN 0 
							ELSE 1 
						END AS IsStateFundingELLIntegrityPassed
		FROM cteRankedADMIntegrityHistory
		WHERE RankNumber = 1 
			AND IntegrityRuleTypeId = 7								--State ELL rules
			AND IntegrityResultTypeId in (1,2)						--from the ranked dataset ignore no data result type (3)
		GROUP BY FiscalYear, StudentUSI, SchoolId
	)

	--return results for the view 
	SELECT adm.FiscalYear, adm.StudentUSI, adm.SchoolId, 
		   adm.IsStateFundingADMIntegrityPassed, sped.IsStateFundingSPEDIntegrityPassed, ell.IsStateFundingELLIntegrityPassed
	FROM cteADMIntegrityResut as adm
	LEFT JOIN cteELLIntegrityResut as ell
		ON adm.FiscalYear = ell.FiscalYear
	   AND adm.StudentUSI = ell.StudentUSI
       AND adm.SchoolId = ell.SchoolId
	LEFT JOIN cteSPEDIntegrityResut as sped
		ON adm.FiscalYear = sped.FiscalYear
	   AND adm.StudentUSI = sped.StudentUSI
       AND adm.SchoolId = sped.SchoolId        	
GO	
