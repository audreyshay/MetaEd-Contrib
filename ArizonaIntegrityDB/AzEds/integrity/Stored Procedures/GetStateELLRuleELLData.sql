/********************************************************************************************************
**Procedure Name:
**      process.GetIntegrityELLData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get ELL Program Participation Data for integrity processing  
**               
**Input:
**
**Output:
**	ELL Program Participation Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get ELL Program Participation Data for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	03/31/2015	Initial Creation
**	Rohith		08/10/2015	removing entrydate check in join conditions as SPED AND ELL will be at student 
**							and school level
**  PSharma		08/20/2016	added distinct to the select (TFS#151027)
**  Amit Verma	03/09/2017	Updated the View Name from integrity.[StudentProgramAssociation_IsConcurrent] 
**							to integrity.[StudentProgramAssociation_IsOverlapping] 
** Rchinta		04/02/2017	change in the order of joins that match with primary key. 
** Sucharita    02/20/2019  Commented extra join with process.Execution table.Also commented join with  integrity.ProgramSchools as we are not using ProgramSchoolIsLEA field 
******************************************************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetStateELLRuleELLData]
@ExecutionId as int,
@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
	  --Get Student ELL Program Participation Data
      SELECT DISTINCT SSA.StudentUSI,
             SSA.SchoolId,
			 ssa.FiscalYear					                                                                                AS 'FiscalYear',
             LEFT(SPA.ProgramName, CHARINDEX(' ', SPA.ProgramName) - 1)                                                     AS 'ProgramName',
			 SPA.ProgramName                                                                                                AS 'FullProgramName',
             SPA.BeginDate                                                                                                  AS 'ProgramBeginDate',
      	     SPA.EndDate                                                                                                    AS 'ProgramEndDate',
			 d.CodeValue                                                                                                    AS 'ReasonDescriptor',
			 spae.IsProgramOverlapping																						AS 'IsProgramOverlapping',
			 spaeell.IsConcurrentlyEnrolledInEll																			AS 'IsELLProgramConcurrentlyEnrolled',
			 CASE WHEN d.CodeValue = 'ELL07' 															                    
			      THEN Integrity.ELLProgramHasSubsequentSPED(SPA.StudentUSI,SPA.EducationOrganizationId)	                    
			 ELSE NULL END                                                                                                  AS 'ELLProgramHasSubsequentSPED'
			---	 CASE WHEN ps.schoolid IS NOT NULL THEN 0 ELSE 1 END														AS 'ProgramSchoolIsLEA'  --EducationOrganizationId 
     FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ELLDM
	       INNER JOIN leadata.StudentSchoolAssociation SSA
		         ON   ELLDM.FiscalYear = SSA.FiscalYear
					AND  SSA.StudentUSI = ELLDM.StudentUSI
				    AND SSA.SchoolId = ELLDM.SchoolId					
      	    LEFT JOIN leadata.StudentProgramAssociation SPA
                 ON ELLDM.FiscalYear = SPA.Fiscalyear
				    AND ELLDM.StudentUSI = SPA.StudentUSI    
					AND ELLDM.SchoolId = SPA.EducationOrganizationId   						  
		    LEFT JOIN leadata.Descriptor D
		         ON SPA.FiscalYear = D.FiscalYear 
				 AND SPA.ReasonExitedDescriptorId = D.DescriptorId					
			LEFT OUTER JOIN integrity.[StudentProgramAssociation_IsOverlapping] spae 
				 ON  spae.FiscalYear = SPA.FiscalYear
					AND spae.StudentUSI = ELLDM.StudentUSI
				    AND spae.EducationOrganizationId = SPA.EducationOrganizationId
					AND spae.programtypeid = SPA.programtypeid					
			LEFT OUTER JOIN integrity.[StudentProgramAssociation_IsELLConcurrent] spaeELL 
				 ON spaeELL.StudentUSI = ELLDM.StudentUSI
				    AND spaeELL.EducationOrganizationId = SPA.EducationOrganizationId
				    AND spaeELL.FiscalYear = SPA.FiscalYear
				    AND spaeELL.programtypeid = SPA.programtypeid
			--INNER JOIN process.Execution e 
			--	 ON e.ExecutionId = @ExecutionId
			--	    AND e.FiscalYear = elldm.FiscalYear
			--LEFT OUTER JOIN integrity.ProgramSchools ps
			--	ON SPA.EducationOrganizationId = ps.SchoolId
	  WHERE ELLDM.Executionid = @ExecutionId 
			AND ELLDM.messageid = @MessageId	
		    AND SPA.ProgramTypeId = 1			  -- Brings only data for STATE ELL Type
		    AND ELLDM.IntegrityRuleTypeId = 7 
END
