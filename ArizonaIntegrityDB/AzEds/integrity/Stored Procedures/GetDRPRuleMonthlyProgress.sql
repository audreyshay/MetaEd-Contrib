/**************************************************************************************
**Procedure Name:
**      process.GetDRPRuleMonthlyProgress
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Student MonthlyProgress Data for DRP integrity processing  
**               
**Input:
**
**Output:
**	Student DRP MonthlyProgress Data for DRP integrity processing  
**
**Returns:
**
**Implementation:
**	Used to get Student DRP MonthlyProgress Data for DRP integrity processing   
**
**Revision History:
**	Who				When		What
**	Amit Verma		07/29/2016	Initial Creation
**	Amit Verma		08/22/2016	Added MonthCodeValue column to use it in Order By and 
**								removed the EducationOrganizationId column
**	Martez Killens	09/08/2016  Added Program Begin Date
**
***************************************************************************************/
CREATE PROCEDURE [integrity].[GetDRPRuleMonthlyProgress]
@ExecutionId INT,
@MessageId  NVARCHAR(36)
AS
BEGIN 

      SET NOCOUNT ON;
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock but at SP level.
	 
	  --Get Student MonthlyProgress Data for DRP integrity processing 
      SELECT DISTINCT SDRPPMU.StudentUSI,
			 SDRPPMU.FiscalYear,
			 DRP.SchoolId,
			 SPA.BeginDate								AS 'ProgramBeginDate',
			 PT.CodeValue								AS 'ProgramType',
			 SDRPPMU.BeginDate							AS 'ProgramBeginDate',
			 CONVERT(INT, MD.CodeValue)					AS 'MonthCodeValue',
			 SDRPPMU.RevisedWrittenLearningPlanDate,
			 CASE WHEN MD.CodeValue = '1' THEN 7
			      WHEN MD.CodeValue = '2' THEN 8
				  WHEN MD.CodeValue = '3' THEN 9
				  WHEN MD.CodeValue = '4' THEN 10
				  WHEN MD.CodeValue = '5' THEN 11
				  WHEN MD.CodeValue = '6' THEN 12
				  WHEN MD.CodeValue = '7' THEN 1
				  WHEN MD.CodeValue = '8' THEN 2
				  WHEN MD.CodeValue = '9' THEN 3
				  WHEN MD.CodeValue = '10' THEN 4
				  WHEN MD.CodeValue = '11' THEN 5
				  WHEN MD.CodeValue = '12' THEN 6
			 END										AS 'MonthOfProgress',
			 SDRPPMU.SatisfactoryProgress
	  FROM integrity.vw_GetIntegrityHistoryPerExecution DRP
	       JOIN leadata.StudentDropOutRecoveryProgramMonthlyUpdate SDRPPMU
		     ON DRP.StudentUSI = SDRPPMU.StudentUSI
			    AND DRP.FiscalYear = SDRPPMU.FiscalYear
				AND DRP.SchoolId = SDRPPMU.EducationOrganizationId
				AND DRP.IntegrityRuleTypeId = 4							-- DRP Integrity Type
		   JOIN leadata.StudentProgramAssociation SPA
		     ON SPA.StudentUSI = SDRPPMU.StudentUSI 
                AND SPA.FiscalYear = SDRPPMU.FiscalYear 
                AND SPA.ProgramTypeId = SDRPPMU.ProgramTypeId 
				AND SPA.ProgramName = SDRPPMU.ProgramName
                AND SPA.ProgramEducationOrganizationId = SDRPPMU.ProgramEducationOrganizationId 
                AND SPA.BeginDate = SDRPPMU.BeginDate 
                AND SPA.EducationOrganizationId = SDRPPMU.EducationOrganizationId
		   JOIN entity.ProgramType PT
			 ON SDRPPMU.ProgramTypeId = PT.ProgramTypeId
		   LEFT JOIN leadata.Descriptor MD
			 ON SDRPPMU.MonthDescriptorId = MD.DescriptorId
			    AND SDRPPMU.FiscalYear = MD.FiscalYear
	  WHERE  DRP.Executionid = @ExecutionId 
			 AND DRP.messageid = @MessageId	
		     AND SPA.ProgramTypeId = 61									-- DRP Program type
	  ORDER BY SDRPPMU.StudentUSI,
			   SDRPPMU.FiscalYear,
			   DRP.SchoolId,
			   PT.CodeValue,
			   SDRPPMU.BeginDate,
			   MonthCodeValue

END
