/********************************************************************************************************
**Procedure Name:
**      [report].[SPED20_GetReportSPED]
**
**Author:
**		Amit Verma
**
**Description:  
**	Get SPED28 Data
**            
**Input:
**	@ExcecutionId         - ExecutionId from ACE Summary
**	@LocalEducationAgency - District the report is executed for
**	@FiscalYear	          - FiscalYear to filter upon
**
**Returns:
**
**Implementation:
**	Used by Excessive Absence Report stored proc in AzEDS db
** 
**Revision History:
**	Who			When		What
**	Amit Verma	06/10/2016	Initial Creation 
**	P Kanyar	07/11/2016	Changed filter to ReportingPeriodId IN (1,5,6)
**	Amit Verma	07/14/2016	Removed ReportingPeriod & ReportingPeriodType joins
**  Amit Verma  08/25/2016  Removed the hard code logic to define the Groups and 
**							Self Contained Flag for ProgramServiceDescriptors
**  Amit Verma  09/05/2016  Added the FundinyTypeId Filter in the report dataset
**  Amit Verma  09/15/2016	Fixed bug 158848, Non AOI numbers are incorrect and not matching SPED20
**  Amit Verma  09/16/2016  Added the filter to get SPED Fundable Need only
**  Amit Verma  09/20/2016  Updated the condition from FundingTypeId IN (1,2) to IsFundable = 1
**  Amit Verma  11/22/2016  Fixing Reporting Period 5 for 200 day school calender bug
**
*******************************************************************************************************/

CREATE PROCEDURE [report].[SPED20_GetReportSPED]  
	@ExcecutionId INT,
	@LocalEducationAgency  INT,
	@FiscalYear as INT

AS
BEGIN 

    SET NOCOUNT ON;
	
	
	/* Calculate Limited ADM and Load in #TempSPEDADM Table */  	  
	SELECT CASE WHEN ResourceWeight <> SelfContainedWeight 
				     AND IsSelfContained = 1 THEN D.Description + ' - SC' 
				WHEN ResourceWeight <> SelfContainedWeight 
				     AND IsSelfContained = 0 THEN D.Description + ' - R' 
				ELSE D.Description 
			END																		AS 'Disability Category', 
			DescriptorId, 
			SUM(ACE.LimitedAverageDailyMembership)									AS LimitedAverageDailyMembership, 
			SPEDSCF.IsSelfContained, 
			SPED.ResourceWeight, 
			SPED.SelfContainedWeight, 
			ACE.ReportingPeriodId													AS ReportingPeriod, 
			MIN(ACE.ReportingPeriodTypeId)											AS ADMType ,
			ACE.FiscalYear
	INTO   #TempSPEDADM 
	FROM   ace.MembershipSummary ACE WITH (NOLOCK) 
	           JOIN ace.FundingType FT										-- To Check if FundingTypeId is Fundable or not
			     ON ACE.FundingTypeId = FT.FundingTypeId
		       JOIN config.SPEDNeedSupportLevelWeight SPED WITH (NOLOCK)
		         ON ACE.FiscalYear = SPED.FiscalYear 
		            AND ACE.GradeLevelTypeId = SPED.GradeLevelTypeId 
		            AND ACE.ProgramServiceDescriptorId = SPED.StudentNeedDescriptorId 
		       JOIN leadata.Descriptor D WITH (NOLOCK) 
		         ON ACE.ProgramServiceDescriptorId = D.DescriptorId 
		            AND ACE.FiscalYear = D.FiscalYear 
		       JOIN config.SPEDServiceCodeFundability SPEDSCF WITH (NOLOCK) 
		         ON SPEDSCF.FiscalYear = SPED.FiscalYear 
		            AND SPEDSCF.GradeLevelTypeId = SPED.GradeLevelTypeId 
		            AND SPEDSCF.ServiceCodeDescriptorId = ACE.ServiceCodeDescriptorId 
			   JOIN leadata.StudentNeedDescriptor SND
			        ON ACE.ProgramServiceDescriptorId = SND.StudentNeedDescriptorId
	WHERE  ACE.ADMTypeId = 2 
	       AND SND.StudentNeedCategoryTypeId = 1
		   AND SPEDSCF.IsSPEDFundable = 1
	       AND ACE.ExecutionId = @ExcecutionId 
	       AND ACE.ResidentEducationOrganizationId = @LocalEducationAgency 
		   AND ACE.FiscalYear = @FiscalYear
	       AND ACE.ReportingPeriodId IN ( 1, 5, 6 )
		   AND FT.IsFundable = 1											-- To Check if FundingTypeId is Fundable or not
		   --AND ACE.FundingTypeId IN (1,2)
	GROUP  BY D.Description, 
	          DescriptorId, 
			  ACE.FiscalYear,
	          ACE.ReportingPeriodId, 
	          --ACE.ReportingPeriodTypeId, 
	          SPEDSCF.IsSelfContained, 
	          SPED.ResourceWeight, 
	          SPED.SelfContainedWeight
	ORDER  BY [Disability Category],
			  ReportingPeriod,
			  DescriptorId 


    /* Calculate Self-Contained and Resource ADM in #TempPivot Table */
	SELECT [Disability Category], 
	       DescriptorId, 
	       [0] AS ResourceADM, 
	       [1] AS SelfContainedADM, 
	       ReportingPeriod, 
	       ADMType, 
	       ResourceWeight, 
	       SelfContainedWeight, 
		   FiscalYear 
	INTO   #TempPivot 
	FROM   #TempSPEDADM 
	       PIVOT( SUM(LimitedAverageDailyMembership) FOR IsSelfContained IN([0], [1]) 
		        ) AS A 

	SELECT [Disability Category], 
	       DescriptorId, 
	       SUM(ResourceADM) AS ResourceADM, 
	       SUM(SelfContainedADM) AS SelfContainedADM, 
	       ReportingPeriod, 
	       MIN(ADMType) AS ADMType, 
	       ResourceWeight, 
	       SelfContainedWeight, 
		   FiscalYear 
	INTO   #TempPivotMin
	FROM   #TempPivot 
	GROUP BY [Disability Category], 
	         DescriptorId,
	         ReportingPeriod,
	         ResourceWeight, 
	         SelfContainedWeight, 
		     FiscalYear 

    /* Create #TempSPEDRpt Table having Disability categories with Group Ids*/
	-- report.ReportSPED20CategoryGroup Table has the ProgramServiceDescriptors with SelfContained Flag and Groups assigned to different ProgramServiceDescriptors

	SELECT CASE WHEN RSC.IsSelfContained IS NOT NULL THEN  D.Description +' - ' + CAST(CASE WHEN RSC.IsSelfContained = 1 THEN 'SC' 
                                                                                   WHEN RSC.IsSelfContained = 0 THEN 'R' 
																			  ELSE NULL  END AS NVARCHAR(10))
            ELSE D.Description END AS [Disability Category],
			RSC.ReportingPeriodId, 
			RSC.Groups
	INTO #TempSPEDRpt
	FROM report.ReportSPED20CategoryGroup RSC
	     JOIN leadata.Descriptor D
		   ON RSC.ProgramServiceDescriptorId = D.DescriptorId
		      AND RSC.FiscalYear = D.FiscalYear
		      AND D.FiscalYear = @FiscalYear
    

	/* Create #TempFinal Table having Disability categories Data with Reporting Period and Groups*/
	SELECT TD.[Disability Category], 
           DescriptorId,
	       CASE 
	         WHEN TDSRT.[Disability Category] LIKE '%- R%' THEN ResourceWeight 
	         ELSE SelfContainedWeight 
	       END AS SPEDWeight, 
	       TDSRT.ResourceADM, 
	       TDSRT.SelfContainedADM, 
	       TDSRT.ReportingPeriod, 
	       CASE 
	         WHEN TDSRT.ADMType IS NULL THEN 1 
	         ELSE TDSRT.ADMType 
	       END AS ADMType,
	       TD.Groups 
	INTO   #TempFinal 
	FROM   #TempSPEDRpt TD 
	       LEFT JOIN #TempPivotMin TDSRT 
	              ON TD.[Disability Category] = TDSRT.[Disability Category] 
	                 AND TD.ReportingPeriodId = TDSRT.ReportingPeriod 
	WHERE ReportingPeriod IS NOT NULL
	ORDER BY Groups,DescriptorId


	SELECT [Disability Category],
	       SPEDWeight,
		   ResourceADM,
		   SelfContainedADM,
		   ReportingPeriod,
		   ADMType,
		   Groups
	 FROM #TempFinal

	/* Drop Temp Tables */
	DROP TABLE #TempSPEDADM 
	DROP TABLE #TempSPEDRpt 
	DROP TABLE #TempFinal 
	DROP TABLE #TempPivot 
	DROP TABLE #TempPivotMin
END

/* End [report].[SPED20_GetReportSPED] */
