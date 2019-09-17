/********************************************************************************************************
**Procedure Name:
**      process.GetIntegritySPEDSettings
**
**Author:
**      Amit Verma
**
**Description:  
**	Get SPED Settings Data for integrity processing  
**               
**Input:
**
**Output:
**	SPED Settings Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get SPED Settings Data for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	05/27/2015	Initial Creation
**  Rohith		08/07/2015	updating Sp's by commenting few tables as per azeds design
**	Rohith		08/10/2015 removing entrydate check in join conditions as SPED AND ELL will be at student and school level
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[GetStateSpedRuleSpedSettings]
@ExecutionId int,
@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

	

	  --Get Student SPED Settings Data
      SELECT DISTINCT SSA.StudentUSI,
	         SSA.SchoolId                                                          AS 'SchoolID',
			 SSA.EntryDate,
			 SPEDDM.FiscalYear                                                     AS 'FiscalYear',
			 PT.CodeValue                                                          AS 'ProgramType',
			 LEFT(SSEPA.ProgramName, CHARINDEX(' ', SSEPA.ProgramName) - 1)        AS 'ProgramCode',
			 SESD.CodeValue                                                        AS 'SpecialEducationSettingDescriptor'
	  FROM [integrity].[vw_GetIntegrityHistoryPerExecution] SPEDDM
	       INNER JOIN leadata.StudentSpecialEducationProgramAssociation SSEPA
		         ON SPEDDM.StudentUSI = SSEPA.StudentUSI                        
				    AND SPEDDM.SchoolId = SSEPA.EducationOrganizationId		
					AND SPEDDM.Fiscalyear = SSEPA.FiscalYear			
					 AND SPEDDM.IntegrityRuleTypeId IN (6, 8)   -- Brings only data for STATE SPED & Fed Sped
		   LEFT JOIN entity.ProgramType PT
		         ON SSEPA.ProgramTypeId = PT.ProgramTypeId
	       LEFT JOIN leadata.StudentSchoolAssociation SSA
		         ON SSA.StudentUSI = SPEDDM.StudentUSI
				    AND SSA.SchoolId = SPEDDM.SchoolId
					AND SSA.FiscalYear = SPEDDM.FiscalYear
					--AND SSA.EntryDate = SPEDDM.SchoolEntryDate  --- removing this again
      	   LEFT JOIN leadata.Student S
		         ON SPEDDM.StudentUSI = S.StudentUSI
		   LEFT JOIN leadata.Descriptor SESD
		         ON SSEPA.SpecialEducationSettingDescriptorId = SESD.DescriptorId
				 AND SSEPA.Fiscalyear = SESD.FiscalYear
		  WHERE  SPEDDM.Executionid = @ExecutionId and SPEDDM.messageid = @MessageId	
		   --LEFT JOIN leadata.Descriptor SED
		   --      ON SSEPA.SpecialEducationSettingDescriptorId = SED.DescriptorId
      ORDER BY SSA.StudentUSI, SSA.SchoolId 
END
GO