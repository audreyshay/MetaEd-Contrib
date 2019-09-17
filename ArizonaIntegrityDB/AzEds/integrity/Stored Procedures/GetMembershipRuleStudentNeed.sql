/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetMembershipRuleStudentNeed]
**
**Author:
**      Amit Verma
**
**Description:  
**	Get StudentNeedData for integrity membership rule processing  
**               
**Input:
**
**Output:
**	StudentNeedData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get StudentNeedData for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	01/05/2015	Initial Creation
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[GetMembershipRuleStudentNeed]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	      SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level. 
	      --- Get Student Need Data
		SELECT DISTINCT 
				ih.StudentUSI, 
				ih.SchoolId							AS 'SchoolID', 
				ih.FiscalYear						AS 'FiscalYear', 
				CAST(ih.SchoolEntryDate AS DATETIME)	    AS 'Entrydate', 
				sn.StudentNeedEntryDate,
				sn.StudentNeedExitDate,
				snct.CodeValue						AS 'StudentNeedDescriptor'
		FROM   [integrity].[vw_GetIntegrityHistoryPerExecution]  ih	
			INNER JOIN leadata.StudentNeed sn
					ON ih.FiscalYear = sn.FiscalYear 
				AND ih.StudentUSI = sn.StudentUSI
				AND ih.SchoolId = sn.ReportingEducationOrganizationID
			LEFT JOIN leadata.StudentNeedDescriptor snd
					ON sn.StudentNeedDescriptorId =  snd.StudentNeedDescriptorId
			LEFT JOIN leadata.StudentNeedCategoryType snct
					ON snd.StudentNeedCategoryTypeId = snct.StudentNeedCategoryTypeId
				Where ih.Executionid = @executionid and ih.messageid = @messageid			
				and ih.IntegrityRuleTypeId = 1 -- for Membership data only 
		ORDER BY ih.StudentUSI, ih.SchoolId, EntryDate, sn.StudentNeedEntryDate                   

END