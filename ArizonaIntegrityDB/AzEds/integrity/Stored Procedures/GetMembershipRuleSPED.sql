/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetMembershipRuleSPED]
**
**Author:
**      Amit Verma
**
**Description:  
**	Get SPED Data for integrity membership rule processing  
**               
**Input:
**
**Output:
**	SPEDData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get SPED Data for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	03/06/2015	Initial Creation
**  PSharma		12/02/2016  Rule 10067 to look at the program participation across the LEAs so commented the SchoolId condition from the join.
**							This change affects 10122 which is looking at SPED program participation so that is being modified to handle it.
**	PSharma		12/12/2016  Added ProgramSchoolId to accomodate the fix for 10067 in 10122
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[GetMembershipRuleSPED]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
	  --Get Student Membership SPED Data
      SELECT DISTINCT 
			 ih.StudentUSI,
             ih.SchoolId,
             ih.SchoolEntryDate,
             PT.CodeValue                                               AS 'ProgramType',
      	     LEFT(SPA.ProgramName, CHARINDEX(' ', SPA.ProgramName) - 1) AS 'ProgramName',
             SPA.BeginDate                                              AS 'ProgramBeginDate',
      	     SPA.EndDate                                                AS 'ProgramEndDate',
			 SPA.EducationOrganizationId								AS 'ProgramSchoolId'
		FROM [integrity].[vw_GetIntegrityHistoryPerExecution]  ih
            INNER JOIN leadata.StudentProgramAssociation SPA
                 ON ih.FiscalYear = SPA.FiscalYear 
				AND ih.StudentUSI = SPA.StudentUSI
      		   -- AND ih.SchoolId = SPA.EducationOrganizationId
      	    INNER JOIN entity.ProgramType PT
      			 ON SPA.ProgramTypeId = PT.ProgramTypeId
	 Where ih.Executionid = @executionid and ih.messageid = @messageid	
	  and SPA.ProgramTypeId = 6		--SPED is ProgramType 6
				AND ih.IntegrityRuleTypeId = 1 -- for Membership data only 	
END