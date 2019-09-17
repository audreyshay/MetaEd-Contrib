/************************************************************************************************************************
**Procedure Name: [ace].[vw_ADMBySchoolGrade]
**
**Author: Britto Augustine
**
**Description: View to get the 40th, 100th, 200th and the Year End ADM by DOR, DOA and School. 
**             View is used by reconcilaition reports and dashboard
**	
**Revision History:
**	Who						When		What
**	Britto Augustine		08/19/2016	Initial Creation
**  
***************************************************************************************************************************/
CREATE VIEW [ace].[vw_ADMBySchoolGrade]
AS

	WITH 
	cteTotal_ADM AS
	(
		SELECT
			DataCaptureDateTime, 
			ACEExecutionId,
			ADMIntegrityExecutionId,
			FiscalYear,
			AttendingLocalEducationAgencyId,	 
			ResidentEducationOrganizationId,
			SchoolId,
			GradeLevelTypeId,
			AggregationTypeId,
			FTFStatus,
			[1] as '40thDayADM', 
			[5] as '100thDayADM', 
			[6] as '200thDayADM'
		FROM
			(
				SELECT
				   E.DataCaptureDateTime,
				   E.ACEExecutionId,
				   E.ADMIntegrityExecutionId,
				   MS.FiscalYear,
				   MS.AttendingLocalEducationAgencyId,	 
				   MS.ResidentEducationOrganizationId,
				   MS.SchoolId,
				   MS.GradeLevelTypeId,
				   MS.AggregationTypeId,
				   MS.FTFStatus,
				   MS.ReportingPeriodId,
				   ROUND(SUM(MS.LimitedAverageDailyMembership),4) AS 'TOTAL_ADM'
				FROM [ace].[MembershipSummary] MS WITH(NOLOCK)
				JOIN [ace].[vw_ACEExecution] E
					ON E.ACEExecutionId = MS.ExecutionId		
				WHERE   MS.AggregationTypeId IN (1,2,3,4)	-- B&M, AOI, GCD, DRP 
					AND MS.ADMTypeId = 1					-- Regular ADM
					AND MS.FundingTypeId IN (1,2)			
					AND MS.ReportingPeriodId IN (1,5,6)
				GROUP BY
				   E.DataCaptureDateTime, 
				   E.ACEExecutionId,
				   E.ADMIntegrityExecutionId,
				   MS.FiscalYear,
				   MS.AttendingLocalEducationAgencyId,	 
				   MS.ResidentEducationOrganizationId,
				   MS.SchoolId,
				   MS.GradeLevelTypeId,
				   MS.ReportingPeriodId,
				   MS.AggregationTypeId,
				   MS.FTFStatus
			) P
			PIVOT
			(
				MAX(TOTAL_ADM)
				FOR ReportingPeriodId IN ([1], [5], [6])
			) AS SRC
		WHERE 
			([1] IS NOT NULL OR [5] IS NOT NULL OR [6] IS NOT NULL)
	),

	cteYE_ADM as
	(
			SELECT
				E.DataCaptureDateTime,
				E.ACEExecutionId,
				E.ADMIntegrityExecutionId,
				MS.FiscalYear,
				MS.AttendingLocalEducationAgencyId,	 
				MS.ResidentEducationOrganizationId,
				MS.SchoolId,
				MS.GradeLevelTypeId,
				MS.AggregationTypeId,
				MS.FTFStatus,
				ROUND(SUM(MS.LimitedAverageDailyMembership),4) AS 'YE_ADM'
			FROM [ace].[MembershipSummary] MS WITH(NOLOCK)
			JOIN [ace].[vw_ACEExecution] E
				ON E.ACEExecutionId = MS.ExecutionId		
			WHERE   MS.AggregationTypeId IN (1,2,3,4)	-- B&M, AOI, GCD, DRP 
				AND MS.ADMTypeId = 1					-- Regular ADM
				AND MS.FundingTypeId IN (1,2)			
				AND MS.ReportingPeriodId IN (5,6)
			GROUP BY
  			    E.DataCaptureDateTime, 
				E.ACEExecutionId,
				E.ADMIntegrityExecutionId,
				MS.FiscalYear,
				MS.AttendingLocalEducationAgencyId,	 
				MS.ResidentEducationOrganizationId,
				MS.SchoolId,
				MS.GradeLevelTypeId,
				MS.AggregationTypeId,
				MS.FTFStatus
	)

	SELECT 
			t.DataCaptureDateTime, 
			t.ACEExecutionId,
			t.ADMIntegrityExecutionId,
			t.FiscalYear,
			t.AttendingLocalEducationAgencyId,	 
			t.ResidentEducationOrganizationId,
			t.SchoolId,
			t.GradeLevelTypeId,
			glt.CodeValue as 'GradeLevel',
			t.AggregationTypeId,
			t.FTFStatus,
			isnull(t.[40thDayADM], 0)  as '40thDayADM',
			isnull(t.[100thDayADM], 0) as '100thDayADM', 
			isnull(t.[200thDayADM], 0) as '200thDayADM',
			isnull(ye.YE_ADM, 0)	   as 'YearEndADM'
	FROM cteTotal_ADM t
	JOIN cteYE_ADM ye
		  ON t.ACEExecutionId = ye.ACEExecutionId
		 AND t.AttendingLocalEducationAgencyId = ye.AttendingLocalEducationAgencyId
		 AND t.ResidentEducationOrganizationId = ye.ResidentEducationOrganizationId
		 AND t.SchoolId = ye.SchoolId
		 AND t.GradeLevelTypeId = ye.GradeLevelTypeId
		 AND t.AggregationTypeId = ye.AggregationTypeId
		 AND t.FTFStatus = ye.FTFStatus
	JOIN entity.GradeLevelType glt
		  ON glt.GradeLevelTypeId = t.GradeLevelTypeId

GO