/********************************************************************************************************
**Procedure Name:
**      process.GetIntegrityELLStudentNeedData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get ELL StudentNeedData for integrity processing  
**               
**Input:
**
**Output:
**	ELL StudentNeedData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get ELL StudentNeedData for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	04/15/2015	Initial Creation
**	Rohith		08/10/2015 removing entrydate check in join conditions as SPED AND ELL will be at student and school level
**  Sucharita   02/25/2019  Added IntegrityRuleTypeId and StudentNeedCategoryTypeId = 3
** Sucharita    04/25/2019  Removed filter on StudentNeedCategoryTypeId =3
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[GetStateELLRuleStudentNeed]
@ExecutionId int,
@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	      
		
	      --- Get ELL Student Need Data
			SELECT DISTINCT ssa.StudentUSI, 
			       ssa.SchoolId													         AS 'SchoolID', 
				   ssa.FiscalYear														 AS 'FiscalYear',
				   esn.StudentNeedEntryDate,									         
				   esn.StudentNeedExitDate,										         
				   snd.CodeValue											             AS 'StudentNeedDescriptor',
				   integrity.IsProgramSchoolLEA(esn.ReportingEducationOrganizationID,esn.FiscalYear)      AS 'ReportingEducationOrganizationIsLEA'
			FROM   leadata.StudentNeed esn 
			    INNER JOIN [integrity].[vw_GetIntegrityHistoryPerExecution] DM
			         ON esn.StudentUSI = DM.StudentUSI
					    AND esn.ReportingEducationOrganizationID = DM.SchoolId
						AND DM.Fiscalyear = esn.FiscalYear
						AND DM.IntegrityRuleTypeId =7      -----Brings data only for StateELL
				LEFT JOIN leadata.StudentSchoolAssociation ssa
				     ON ssa.StudentUSI = DM.StudentUSI
					    AND ssa.SchoolId = DM.SchoolId
						AND ssa.FiscalYear = DM.Fiscalyear
					   -- AND ssa.EntryDate = DM.SchoolEntryDate
		  	    LEFT JOIN leadata.StudentNeedDescriptor esnd
			         ON esn.StudentNeedDescriptorId =  esnd.StudentNeedDescriptorId					
				LEFT JOIN leadata.Descriptor snd
			         ON esnd.StudentNeedDescriptorId = snd.DescriptorId
					 AND snd.Fiscalyear = esn.FiscalYear
			WHERE  DM.Executionid = @ExecutionId and DM.messageid = @MessageId				       
		    ORDER BY ssa.StudentUSI, ssa.SchoolId, esn.StudentNeedEntryDate                   
END
GO

