/************************************************************
**Procedure Name: process.GetProcessStatusByEducationOrganizationId
**
**Author: Vinoth
**
**Description:  Gets list of most recent Integrity Status runs for given Education Organization Id
**	
**Revision History:
**	Who			When		What
**	Vinoth		10/04/2017	Initial Creation
**	Vinoth		10/17/2017	Modified to include the Execution Type for 915 ACE process
**	Vinoth		10/23/2017	Modified to include the Execution Type for 915 ACE and Integrity process
***************************************************************/
CREATE PROCEDURE [process].[GetProcessStatusByEducationOrganizationId]
	@displayCategory varchar(100),
	@fiscalYear int =null,
	@leaId int =null
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
		, st.[Description]			AS StatusType
		, e.ReferenceExecutionId
		, epst.ProcessSubTypeId
		, pst.[Description]
		, ROW_NUMBER() OVER(PARTITION BY epst.ProcessSubTypeId 
								ORDER BY e.InitiatedDateTime DESC) AS rk
	FROM  process.Execution e
	JOIN  process.ExecutionProcessSubType epst on e.ExecutionId = epst.ExecutionId
	JOIN  process.ProcessType p on p.ProcessTypeId = e.ProcessTypeId
	JOIN  process.ProcessSubType pst on epst.ProcessSubTypeId = pst.ProcessSubTypeId
	LEFT JOIN  process.ExecutionEducationOrganization eo on eo.ExecutionId=e.ExecutionId  and eo.fiscalyear=e.fiscalyear and eo.EducationOrganizationId=@LeaId
	JOIN  process.StatusType st on st.StatusTypeId =e.StatusTypeId
	where p.DisplayCategory = @displayCategory
	  -- first try to filter results by passed in year, if null pull results by current fiscal year
	  and e.FiscalYear = COALESCE(@fiscalYear, @fy)
	  and ((e.ExecutionTypeId = Case when ((select 1 from process.ExecutionEducationOrganization eo where eo.ExecutionId=e.ExecutionId  and eo.fiscalyear=e.fiscalyear and eo.EducationOrganizationId=@leaId) =1 and p.DisplayCategory = 'Integrity')
			then 3
			else 1
  		   end)
		   or
		   (e.ExecutionTypeId = Case when ((select 1 from process.ExecutionEducationOrganization eo where eo.ExecutionId=e.ExecutionId  and eo.fiscalyear=e.fiscalyear and eo.EducationOrganizationId=@leaId) =1 and p.DisplayCategory = 'Integrity')
			then 2
			else 1
  		   end)
		   or
		   (e.ExecutionTypeId = Case when ((select 1 from process.ExecutionEducationOrganization eo where eo.ExecutionId=e.ExecutionId  and eo.fiscalyear=e.fiscalyear and eo.EducationOrganizationId=@leaId) !=1 and p.DisplayCategory = 'Integrity')
			then 1
  		   end)
		   or
		   (e.ExecutionTypeId = Case when (p.DisplayCategory = 'ACE')
			then 3
  		   end)
		   )
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
