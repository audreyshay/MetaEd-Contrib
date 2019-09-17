
/********************************************************************************************************
**Procedure Name:
**       Process.InsertMessageIntoPortal
**
**Author:
**      Rohith Chintamaneni
**
**Description:  
**	insert message into portal when Active batch fails
**               
**Input:
**		@ProcessTypeid
**Output:
**	NA
**
**Returns:
**	NA
**Implementation:
**	Used in Active Batch 
**
**Revision History:
**	Who					When		What
**	rchinta				02/19/2019	Initial Creation
**********************************************************************************************************/
-- =============================================
CREATE PROCEDURE [process].[InsertMessageIntoPortal]
	@ProcessTypeid int
AS
BEGIN
Declare @Title Varchar(100),@message Nvarchar(Max), @StartDate Datetime, @Enddate Datetime,@SeverityLevel Int, @fiscalYear int, @startdatetime datetime

Select top 1 @fiscalYear = FiscalYear, @startdatetime =  DateADD(HH,-7, Startdatetime)  from azeds.process.Execution
where ProcessTypeId = @ProcessTypeid and StatusTypeId = 5
order by  ExecutionId desc

SET @Title = 'AzEDS nightly process failure'
SET @StartDate = GETDATE()  -- 24 hour clock format
SET @Enddate = DATEADD(hh,18, Convert(datetime, DATEADD(DD,1, Convert(date, Getdate()))))	-- 24 hour clock format, defaults to Next day 6 PM
SET @SeverityLevel = 1

Select @Message = Case 
					WHEN @ProcessTypeid = 8 THEN 
											Case 
												When @startdatetime < GETUTCDATE() and @startdatetime > DATEADD(dd,-1, getutcdate()) 
												THEN concat('AzEDS nightly STC Integrity process for FY ', @fiscalYear, ' did not complete successfully on ', convert(varchar, @startdatetime, 100) ,'. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
												ELSE concat('AzEDS nightly STC Integrity process for FY ', @fiscalYear, ' did not complete successfully on last night. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
					END	
								 
					WHEN @ProcessTypeid = 99 THEN concat('AzEDS nightly process for FY ', @fiscalYear, ' did not run. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
					WHEN @ProcessTypeid = 11 THEN
											 Case
												 When @startdatetime < GETUTCDATE() and @startdatetime > DATEADD(dd,-1, getutcdate()) 
												 THEN concat('AzEDS nightly Accountabillity,Other Integrity process for FY ', @fiscalYear, ' did not complete successfully on ', convert(varchar, @startdatetime, 100) ,'. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
												 ELSE concat('AzEDS nightly Accountabillity,Other Integrity process for FY ', @fiscalYear, ' did not complete successfully on last night. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
											 END
					 WHEN @ProcessTypeid = 10 THEN
					 Case
						 When @startdatetime < GETUTCDATE() and @startdatetime > DATEADD(dd,-1, getutcdate()) 
						 THEN concat('AzEDS nightly FED SPED Integrity process for FY ', @fiscalYear, ' did not complete successfully on ', convert(varchar, @startdatetime, 100) ,'. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
						 ELSE concat('AzEDS nightly FED SPED Integrity process for FY ', @fiscalYear, ' did not complete successfully on last night. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
					 END
					 WHEN @ProcessTypeid = 12 THEN
					 Case
						 When @startdatetime < GETUTCDATE() and @startdatetime > DATEADD(dd,-1, getutcdate()) 
						 THEN concat('AzEDS nightly Calendar Integrity process for FY ', @fiscalYear, ' did not complete successfully on ', convert(varchar, @startdatetime, 100) ,'. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
						 ELSE concat('AzEDS nightly Calendar Integrity process for FY ', @fiscalYear, ' did not complete successfully on last night. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
					 END
					 WHEN @ProcessTypeid = 9 THEN
					 Case
						 When @startdatetime < GETUTCDATE() and @startdatetime > DATEADD(dd,-1, getutcdate()) 
						 THEN concat('AzEDS nightly Support Programs Integrity process for FY ', @fiscalYear, ' did not complete successfully on ', convert(varchar, @startdatetime, 100) ,'. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
						 ELSE concat('AzEDS nightly Support Programs Integrity process for FY ', @fiscalYear, ' did not complete successfully on last night. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
					 END
					 WHEN @ProcessTypeid = 1 THEN
					 Case
						 When @startdatetime < GETUTCDATE() and @startdatetime > DATEADD(dd,-1, getutcdate()) 
						 THEN concat('AzEDS nightly ADM Integrity process for FY ', @fiscalYear, ' did not complete successfully on ', convert(varchar, @startdatetime, 100) ,'. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
						 ELSE concat('AzEDS nightly ADM Integrity process for FY ', @fiscalYear, ' did not complete successfully on last night. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
					 END
					 WHEN @ProcessTypeid = 2 THEN
					 Case
						 When @startdatetime < GETUTCDATE() and @startdatetime > DATEADD(dd,-1, getutcdate()) 
						 THEN concat('AzEDS nightly ADM Aggregation process for FY ', @fiscalYear, ' did not complete successfully on ', convert(varchar, @startdatetime, 100) ,'. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
						 ELSE concat('AzEDS nightly ADM Aggregation process for FY ', @fiscalYear, ' did not complete successfully on last night. The AzEDS IT team is aware of the issue and is working on the root cause analysis and the appropriate fix for the issue')
					 END
					END

INSERT INTO [Azeds].[config].[SystemStatusMessages]
(
Title,
MessageText,
StartDate,
EndDate,
SeverityLevelTypeId
)
Values 
(
@Title,
@Message,
@StartDate,
@EndDate,
@SeverityLevel
)

END
GO
