/**************************************************************************************************
**Procedure Name:
**      dashboard.GetIntegrityErrorCountStateWide
**
**Author:
**		Amit Verma
**
**Description:  
**	Get Integrity Error Count State Wide
**            
**Input:
**	@ProcessTypeId - ProcessTypeId 
**
**Returns:
**
**Implementation:
** 
**Revision History:
**	Who			When		What
**	Amit Verma	05/26/2017	Initial Creation 
**
******************************************************************************************************/
CREATE PROC [dashboard].[GetIntegrityErrorCountStateWide] 
@ProcessTypeId  AS INT,
@FiscalYear AS INT
AS  
BEGIN  
     
	 SELECT TOP 5 ED.EventDateId,
				  ED.EventDate,
				  E.ProcessTypeId, 
				  E.FiscalYear 
	 INTO #TempEventDate
	 FROM process.Execution E
	      JOIN dashboard.EventDateExecution EDE
		    ON E.ExecutionId = EDE.ExecutionId 
			   AND E.ExecutionTypeId = 1
			   AND E.StatusTypeId = 6
			   AND E.ProcessTypeId = @ProcessTypeId
			   AND E.FiscalYear = @FiscalYear
          JOIN dashboard.EventDate ED
		    ON EDE.EventDateId = ED.EventDateId
	 ORDER BY EDE.EventDateId DESC

	 SELECT FORMAT(TED.EventDate,'MM/dd/yyyy HH:mm:ss') AS EventDate,
	        @FiscalYear									AS FiscalYear, 
	        IEC.IntegrityRuleTypeId, 
			IRT.Description								AS IntegrityRuleTypeDescription,
			ES.Description								AS ExceptionSeverity,
			IEM.ExceptionMessageCode,
			IEM.Description								AS ExceptionMessage,
			SUM(IEC.RecordCount)						AS Total
     INTO #TempResult
	 FROM integrity.IntegrityExceptionMessage IEM
	      LEFT JOIN dashboard.IntegrityErrorCount IEC
		    ON IEM.ExceptionMessageCode = IEC.ExceptionMessageCode
	      LEFT JOIN #TempEventDate TED
		    ON IEC.EventDateId = TED.EventDateId
		  LEFT JOIN integrity.IntegrityRuleType IRT
		    ON IEC.IntegrityRuleTypeId = IRT.IntegrityRuleTypeId
		  LEFT JOIN integrity.ExceptionSeverity ES
			ON ES.ExceptionSeverityId = IEC.ExceptionSeverityId
	 WHERE TED.EventDate IN (SELECT DISTINCT EventDate FROM #TempEventDate)
	 GROUP BY TED.EventDate,
	        IEC.FiscalYear, 
	        IEC.IntegrityRuleTypeId, 
			IRT.Description,				
			ES.Description,
			IEM.ExceptionMessageCode,
			IEM.Description	
	 ORDER BY CONVERT(INT,REPLACE(IEM.ExceptionMessageCode,'-','')) 

	 ----Declare Dynamic Columns and Query to execute the Result
	 DECLARE @Cols AS NVARCHAR(MAX), @Query AS NVARCHAR(MAX);
	 
	 SET @Cols = STUFF((SELECT  DISTINCT  ',' + QUOTENAME(TR.EventDate)
				  FROM #TempResult TR 
				  ORDER BY 1 DESC
				 FOR XML PATH (''),TYPE).value('.','NVARCHAR(MAX)')
				 ,1,1,'')
	 SET @Query =  'SELECT * FROM (SELECT FiscalYear, IntegrityRuleTypeId,IntegrityRuleTypeDescription, ExceptionSeverity, ExceptionMessageCode, ExceptionMessage, ' +
	                @Cols+ ' FROM (SELECT EventDate, FiscalYear, IntegrityRuleTypeId,IntegrityRuleTypeDescription, ExceptionSeverity, ExceptionMessageCode, ExceptionMessage, Total
					                FROM #TempResult
					              ) x PIVOT (SUM(Total) FOR EventDate IN  (' + @Cols + ')) p) AS TEMP
								  WHERE IntegrityRuleTypeId IS NOT NULL
								  ORDER BY CONVERT(INT,REPLACE(ExceptionMessageCode,''-'','''')) '
	 
	 
	 EXECUTE (@Query)
	 
     DROP TABLE #TempEventDate
     DROP TABLE #TempResult

  END