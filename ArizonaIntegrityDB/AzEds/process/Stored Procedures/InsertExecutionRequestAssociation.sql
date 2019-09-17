-- =============================================================================================================================================
-- Author:      Pratibha Kanyar
-- Create date:	03/06/2018
-- Description: To Populate [AzEDS].[process].[ExecutionRequestAssociation] to track 915 process
--
--	Who			When		What
--	P Kanyar	07/25/2018  Fixed the logic that included closed request that had a successful integrity run after the Request Enddtm to run integrity again
--							Removed the logic that was handling the scenario where the user can close the request to a prior date (UI is taking care of that now)
--	P Kanyar	07/26/2018  Removed the logic CONVERT(Date,@CurrentDtm) <=  R.LastModifiedDtm) from the other select stmt too (UI is taking care of that now)
--	Vinoth K	07/26/2019  Added the processtypeid for non student resource which we are enabled for 915 student
--
-- ============================================================================================================================================================
CREATE PROCEDURE [process].[InsertExecutionRequestAssociation] 
		@ExecutionId AS INT,		 
		@ExecutionTypeId INT,
		@FiscalYear INT,
		@ProcessTypeId INT
AS
BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.

       SET NOCOUNT ON;
       DECLARE @CurrentDtm DATETIME
       SET @CurrentDtm = GETDATE()		 											

   
	   IF(@executionTypeid = 3 AND @ProcessTypeId IN (1,12,8))  -- (handle calendar 915) + (student 915 when a student 915 request exists)
			BEGIN
			   INSERT INTO process.ExecutionRequestAssociation (ExecutionId, RequestId)
			   SELECT DISTINCT 
					 @ExecutionId
					,RequestId
			   FROM [915].Request r 
			   JOIN config.ProcessTypeRequestTypeAssociation ptrt
					ON ptrt.RequestTypeId = r.RequestTypeId
			   WHERE R.FiscalYear = @FiscalYear
					AND ptrt.ProcessTypeId = @ProcessTypeId 
					AND ( (@CurrentDtm >=  r.BeginDtm	AND CONVERT(Date,@CurrentDtm) <= R.EndDtm )										-- For all the Open 915 requests
						 OR											
						  ( CONVERT(Date,@CurrentDtm) > r.EndDtm AND NOT EXISTS ( SELECT 1 FROM process.Execution pe (NOLOCK)			-- For closed request, when there is no successful integrity run after the Request Enddtm
																				  WHERE pe.FiscalYear = r.FiscalYear 
																					AND pe.StatusTypeId = 6 
																					AND pe.ExecutionTypeId = 3 
																					AND pe.ProcessTypeId = ptrt.ProcessTypeId
																					AND pe.InitiatedDateTime > r.EndDtm	 --(CONVERT(Date,pe.InitiatedDateTime) > r.EndDtm)
																			    )
						  )	
					    )

				UNION

				/* We create an ExecutionId for 915 ADM also in process.Execution when there is ONLY a 915 Calendar request but no 915 Student request. 
				   For this we will not find a record in [915].Request to get the RequestId. We have to get the RequestId of Calendar 915 request. */

					--  Insert executionid for student 915, when there is no student 915 request but there is a calendar 915 open
				SELECT DISTINCT										
						@ExecutionId
						,R.RequestId
				FROM [915].request r 
				JOIN config.ProcessTypeRequestTypeAssociation ptrt
					ON ptrt.RequestTypeId = r.RequestTypeId
				WHERE r.FiscalYear = @FiscalYear
					AND ptrt.ProcessTypeId = 12 
					AND @ProcessTypeId = 1	
					AND (@CurrentDtm >=  r.BeginDtm	AND CONVERT(Date,@CurrentDtm) <=  R.EndDtm )									
			END
END

