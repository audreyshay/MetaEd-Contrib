
/********************************************************************************************************
**Procedure Name:
**      integrity.GetSupportProgramStudentNeedData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Get State Support Program Student Need Data for integrity processing  
**               
**Input:
**
**Output:
**	Get State Support Program Student Need Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Get State Support Program Student Need Data for integrity processing  
**
**Revision History:
**	Who			When		What
**	Jeff Stokes	9/12/2016	Initial Creation
**	PS	11/03/16			Moved the condition esnd.StudentNeedCategoryTypeId
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[GetSupportProgramStudentNeedData]
	@ExecutionId	int,
	@MessageId		nvarchar(36)
AS

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
 
BEGIN 
	--- Get SPED Student Need Data
	SELECT DISTINCT 
		ssa.StudentUSI,
		esn.ReportingEducationOrganizationID	AS SchoolID,
		snd.CodeValue							AS NeedCode,
		esn.StudentNeedEntryDate,
		esn.StudentNeedExitDate,
		PNTR.CodeValue							AS PrimaryNightTimeResidence
	FROM   
		leadata.StudentNeed esn 
		INNER JOIN [integrity].[vw_GetIntegrityHistoryPerExecution] SPEDDM ON 
			(
				esn.StudentUSI = SPEDDM.StudentUSI AND
				esn.FiscalYear = SPEDDM.FiscalYear AND 
				SPEDDM.IntegrityRuleTypeId = 14   -- Brings only data for Support Program 
			)
		LEFT JOIN leadata.StudentSchoolAssociation ssa ON 
			(
				ssa.StudentUSI = SPEDDM.StudentUSI AND 
				ssa.SchoolId = SPEDDM.SchoolId AND 
				SSA.FiscalYear = SPEDDM.FiscalYear
			)
		LEFT JOIN leadata.Descriptor snd ON 
			(
				esn.StudentNeedDescriptorId = snd.DescriptorId
			)
		LEFT OUTER JOIN leadata.StudentNeedDescriptor esnd ON
			(
				esn.StudentNeedDescriptorId = esnd.StudentNeedDescriptorId 
			)
		LEFT JOIN leadata.Descriptor PNTR ON 
			(
				esn.PrimaryNightTimeResidenceDescriptorId = PNTR.DescriptorId
			)
	WHERE  
		SPEDDM.Executionid = @ExecutionId AND 
		SPEDDM.messageid = @MessageId AND
		esnd.StudentNeedCategoryTypeId not in (1,3,5)
	ORDER BY 
		ssa.StudentUSI,
		esn.ReportingEducationOrganizationID, 
		esn.StudentNeedEntryDate                   
END

