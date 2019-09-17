/************************************************************ 
**Procedure Name: Integrity.GetIntegrityNeed 
** 
**Author: Rohith Chintamaneni 
** 
**Description:  Gets the IntegrityNeed for each RuleType 
**   
**Revision History: 
**  Who      When    What 
**  RC      11/05/2015  Initial Creation 
**  RC		11/06/2015 Adding Integrity Run date time
**	RC		11/6/2015 Removing The between logic and inserting the 
**  RC		1/21/2016 got rid of while loop
**  RC		1/26/2016 Changing NewID with Sequence
**	RC		3/30/2016 Adding FiscalYear Logicto where clause
**  RC		6/13/2016 Updating the Getdate to GETUTCDATE
**	RC		6/21/2016 Adding ProcessSubTypes to make sure we populate data in integrity history for that subtype only.
**  RC		3/28/2017 Removing the transactions and update on temp table. Instead inserting directly into integrityhistory
**	RC		7/21/2017 updating the proc to insert messages order by IntegrityRUleTypeID
**  RC		8/16/2017 915 changes to update integrityhistory without deleting for new execution
**  JD      5/22/2018 change merge to update and insert
***************************************************************/ 
CREATE PROCEDURE [integrity].[InsertIntegrityHistoryInBatches]  @ExecutionID INT, 
                                                               @BatchLimit  INT ,
															   @ProcessSubTypes Varchar(1024)
AS 
  BEGIN 
     SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
            DECLARE @countofIntegrityNeedrecords AS INT,
				   @numofNTilebuckets INT,
				   @Fiscalyear INT		
               
			   -- to prevent execution of while loop infinitely. Check if condition in While loop for more details - rchinta
			Delete from Integrity.integrityhistory
			where executionid = @ExecutionID

			Delete from process.MessageLog
			where executionid = @ExecutionID

			SELECT @Fiscalyear = FiscalYear FROM process.execution
			WHERE executionid = @ExecutionID

			DECLARE @TempprocessSubTypes TABLE ([ProcessSubType] nvarchar(50))
			INSERT INTO @TempprocessSubTypes SELECT DISTINCT [Token] from [util].[Split](@ProcessSubTypes, ',' )	
			      
			SELECT 
					@countofIntegrityNeedrecords = COUNT(*)  
			 FROM   
			 [integrity].[integrityneed] INS (NOLOCK)
             INNER JOIN [integrity].[integrityruletype] IRT (NOLOCK)
                    ON IRT.integrityruletypeid = INS.integrityruletypeid 
             INNER JOIN [process].[executionprocesssubtype] EPT (NOLOCK)
                    ON EPT.processsubtypeid = IRT.integritytypeid 
             INNER JOIN [process].execution E (NOLOCK)
                    ON EPT.executionid = E.executionid
			 INNER JOIN	@TempprocessSubTypes PST 
				    ON PST.ProcessSubType = EPT.processsubtypeid	 
			 WHERE  E.executionid = @ExecutionId 
					AND INS.[isintegrityneeded] = 1 AND INS.FiscalYear = @Fiscalyear

			-- if the countofIntegrityneed records is less than batchlimit then you default make as a single bucket
			SET @numofNTilebuckets = Ceiling(Cast(@countofIntegrityNeedrecords as float)/@BatchLimit)

              CREATE TABLE #TempIntegrityNeedRecords 
              ( 
                 rownumber           INT, 
                 integrityneedid     INT, 
				 GroupId			 INT,			
                 fiscalyear          INT, 
                 integrityruletypeid INT, 
                 isintegrityneeded   INT, 
                 studentuniqueid     INT, 
                 schoolid            INT, 
                 schoolentrydate     DATETIME,
				 MessageId Nvarchar(36) NULL,
				 PRIMARY KEY(IntegrityNeedid, GroupID)
              )
			  
			CREATE TABLE #GroupTable
			(
			GroupId INT,
			CountofRecordsPerBatch INT,
			GuidId NVARCHAR(36) NULL			
			) 
		    
            INSERT INTO #TempIntegrityNeedRecords
			(
				rownumber           ,
				integrityneedid     ,
				fiscalyear          ,
			    integrityruletypeid ,
				isintegrityneeded   ,
				studentuniqueid     ,
				schoolid            ,
				schoolentrydate     ,
				GroupId
				)
			SELECT ROW_NUMBER() 
                 OVER(ORDER BY integrityneedid) AS RowNumber, 
                 integrityneedid, 
                 INS.fiscalyear, 
                 INS.integrityruletypeid, 
                 INS.isintegrityneeded, 
                 INS.studentuniqueid, 
                 INS.schoolid, 
                 INS.schoolentrydate,
				 NTILE(@numofNTilebuckets)  over(order by IRT.integrityruletypeid)
            FROM   [integrity].[integrityneed] INS (nolock)
                 INNER JOIN [integrity].[integrityruletype] IRT (nolock)
                         ON IRT.integrityruletypeid = INS.integrityruletypeid 
                 INNER JOIN [process].[executionprocesssubtype] EPT (nolock)
                         ON EPT.processsubtypeid = IRT.integritytypeid 
                 INNER JOIN [process].execution E (nolock)
                         ON EPT.executionid = E.executionid 
            WHERE  E.executionid = @ExecutionId and INS.FiscalYear = @Fiscalyear
                 AND INS.[isintegrityneeded] = 1 
            --ORDER  BY IRT.integrityruletypeid

		    INSERT INTO #GroupTable
			(
			GroupId,
			CountofRecordsPerBatch,
			GuidId 	
			)
		    SELECT 
		    GroupId, 
			Count(*) as CountofRecordsPerBatch,
		    --NEWID() AS guidID			
			CAST(NEXT VALUE FOR integrity.IntegrityMessageLogId AS NVARCHAR(36))
		    FROM #TempIntegrityNeedRecords T
		    GROUP BY T.GroupId		
		   

		   UPDATE DEST
		    SET 
				 DEST.executionid = @ExecutionID
				,DEST.Fiscalyear = SRC.fiscalyear
				,DEST.messageid = c.GuidId
				,DEST.integrityresulttypeid = 0  -- set integrittyresult as 0 
				,DEST.IntegrityRunDateTime = GETUTCDATE()				
				,DEST.IntegrityData = null
				FROM integrity.IntegrityHistory DEST
				INNER JOIN #TempIntegrityNeedRecords src
				ON src.IntegrityNeedId = DEST.IntegrityNeedId
				INNER JOIN #GroupTable c ON c.GroupId = src.GroupId

		INSERT INTO integrity.integrityhistory (
				fiscalyear, 
				executionid, 
				messageid, 
				integrityneedid, 
				integrityresulttypeid, 
				IntegrityRunDateTime,
				createddate
			)
			SELECT 
				src.fiscalyear, 
				@ExecutionID,
				c.GuidId,				
				src.integrityneedid,
				0,
				GETUTCDATE(),
				GETUTCDATE()	
			FROM 
				#TempIntegrityNeedRecords src
				INNER JOIN #GroupTable c ON c.GroupId = src.GroupId
				LEFT OUTER JOIN integrity.integrityhistory DEST
				 on src.IntegrityNeedId = DEST.IntegrityNeedId
				WHERE DEST.IntegrityNeedId IS NULL

		

		 -- Insert into MessageLog 
                INSERT INTO [process].[messagelog] 
                            (executionid, 
                             messageid, 
                             submittedrecordcount) 
                Select  @executionid
						,Ins.guidID
						,ins.CountofRecordsPerBatch 
				FROM   #GroupTable ins
				

			-- Dropping Temp Table
		DROP TABLE #TempIntegrityNeedRecords;
		DROP TABLE #GroupTable;

    
  END

GO


