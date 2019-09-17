/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetACCTRulePriorYearEnrollmentData]
**
**Author:
**      Sucharita Mahapatra
**
**Description:  
**	Get Prior year Enrollment Data for Accountability rule integrity processing  

****************************************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetACCTRulePriorYearEnrollmentData]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 

    SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
            
			--Get FiscalYear
			DECLARE @FiscalYear INT
			 
			SELECT @FiscalYear= FiscalYear FROM process.Execution
			WHERE ExecutionId = @ExecutionId
			
			--Load Student Prior Year Data In Temp Table 
			SELECT ssa1.StudentUniqueId, 
				   ssa1.SchoolId,
				   ssa1.ExitWithdrawTypeDescriptor, 
				   FiscalYear+1						AS FiscalYear    
			INTO #TempStudentPriorYearData 
			FROM integrity.vw_PriorYearLatestEnrollment ssa1
            WHERE FiscalYear = @FiscalYear-1


	        -- Get Student Prior Year Enrollment Data
			SELECT DISTINCT 
				   ih.StudentUSI, 
			       ssa1.ExitWithdrawTypeDescriptor                                          AS 'PriorYearExitWithdrawCode',
				   ssa1.SchoolId                                                            AS 'PriorYearSchoolId'

			FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih			
				 	     				
				LEFT JOIN #TempStudentPriorYearData ssa1 with (nolock)
                    ON ih.StudentUniqueId = ssa1.StudentUniqueId
                   -- AND  ih.SchoolId = ssa1.SchoolId                / ** To get PriorYear data across schools **   /                                 
                       AND ih.FiscalYear = ssa1.FiscalYear
					   AND ih.IntegrityRuleTypeId in (3,15)


			  WHERE ih.Executionid = @executionid 
				AND ih.messageid = @messageid				 
			 

	        DROP TABLE #TempStudentPriorYearData
	END
