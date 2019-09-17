/********************************************************************************************************
**Procedure Name: 
**      [integrity].[UpdateTrackStatusIsValid] 
** 
**Author: 
**      Vinoth
** 
**Description:   
**  Updates Calendar Track Status Is Valid or not 
**                
**Input: 
** 
**Output: 
**   
** 
**Returns: 
** 
**Implementation: 
**   
** 
**Revision History: 
**  Who			When		What 
**  Vinoth		12/18/2017  Initial Creation 
**  Pratibha K  02/28/2018  Marking IsValid Flag to False for IntegrityResultType 1(PASS) when there is no record in source Track/ CalendarDateTrackEvent table 
**  Vinoth K	02/13/2019  Added the calendar code as part of the join, Fy2020 onwards calendar code will be unique. 
**  Pratibha K  06/10/2019  Removed marking IsValid Flag to False for IntegrityResultType 1(PASS) when there is no record in source Track/ CalendarDateTrackEvent table 
**							& added Mark IsValid Flag to NULL when there is no record in AZEDS Track so that calendar UI does not show status failed/ passed when track is deleted & be in sync with Integ35 report
**
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[UpdateTrackStatusIsValid] 
	@ExecutionId AS INT

AS 
  BEGIN 
  SET NOCOUNT ON; 

	  DECLARE @FiscalYear int 
	  SELECT @FiscalYear = FiscalYear FROM process.Execution WHERE ExecutionId = @ExecutionId


	  --Mark IsValid Flag to True for Integrity Result Type 1 (Pass) along with ValidationDate

	  UPDATE entity.trackstatus SET IsValid = 1, ValidationDate = IH.IntegrityRunDateTime  
	  FROM [AzEds].[integrity].[vw_GetIntegrityHistoryPerExecution] IEH 
	  JOIN entity.trackstatus ts ON ts.EducationOrganizationId = IEH.SchoolId
		AND ts.TrackNumber = IEH.TrackNumber
		AND ts.FiscalYear = IEH.FiscalYear
		AND ts.TrackLocalEducationAgencyId = IEH.TrackLocalEducationAgencyId  
		AND ts.CalendarCode = IEH.CalendarCode  
	  JOIN integrity.IntegrityHistory IH ON IH.IntegrityHistoryId = IEH.IntegrityHistoryId
		AND ih.IntegrityResultTypeId = 1
	  WHERE IH.ExecutionId = @ExecutionId AND IEH.IntegrityRuleTypeId = 16 


  --Mark IsValid Flag to False for Integrity Result Type 2 (Fail) along with ValidationDate

	  UPDATE entity.trackstatus SET IsValid = 0, ValidationDate = IH.IntegrityRunDateTime   
	  FROM [AzEds].[integrity].[vw_GetIntegrityHistoryPerExecution] IEH 
	  JOIN entity.trackstatus ts ON ts.EducationOrganizationId = IEH.SchoolId
		AND ts.TrackNumber = IEH.TrackNumber
		AND ts.FiscalYear = IEH.FiscalYear
		AND ts.TrackLocalEducationAgencyId = IEH.TrackLocalEducationAgencyId
		AND ts.CalendarCode = IEH.CalendarCode  
	  JOIN integrity.IntegrityHistory IH ON IH.IntegrityHistoryId = IEH.IntegrityHistoryId
		AND ih.IntegrityResultTypeId IN (2,3)
	  WHERE IH.ExecutionId = @ExecutionId AND IEH.IntegrityRuleTypeId = 16 


	/*	--Mark IsValid Flag to False for Integrity Result Type 1 (PASS) when there is no record in source Track/ CalendarDateTrackEvent table 

  			UPDATE entity.trackstatus set IsValid = 0, ValidationDate = IH.IntegrityRunDateTime  FROM
	  [AzEds].[integrity].[vw_GetIntegrityHistoryPerExecution] IEH 
	  JOIN entity.trackstatus ts on ts.EducationOrganizationId = IEH.SchoolId
		AND ts.TrackNumber = IEH.TrackNumber
		AND ts.FiscalYear = IEH.FiscalYear
		AND ts.TrackLocalEducationAgencyId = IEH.TrackLocalEducationAgencyId
		AND ts.CalendarCode = IEH.CalendarCode  
	  JOIN integrity.IntegrityHistory IH ON IH.IntegrityHistoryId = IEH.IntegrityHistoryId
		AND ih.IntegrityResultTypeId = 1
	  LEFT JOIN entity.track tr on tr.TrackLocalEducationAgencyId = ieh.TrackLocalEducationAgencyId 
			AND tr.EducationOrganizationId = ieh.SchoolId 
			AND tr.TrackNumber = ieh.TrackNumber
			AND tr.FiscalYear = ieh.FiscalYear
			AND tr.CalendarCode = ieh.CalendarCode  
	  WHERE IH.ExecutionId = @ExecutionId AND IEH.IntegrityRuleTypeId =16 AND tr.EducationOrganizationId IS NULL */


      --Mark IsValid Flag to NULL when there is no record in AZEDS Track table 

	  UPDATE entity.trackstatus SET IsValid = NULL, ValidationDate = NULL  
	  FROM entity.trackstatus ts
	  LEFT JOIN entity.track tr ON tr.CalendarCode = ts.CalendarCode     
			AND tr.EducationOrganizationId = ts.EducationOrganizationId 
			AND tr.FiscalYear = ts.FiscalYear
			AND tr.TrackNumber = ts.TrackNumber
			AND tr.TrackLocalEducationAgencyId = ts.TrackLocalEducationAgencyId  
	  WHERE tr.EducationOrganizationId IS NULL AND ts.FiscalYear = @fiscalYear

  END