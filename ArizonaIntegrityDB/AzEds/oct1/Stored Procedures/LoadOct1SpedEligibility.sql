/*********************************************************************************************************************
**Procedure Name: oct1.LoadOct1SpedEligibility
** 
**Author: Pratibha Kanyar
** 
**Description:  
**	Loading StudentSchoolOct1SpedEligibility table based on FED SPED status & Active/Inactive SPED 
**	program participation on OCT1
**	 
**Revision History: 
**  Who		      When			What 
**	P Kanyar	  11/20/2016	Initial creation 
**	P Kanyar	  12/08/2016	Fixed Students with membership type 'D' getting dropped for OCT1 
**	P Kanyar	  12/12/2016	Added logic to catch the students who 'PASS' FED SPED wrongly 
**								and fail OCT1,mark them as 'Internal Error' 
**	P Kanyar	  12/14/2016	Changed the StudentEnrollmentProgramAssociation & StudentProgramNeedAssociation	
**								join to Left to bring the students who have program outside enrollment, 
**								removed join with leadata.StudentProgramAssociation, integrity.IntegrityNeed
**	P Kanyar	  12/15/2016	Updated to implement the changes of renamed column in StudentSchoolOct1SpedEligibility table
**	P Kanyar	  01/05/2017	Added join predicate spna.ProgramTypeId = 6
**	P Kanyar	  01/06/2017	Loading StudentProgramOct1SpedEligibility table for ESS
**	P Kanyar	  01/19/2017	Changed the logic to load StudentProgramOct1SpedEligibility table for ESS with only  
**								those students that have OCT1 eligibility 
**	P Kanyar	  01/24/2017	Fixed counts not matching in 2 tables, included patch that was added in Prod for bug# 175047  
**	P Kanyar	  02/15/2017	Fixed fedSped_Passed_SubsequentprogramCTE logic, changed temp tables to CTEs
**	P Kanyar	  02/22/2017	Fixed record count mismatch b/w [StudentSchoolOct1SpedEligibility]  
**								& [StudentProgramOct1SpedEligibility] tables in Prod by changing fedSped_Passed_SubsequentprogramCTE logic
**	P Kanyar	  06/22/2017	Modified to refer to new CalendarDateTrackEvent table based on Fiscalyear 
**  P Kanyar	  07/31/2017    Enhancement to count students with ProgramEndDate on last instructional day before Oct 1, the subsequent 
**								program begin date at new School on the first instructional day after Oct 1 for Oct1 SPED Eligibility
**  P Kanyar	  10/04/2017    Enhancement to insert both OCT1 failed & passed students in to StudentProgramOct1SpedEligibility table
**								for the OCT1FEDSPED report enhancement to not display SPED records for students who have no program participation on OCT 1 
**  Vinoth K	  02/01/2019    Currently Calendar has an instruction day defined by Event type, so there can be mutiple event type for a instructional day
								we need to consider all the event type which are part of the instruction day.
**					
**********************************************************************************************************************************/ 
--declare @ExecutionId AS INT = 5562   -- 5990=2018/ 5562-2017 in \vnext

CREATE PROCEDURE [oct1].[LoadOct1SpedEligibility]
	@ExecutionId AS INT							-- FED SPED INTEGRITY EXECUTION ID

AS 
BEGIN 

	BEGIN TRY

		BEGIN TRAN LoadOCT1Eligibility

  				   --getting student records for FED SPED rule type
				  SELECT DISTINCT  FiscalYear 
								  ,IntegrityHistoryId
								  ,IntegrityNeedId
								  ,ExecutionId
								  ,MessageId
								  ,StudentUSI
								  ,StudentUniqueId
								  ,SchoolId
				  INTO   #StudentOct1count											
				  FROM   [integrity].[vw_GetIntegrityHistoryPerExecution] Ihe (nolock) 
				  WHERE  Ihe.ExecutionId = @ExecutionId 
						 AND StudentUSI IS NOT NULL
						 AND Ihe.IntegrityTypeId = 7			-- FED SPED type 


				-- storing Fiscal Year in a variable
				DECLARE @FY INT
				SELECT @FY = FiscalYear  
				FROM #StudentOct1count

				-- storing oct1 date in a variable
				DECLARE @OCT1 DATE 
				SELECT @OCT1 = CONVERT(DATE,CONVERT(NVARCHAR(4),FiscalYear-1 )+'-10-01')
				FROM #StudentOct1count

----------------------------------------------------------------------------------
	
			  DECLARE @r INT; 

			  SET @r = 1; 

			  WHILE @r > 0 
				BEGIN 
					-- Delete records from oct1.StudentSchoolOct1SpedEligibility
					DELETE TOP (100000) dest 
					FROM [oct1].[StudentSchoolOct1SpedEligibility] dest 
						  JOIN #StudentOct1count s
							ON dest.FiscalYear = s.FiscalYear

					-- Delete records from oct1.StudentProgramOct1SpedEligibility
					DELETE TOP (100000) dest 
					FROM [oct1].[StudentProgramOct1SpedEligibility] dest 
						  JOIN #StudentOct1count s
							ON dest.FiscalYear = s.FiscalYear
           
					SET @r = @@ROWCOUNT;         
				END 


--------------------------------------------------------------------------------------------------------------------------
			CREATE TABLE #TempSPEDprogram 
			(
			 FiscalYear			INT
			 --,ih.executionid  INT
			,StudentUSI			INT
			,SchoolId			INT
			,IntegrityResultTypeId INT
			,IsVirtual			SMALLINT
			,IsSPEDProgramSubsequent  BIT 
			,IsOCT1Instructional	BIT
			,Last_InstructionalDate_beforeOct1	DATE
			,First_InstructionalDate_afterOct1  DATE
			,ProgramTypeId						INT
			,ProgramEducationOrganizationId		INT
			,ProgramName						NVARCHAR(60)
			,BeginDate							DATE														
			,EndDate							DATE										
			,ProgramCode						NVARCHAR(50)													
			,IsOCT1Eligible						BIT
			,Oct1SpedReasonId					INT
			,PrimaryStudentNeedIndicator		BIT
			)

			  -- getting  FED SPED PASSED & failed records based on Fiscal Year
		
			IF @FY > 2017
			    BEGIN
					INSERT INTO #TempSPEDprogram
					SELECT DISTINCT 
						 ih.FiscalYear
						--,ih.executionid
						,ih.StudentUSI
						,ih.SchoolId
						,ih.IntegrityResultTypeId
						,sc.IsVirtual 
						,oct1.IsSPEDProgramSubsequent (ih.StudentUSI, ih.FiscalYear, ih.SchoolId)	AS 'IsSPEDProgramSubsequent'
						,CASE WHEN TrackEventTypeId in (1,4,5,6,7,25) OR sc.IsVirtual= 1 														-- if school is AOI/ student membership type ='D'/ school day is 'Instructional' 
										OR sepa.MembershipTypeDescriptorId = 11743 												-- then OCT1 is Instructional
							   THEN 1
							   ELSE 0 END															AS 'IsOCT1Instructional'
						,CASE  WHEN TrackEventTypeId in (1,4,5,6,7,25) THEN DATE
							   ELSE ( SELECT MAX(Date) 
									  FROM entity.CalendarDateTrackEvent WITH (NOLOCK) 
									  WHERE FiscalYear = sepa.FiscalYear
									  AND Date < @OCT1 
									  AND EducationOrganizationId = sepa.SchoolId 
									  AND TrackLocalEducationAgencyId = sepa.TrackEducationOrganizationId
									  AND TrackNumber = sepa.TrackNumber
									  AND TrackEventTypeId in (1,4,5,6,7,25) ) END								AS 'Last_InstructionalDate_beforeOct1'

						,CASE WHEN TrackEventTypeId in (1,4,5,6,7,25) THEN DATE
							   ELSE ( SELECT MIN(Date) 
									  FROM entity.CalendarDateTrackEvent WITH (NOLOCK) 
									  WHERE FiscalYear = sepa.FiscalYear
									  AND Date > @OCT1  
									  AND EducationOrganizationId = sepa.SchoolId 
									  AND TrackLocalEducationAgencyId = sepa.TrackEducationOrganizationId
									  AND TrackNumber = sepa.TrackNumber
									  AND TrackEventTypeId in (1,4,5,6,7,25) )	END								AS 'First_InstructionalDate_afterOct1'
						,spna.ProgramTypeId
						,spna.ProgramEducationOrganizationId
						,spna.ProgramName
						,spna.ProgramBeginDate														AS 'BeginDate'		
						,spna.ProgramEndDate														AS 'EndDate'		
						,spna.ProgramCode													
						,0																			AS 'IsOCT1Eligible'
						,NULL																		AS 'Oct1SpedReasonId'
						,spna.PrimaryStudentNeedIndicator
					FROM oct1.IntegrityHistory ih (NOLOCK)
						INNER JOIN #StudentOct1count soc 
							ON soc.FiscalYear = ih.FiscalYear
								AND soc.IntegrityHistoryId = ih.IntegrityHistoryId
								AND soc.IntegrityNeedId = ih.IntegrityNeedId
								AND soc.ExecutionId = ih.ExecutionId
								AND soc.MessageId = ih.MessageId
								AND ih.IntegrityResultTypeId in (1,2)							-- FED SPED PASSED & failed

						INNER JOIN entity.School sc (NOLOCK)
							ON sc.SchoolId = ih.SchoolId
								AND sc.FiscalYear = ih.FiscalYear
				
						LEFT JOIN oct1.StudentEnrollmentProgramAssociation sepa (NOLOCK)
							ON sepa.StudentUSI = ih.StudentUSI
								AND sepa.SchoolId = ih.SchoolId
								AND sepa.FiscalYear = ih.FiscalYear
								AND sepa.ProgramTypeId = 6 

						LEFT JOIN oct1.StudentProgramNeedAssociation spna (NOLOCK)
							ON spna.FiscalYear = ih.FiscalYear 
								AND spna.StudentUSI = ih.StudentUSI
								AND spna.SchoolId = ih.SchoolId
								AND spna.ProgramEducationOrganizationId = sepa.ProgramEducationOrganizationId  
								AND spna.ProgramName = sepa.ProgramName
								AND spna.ProgramTypeId = sepa.ProgramTypeId						
								AND spna.ProgramBeginDate = sepa.ProgramBeginDate
								AND spna.ProgramTypeId = 6 
								AND spna.ProgramBeginDate IS NOT NULL							

							-- for membershiptype = M,A,P (11738,10217,10218) - Calendar is there
							-- for membershiptype = T(AOI school),memmbership type = 'D' - OCT1 IS ALWAYS INSTUCTIONAL

						LEFT JOIN entity.CalendarDateTrackEvent cdte (NOLOCK)
							ON cdte.FiscalYear = sepa.FiscalYear
								AND cdte.EducationOrganizationId = sepa.SchoolId 
								AND cdte.TrackLocalEducationAgencyId = sepa.TrackEducationOrganizationId
								AND cdte.TrackNumber = sepa.TrackNumber
								AND cdte.DATE = @OCT1 
								AND sc.IsVirtual = 0 
			    END
		    ELSE
		        BEGIN
					INSERT INTO #TempSPEDprogram
					SELECT DISTINCT 
						 ih.FiscalYear
						--,ih.executionid
						,ih.StudentUSI
						,ih.SchoolId
						,ih.IntegrityResultTypeId
						,sc.IsVirtual 
						,oct1.IsSPEDProgramSubsequent (ih.StudentUSI, ih.FiscalYear, ih.SchoolId)	AS 'IsSPEDProgramSubsequent'
						,CASE WHEN TrackEventTypeId in (1,4,5,6,7,25) OR sc.IsVirtual= 1 														-- if school is AOI/ student membership type ='D'/ school day is 'Instructional' 
										OR sepa.MembershipTypeDescriptorId = 11743 												-- then OCT1 is Instructional
							   THEN 1
							   ELSE 0 END															AS 'IsOCT1Instructional'
						,CASE  WHEN TrackEventTypeId in (1,4,5,6,7,25) THEN DATE
							   ELSE ( SELECT MAX(Date) 
									  FROM entity.CalendarDateTrackEvent WITH (NOLOCK) 
									  WHERE FiscalYear = sepa.FiscalYear
									  AND Date < @OCT1 
									  AND EducationOrganizationId = sepa.TrackEducationOrganizationId 
									  AND TrackNumber = sepa.TrackNumber
									  AND TrackEventTypeId in (1,4,5,6,7,25) ) END								AS 'Last_InstructionalDate_beforeOct1'
					
						,CASE WHEN TrackEventTypeId in (1,4,5,6,7,25) THEN DATE
							   ELSE ( SELECT MIN(Date) 
									  FROM entity.CalendarDateTrackEvent WITH (NOLOCK) 
									  WHERE FiscalYear = sepa.FiscalYear
									  AND Date > @OCT1  
									  AND EducationOrganizationId = sepa.TrackEducationOrganizationId 
									  AND TrackNumber = sepa.TrackNumber
									  AND TrackEventTypeId in (1,4,5,6,7,25) )	END								AS 'First_InstructionalDate_afterOct1'
						,spna.ProgramTypeId
						,spna.ProgramEducationOrganizationId
						,spna.ProgramName
						,spna.ProgramBeginDate														AS 'BeginDate'		
						,spna.ProgramEndDate														AS 'EndDate'		
						,spna.ProgramCode													
						,0																			AS 'IsOCT1Eligible'
						,NULL																		AS 'Oct1SpedReasonId'
						,spna.PrimaryStudentNeedIndicator
					FROM oct1.IntegrityHistory ih (NOLOCK)
						INNER JOIN #StudentOct1count soc 
							ON soc.FiscalYear = ih.FiscalYear
								AND soc.IntegrityHistoryId = ih.IntegrityHistoryId
								AND soc.IntegrityNeedId = ih.IntegrityNeedId
								AND soc.ExecutionId = ih.ExecutionId
								AND soc.MessageId = ih.MessageId
								AND ih.IntegrityResultTypeId in (1,2)							-- FED SPED PASSED & failed

						INNER JOIN entity.vw_School sc (NOLOCK)
							ON sc.SchoolId = ih.SchoolId
								AND sc.FiscalYear = ih.FiscalYear
				
						LEFT JOIN oct1.StudentEnrollmentProgramAssociation sepa (NOLOCK)
							ON sepa.StudentUSI = ih.StudentUSI
								AND sepa.SchoolId = ih.SchoolId
								AND sepa.FiscalYear = ih.FiscalYear
								AND sepa.ProgramTypeId = 6 

						LEFT JOIN oct1.StudentProgramNeedAssociation spna (NOLOCK)
							ON spna.FiscalYear = sepa.FiscalYear 
								AND spna.StudentUSI = sepa.StudentUSI
								AND spna.SchoolId = sepa.SchoolId
								AND spna.ProgramEducationOrganizationId = sepa.ProgramEducationOrganizationId  
								AND spna.ProgramName = sepa.ProgramName
								AND spna.ProgramTypeId = sepa.ProgramTypeId						
								AND spna.ProgramBeginDate = sepa.ProgramBeginDate
								AND spna.ProgramTypeId = 6  
								AND spna.ProgramBeginDate IS NOT NULL							

							-- for membershiptype = M,A,P (11738,10217,10218) - Calendar is there
							-- for membershiptype = T(AOI school) AND 'D' - OCT1 IS ALWAYS INSTUCTIONAL

						LEFT JOIN entity.CalendarDateTrackEvent cdte (NOLOCK)
							ON cdte.FiscalYear = sepa.FiscalYear
								AND cdte.EducationOrganizationId = sepa.TrackEducationOrganizationId 
								AND cdte.TrackNumber = sepa.TrackNumber
								AND cdte.DATE = @OCT1 
								AND sc.IsVirtual = 0 
			    END 


--  The PrimaryStudentNeedIndicator flag in the temp table causes a lot of duplicate records later.
-- So inserting the FED SPED failed records separately in to 2 tables first, and I will filter out the FED SPED Passed records without PrimaryStudentNeedIndicator=1
-- as it is the basic need for the student to pass OCT1 FED SPED integrity.

	-- getting FED SPED failed records 
				;WITH fedSped_failedCTE
				AS
				 (
					SELECT distinct 
						 tsp.FiscalYear
						,tsp.StudentUSI
						,tsp.SchoolId
					FROM  
						#TempSPEDprogram tsp
					WHERE tsp.IntegrityResultTypeId = 2						
				 ) 

				-- inserting FEDSPED failed records in to oct1.StudentSchoolOct1SpedEligibility table with OCT1eligibility = 0 & Reason = 1
				MERGE [oct1].[StudentSchoolOct1SpedEligibility] AS sso_dest 
				USING fedSped_failedCTE							AS ffc_src  
					ON ffc_src.FiscalYear = sso_dest.FiscalYear 
						AND ffc_src.StudentUSI = sso_dest.StudentUSI 
						AND ffc_src.SchoolId = sso_dest.SchoolId 
			  
					WHEN NOT MATCHED BY TARGET THEN 				
					INSERT (  
							 FiscalYear
							,StudentUSI
							,SchoolId
							,IsOct1SpedEligible
							,Oct1SpedReasonId
							,CreatedDate
							)
					VALUES ( 
							 ffc_src.FiscalYear
							,ffc_src.StudentUSI
							,ffc_src.SchoolId
							,0
							,1
							,GETUTCDATE()
							);

--*************************************************************************************************************************

		-- getting FED SPED failed records 
			;WITH TempSPEDprogramFinal2_CTE AS
					  (
						SELECT DISTINCT 
								 FiscalYear
								,StudentUSI
								,SchoolId
								,ProgramTypeId
								,ProgramEducationOrganizationId
								,ProgramName
								,BeginDate
								,EndDate
								,ProgramCode
								,IsOCT1Instructional
								,Last_InstructionalDate_beforeOct1
								,First_InstructionalDate_afterOct1
								,IsOct1Eligible
								,Oct1SpedReasonId
						FROM #TempSPEDprogram 
						WHERE IntegrityResultTypeId = 2   
								AND ProgramTypeId IS NOT NULL
								AND ProgramEducationOrganizationId IS NOT NULL
								AND ProgramName IS NOT NULL
								AND BeginDate IS NOT NULL 
					  ) 

				-- inserting FEDSPED failed records in to oct1.StudentProgramOct1SpedEligibility table with OCT1eligibility = 0 & Reason = 1

					MERGE [oct1].[StudentProgramOct1SpedEligibility] AS sso_dest 
						USING TempSPEDprogramFinal2_CTE				 AS tf_src  
							ON tf_src.FiscalYear = sso_dest.FiscalYear 
								AND tf_src.StudentUSI = sso_dest.StudentUSI 
								AND tf_src.SchoolId = sso_dest.SchoolId
								AND tf_src.ProgramTypeId = sso_dest.ProgramTypeId
								AND tf_src.ProgramEducationOrganizationId = sso_dest.ProgramEducationOrganizationId
								AND tf_src.ProgramName = sso_dest.ProgramName
								AND tf_src.BeginDate = sso_dest.ProgramBeginDate
								AND tf_src.ProgramCode = sso_dest.ProgramCode


							WHEN NOT MATCHED BY TARGET THEN 				
							INSERT (  
									 FiscalYear
									,StudentUSI
									,SchoolId
									,ProgramTypeId
									,ProgramEducationOrganizationId
									,ProgramName
									,ProgramBeginDate
									,ProgramEndDate
									,ProgramCode
									,IsOCT1Instructional
									,Last_InstructionalDate_beforeOct1
									,First_InstructionalDate_afterOct1
									,IsOct1SpedEligible
									,Oct1SpedReasonId
									,CreatedDate
									)
							VALUES ( 
									 tf_src.FiscalYear
									,tf_src.StudentUSI
									,tf_src.SchoolId
									,tf_src.ProgramTypeId
									,tf_src.ProgramEducationOrganizationId
									,tf_src.ProgramName
									,tf_src.BeginDate
									,tf_src.EndDate
									,tf_src.ProgramCode
									,tf_src.IsOCT1Instructional
									,tf_src.Last_InstructionalDate_beforeOct1
									,tf_src.First_InstructionalDate_afterOct1
									,0
									,1
									,GETUTCDATE()
									);


--------------------------- Getting only FED SPED passed records with Federal Primary Need ------------------------------------------------------

		SELECT 
			 FiscalYear		
			,StudentUSI		
			,SchoolId
			,IntegrityResultTypeId
			,IsVirtual
			,IsSPEDProgramSubsequent
			,IsOCT1Instructional
			,Last_InstructionalDate_beforeOct1
			,First_InstructionalDate_afterOct1
			,ProgramTypeId						
			,ProgramEducationOrganizationId		
			,ProgramName
			,BeginDate																		
			,EndDate													
			,ProgramCode																	
			,IsOCT1Eligible					
			,Oct1SpedReasonId		
			,PrimaryStudentNeedIndicator	 
		INTO #TempSPEDprogram_PrimaryStudentNeedIndicator
		FROM #TempSPEDprogram
		WHERE PrimaryStudentNeedIndicator = 1 
			AND IntegrityResultTypeId = 1  


----------------------------------------------- Checking for OCT1 ELIGIBILITY and Updating to 'Passed'  -------------------------------------------------------------------------------

		-- getting students with Subsequent program in a school eligible for OCT1 and
		-- Updating to 'Passed': Students FED SPED passed, with Subsequent Program participation in a school
 				;WITH fedSped_Passed_SubsequentprogramCTE
				AS
				 (
					SELECT 
						 sub1.FiscalYear
						,sub1.StudentUSI
						,CASE WHEN sub1.EndDate = sub1.Last_InstructionalDate_beforeOct1 
								THEN sub1.SchoolId
							  ELSE sub2.SchoolId	END		AS SchoolId
						,CASE WHEN sub1.EndDate = sub1.Last_InstructionalDate_beforeOct1 
								THEN sub1.BeginDate
							  ELSE sub2.BeginDate	END		AS BeginDate
						,CASE WHEN sub1.EndDate = sub1.Last_InstructionalDate_beforeOct1 
								THEN sub1.EndDate
							  ELSE sub2.EndDate		END		AS EndDate
					FROM 
					    ( 
							SELECT FiscalYear
								  ,StudentUSI
								  ,SchoolId
								  ,IsOCT1Instructional
								  ,IsSPEDProgramSubsequent
								  ,Last_InstructionalDate_beforeOct1
								  ,First_InstructionalDate_afterOct1
								  ,BeginDate
								  ,EndDate
							FROM #TempSPEDprogram_PrimaryStudentNeedIndicator tsp 
							WHERE (IsSPEDProgramSubsequent = 1 AND IsOCT1Instructional = 1 AND  EndDate < @OCT1)
									OR (IsSPEDProgramSubsequent = 1 AND IsOCT1Instructional = 0  AND EndDate = tsp.Last_InstructionalDate_beforeOct1 )
						) sub1			
						
						INNER JOIN 
						(
							SELECT FiscalYear
								  ,StudentUSI
								  ,SchoolId
								  ,IsOCT1Instructional
								  ,IsSPEDProgramSubsequent
								  ,Last_InstructionalDate_beforeOct1
								  ,First_InstructionalDate_afterOct1
								  ,BeginDate
								  ,EndDate
							FROM #TempSPEDprogram_PrimaryStudentNeedIndicator tsp
							WHERE (tsp.IsSPEDProgramSubsequent = 1 AND IsOCT1Instructional = 1 AND BeginDate <= @OCT1 AND EndDate >= @OCT1)
									OR (IsSPEDProgramSubsequent = 1 AND IsOCT1Instructional = 0  AND BeginDate = tsp.First_InstructionalDate_afterOct1 
											AND ( EndDate >= tsp.First_InstructionalDate_afterOct1 OR EndDate IS NULL) -- ADDED FOR NULL ENDDATE
										) 
						)sub2
						ON sub1.FiscalYear = sub2.FiscalYear
							AND sub1.StudentUSI = sub2.StudentUSI
							AND sub1.Begindate <> sub2.BeginDate  
				 )
				UPDATE tsp 
				SET IsOCT1Eligible = 1, Oct1SpedReasonId = 0
				FROM #TempSPEDprogram_PrimaryStudentNeedIndicator tsp
				JOIN fedSped_Passed_SubsequentprogramCTE cte ON cte.FiscalYear = tsp.FiscalYear
					AND cte.StudentUSI = tsp.StudentUSI
					AND cte.SchoolId = tsp.SchoolId
					AND cte.BeginDate = tsp.BeginDate
					AND cte.EndDate = tsp.EndDate  

-------------------------------------------------------------------------------------------------------------------------------------

				-- Updating to 'Passed': students FED SPED passed, with Program Begin date & End date with/without SUBSEQUENT program participation
				UPDATE #TempSPEDprogram_PrimaryStudentNeedIndicator 
				SET IsOCT1Eligible = 1, Oct1SpedReasonId = 0
				WHERE 
				-- this is done independent of IsSPEDProgramSubsequent = 0/1	
				   (	
					 ( IsOCT1Instructional = 1 AND BeginDate <= @oct1
							AND EndDate >= @oct1 AND BeginDate <> EndDate  
					  ) OR
					   ( IsOCT1Instructional = 0  AND BeginDate <= Last_InstructionalDate_beforeOct1
							AND EndDate >= First_InstructionalDate_afterOct1
						  ) 
				   )



				--Updating to 'Passed': Students FED SPED passed, with Program Begin date & NULL Program End date
				UPDATE #TempSPEDprogram_PrimaryStudentNeedIndicator 
				SET IsOCT1Eligible = 1, Oct1SpedReasonId = 0	
					WHERE EndDate IS NULL 
						AND((IsOCT1Instructional = 1 AND BeginDate <= @oct1) 
								OR ( IsOCT1Instructional = 0 AND BeginDate <= Last_InstructionalDate_beforeOct1 )
							)
	
------------------------------------------------ Updating the OCT1 Failed records   ---------------------------------------------------------------------------

					--Updating Oct1SpedReasonId = 2,(student not in program on OCT1) for the students that failed OCT1

					UPDATE tsp
					SET Oct1SpedReasonId = sq.Oct1SpedReasonId
  					FROM #TempSPEDprogram_PrimaryStudentNeedIndicator tsp
					INNER JOIN Config.FiscalYear cfy ON cfy.FiscalYear = tsp.FiscalYear 
					INNER JOIN ( SELECT FiscalYear
										,StudentUSI
										,SchoolId
										,BeginDate
										,EndDate
										,CASE WHEN BeginDate > @OCT1 THEN 2
		   									  WHEN EndDate < @OCT1	THEN 2 
										 END AS Oct1SpedReasonId
								 FROM #TempSPEDprogram_PrimaryStudentNeedIndicator tsp				 
								 WHERE IsOCT1Eligible = 0 
							  ) sq ON 
								sq.FiscalYear = tsp.FiscalYear
									AND sq.StudentUSI = tsp.StudentUSI
									AND sq.SchoolId = tsp.SchoolId
									AND sq.BeginDate = tsp.BeginDate
									AND ISNULL(sq.EndDate,cfy.EndDate) = ISNULL(tsp.EndDate,cfy.EndDate)	
		

---------------------------------------------------------------------------------------------------------------------------------

					-- this is added on Dec-09/16 when a new reason Id was decided to add to catch all those students which have faulty FED SPED results

					-- Updating Oct1SpedNotEligibleReasonId = 3,(Internal Error reason for OCT1 FED SPED) for the students that have passed FED SPED wrongly
					-- to cover unexpected scenarios in FED SPED integrity rules

					UPDATE tsp 
					SET Oct1SpedReasonId = 3
					FROM #TempSPEDprogram_PrimaryStudentNeedIndicator tsp
					WHERE IsOCT1Eligible = 0 AND Oct1SpedReasonId IS NULL

-----------------------------------------------------------------------------------------------------------------------------------------

					-- if a student has more than one programs 
					-- when one passed & one failed OCT1 - only passed is considered,
					-- when both failed OCT1 - then the first program is considered to load Student OCT1 eligibility at the school lavel
					;WITH TempSPEDprogramFinal1_CTE AS
					  (
						SELECT  
							FiscalYear
							,SchoolId
							,StudentUSI
							,IsOCT1Eligible
							--,BeginDate
							--,EndDate
							,Oct1SpedReasonId
							,RN  
						FROM (
								SELECT 
									 FiscalYear
									,SchoolId
									,StudentUSI
									,IsOCT1Eligible
									,BeginDate
									,EndDate
									,Oct1SpedReasonId
									,ROW_NUMBER () OVER (PARTITION BY FiscalYear,SchoolID,StudentUSI ORDER BY StudentUSI,IsOCT1Eligible DESC,BeginDate ASC) AS RN 
									FROM #TempSPEDprogram_PrimaryStudentNeedIndicator
								)SQ WHERE SQ.RN = 1  
						) 

					-- inserting (FEDSPED Passed) both OCT1 passed & failed records in to oct1.StudentSchoolOct1SpedEligibility table 

					MERGE [oct1].[StudentSchoolOct1SpedEligibility] AS sso_dest 
					USING TempSPEDprogramFinal1_CTE					AS tsp_src  
						ON tsp_src.FiscalYear = sso_dest.FiscalYear 
							AND tsp_src.StudentUSI = sso_dest.StudentUSI 
							AND tsp_src.SchoolId = sso_dest.SchoolId 


						WHEN NOT MATCHED BY TARGET THEN 				
						INSERT ( 
								 FiscalYear
								,StudentUSI
								,SchoolId
								,IsOct1SpedEligible
								,Oct1SpedReasonId
								,CreatedDate
								)
						VALUES ( 
								 tsp_src.FiscalYear
								,tsp_src.StudentUSI
								,tsp_src.SchoolId
								,IsOCT1Eligible
								,Oct1SpedReasonId		
								,GETUTCDATE()
								); 

-----------------------------------------------------------------------------------------------------------------------------
				-- changed the logic to insert both OCT1 passed & failed records in to oct1.StudentProgramOct1SpedEligibility table for the  
				-- for the OCT1FEDSPED report enhancement to not display SPED records for students who have no program participation on OCT 1 
				-- so that for failed records also I can refer to program begin, end dates ,First_InstructionalDate_afterOct1, Last_InstructionalDate_beforeOct1 in the StudentProgramOct1SpedEligibility table.

					;WITH TempSPEDprogramFinal2_CTE AS
					  (
						SELECT DISTINCT 
								 FiscalYear
								,StudentUSI
								,SchoolId
								,ProgramTypeId
								,ProgramEducationOrganizationId
								,ProgramName
								,BeginDate
								,EndDate
								,ProgramCode
								,IsOCT1Instructional
								,Last_InstructionalDate_beforeOct1
								,First_InstructionalDate_afterOct1
								,IsOct1Eligible
								,Oct1SpedReasonId
								,IntegrityResultTypeId
						FROM  #TempSPEDprogram_PrimaryStudentNeedIndicator 
					  )

					-- inserting records in to oct1.StudentProgramOct1SpedEligibility table ( giving eligibility at the program level)

					MERGE [oct1].[StudentProgramOct1SpedEligibility] AS sso_dest 
						USING TempSPEDprogramFinal2_CTE				 AS tf_src  
							ON tf_src.FiscalYear = sso_dest.FiscalYear 
								AND tf_src.StudentUSI = sso_dest.StudentUSI 
								AND tf_src.SchoolId = sso_dest.SchoolId
								AND tf_src.ProgramTypeId = sso_dest.ProgramTypeId
								AND tf_src.ProgramEducationOrganizationId = sso_dest.ProgramEducationOrganizationId
								AND tf_src.ProgramName = sso_dest.ProgramName
								AND tf_src.BeginDate = sso_dest.ProgramBeginDate
								AND tf_src.ProgramCode = sso_dest.ProgramCode


							WHEN NOT MATCHED BY TARGET THEN 				
							INSERT (  
									 FiscalYear
									,StudentUSI
									,SchoolId
									,ProgramTypeId
									,ProgramEducationOrganizationId
									,ProgramName
									,ProgramBeginDate
									,ProgramEndDate
									,ProgramCode
									,IsOCT1Instructional
									,Last_InstructionalDate_beforeOct1
									,First_InstructionalDate_afterOct1
									,IsOct1SpedEligible
									,Oct1SpedReasonId
									,CreatedDate
									)
							VALUES ( 
									 tf_src.FiscalYear
									,tf_src.StudentUSI
									,tf_src.SchoolId
									,tf_src.ProgramTypeId
									,tf_src.ProgramEducationOrganizationId
									,tf_src.ProgramName
									,tf_src.BeginDate
									,tf_src.EndDate
									,tf_src.ProgramCode
									,tf_src.IsOCT1Instructional
									,tf_src.Last_InstructionalDate_beforeOct1
									,tf_src.First_InstructionalDate_afterOct1
									,tf_src.IsOct1Eligible
									,tf_src.Oct1SpedReasonId
									,GETUTCDATE()
									); 

				DROP TABLE #StudentOct1count
				DROP TABLE #TempSPEDprogram
				DROP TABLE #TempSPEDprogram_PrimaryStudentNeedIndicator

		COMMIT TRAN LoadOCT1Eligibility

	END TRY

	BEGIN CATCH
		if @@TRANCOUNT > 0
	 			BEGIN
	 				ROLLBACK TRAN LoadOCT1Eligibility;				
	 				Throw ; 
	 			END
	END CATCH

END

