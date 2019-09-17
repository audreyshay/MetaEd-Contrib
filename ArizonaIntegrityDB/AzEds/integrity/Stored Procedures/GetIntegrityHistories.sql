/********************************************************************************************************
**Procedure Name:
**      [Integrity].[GetIntegrityHistories]
**
**Author:
**      Rohith Chintamaneni
**
**Description:  
**	Get Integrity Hisotries
**               
**Input:
**	@ExecutionId int,
	@IntegrityRuleTypeId int
**Output:
**	Current Membership Data for integrity processing
**
**Returns:
**
**Revision History:
**	Who			When		What
**	Rohith Chintamaneni		07/30/2015	Initial Creation
**  Rohith Chintamaneni		06/15/2016  Changing the source from function to View
**  Venugopal Metukuru      06/23/2016	Adding new columns to the View.
**  Vinoth			        11/14/2017	Getting the TrackNumber and TracklocalEducationAgencyID.
**  Vinoth			        04/01/2019	Getting the CalendarCode as part of EdFI 3.0 change.
**  Pratibha		        08/07/2019	Getting SessionName as part of EdFI 3.0 change ( for ODS applictions).
**
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[GetIntegrityHistories]
	@ExecutionId int,
	@MessageId as [nvarchar](36),
	@IntegrityRuleTypeId int
AS
BEGIN
Select  IntegrityHistoryId,
		IntegrityNeedId,
		FiscalYear, 
		IntegrityRuleTypeId,
		IsIntegrityNeeded,
		Studentusi, 
	    StudentUniqueId,
		SchoolId,
	    SchoolEntryDate,
		TermTypeId,
		Lower(TermType) AS TermType,
		Lower(LocalCourseCode) AS LocalCourseCode,
		LOWER(SessionName) AS SessionName,
		StaffUSI,
		StaffUniqueId,
		Schoolyear	,
		SectionBeginDate,
		TrackNumber,
		TrackLocalEducationAgencyId,
		CalendarCode
	   FROM [integrity].[vw_GetIntegrityHistoryPerExecution]
	   WHERE Executionid = @ExecutionId and MessageID = @MessageId and IntegrityRuleTypeId = @IntegrityRuleTypeId


END
