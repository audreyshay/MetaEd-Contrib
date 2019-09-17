/********************************************************************************************************
**VIEW Name:
**      [Integrity].[vw_GetIntegrityHistoryPerExecution]
**
**Author:
**      Rohith Chintamaneni
**
**
**Returns:
**
**Revision History:
**	Who						When		What
**	Rohith Chintamaneni					Initial Creation
**  Pratibha		        08/07/2019	Added SessionName as part of EdFI 3.0 change ( for ODS applictions).
**
**********************************************************************************************************/
CREATE VIEW [integrity].[vw_GetIntegrityHistoryPerExecution]
AS
	 SELECT ML.ExecutionId, 
			IH.IntegrityHistoryId, 
			IND.IntegrityNeedId, 
			IND.FiscalYear, 
			IND.IntegrityRuleTypeId, 
			IND.IsIntegrityNeeded, 
			IND.StudentUSI, 
			IND.StudentUniqueId,
			IND.SchoolId, 
			IND.SchoolEntryDate,
			IND.TermTypeId,
			T.CodeValue as TermType,
			IND.LocalCourseCode,
			IND.StaffUSI,
			IND.StaffUniqueId,
			ML.MessageId,
			IRT.IntegrityTypeId,
			IND.SchoolYear,
			IND.SectionBeginDate,
			IND.TrackLocalEducationAgencyId,
			IND.TrackNumber,
			IND.SubmittedByEducationOrganizationId,
			IND.CalendarCode,
			IND.SessionName
	  FROM process.Execution EX  (NOLOCK)
	      JOIN process.MessageLog ML (NOLOCK)
	        ON ML.ExecutionId= EX.ExecutionId
	      JOIN integrity.IntegrityHistory IH (NOLOCK)
		    ON IH.ExecutionId = EX.ExecutionId 
		       AND IH.FiscalYear=EX.Fiscalyear
	           AND (IH.MessageId = ML.MessageId)
	      JOIN integrity.IntegrityNeed IND  (NOLOCK)
	        ON IND.IntegrityNeedId = IH.IntegrityNeedId
		       AND IND.FiscalYear = IH.FiscalYear
		  JOIN integrity.IntegrityRuleType IRT (NOLOCK)
		    ON IRT.IntegrityRuleTypeId = IND.IntegrityRuleTypeId
          LEFT JOIN entity.TermType T on T.TermTypeId = IND.TermTypeId