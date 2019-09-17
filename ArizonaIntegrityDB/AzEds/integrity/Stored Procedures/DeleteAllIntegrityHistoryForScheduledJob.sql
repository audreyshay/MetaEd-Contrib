/************************************************************
**Procedure Name: integrity.DeleteAllIntegrityHistoryForScheduledJob
**
**Author: Britto Augustine
**
**Description: Archive integrity histroy and integrity exceptions for the next 
**			   run of schedule integrity job.
**			   This proc is called by ActiveBatch that triggers the integrity schedule
**					
**Revision History:
**	Who			When		What
**	BA			1/28/2016	Initial Creation
**	BA			6/28/2016	Changed to accomodate FY executions
**	RC			9/8/2016    Remove processType as we will be pulling this on BusinessID between STC and ADM integrity
**	RC			9/15/2016	Adding process Type = 1 back so that we are deleting the previous execution - Ignore 9/8/2016 comment
**	RC			9/16/2016	fix on 9/15 did not resolve the issue completely, Hence passing ProcessTypeId as Parameters
**	BA			12/12/2016  Removed BusinessGroupId parameter because the ProcessType parameter can now uniquely identify the various integrity types.
**                          Also changed it to not insert into IntegrityHistoryArchive if process type is STC	
**	RC			9/5/2017	Archiving now based on executionid and cleaning history records with status TYpeid = 3
**	Vinoth		12/12/2017	Added the new columns ExceptionDetails to move the details from exception table to archive table
**  Rchinta		4/6/2018	Fixing the ADM issue by cleaning Integrity history for previous executions, 
**  Rchinta		4/6/2018 TODO - Must and should revisit this proc to handle deletes for Post submission calendar
**  Rchinta		7/12/2018	- Implemented the Post submission calendar for a LEA,school, TrackNUmber
**  Vinoth		5/10/2019	- Implemented the Post submission calendar for a LEA,school, CalendarCode for Fy2020 
***************************************************************/
CREATE PROC [integrity].[DeleteAllIntegrityHistoryForScheduledJob]	
	@executionid as int
AS
BEGIN

	Declare @processTypeid as int, @FiscalYear int, @executionType int, @loopcount INT	
	SET @loopcount = 1; 

	Declare @CurrentExecutionEducationOrganzations Table
	(
	EducationOrganizationId int,
	Schoolid int,
	TrackNumber smallint,
	CalendarCode Varchar(60)
	)	

	Declare @PreviousExecutionEducationOrganzations Table
	(
	EducationOrganizationId int,
	Schoolid int,
	TrackNumber smallint,
	CalendarCode Varchar(60)
	)	

			

	--get the last (max) execution id for the state wide integrity run for the process type
	select @processTypeid = e.ProcessTypeId, @FiscalYear = FiscalYear, @executionType = ExecutionTypeId
	from process.Execution e
	where 
		e.ExecutionId = @executionid

	 	 
	if @processTypeid <> 8					--not archiving if it is STC
	begin
		print 'insert into IntegrityHistoryArchive'
		
		Insert into integrity.IntegrityHistoryArchive
		(
			IntegrityHistoryId,
			FiscalYear,
			ExecutionId,
			MessageId,
			IntegrityNeedId,
			IntegrityResultTypeId,
			IntegrityRunDateTime,
			IntegrityData,
			CreatedDate 		
		)
		Select 
			IntegrityHistoryId,
			FiscalYear,
			ExecutionId,
			MessageId,
			IntegrityNeedId,
			IntegrityResultTypeId,
			IntegrityRunDateTime,
			IntegrityData,
			CreatedDate
		from integrity.IntegrityHistory
		where ExecutionId = @executionid

		Insert into integrity.IntegrityExceptionArchive
		(
			IntegrityExceptionId,
			IntegrityHistoryId,
			ExceptionMessageCode,
			ExceptionSeverityId,
			CreatedDate,
			ExceptionDetails,
			Actual,
			Expected 
		)
		Select 
			ie.IntegrityExceptionId,
			ie.IntegrityHistoryId,
			ie.ExceptionMessageCode,
			ie.ExceptionSeverityId,
			ie.CreatedDate,
			ie.ExceptionDetails,
			ie.Actual,
			ie.Expected 
		from integrity.IntegrityException ie
		join integrity.IntegrityHistory ih
		  on ih.IntegrityHistoryId = ie.IntegrityHistoryId
         and ih.ExecutionId = @executionid		
		END

				 
		 If(@executionType = 1 ) -- Statewide
		 BEGIN	 	

			
			SELECT 
			Executionid, 
			ProcessTypeId,
			ExecutionTypeId, 
			FiscalYear 
			INTO #RecordsToBeDeleted 
			FROM process.Execution E
			WHERE E.FiscalYear = @FiscalYear 
					AND E.ExecutionTypeId = @executionType 
					AND E.ProcessTypeId = @processTypeid 
					AND ExecutionId < @executionid
			GROUP BY Executionid, 
					 ProcessTypeId,
					 ExecutionTypeId, 
					 FiscalYear	
			
			-- DELETE Exceptions
			WHILE @loopcount > 0 
			BEGIN 

			BEGIN TRANSACTION; 		

			DELETE TOP (50000) IE FROM Integrity.IntegrityException IE 
			INNER JOIN Integrity.IntegrityHistory (nolock) IH on IE.IntegrityHistoryId = IH.IntegrityHistoryId
			INNER JOIN integrity.IntegrityNeed (nolock) ind on IH.IntegrityNeedId = ind.IntegrityNeedId and IH.FiscalYear = ind.FiscalYear
			INNER JOIN #RecordsToBeDeleted E on E.ExecutionId = IH.ExecutionId and E.Fiscalyear = IH.FiscalYear
          
		    SET @loopcount = @@ROWCOUNT; 

				COMMIT TRANSACTION; 
			END;

			-- DELETE History
			SET @loopcount = 1

			WHILE @loopcount > 0 
			BEGIN 

			BEGIN TRANSACTION; 		

			DELETE TOP (50000) IH FROM  Integrity.IntegrityHistory  IH 
			INNER JOIN integrity.IntegrityNeed (nolock) ind on IH.IntegrityNeedId = ind.IntegrityNeedId and IH.FiscalYear = ind.FiscalYear
			INNER JOIN #RecordsToBeDeleted E on E.ExecutionId = IH.ExecutionId and E.Fiscalyear = IH.FiscalYear
          
		    SET @loopcount = @@ROWCOUNT; 

				COMMIT TRANSACTION; 
			END;

		DROP Table #RecordsToBeDeleted

		 END

		 IF(@executionType = 3 and @processTypeid = 1)  -- Handle deletes for 915 Student
		 BEGIN
		  -- Get number of LEAS from Current Execution
		    Insert into @CurrentExecutionEducationOrganzations (EducationOrganizationid)
			Select EducationOrganizationId 
			from process.ExecutionEducationOrganization			
			where ExecutionId = @executionid
		
				
			;With Cteprevious915Execution (ExecutionId)   -- Get number of LEAS from previous Execution		
			AS
			(
			Select (
				Select top(1) E.ExecutionId from process.ExecutionEducationOrganization EO
				Inner join Process.Execution E on EO.FiscalYear = E.FiscalYear and Eo.ExecutionId = E.ExecutionId  
				where E.ExecutionId <  @executionid	and E.FiscalYear = @FiscalYear	and E.ProcessTypeId = @processTypeid	
				group by E.ExecutionId
				order by E.ExecutionId desc
				)
			)
			Insert into  @PreviousExecutionEducationOrganzations (EducationOrganizationid)
			Select EducationOrganizationId 
			from process.ExecutionEducationOrganization PEEO
			Inner join  Cteprevious915Execution PE on PE.ExecutionId = PEEO.ExecutionId 
		
		
			/* consider the 3 scenarios for data that exist in Process.ExecutionEducationOrganizations between 2 last executions. 
				Previous Execution| Current Execution
				---------------------------------------
						Exists	  |		Exists			-- Must be deleted from integrity history for previous execution
					Not	Exists	  |		Exists			-- Must be deleted from integrity history for previous execution
						Exists	  |	Not	Exists			-- Should not be deleted from integrity history for previous execution as 915 process is complete for that LEA.
			*/ 
			-- Implementing the above Idea in below Query
			Declare @ListOfLeasTobeDeleted table
			(
			EducationOrganizationid Int
			)

			Insert into @ListOfLeasTobeDeleted
			Select * from
			(
				(
					Select EducationOrganizationId from @CurrentExecutionEducationOrganzations
					Except																							-- FOR new LEAS that are added we must delete previous Execution record
					Select EducationOrganizationId from @PreviousExecutionEducationOrganzations
				)
			Union
				(
					Select EducationOrganizationId from @CurrentExecutionEducationOrganzations
					Intersect																						-- For LEAS that match we must delete previous execution records
					Select EducationOrganizationId from @PreviousExecutionEducationOrganzations
				)
			) as ListofLEAS

			Delete IE from Integrity.IntegrityException IE 
			inner join Integrity.integrityHistory IH on IE.IntegrityHistoryId = IH.IntegrityHistoryId
			Inner JOin integrity.IntegrityNeed ind on Ind.IntegrityNeedId = ih.IntegrityNeedId
			inner join @ListOfLeasTobeDeleted P on ind.SubmittedByEducationOrganizationId = p.EducationOrganizationId
			Where ih.ExecutionId < @executionid and ih.FiscalYear = @FiscalYear


			DELETE IH from Integrity.integrityHistory IH 
			Inner JOin integrity.IntegrityNeed ind on Ind.IntegrityNeedId = ih.IntegrityNeedId
			inner join @ListOfLeasTobeDeleted P on ind.SubmittedByEducationOrganizationId = p.EducationOrganizationId
			Where ih.ExecutionId < @executionid and ih.FiscalYear = @FiscalYear



		 END

		  IF(@executionType = 3 and @processTypeid = 12 and @FiscalYear=2019)  -- Handle deletes for 915 Calendar
		 BEGIN

		  -- Get number of LEAS from Current Execution
		    Insert into @CurrentExecutionEducationOrganzations (EducationOrganizationid, Schoolid, TrackNumber)
			Select Distinct R.LocalEducationAgencyId,  CR.SchoolId, CR.TrackNumber
			from [process].[ExecutionRequestAssociation] ERA
			Inner join [915].request R on ERA.RequestId = R.RequestId and R.RequestTypeId = 2 -- for calendar requests only
			Inner join [915].CalendarRequest CR on R.RequestId = CR.RequestId
			where ExecutionId = @executionid

			;With Cteprevious915Execution (ExecutionId)   -- Get previous Execution		
			AS
			(
			Select (
				Select top(1) E.ExecutionId from process.ExecutionEducationOrganization EO
				Inner join Process.Execution E on EO.FiscalYear = E.FiscalYear and Eo.ExecutionId = E.ExecutionId  
				where E.ExecutionId <  @executionid	and E.FiscalYear = @FiscalYear	and E.ProcessTypeId = @processTypeid	
				group by E.ExecutionId
				order by E.ExecutionId desc
				)
			)
			Insert into  @PreviousExecutionEducationOrganzations (EducationOrganizationId, Schoolid, TrackNumber) 
			Select Distinct R.LocalEducationAgencyId,CR.SchoolId, CR.TrackNumber 
			from  [process].[ExecutionRequestAssociation] ERA
			INNER JOIN  Cteprevious915Execution PE on PE.ExecutionId = ERA.ExecutionId 
			INNER JOIN [915].request R on ERA.RequestId = R.RequestId and R.RequestTypeId = 2 -- for calendar requests only
			INNER JOIN [915].CalendarRequest CR on R.RequestId = CR.RequestId

			/* consider the 3 scenarios for data that exist in Process.ExecutionEducationOrganizations between 2 last executions. 
				Previous Execution| Current Execution
				---------------------------------------
						Exists	  |		Exists			-- Must be deleted from integrity history for previous execution
					Not	Exists	  |		Exists			-- Must be deleted from integrity history for previous execution
						Exists	  |	Not	Exists			-- Should not be deleted from integrity history for previous execution as 915 process is complete for that LEA.
			*/ 
			-- Implementing the above Idea in below Query
			Declare @ListOfLeaSchoolTracksTobeDeleted table
			(
			EducationOrganizationid Int,
			SchoolId int,
			TrackNumber int
			)
			Insert into @ListOfLeaSchoolTracksTobeDeleted(EducationOrganizationId, Schoolid, TrackNumber)
			Select EducationOrganizationId, Schoolid, TrackNumber from
			(
				(
					Select EducationOrganizationId, Schoolid, TrackNumber from @CurrentExecutionEducationOrganzations
					Except																							-- FOR new LEAS that are added we must delete previous Execution record
					Select EducationOrganizationId, Schoolid, TrackNumber from @PreviousExecutionEducationOrganzations
				)
			Union
				(
					Select EducationOrganizationId, Schoolid, TrackNumber from @CurrentExecutionEducationOrganzations
					Intersect																						-- For LEAS that match we must delete previous execution records
					Select EducationOrganizationId, Schoolid, TrackNumber from @PreviousExecutionEducationOrganzations
				)
			) as ListofLEA_School_Tracks


			Delete IE from Integrity.IntegrityException IE 
			INNER JOIN Integrity.integrityHistory IH on IE.IntegrityHistoryId = IH.IntegrityHistoryId
			INNER JOIN integrity.IntegrityNeed ind on Ind.IntegrityNeedId = ih.IntegrityNeedId
			INNER JOIN @ListOfLeaSchoolTracksTobeDeleted P on ind.TrackLocalEducationAgencyId = p.EducationOrganizationId and ind.SchoolId = P.SchoolId and ind.TrackNumber = P.TrackNumber
			Where ih.ExecutionId < @executionid and ih.FiscalYear = @FiscalYear


			DELETE IH from Integrity.integrityHistory IH 
			INNER JOIN integrity.IntegrityNeed ind on Ind.IntegrityNeedId = ih.IntegrityNeedId
			INNER JOIN @ListOfLeaSchoolTracksTobeDeleted P on ind.TrackLocalEducationAgencyId = p.EducationOrganizationId and ind.SchoolId = P.SchoolId and ind.TrackNumber = P.TrackNumber
			Where ih.ExecutionId < @executionid and ih.FiscalYear = @FiscalYear


		 END
		 
		  IF(@executionType = 3 and @processTypeid = 12 and @FiscalYear>2019)  -- Handle deletes for 915 Calendar
		 BEGIN

		  -- Get number of LEAS from Current Execution
		    Insert into @CurrentExecutionEducationOrganzations (EducationOrganizationid, Schoolid,CalendarCode )
			Select Distinct R.LocalEducationAgencyId,  CR.SchoolId, CR.CalendarCode
			from [process].[ExecutionRequestAssociation] ERA
			Inner join [915].request R on ERA.RequestId = R.RequestId and R.RequestTypeId = 2 -- for calendar requests only
			Inner join [915].CalendarRequest CR on R.RequestId = CR.RequestId
			where ExecutionId = @executionid

			;With Cteprevious915Execution (ExecutionId)   -- Get previous Execution		
			AS
			(
			Select (
				Select top(1) E.ExecutionId from process.ExecutionEducationOrganization EO
				Inner join Process.Execution E on EO.FiscalYear = E.FiscalYear and Eo.ExecutionId = E.ExecutionId  
				where E.ExecutionId <  @executionid	and E.FiscalYear = @FiscalYear	and E.ProcessTypeId = @processTypeid	
				group by E.ExecutionId
				order by E.ExecutionId desc
				)
			)
			Insert into  @PreviousExecutionEducationOrganzations (EducationOrganizationId, Schoolid,CalendarCode) 
			Select Distinct R.LocalEducationAgencyId,CR.SchoolId, CR.CalendarCode 
			from  [process].[ExecutionRequestAssociation] ERA
			INNER JOIN  Cteprevious915Execution PE on PE.ExecutionId = ERA.ExecutionId 
			INNER JOIN [915].request R on ERA.RequestId = R.RequestId and R.RequestTypeId = 2 -- for calendar requests only
			INNER JOIN [915].CalendarRequest CR on R.RequestId = CR.RequestId

			/* consider the 3 scenarios for data that exist in Process.ExecutionEducationOrganizations between 2 last executions. 
				Previous Execution| Current Execution
				---------------------------------------
						Exists	  |		Exists			-- Must be deleted from integrity history for previous execution
					Not	Exists	  |		Exists			-- Must be deleted from integrity history for previous execution
						Exists	  |	Not	Exists			-- Should not be deleted from integrity history for previous execution as 915 process is complete for that LEA.
			*/ 
			-- Implementing the above Idea in below Query
			Declare @ListOfLeaSchoolCalendarTobeDeleted table
			(
			EducationOrganizationid Int,
			SchoolId int,
			CalendarCode Varchar(60)
			)
			Insert into @ListOfLeaSchoolCalendarTobeDeleted(EducationOrganizationId, Schoolid, CalendarCode)
			Select EducationOrganizationId, Schoolid, CalendarCode from
			(
				(
					Select EducationOrganizationId, Schoolid, CalendarCode from @CurrentExecutionEducationOrganzations
					Except																							-- FOR new LEAS that are added we must delete previous Execution record
					Select EducationOrganizationId, Schoolid, CalendarCode from @PreviousExecutionEducationOrganzations
				)
			Union
				(
					Select EducationOrganizationId, Schoolid, CalendarCode from @CurrentExecutionEducationOrganzations
					Intersect																						-- For LEAS that match we must delete previous execution records
					Select EducationOrganizationId, Schoolid, CalendarCode from @PreviousExecutionEducationOrganzations
				)
			) as ListofLEA_School_Tracks


			Delete IE from Integrity.IntegrityException IE 
			INNER JOIN Integrity.integrityHistory IH on IE.IntegrityHistoryId = IH.IntegrityHistoryId
			INNER JOIN integrity.IntegrityNeed ind on Ind.IntegrityNeedId = ih.IntegrityNeedId
			INNER JOIN @ListOfLeaSchoolCalendarTobeDeleted P on ind.TrackLocalEducationAgencyId = p.EducationOrganizationId and ind.SchoolId = P.SchoolId and ind.CalendarCode = P.CalendarCode
			Where ih.ExecutionId < @executionid and ih.FiscalYear = @FiscalYear


			DELETE IH from Integrity.integrityHistory IH 
			INNER JOIN integrity.IntegrityNeed ind on Ind.IntegrityNeedId = ih.IntegrityNeedId
			INNER JOIN @ListOfLeaSchoolCalendarTobeDeleted P on ind.TrackLocalEducationAgencyId = p.EducationOrganizationId and ind.SchoolId = P.SchoolId and ind.CalendarCode = P.CalendarCode
			Where ih.ExecutionId < @executionid and ih.FiscalYear = @FiscalYear


		 END
		 

END



