/************************************************************
**Procedure Name: [process].[GetSchedules]
**
**Author: A Britto
**
**Description: Called by Active Batch to get schedules for running jobs - intgrity, 915..
**	
**Revision History:
**	Who			When		What
**  A Britto	06/16/2017  Initial Creation
**  Rchinta		09/07/2017	Adding logic to  handle 915 requests. So when process.Schedule has previous year records. The GetSchedules will bring only when you have 915 open for any districts
**  Rchinta		09/26/2017  proc change to make sure we get the records when System date is within the beginDate and enddate
**  Rchinta		10/10/2017  Changing the executionType from 2 to 3
**	Rchinta		10/26/2017  Bringing the records in ExecutionOrder since we want Calendar to run even before Membership
**	P Kanyar	02/05/2018  Updating logic to handle Calendar integrity not part of daily integrity process post calendar submission closure date 
**	P Kanyar	07/25/2018  Fixed the logic that included closed request that had a successful integrity run after the Request Enddtm to run again
**							Removed the logic that was handling the scenario where the user can close the request to a prior date (UI is taking care of that now)
** 
*********************************************************************************************************************************************************/
CREATE PROCEDURE [process].[GetSchedules]
	@IncludeActiveSchedulesOnly AS BIT = 1
AS
BEGIN

DECLARE @CurrentDate DATETIME = GETDATE()

	--temp table  to get a list of process types and comma seperated list of process sub types

		SELECT
			pst.ProcessTypeId
			,sc.FiscalYear
			,sc.ExecutionOrder
			,sc.ExecutionTypeId
			,sc.DataLoadTypeId
			,sc.IsActive
			,sc.StopFurtherProcessingUponFailure
			,STUFF(
					(SELECT DISTINCT ',' + CONVERT(varchar(5), ProcessSubTypeId)
					 FROM process.ProcessSubType
					 WHERE [ProcessTypeId] = pst.[ProcessTypeId] 
					 FOR XML PATH (''))
						, 1, 1, '')  AS ProcessSubTypeIds
		INTO #cteProcessTypeSubType
		FROM process.ProcessSubType pst
		JOIN process.Schedule sc
			ON sc.ProcessTypeId = pst.ProcessTypeId
		GROUP BY pst.ProcessTypeId
			,sc.FiscalYear
			,sc.ExecutionOrder
			,sc.ExecutionTypeId
			,sc.DataLoadTypeId
			,sc.IsActive
			,sc.StopFurtherProcessingUponFailure


------------  1 ----------------------------------------------------------

		-- Logic to handle All StateWide except Calendar integrity 
		SELECT DISTINCT
			   cte.FiscalYear,
			   cte.ProcessTypeId,	
			   pt.ProcessTypeJobName,
			   cte.ProcessSubTypeIds,
			   cte.ExecutionOrder,
			   cte.ExecutionTypeId,
			   cte.DataLoadTypeId,		   
			   cte.StopFurtherProcessingUponFailure,
			   cte.IsActive	
		INTO #Temp_Schedules
		FROM  #cteProcessTypeSubType  cte 
		JOIN process.ProcessType pt
			ON pt.ProcessTypeId = cte.ProcessTypeId
				AND pt.ProcessTypeId <> 12	
		WHERE @IncludeActiveSchedulesOnly = 0 
				OR ( @IncludeActiveSchedulesOnly = 1 
						AND cte.IsActive = 1			
						AND ExecutionTypeId = 1								-- All LEAs - State Wide	
					)

		UNION	

---------------------   2-------------------------------------------------



		-- Logic to handle StateWide Calendar integrity only
		SELECT DISTINCT
			   cte.FiscalYear,
			   cte.ProcessTypeId,	
			   pt.ProcessTypeJobName,
			   cte.ProcessSubTypeIds,
			   cte.ExecutionOrder,
			   cte.ExecutionTypeId,
			   cte.DataLoadTypeId,		   
			   cte.StopFurtherProcessingUponFailure,
			   cte.IsActive	
		FROM #cteProcessTypeSubType  cte 
		JOIN process.ProcessType pt
			ON pt.ProcessTypeId = cte.ProcessTypeId
				AND pt.ProcessTypeId = 12									-- Calendar integrity
		JOIN config.DataSubmissionWindow dsw
			ON dsw.FiscalYear = cte.FiscalYear									
				AND dsw.RequestTypeId = 2									-- Calendar data submission 
				AND (@currentDate >= dsw.SubmissionStartDate 
						AND CONVERT(Date,@currentDate) <= dsw.SubmissionEndDate)
		WHERE @IncludeActiveSchedulesOnly = 0 
				OR ( @IncludeActiveSchedulesOnly = 1 
						AND cte.IsActive = 1			
						AND ExecutionTypeId = 1								-- All LEAs - State Wide	
					)


-------------------------------  3 ---------------------------------------------------------

	 --Logic to handle 915 	
	 SELECT FiscalYear 
	 INTO #StateWide_Calendar_schedule 
	 FROM #Temp_Schedules
		WHERE ProcessTypeId = 12 AND ExecutionTypeId = 1


	IF EXISTS (SELECT 1 FROM #StateWide_Calendar_schedule )
		 BEGIN
			  /* If there is a Statewide Calendar for a FY, don't include PSW Calendar for that FY
				 if there is a Student 915 is open, include 915 ADM.*/
				INSERT INTO #Temp_Schedules
				SELECT DISTINCT						
					   cte.FiscalYear,
					   cte.ProcessTypeId,	
					   pt.ProcessTypeJobName,
					   cte.ProcessSubTypeIds,
					   cte.ExecutionOrder,
					   cte.ExecutionTypeId,
					   cte.DataLoadTypeId,		   
					   cte.StopFurtherProcessingUponFailure,
					   cte.IsActive	
				FROM #cteProcessTypeSubType cte 
				JOIN process.ProcessType pt
					ON pt.ProcessTypeId = cte.ProcessTypeId 
				JOIN [915].Request R												
					ON R.FiscalYear = cte.FiscalYear	
				JOIN config.ProcessTypeRequestTypeAssociation ptrt
						ON ptrt.RequestTypeId = r.RequestTypeId
							AND ptrt.ProcessTypeId = pt.ProcessTypeId
				WHERE ( @IncludeActiveSchedulesOnly = 0 
						OR (@IncludeActiveSchedulesOnly = 1 
								AND cte.IsActive = 1		
								AND cte.ExecutionTypeId = 3														-- 915 Whitelist Process
								AND ( @currentDate >=  r.BeginDtm AND CONVERT(Date,@currentDate) <=  R.EndDtm )									
								AND (r.RequestTypeId = 1 OR (r.RequestTypeId = 2 AND r.FiscalYear NOT IN (SELECT FiscalYear FROM #StateWide_Calendar_schedule)))		
							)
					   )
					   
				UNION
					 --Logic to include Student 915 requests for which there is no successful integrity run after the Request Enddtm + Calendar 915 requests for which there is no Statewide 
				SELECT  DISTINCT								
						   cte.FiscalYear,
						   cte.ProcessTypeId,	
						   pt.ProcessTypeJobName,
						   cte.ProcessSubTypeIds,
						   cte.ExecutionOrder,
						   cte.ExecutionTypeId,
						   cte.DataLoadTypeId,		   
						   cte.StopFurtherProcessingUponFailure,
						   cte.IsActive	
				FROM  #cteProcessTypeSubType cte 
					JOIN process.ProcessType pt
						ON pt.ProcessTypeId = cte.ProcessTypeId
					JOIN [915].Request r 
						ON R.FiscalYear = cte.FiscalYear
							AND CONVERT(Date,@currentDate) >  R.EndDtm	
							AND RequestTypeId = 1
					JOIN config.ProcessTypeRequestTypeAssociation ptrt
						ON ptrt.RequestTypeId = r.RequestTypeId
							AND ptrt.ProcessTypeId = pt.ProcessTypeId
					WHERE NOT EXISTS ( SELECT 1 FROM process.Execution pe				-- If there is no successful integrity run after the Request Enddtm
										WHERE pe.FiscalYear = r.FiscalYear 
											AND pe.StatusTypeId = 6 
											AND pe.ExecutionTypeId = 3 
											AND pe.ProcessTypeId = ptrt.ProcessTypeId
											AND pe.InitiatedDateTime > r.EndDtm -- (CONVERT(Date,pe.InitiatedDateTime) > r.EndDtm)
									 ) AND 
						 ( @IncludeActiveSchedulesOnly = 0 
								OR (@IncludeActiveSchedulesOnly = 1 
										AND cte.IsActive = 1		
										AND cte.ExecutionTypeId = 3	
										AND (r.RequestTypeId = 1 OR (r.RequestTypeId = 2 AND r.FiscalYear NOT IN (SELECT FiscalYear FROM #StateWide_Calendar_schedule)))
									)
							)

		END
	ELSE				-- If there is no Normal Submission window open for Calendar, then include Calendar PSW 
	    BEGIN
			 /*if there is a Student 915 is open, 915 ADM is included. If there is only a Calendar 915 open, only 915 Calendar is included*/
			INSERT INTO #Temp_Schedules
			SELECT DISTINCT								
				   cte.FiscalYear,
				   cte.ProcessTypeId,	
				   pt.ProcessTypeJobName,
				   cte.ProcessSubTypeIds,
				   cte.ExecutionOrder,
				   cte.ExecutionTypeId,
				   cte.DataLoadTypeId,		   
				   cte.StopFurtherProcessingUponFailure,
				   cte.IsActive	
			FROM #cteProcessTypeSubType cte 
			JOIN process.ProcessType pt
				ON pt.ProcessTypeId = cte.ProcessTypeId 
			JOIN [915].Request R												
				ON R.FiscalYear = cte.FiscalYear		
			JOIN config.ProcessTypeRequestTypeAssociation ptrt 
				ON ptrt.ProcessTypeId = cte.ProcessTypeId 
					AND R.RequestTypeId = ptrt.RequestTypeId
			WHERE  @IncludeActiveSchedulesOnly = 0 
					OR (@IncludeActiveSchedulesOnly = 1 
							AND cte.IsActive = 1		
							AND ExecutionTypeId = 3														-- 915 Whitelist Process
							AND ( @currentDate >=  r.BeginDtm AND CONVERT(Date,@currentDate) <=  R.EndDtm )									
						)

			UNION
				 --Logic to include any type of 915 requests for which there is no successful integrity run after the Request Enddtm
			SELECT  DISTINCT								
					   cte.FiscalYear,
					   cte.ProcessTypeId,	
					   pt.ProcessTypeJobName,
					   cte.ProcessSubTypeIds,
					   cte.ExecutionOrder,
					   cte.ExecutionTypeId,
					   cte.DataLoadTypeId,		   
					   cte.StopFurtherProcessingUponFailure,
					   cte.IsActive	
			FROM  #cteProcessTypeSubType cte 
				JOIN process.ProcessType pt
					ON pt.ProcessTypeId = cte.ProcessTypeId
				JOIN [915].Request r 
					ON R.FiscalYear = cte.FiscalYear
						AND CONVERT(Date,@currentDate) >  R.EndDtm	
				JOIN config.ProcessTypeRequestTypeAssociation ptrt
					ON ptrt.RequestTypeId = r.RequestTypeId
						AND ptrt.ProcessTypeId = pt.ProcessTypeId
				WHERE NOT EXISTS ( SELECT 1 FROM process.Execution pe				-- If there is no successful integrity run after the Request Enddtm
									WHERE pe.FiscalYear = r.FiscalYear 
										AND pe.StatusTypeId = 6 
										AND pe.ExecutionTypeId = 3 
										AND pe.ProcessTypeId = ptrt.ProcessTypeId
										AND pe.InitiatedDateTime > r.EndDtm --(CONVERT(Date,pe.InitiatedDateTime) > r.EndDtm)
								 ) AND 
					 ( @IncludeActiveSchedulesOnly = 0 
							OR (@IncludeActiveSchedulesOnly = 1 
									AND cte.IsActive = 1		
									AND cte.ExecutionTypeId = 3	
								)
						)
		END


				  
	---------------  5 INSERT -------------------------------------------				

		-- TO INSERT EXECUTIONID FOR 915 ADM INTEGRITY WHEN THERE IS A 915 CALENDAR OPEN FOR A PARTICULAR FISCALYEAR
		IF EXISTS (SELECT 1 FROM #Temp_Schedules WHERE ProcessTypeId = 12 AND ExecutionTypeId = 3 )
				BEGIN
					INSERT INTO #Temp_Schedules
					SELECT DISTINCT 
						 ts.FiscalYear
						,cte.ProcessTypeId
						,pt.ProcessTypeJobName
						,cte.ProcessSubTypeIds
						,cte.ExecutionOrder
						,cte.ExecutionTypeId
						,cte.DataLoadTypeId
						,cte.StopFurtherProcessingUponFailure
						,cte.IsActive
					FROM #cteProcessTypeSubType cte 
						JOIN process.ProcessType pt
							ON pt.ProcessTypeId = cte.ProcessTypeId
						JOIN #Temp_Schedules ts 
							ON ts.FiscalYear = cte.FiscalYear 
								AND ts.ProcessTypeId = 12 
								AND ts.ExecutionTypeId = 3
					WHERE @IncludeActiveSchedulesOnly = 0
						OR (@IncludeActiveSchedulesOnly = 1
								AND cte.IsActive = 1	 
								AND cte.ProcessTypeId = 1 
								AND cte.ExecutionTypeId = 3 
							)
				END

		---- TO INSERT EXECUTIONID FOR 915 AGGREGATION ALSO WHEN THERE IS A 915 STUDENT OPEN FOR A PARTICULAR FISCALYEAR 
		IF EXISTS (SELECT 1 FROM #Temp_Schedules WHERE ProcessTypeId = 1 AND ExecutionTypeId = 3 )
				BEGIN
					INSERT INTO #Temp_Schedules
					SELECT DISTINCT 
						 ts.FiscalYear
						,cte.ProcessTypeId
						,pt.ProcessTypeJobName
						,cte.ProcessSubTypeIds
						,cte.ExecutionOrder
						,cte.ExecutionTypeId
						,cte.DataLoadTypeId
						,cte.StopFurtherProcessingUponFailure
						,cte.IsActive
					FROM #cteProcessTypeSubType cte 
						JOIN process.ProcessType pt
							ON pt.ProcessTypeId = cte.ProcessTypeId
						JOIN #Temp_Schedules ts 
							ON ts.FiscalYear = cte.FiscalYear 
								AND ts.ProcessTypeId = 1 
								AND ts.ExecutionTypeId = 3
					WHERE @IncludeActiveSchedulesOnly = 0
						OR (@IncludeActiveSchedulesOnly = 1
								AND cte.IsActive = 1	 
								AND cte.ProcessTypeId = 2 
								AND cte.ExecutionTypeId = 3 
							)
				END

		-- getting the final list of schedules

			SELECT DISTINCT
				 FiscalYear
				,ProcessTypeId
				,ProcessTypeJobName
				,ProcessSubTypeIds
				,ExecutionOrder
				,ExecutionTypeId
				,DataLoadTypeId
				,StopFurtherProcessingUponFailure
				,IsActive 
			FROM #Temp_Schedules 
			ORDER BY FiscalYear, ExecutionOrder 
	
	DROP TABLE #Temp_Schedules 
	DROP TABLE #cteProcessTypeSubType
	DROP TABLE #StateWide_Calendar_schedule		 

END
