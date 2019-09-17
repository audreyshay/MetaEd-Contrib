/**************************************************************************************************
**Procedure Name:
**      dashboard.LoadIntegrityErrorCount
**
**Author:
**		Amit Verma
**
**Description:  
**	Load Integrity Error Count
**            
**Input:
**	@IntegrityExecutionId - ExecutionId 
**
**Returns:
**
**Implementation:
** 
**Revision History:
**	Who			When		What
**	Amit Verma	05/26/2017	Initial Creation 
**
******************************************************************************************************/
CREATE PROC dashboard.LoadIntegrityErrorCount 
@IntegrityExecutionId AS INT
AS  
BEGIN  
	DECLARE @EventDateId AS INT
	DECLARE @FY AS INT 
	 
	DECLARE @CurrentDateTime AS DATETIME
	SET @CurrentDateTime = GETDATE()
	 
	--cerate or get event date id
	EXEC dashboard.CreateEventDate @ExecutionId = @IntegrityExecutionId, @EventDateId = @EventDateId OUTPUT
	 
	IF @EventDateId IS NULL
		THROW 51000, 'Could not create EventDateId.', 1;  
	 
	--get FY FROM execution
	IF EXISTS (SELECT 1 FROM process.Execution WHERE ExecutionId = @IntegrityExecutionId)
		SELECT @FY = FiscalYear
		FROM process.Execution 
		WHERE ExecutionId = @IntegrityExecutionId
	ELSE                
		THROW 51000, 'Could not find Execution record.', 1;  
	 
	--delete existing data so we can insert it below
	DELETE FROM dashboard.IntegrityErrorCount               
	WHERE EventDateId = @EventDateId 
	 
	--insert integrity error record counts for the exeuctionId
	INSERT INTO dashboard.IntegrityErrorCount
	            (	EventDateId, 
					FiscalYear, 
					SchoolId, 
					AttendingLocalEducationAgencyId, 
					IntegrityRuleTypeId, 
					ExceptionMessageCode, 
					ExceptionSeverityId, 
					RecordCount
				)
	SELECT @EventDateId					AS EventDateId,
	       @FY							AS FiscalYear,
		   SCH.SchoolId,
		   SCH.LocalEducationAgencyId	AS AttendingLocalEducationAgencyId,
		   N.IntegrityRuleTypeId,
		   E.ExceptionMessageCode,
		   E.ExceptionSeverityId,
		   COUNT(*)						AS RecordCount
    FROM integrity.IntegrityNeed N (NOLOCK)   
	     JOIN integrity.IntegrityHistory H (NOLOCK) 
		   ON H.ExecutionId = @IntegrityExecutionId
		      AND H.FiscalYear = @FY
		      AND N.IntegrityNeedId = H.IntegrityNeedId 
		      AND N.FiscalYear = H.FiscalYear  
		 JOIN entity.School SCH
		   ON N.SchoolId = SCH.SchoolId
		      AND N.FiscalYear = SCH.FiscalYear
         JOIN integrity.IntegrityException E (NOLOCK) 
		   ON H.IntegrityHistoryId = E.IntegrityHistoryId
	GROUP BY SCH.SchoolId,
		     SCH.LocalEducationAgencyId,
		     N.IntegrityRuleTypeId,
		     E.ExceptionMessageCode,
		     E.ExceptionSeverityId
	ORDER BY SCH.SchoolId,
			 SCH.LocalEducationAgencyId,
			 N.IntegrityRuleTypeId,
			 E.ExceptionMessageCode,
			 E.ExceptionSeverityId

END
