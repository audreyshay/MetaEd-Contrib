/***********************************************************************************************************
**Procedure Name:
**      report.ELL20_GetReportELLADM
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Gives Total ELL ADM for different Reporting periods
**   
**Input:
**	@LEAId - DOR district to filter upon
**  @FiscalYear - Fiscal year to filter upon
**	@ExecutionID - latest Aggregation Execution ID to filter upon  
**
**Output:
**  
**Returns:
**	@@Error
**
**Implementation:
**	Called from ELL20ELLADM.rdl (ELL ADM Report)
**
**Revision History:
**	P Kanyar	07/11/2016	Initial creation
**	P Kanyar	07/25/2016	Fixed bug 152274, truncating Program service descriptions
**  Amit Verma  09/15/2016	Fixed bug 158847, Non AOI numbers are incorrect and not matching ELL20
**  Amit Verma  09/20/2016  Updated the condition from FundingTypeId IN (1,2) to IsFundable = 1
**  Amit Verma  04/17/2017  Commented the Group By clause for AggregationTypeId and IsFundable
**
****************************************************************************************************************/

CREATE PROC [report].[ELL20_GetReportELLADM]
	@LEAId INT, 
	@FiscalYear INT,
	@ExecutionID INT			-- latest Aggregation Execution ID coming from GetAllExecIdDataCaptureDate stored proc

AS
BEGIN

--DECLARE 
--@LEAId INT = 4448, --4242, 
--	@FiscalYear INT = 2016,
--	@ExecutionID INT = 3328 --3464, 3451


SET NOCOUNT ON;

  SELECT 
       ExecutionId
      ,ms.FiscalYear
      ,ADMTypeId
      ,MIN(ReportingPeriodTypeId)					AS ReportingPeriodTypeId
      ,ReportingPeriodId
      ,ResidentEducationOrganizationId
      ,ProgramServiceDescriptorId
	  ,CASE WHEN ProgramServiceDescriptorId IN(11734,11735,11736)  THEN 1
			WHEN ProgramServiceDescriptorId IN (11638,11639,11640) THEN 2
			WHEN ProgramServiceDescriptorId = 11666				   THEN 3
			END	AS ServiceGroup
	  ,LEFT(d.Description,47)						
	  AS Description
      ,ROUND(SUM(LimitedAverageDailyMembership),4)	AS TotalADM
  FROM 
	  ace.MembershipSummary ms WITH(NOLOCK)
			INNER JOIN
	  leadata.Descriptor d WITH(NOLOCK) ON d.DescriptorId = ms.ProgramServiceDescriptorId
				AND d.FiscalYear = ms.FiscalYear
			INNER JOIN 
	  ace.FundingType ft WITH(NOLOCK) ON ms.FundingTypeId = ft.FundingTypeId

  WHERE 
	  ADMTypeId = 3																		-- ELL
		--AND AggregationTypeId = 6														-- ELL 
		AND ResidentEducationOrganizationId = @LEAId
		AND ms.FiscalYear = @FiscalYear
		AND ms.ExecutionId = @ExecutionID
		--AND FundingTypeId IN (1,2)														-- FUNDABLE
		AND ft.IsFundable = 1															-- FUNDABLE
		AND ProgramServiceDescriptorId IN (11734,11735,11736,11638,11639,11640,11666)	-- ELL SERVICES
		AND ReportingPeriodId IN (1,5,6)												-- 40TH, 100TH, 200TH REPORTING PERIODS
		AND GradeLevelTypeId <> -1
  GROUP BY
	   ExecutionId
      ,ms.FiscalYear
      ,ADMTypeId
      --,AggregationTypeId
      --,ReportingPeriodTypeId
      ,ReportingPeriodId
      ,ResidentEducationOrganizationId
      --,ft.IsFundable
      ,ProgramServiceDescriptorId
	  ,d.Description
  ORDER	BY
		 ServiceGroup
		,ProgramServiceDescriptorId	
END

/* end report.ELL20_GetReportELLADM */