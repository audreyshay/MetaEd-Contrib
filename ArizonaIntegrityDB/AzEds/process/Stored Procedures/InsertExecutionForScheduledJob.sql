
/**************************************************************************************
**Procedure Name: process.InsertExecutionForScheduledJob
**
**Author: Britto Augustine
**
**Description:  cerate execution record for scheduled job
**	
**Revision History:
**	Who			When		What
**	BA			12/22/2015	Initial Creation
**	CM			05/23/2016	adding logic for memebership summary process
**  RC			06/02/2016	Adding STC process Sub TypeList
**  VM          06/13/2016  Addidg ProcessSubType parameter
**	RC			09/08/2016	Adding or condition processTypeid 8 for STC. The Parameters passed to this proc will change, for ADM integrity It will be 1,'4,5,6',1,2017,null,'RC' and for STC  8,'9',1,2017,null,'RC'
**	PS			11/02/2016	Added @processTypeId = 9 for SupportProgs
**	PS			11/03/2016	Added @processTypeId = 10 for FedSped
**  SM          01/25/2017  Added @processTypeId = 11 for Accountability-NonPayment
**  B Augustine 06/15/2017  Added dataLoadTypeId parameter. removed membership summary execution insert
****************************************************************************************/
CREATE PROC [process].[InsertExecutionForScheduledJob]
	@processTypeId as int,
	@processSubTypeIds as nvarchar(100),
	@executionTypeId as int,	
	@fiscalYear as int = null,
	@referenceExecutionId as int = null,
	@initiatedBy as nvarchar(100),
	@dataLoadTypeId INT = 3
AS

BEGIN

	declare @initiatedDateTime as datetime
	declare @executionId int
	declare @processSubTypeList as process.ProcessSubTypeTableType
	declare @edOrgTableTypeList as process.EdOrgTableType

	if @fiscalYear is null
	begin
		select @fiscalYear = FiscalYear from config.FiscalYear where IsCurrent = 1
	end

	select @initiatedDateTime = GETUTCDATE()

	insert INTO @processSubTypeList(ProcessSubTypeId) 
	SELECT DISTINCT [Token] from [util].[Split](@processSubTypeIds, ',' ) 

	if @processTypeId = 2       -- for aggregation check if referenceIntegrityExecutionid is passed in, otw get the last one
	begin 
		--get integrity run for ACE. if an execution id is passed in to the proc then use that, otw get the last successful integrity execution id 
		if @referenceExecutionId is null OR @referenceExecutionId = -1
		begin
			SELECT TOP 1 
				@referenceExecutionId = ExecutionId,
				@fiscalYear = FiscalYear
			FROM [process].[Execution]
			WHERE StatusTypeId = 6 and ProcessTypeId  = 1
			ORDER BY ExecutionId DESC
		end
		else
		begin
			if not exists (select 1 from process.Execution where ExecutionId = @referenceExecutionId and StatusTypeId = 6 and ProcessTypeId  = 1)
			begin
				DECLARE @msg NVARCHAR(2048) = 'Could not find successful integrity execution record for execution id ' + convert(varchar(255), @referenceExecutionId);
				THROW 51000, @msg, 1;
			end

			SELECT
				@referenceExecutionId = ExecutionId,
				@fiscalYear = FiscalYear
			FROM [process].[Execution]
			WHERE ExecutionId = @referenceExecutionId
		end
	end
	
	exec [process].[InsertExecution] 
		@processTypeId 
	   ,@executionTypeId
	   ,@initiatedDateTime
	   ,@initiatedBy
	   ,@fiscalYear
	   ,null
	   ,@edOrgTableTypeList
	   ,@processSubTypeList
	   ,@referenceExecutionId
	   ,@executionId OUTPUT
	   ,@dataLoadTypeId

	SELECT @executionId as ExecutionId
	
END
