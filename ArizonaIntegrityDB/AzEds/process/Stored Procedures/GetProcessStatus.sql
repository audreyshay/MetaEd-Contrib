/************************************************************
**Procedure Name: process.GetSubProcessStatus
**
**Author: Martez Killens
**
**Description:  Gets list of most recent Integrity Status runs for each integrity type
**	
**Revision History:
**	Who			When		What
**	MK			01/04/2016	Initial Creation
**  RC			9/9/2016	Deleted GetProcessSubTYpes SP and Created a new SP which Passses ProcessTypes as List for Integrity and STC
**	RC			9/12/2016   Changing the Sp parameter from processTypeids to DisplayCategory
**  Britto		9/28/2016   Changed proc to get status for current fiscal year only
**  MKillens	04/17/2017  Changed proc to load Sub Progress Discription/Name.
**  MKillens	06/05/2017  Changed proc load status by fiscal year.
**  Vinoth		10/17/2017  Changed proc to load status type & Execution Type for 915 ACE process.
**  JD          6/14/2018   Bind subprocess join to process join
**	to Call SP: exec  [process].[GetProcessStatus] 'Aggregation'
**  Vinoth      09/04/2018  Removed the execution Type ID from where condition, because for Current year it will run for statewide and clanedar post submission window
***************************************************************/
CREATE PROCEDURE [process].[GetProcessStatus]
	@displayCategory varchar(100),
	@fiscalYear int = null,
	@executionType int=null
AS
BEGIN

	declare @fy as int
	set @fy = config.CurrentFiscalYear()

	;WITH summary AS (
	SELECT 
		  e.ExecutionId
		, e.ProcessTypeId
		, e.ExecutionTypeId
		, e.InitiatedDateTime
		, e.StartDateTime
		, e.EndDateTime
		, e.CancelledDateTime
		, e.InitiatedByUserName
		, e.CancelledByUserName
		, e.FiscalYear
		, e.StatusTypeId
		, e.ReferenceExecutionId
		, epst.ProcessSubTypeId
		, pst.[Description]
		, st.[Description]			AS StatusType
		, ROW_NUMBER() OVER(PARTITION BY epst.ProcessSubTypeId 
								ORDER BY e.InitiatedDateTime DESC) AS rk
	FROM  process.Execution e
	JOIN  process.ExecutionProcessSubType epst on e.ExecutionId = epst.ExecutionId
	JOIN  process.ProcessType p on p.ProcessTypeId = e.ProcessTypeId
	JOIN  process.ProcessSubType pst on epst.ProcessSubTypeId = pst.ProcessSubTypeId and pst.ProcessTypeId = p.ProcessTypeId
	JOIN  process.StatusType st on e.StatusTypeId = st.StatusTypeId
	where p.DisplayCategory = @displayCategory
	  -- first try to filter results by passed in year, if null pull results by current fiscal year
	  and e.FiscalYear = COALESCE(@fiscalYear, @fy)
	  	   -- first try to filter results by passed in exceution type, if null pull results by Statewide
	  --and (@Executiontype is null or e.ExecutionTypeId = @Executiontype)
	)

SELECT 
	  s.ExecutionId
	, s.ProcessTypeId
	, s.ExecutionTypeId
	, s.InitiatedDateTime
	, s.StartDateTime
	, s.EndDateTime
	, s.CancelledDateTime
	, s.InitiatedByUserName
	, s.CancelledByUserName
	, s.FiscalYear
	, s.StatusTypeId
	, s.StatusType
	, s.ReferenceExecutionId
	, s.ProcessSubTypeId
	, s.[Description] AS ProcessSubType
  FROM summary s
  WHERE s.rk = 1
END
