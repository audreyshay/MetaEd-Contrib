
/********************************************************************************************************
**Procedure Name:
**      process.GetIntegrityELLSPEDData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get MembershipELLSPEDData for integrity processing  
**               
**Input:
**
**Output:
**	MembershipELLSPEDData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Membership ELL SPED Data for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	05/13/2015	Initial Creation
**	Rohith		08/10/2015 removing entrydate check in join conditions as SPED AND ELL will be at student and school level
**  Sucharita   02/20/2019  Commented the extra join with ProgramType table
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[GetStateELLRuleSPED]
@ExecutionId as int,
@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
 SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
	  --Get Student Membership ELL SPED Data
      SELECT DISTINCT SSA.StudentUSI,
             SSA.SchoolId,
             SSA.EntryDate,
      	     LEFT(SPA.ProgramName, CHARINDEX(' ', SPA.ProgramName) - 1) AS 'ProgramName',
             SPA.BeginDate                                              AS 'ProgramBeginDate',
      	     SPA.EndDate                                                AS 'ProgramEndDate'
      FROM leadata.StudentSchoolAssociation SSA 
           INNER JOIN [integrity].[vw_GetIntegrityHistoryPerExecution] DM
      			 ON SSA.StudentUSI = DM.StudentUSI
      				AND SSA.SchoolId = DM.SchoolId
      				--AND SSA.EntryDate = DM.SchoolEntryDate
					AND ssa.FiscalYear = DM.FiscalYear
					AND DM.IntegrityRuleTypeId = 7   -- Brings only data for STATE ELL Type 
           INNER JOIN leadata.StudentProgramAssociation SPA
                 ON SSA.StudentUSI = SPA.StudentUSI
      		        AND SSA.SchoolId = SPA.EducationOrganizationId
					AND Spa.FiscalYear = SSA.Fiscalyear
      	   --INNER JOIN entity.ProgramType PT
      			 --ON SPA.ProgramTypeId = PT.ProgramTypeId
    WHERE  DM.Executionid = @ExecutionId and DM.messageid = @MessageId	
	 AND SPA.ProgramTypeId = 6
END
