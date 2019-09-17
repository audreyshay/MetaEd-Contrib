-- =========================================================================================================================================
-- Author:           Rohith chintamaneni
-- Create date: 9/8/2017
-- Description: Populates [AzEDS].[process].[ExecutionEducationOrganization] for 915 process
-- This table is used to set ISintegrityneeded flag for 915 integity. For StateWide integrity you dont need to populate this table as we go 
-- against record ownership table to set ISintegrityneeded flag
-- Include both Begin and endates correctly in the where clause. All the schools on that day ending at 5 Pm should still be considered for Integrity at 6 PM.
--
--	Who					When		What
--  Rohith chintamaneni	9/8/2017	Initial Creation
--	Rohith chintamaneni	10/10/2017  Changing the executionType from 2 to 3
--	Pratibha Kanyar		03/06/2018  Added the filter by RequestTypeId for Calendar 915 & logic to make entry for 915 ADM ExecutionId even when 
--									there no open student 915 but only 915 Calendar 
--	P Kanyar			07/25/2018  Fixed the logic that included closed request that had a successful integrity run after the Request Enddtm to run again
--									Removed the logic that was handling the scenario where the user can close the request to a prior date (UI is taking care of that now)
--	P Kanyar			07/26/2018  Removed the logic CONVERT(Date,@CurrentDtm) <=  R.LastModifiedDtm) from the other select stmt too (UI is taking care of that now)
--	Vinoth K			07/26/2019  Added the processtypeid for non student resource which we are enabled for 915 student
-- 
-- ============================================================================================================================================================
CREATE PROCEDURE [process].[PopulateExecutionEducationOrganization] 
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
		  

		/*This table is used to set ISintegrityneeded flag for 915 Calendar & 915 ADM integity. 
		This table will get populated for only 915 Calendar & 915 ADM integity not for 915 Aggregation.
		For StateWide integrity you dont need to populate this table as we go against record ownership table to set ISintegrityneeded flag */

		    IF (@executionTypeid = 3 AND @ProcessTypeId IN (1,12,8))  -- handle both (Calendar 915) and (Student 915 when there is Request record) 
				BEGIN
				    INSERT INTO process.ExecutionEducationOrganization (Executionid, EducationOrganizationId, FiscalYear)	 
					SELECT DISTINCT 
						   @ExecutionId
						  ,R.LocalEducationAgencyId
						  ,R.FiscalYear 
					FROM [915].request R 
					JOIN config.ProcessTypeRequestTypeAssociation PTRT
						ON PTRT.RequestTypeId = R.RequestTypeId
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

					/* We create an ExecutionId for 915 ADM also when there is ONLY a 915 Calendar request but no 915 Student request. 
					   For this we will not find a record in [915].Request to get the EducationOrganizationId. We have to get the LocalEducationAgencyId of Calendar 915 request. */

					--  handle only student 915 request, when there is no student 915 request but a calendar 915 open 
					UNION					

					SELECT DISTINCT										
						   @ExecutionId
						  ,R.LocalEducationAgencyId
						  ,R.FiscalYear 
					FROM [915].request R 
					JOIN config.ProcessTypeRequestTypeAssociation PTRT
						ON PTRT.RequestTypeId = R.RequestTypeId
					WHERE R.FiscalYear = @FiscalYear
						AND PTRT.ProcessTypeId = 12 	
						AND @ProcessTypeId = 1
						AND (@CurrentDtm >=  r.BeginDtm	AND CONVERT(Date,@CurrentDtm) <=  R.EndDtm )
				END
END

