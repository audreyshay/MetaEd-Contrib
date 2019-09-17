/**********************************************************************************************
**Procedure Name: oct1.LoadOct1SpedData
** 
**Author: Pratibha Kanyar
** 
**Description:  Deletes and inserts the oct1.IntegrityException, oct1.IntegrityHistory, 
**	oct1.StudentEnrollmentProgramAssociation and oct1.StudentProgramNeedAssociation tables  
**	using views leadata.StudentEnrollmentProgramAssociationwithDOR & leadata.StudentProgramNeedAssociation 
**	and integrity.IntegrityHistory & integrity.IntegrityException 
**   
**Revision History: 
**  Who		    When			What 
**	P Kanyar	11/16/2016	Initial creation 
**	P Kanyar	12/06/2016	Added MainSPEDschool & DOR to [oct1].[StudentEnrollmentProgramAssociation]
**  P Kanyar	12/14/2016	Added StudentUSI & SchoolId to [oct1].[IntegrityHistory]
**  P Kanyar	12/16/2016	Updated logic to delete tables for the execution FY
**  P Kanyar	01/05/2017	Loading ELL program data into [oct1].[StudentProgramNeedAssociation] for ESS
**  P Kanyar	01/10/2017	Fixed Transaction name in the stmt.
**  P Kanyar	02/14/2017	Considered 30 membership rules while extracting the data for IntegrityHistory,
**							flagging the FEDSPED passed students as FAILED if they fail any one of 30 membership rules
**  P Kanyar	08/01/2017	Removed the MERGE for loading [oct1].[StudentProgramNeedAssociation] table, Fixed @FiscalYear
**							removed MessageId as i/p param			
**		
************************************************************************************************************/ 
--declare 
--	@FedSpedExecutionId AS INT = 4931  --, 

CREATE PROCEDURE [oct1].[LoadOct1SpedData]
	@FedSpedExecutionId AS INT  

AS 
BEGIN 
  
    BEGIN TRY    

		BEGIN TRAN LoadOct1Data

			DECLARE @MembershipExecutionId AS INT, @FiscalYear AS INT 
			 
			-- getting Latest Execution ID for Membership rule type and Execution FiscalYear
			-- Here I changed the logic bcoz, even when the execution id was for 2017, it was bringing max(fiscalyear) = 2018 if the integrity ran for both the FYs
			SELECT @MembershipExecutionId = MAX(ExecutionID), @FiscalYear = FiscalYear
			FROM [integrity].[vw_GetIntegrityHistoryPerExecution] NOLOCK 
			WHERE IntegrityRuleTypeId = 1 
				AND FiscalYear = ( SELECT DISTINCT FiscalYear 
								   FROM [integrity].[vw_GetIntegrityHistoryPerExecution] 
								   WHERE ExecutionId = @FedSpedExecutionId 
								 ) 
			GROUP BY FiscalYear

			-- getting student integrity records for FED SPED & Memebership rule types
			SELECT DISTINCT  FiscalYear 
							  ,IntegrityHistoryId
							  ,IntegrityNeedId
							  ,ExecutionId
							  ,MessageId
							  ,StudentUSI
							  ,StudentUniqueId
							  ,SchoolId
							  ,IntegrityRuleTypeId
			INTO   #StudentOct1count											
			FROM   [integrity].[vw_GetIntegrityHistoryPerExecution] Ihe (nolock) 
			WHERE  Ihe.ExecutionId IN (@FedSpedExecutionId,@MembershipExecutionId) 
				AND	StudentUSI IS NOT NULL
				AND Ihe.IntegrityRuleTypeId IN (1,8)			-- FED SPED & Memebership types 


		-- storing IntegrityHistoryIds for the Execution FY in order to delete [IntegrityException] table
			SELECT IntegrityHistoryId 
			INTO #TempIntegrityHistory 
			FROM [oct1].[IntegrityHistory] dest WHERE dest.FiscalYear = @FiscalYear

			 BEGIN TRANSACTION deletetables
		  
				  DECLARE @r INT; 
		
				  SET @r = 1; 
		
				  WHILE @r > 0 
					BEGIN 
					   --  Delete records for the execution FY

						DELETE TOP (100000) dest 
						FROM [oct1].[IntegrityException] dest 
							  JOIN #TempIntegrityHistory s
								ON dest.IntegrityHistoryId = s.IntegrityHistoryId  
		
						DELETE TOP (100000) dest 
						FROM [oct1].[IntegrityHistory] dest
						WHERE FiscalYear = @FiscalYear 
		
						DELETE TOP (100000) dest 
						FROM [oct1].[StudentEnrollmentProgramAssociation] dest  
						WHERE FiscalYear = @FiscalYear 	
		
						DELETE TOP (100000) DEST 
						FROM [oct1].[StudentProgramNeedAssociation] dest 
						WHERE FiscalYear = @FiscalYear 
		
		
						SET @r = @@ROWCOUNT;         
					END; 
		
			COMMIT TRANSACTION deletetables;

-------   1     ---------------------------------------------------------------------------------------------

		  -- getting Only FedSPED rule type records from integrity.IntegrityHistory table & loading oct1.IntegrityHistory table
			WITH IH_CTE 
			   AS (
					SELECT Distinct 
						 ih.IntegrityHistoryId
						,ih.FiscalYear
						,ih.ExecutionId
						,ih.MessageId
						,ih.IntegrityNeedId
						,iin.StudentUSI
						,iin.SchoolId
						,ih.IntegrityResultTypeId
						,ih.IntegrityRunDateTime
						,ih.IntegrityData
						,ih.CreatedDate
					FROM integrity.IntegrityHistory ih
						JOIN integrity.IntegrityNeed iin 
							ON iin.IntegrityNeedId = ih.IntegrityNeedId
								AND iin.IntegrityRuleTypeId	= 8							-- FED SPED rule type
						JOIN #StudentOct1count soc 
							ON soc.FiscalYear = ih.FiscalYear
								AND soc.IntegrityHistoryId = ih.IntegrityHistoryId		
				  ) 	


			MERGE [oct1].[IntegrityHistory] AS ih_dest 
			USING IH_CTE					AS ih_src  
				ON ih_src.FiscalYear = ih_dest.FiscalYear 
				   AND ih_src.IntegrityHistoryId = ih_dest.IntegrityHistoryId 
			  
			 WHEN NOT MATCHED BY TARGET THEN 				
			   INSERT (  IntegrityHistoryId
						,FiscalYear
						,ExecutionId
						,MessageId
						,IntegrityNeedId
						,StudentUSI
						,SchoolId
						,IntegrityResultTypeId
						,IntegrityRunDateTime
						,IntegrityData
						,CreatedDate
					  )
			   VALUES ( ih_src.IntegrityHistoryId
					   ,ih_src.FiscalYear
					   ,ih_src.ExecutionId
					   ,ih_src.MessageId
					   ,ih_src.IntegrityNeedId
					   ,ih_src.StudentUSI
					   ,ih_src.SchoolId
					   ,ih_src.IntegrityResultTypeId
					   ,ih_src.IntegrityRunDateTime
					   ,ih_src.IntegrityData
					   ,ih_src.CreatedDate
					  );


	----------     2     --------------------------------------------------------------------------------

		  -- getting Only FedSPED rule type records from integrity.IntegrityException table & loading oct1.IntegrityException table

			WITH IE_CTE 
			   AS (
					SELECT Distinct 
						 ie.IntegrityExceptionId
						,ie.IntegrityHistoryId
						,ie.ExceptionMessageCode
						,ie.ExceptionSeverityId
						,ie.CreatedDate
					FROM integrity.IntegrityException ie
						JOIN integrity.IntegrityHistory ih 
							ON ih.IntegrityHistoryId = ie.IntegrityHistoryId
						JOIN integrity.IntegrityNeed iin 
							ON iin.IntegrityNeedId = ih.IntegrityNeedId
								AND iin.IntegrityRuleTypeId	= 8							-- FED SPED rule type
						JOIN #StudentOct1count soc 
							ON soc.FiscalYear = ih.FiscalYear
								AND soc.IntegrityHistoryId = ih.IntegrityHistoryId
				  ) 	
			
	    
			MERGE [oct1].[IntegrityException]	AS ie_dest 
			USING IE_CTE						AS ie_src  
				ON ie_src.IntegrityExceptionId = ie_dest.IntegrityExceptionId
			  
			 WHEN NOT MATCHED BY TARGET THEN 				
			   INSERT ( 
						 IntegrityExceptionId
						,IntegrityHistoryId
						,ExceptionMessageCode
						,ExceptionSeverityId
						,CreatedDate
					  )
			   VALUES ( ie_src.IntegrityExceptionId
					   ,ie_src.IntegrityHistoryId
					   ,ie_src.ExceptionMessageCode
					   ,ie_src.ExceptionSeverityId
					   ,ie_src.CreatedDate
					  );

	--------------   3     -------------------------------------------------------------------------------

		 -- getting students with SPED program association records only from leadata.StudentEnrollmentProgramAssociationwithDOR view
		 -- and loading oct1.StudentEnrollmentProgramAssociation table

			WITH SEPA_CTE 
			   AS (
					SELECT Distinct 
						 sepa.FiscalYear
						,sepa.StudentUSI
						,sepa.ProgramTypeId
						,sepa.ProgramName
						,sepa.ProgramEducationOrganizationId
						,sepa.ProgramBeginDate
						,sepa.SchoolId
						,sepa.EnrollmentEntryDate
						,sepa.EnrollmentExitWithdrawDate
						,sepa.EntryTypeDescriptorId
						,sepa.ExitWithdrawTypeDescriptorId
						,sepa.TrackEducationOrganizationId
						,sepa.EntryGradeLevelDescriptorId
						,sepa.MembershipTypeDescriptorId
						,sepa.TrackNumber
						,sepa.MainSPEDschool
						,sepa.DOR
					FROM [leadata].[StudentEnrollmentProgramAssociationwithDOR] sepa
						JOIN #StudentOct1count soc 
							ON soc.FiscalYear = sepa.FiscalYear
								AND	soc.StudentUSI = sepa.StudentUSI
								AND soc.SchoolId = sepa.SchoolId 
						WHERE sepa.ProgramTypeId = 6						-- SPED program
				  ) 	


			MERGE [oct1].[StudentEnrollmentProgramAssociation]	AS sepa_dest 
			USING SEPA_CTE										AS sepa_src  
				ON sepa_src.FiscalYear = sepa_dest.FiscalYear
					AND sepa_src.StudentUSI = sepa_dest.StudentUSI
					AND	sepa_src.ProgramTypeId = sepa_dest.ProgramTypeId
					AND	sepa_src.ProgramName = sepa_dest.ProgramName
					AND	sepa_src.ProgramEducationOrganizationId = sepa_dest.ProgramEducationOrganizationId
					AND	sepa_src.ProgramBeginDate = sepa_dest.ProgramBeginDate
			  		AND	sepa_src.SchoolId = sepa_dest.SchoolId

			 WHEN NOT MATCHED BY TARGET THEN 				
			   INSERT ( 
						 FiscalYear
						,StudentUSI
						,ProgramTypeId
						,ProgramName
						,ProgramEducationOrganizationId
						,ProgramBeginDate
						,SchoolId
						,EnrollmentEntryDate
						,EnrollmentExitWithdrawDate
						,EntryTypeDescriptorId
						,ExitWithdrawTypeDescriptorId
						,TrackEducationOrganizationId
						,EntryGradeLevelDescriptorId
						,MembershipTypeDescriptorId
				  		,TrackNumber
						,MainSPEDschool
						,DOR
						,CreatedDate
					  )
			   VALUES ( 
						sepa_src.FiscalYear
					   ,sepa_src.StudentUSI
					   ,sepa_src.ProgramTypeId
					   ,sepa_src.ProgramName
					   ,sepa_src.ProgramEducationOrganizationId
					   ,sepa_src.ProgramBeginDate
					   ,sepa_src.SchoolId
					   ,sepa_src.EnrollmentEntryDate
					   ,sepa_src.EnrollmentExitWithdrawDate
					   ,sepa_src.EntryTypeDescriptorId
					   ,sepa_src.ExitWithdrawTypeDescriptorId
					   ,sepa_src.TrackEducationOrganizationId
					   ,sepa_src.EntryGradeLevelDescriptorId
					   ,sepa_src.MembershipTypeDescriptorId
					   ,sepa_src.TrackNumber
					   ,sepa_src.MainSPEDschool
					   ,sepa_src.DOR
					   ,GETUTCDATE()
					  );					

	--------------   4    -------------------------------------------------------------------------------

		 -- getting students with SPED & ELL program association records from leadata.StudentProgramNeedAssociation view
		 -- and loading oct1.StudentProgramNeedAssociation table

			WITH SPNA_CTE 
			   AS (
					SELECT Distinct 
							 spna.FiscalYear
							,spna.StudentUSI
							,spna.SchoolId                                  
							,spna.ProgramEducationOrganizationId                          
							,spna.ProgramTypeId
							,spna.ProgramName
							,spna.ProgramBeginDate
							,spna.ProgramEndDate
							,spna.ExitCode
							,spna.ProgramCode
							,spna.NeedDescriptorId
							,spna.NeedCode
							,spna.NeedStartDate
							,spna.NeedEndDate
							,spna.PrimaryStudentNeedIndicator
							,spna.spaSourceId
							,spna.SNSourceId
					FROM leadata.StudentProgramNeedAssociation spna				
							JOIN #StudentOct1count soc 
									ON soc.FiscalYear = spna.FiscalYear
										AND soc.StudentUSI = spna.StudentUSI
										AND soc.SchoolId = spna.SchoolId				
						LEFT JOIN [leadata].[StudentNeedDescriptor] snd
								ON spna.NeedDescriptorId = snd.StudentNeedDescriptorId
									AND snd.StudentNeedCategoryTypeId IN (1,3)							-- SPED & ELL Need category		
							WHERE (spna.ProgramTypeId IN (1,6) OR spna.ProgramTypeId IS NULL )			-- SPED & ELL Program
									AND ( spna.NeedDescriptorId IS NULL OR spna.NeedDescriptorId = snd.StudentNeedDescriptorId )  
				  ) 	


			--MERGE [oct1].[StudentProgramNeedAssociation]		AS spna_dest 
			--USING SPNA_CTE										AS spna_src  
			--	ON spna_src.FiscalYear = spna_dest.FiscalYear
			--		AND spna_src.StudentUSI = spna_dest.StudentUSI
			--		AND spna_src.SchoolId = spna_dest.SchoolId

			-- WHEN NOT MATCHED BY TARGET THEN 				
			--   INSERT ( 
			--			 FiscalYear
			--			,StudentUSI
			--			,SchoolId					
			--			,ProgramEducationOrganizationId	
			--			,ProgramTypeId
			--			,ProgramName
			--			,ProgramBeginDate
			--			,ProgramEndDate
			--			,ExitCode
			--			,ProgramCode
			--			,NeedDescriptorId
			--			,NeedCode
			--			,NeedStartDate
			--			,NeedEndDate
			--	  		,PrimaryStudentNeedIndicator
			--			,spaSourceId
			--			,SNSourceId
			--			,CreatedDate
			--		  )
			--   VALUES ( 
			--			spna_src.FiscalYear
			--		   ,spna_src.StudentUSI
			--		   ,spna_src.SchoolId					
			--		   ,spna_src.ProgramEducationOrganizationId
			--		   ,spna_src.ProgramTypeId
			--		   ,spna_src.ProgramName
			--		   ,spna_src.ProgramBeginDate
			--		   ,spna_src.ProgramEndDate
			--		   ,spna_src.ExitCode
			--		   ,spna_src.ProgramCode
			--		   ,spna_src.NeedDescriptorId
			--		   ,spna_src.NeedCode
			--		   ,spna_src.NeedStartDate
			--		   ,spna_src.NeedEndDate
			--		   ,spna_src.PrimaryStudentNeedIndicator
			--		   ,spna_src.spaSourceId
			--		   ,spna_src.SNSourceId
			--		   ,GETUTCDATE()
			--		 );				

			-- 8/2/2017 - Removed the MERGE for loading [oct1].[StudentProgramNeedAssociation] table as the source (view) has all the columns 
			-- nullbale, except fiscalyear, & studentusi and the merge was not accurate based on just 2 columns.

			INSERT INTO [oct1].[StudentProgramNeedAssociation]
			SELECT   FiscalYear
					,StudentUSI
					,SchoolId                      
					,ProgramEducationOrganizationId
					,ProgramTypeId
					,ProgramName
					,ProgramBeginDate
					,ProgramEndDate
					,ExitCode
					,ProgramCode
					,NeedDescriptorId
					,NeedCode
					,NeedStartDate
					,NeedEndDate
					,PrimaryStudentNeedIndicator
					,spaSourceId
					,SNSourceId
					,GETUTCDATE() AS CreatedDate
			FROM SPNA_CTE

		----------------------------------------------------------------------------------------------

			-- if a student has failed FED SPED with one of the Exception codes defined in oct1.IntegrityRuleExclusion, mark him as Passed
			-- and delete those exception records from IntegrityException and Update the IntegrityHistory table with flag Passed
		
				SELECT DISTINCT
					 exclusion_failed.FiscalYear
					,exclusion_failed.IntegrityHistoryId
					,exclusion_failed.IntegrityNeedId
					,exclusion_failed.ExecutionId
					,exclusion_failed.MessageId
					,exclusion_failed.IntegrityExceptionId
					,exclusion_failed.ExceptionMessageCode	
				INTO #exclusion_failed_only
				FROM
					(	
						(
							SELECT 
			 					ih.FiscalYear
								,ih.IntegrityHistoryId
								,ih.IntegrityNeedId
								,ih.ExecutionId
								,ih.MessageId
								,ie.IntegrityExceptionId
								,ie.ExceptionMessageCode
							FROM 
								oct1.IntegrityHistory ih
								JOIN oct1.IntegrityException ie 
									ON ie.IntegrityHistoryId = ih.IntegrityHistoryId
								JOIN oct1.IntegrityRuleExclusion ire
									ON ire.ExceptionMessageCode = ie.ExceptionMessageCode		
							WHERE
								ih.IntegrityResultTypeId = 2	
						) exclusion_failed
				
						LEFT JOIN
		
						(	
						SELECT 
							ih.FiscalYear
							,ih.IntegrityHistoryId
							,ih.IntegrityNeedId
							,ih.ExecutionId
							,ih.MessageId
							,ie.IntegrityExceptionId
							,ie.ExceptionMessageCode
						FROM 
							oct1.IntegrityHistory ih
							JOIN oct1.IntegrityException ie 
								ON ie.IntegrityHistoryId = ih.IntegrityHistoryId
						WHERE
							ih.IntegrityResultTypeId = 2 
		
						) fed_failed
				
					ON 	fed_failed.FiscalYear = exclusion_failed.FiscalYear	
						AND fed_failed.IntegrityHistoryId = exclusion_failed.IntegrityHistoryId
						AND fed_failed.ExecutionId = exclusion_failed.ExecutionId
						AND fed_failed.ExceptionMessageCode <> exclusion_failed.ExceptionMessageCode
				 )
				WHERE 
					fed_failed.ExceptionMessageCode IS NULL 


					BEGIN TRANSACTION IntegHistoryUpdate

						-- delete Oct1_passed records from oct1.InetegrityException

						DELETE oie
						FROM oct1.IntegrityException oie
						JOIN #exclusion_failed_only op 
							ON oie.IntegrityHistoryId = op.IntegrityHistoryId
			
						-- update oct1.IntegrityHistory for resulttype, to passed

						UPDATE oih
						SET oih.IntegrityResultTypeId = 1		-- passed
						FROM oct1.IntegrityHistory oih
							JOIN #exclusion_failed_only op ON op.FiscalYear = oih.FiscalYear
								AND op.IntegrityHistoryId = oih.IntegrityHistoryId
								AND op.ExecutionId = oih.ExecutionId

						DROP TABLE #exclusion_failed_only

					COMMIT TRANSACTION IntegHistoryUpdate
	------------------------------------------------------------------------------------------------------------------------------------------------------------

				-- The following section of logic has to be after the above section of logic, where we checked the students Failed for 4 FED Sped exclusion rules 
				-- and mark them as FED SPED PASSED. In this section again we check for 31 membership failures (MembershipIntegrityRuleInclusion table) and mark them as Failed

				-- getting all the students who passed FED SPED but failed any of 30 membership rules 
					SELECT 
						 fed_passed.fiscalyear
						,fed_passed.Studentusi
						,fed_passed.schoolid 
					INTO  #TMPMembershipFailed
					FROM
						(
							SELECT 
								oih.FiscalYear
								,oih.SchoolId
								,oih.StudentUSI
							FROM 
								oct1.IntegrityHistory oih
							WHERE
								Oih.IntegrityResultTypeId = 1  
						) fed_passed

							INNER JOIN 
						(
							SELECT Distinct 
								 soc.FiscalYear
								,soc.SchoolId
								,soc.StudentUSI  
							FROM #StudentOct1count soc -- 1474972
								 JOIN integrity.IntegrityHistory ih
									ON  ih.IntegrityHistoryId = soc.IntegrityHistoryId
										AND ih.IntegrityResultTypeId = 2			-- failed
										AND soc.IntegrityRuleTypeId = 1				-- membership rule type

								 JOIN integrity.IntegrityException ie
									ON ie.IntegrityHistoryId = ih.IntegrityHistoryId

								 JOIN [oct1].[MembershipIntegrityRuleInclusion] mir
									ON mir.ExceptionMessageCode = ie.ExceptionMessageCode
							WHERE
								 soc.FiscalYear = ih.FiscalYear
						)membership_failed ON 
									fed_passed.FiscalYear = membership_failed.FiscalYear
			 						AND	fed_passed.StudentUSI = membership_failed.StudentUSI	
									AND	fed_passed.SchoolId = membership_failed.SchoolId			



					-- Updating the students as FED SPED Failed who passed FEDSPED but failed one of 30 membership rules
					UPDATE oih
					SET oih.IntegrityResultTypeId = 2		-- failed
					FROM  oct1.IntegrityHistory oih
						JOIN #TMPMembershipFailed mf ON mf.FiscalYear = oih.FiscalYear
							AND mf.StudentUSI = oih.StudentUSI
							AND mf.SchoolId = oih.SchoolId				 

				DROP TABLE #StudentOct1count
				DROP TABLE #TempIntegrityHistory		
				DROP TABLE #TMPMembershipFailed

		COMMIT TRAN LoadOct1Data

	END TRY

	BEGIN CATCH
	if @@TRANCOUNT > 0
	 		BEGIN
	 			ROLLBACK TRAN LoadOct1Data;				
	 			Throw ; 
	 		END
	 
	END CATCH

END	

/* END oct1.LoadOct1SpedData */