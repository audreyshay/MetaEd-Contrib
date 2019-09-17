/********************************************************************************************************
**Procedure Name:
**      process.GetIntegritySPEDProgramAssociationData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get SPED Program Participation Data for integrity processing  
**               
**Input:
**
**Output:
**	SPED Program Participation Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get SPED Program Participation Data for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	04/13/2015	Initial Creation
**	Rohith		08/06/2015 Made changes to comment few tables and modify schema so that the SP works as per AZEDS design
**	Rohith		08/10/2015 removing entrydate check in join conditions as SPED AND ELL will be at student and school level
**	PSharma		10/17/2016 Added IntegrityRuleTypeId for FEDSPED
**  PSharma		10/18/2016 Changed the SChholId and Studentusi to be grabbed from SPEDDM instead of SSA, Rule 40003
**  Sucharita   06/25/2019 Fetching ProgramName of the next enrolled program association in the same district after exiting from the current SPED program.
**                         Also commented extra join on student table
** Sucharita    07/18/2019 Modified stored proc to get ProgramName of the next enrolled program association in the same district after exiting from the current SPED program
**                         from View instead of function
** Vinoth K     08/29/2019 Reverted back to function, AS QA has tested with the function only.
************************************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetStateSpedRuleProgramAssociation]
@ExecutionId INT,
@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	  ----Get FiscalYear 
	  --DECLARE @FiscalYear INT
	  --SELECT @FiscalYear = FiscalYear FROM Process.FiscalYear

	  DECLARE @FiscalYear INT 
      SELECT @FiscalYear = fiscalyear 
      FROM   process.execution (nolock) 
      WHERE  executionid = @ExecutionId 

	 Select * into #temp_NextProgram
	from [integrity].[UdfNextEnrolledSPEDProgramPerExecutionMessage](@ExecutionId, @MessageId, @FiscalYear)

	  --Get Student SPED Program Participation Data
      SELECT DISTINCT SPEDDM.StudentUSI,
	         SPEDDM.SchoolId                                                                                                       AS 'SchoolID',
			 LEFT(SPA.ProgramName, CHARINDEX(' ', SPA.ProgramName) - 1)                                                         AS 'ProgramCode',
	         SPA.EducationOrganizationId                                                                                        AS 'ProgramSchoolID',
			 SPA.BeginDate                                                                                                      AS 'ProgramBeginDate',
			 SESD.CodeValue                                                                                                     AS 'SpecialEducationSettingDescriptor',
			 Integrity.IsSPEDConcurrencyForSameDOA (SPEDDM.StudentUSI,SPA.FiscalYear,SPA.EducationOrganizationId)               AS 'SPEDConcurrencyForSameDOA',
			 --ISNULL(vwSPED.IsSPEDConcurrencyForSameDOA,0) AS IsSPEDConcurrencyForSameDOA,
			 Integrity.SameGradeForSPEDConcurrencyForSameDOA (SPEDDM.StudentUSI,SPA.Fiscalyear,SPA.EducationOrganizationId)     AS 'SameGradeForSPEDConcurrencyForSameDOA',
			 Integrity.IsSPEDConcurrencyForDifferentDOR (SPEDDM.StudentUSI,SPA.Fiscalyear,SPA.EducationOrganizationId)          AS 'SPEDConcurrencyForDifferentDOR',
			 Integrity.IsProgramSchoolLEA(SPA.EducationOrganizationId,SPA.FiscalYear)                                           AS 'ProgramSchoolIsLEA',
			 SSEPA.MainSPEDSchool,																		                                          
			 Integrity.MultipleMainSPEDSchool(SPEDDM.StudentUSI,SPEDDM.SchoolId,SPA.Fiscalyear)									AS 'MultipleMainSPEDSchool',
      	     SPA.EndDate                                                                                                        AS 'ProgramExitDate',
             RED.CodeValue                                                                                                      AS 'ProgramExitReason',
			 CASE WHEN SDSCE.SelfContainedEligible IS NULL THEN CAST(0 AS BIT) ELSE SDSCE.SelfContainedEligible END             AS 'SelfContainedEligible',
			 tmp.NextProgramName                                                                                                AS 'NextEnrolledSPEDProgramName'
    FROM [integrity].[vw_GetIntegrityHistoryPerExecution] SPEDDM
	       INNER JOIN leadata.StudentProgramAssociation SPA
                 ON SPEDDM.SchoolId = SPA.EducationOrganizationId
					AND SPEDDM.StudentUSI = SPA.StudentUSI
					AND SPEDDm.FiscalYear = SPA.Fiscalyear
					AND SPA.ProgramTypeId IN (6,8)

	       LEFT JOIN leadata.StudentSchoolAssociation SSA
		         ON SSA.StudentUSI = SPEDDM.StudentUSI
				    AND SSA.SchoolId = SPEDDM.SchoolId
					--AND SSA.EntryDate = SPEDDM.SchoolEntryDate
					AND SSA.Fiscalyear = SPEDDM.FiscalYear
					AND SPEDDM.IntegrityRuleTypeId in (6,8)  -- Brings only data for STATE SPED and FED SPED

      	    LEFT JOIN entity.ProgramService SPAS   ---We have to get SelfContained flag by joining ProgramService Table
                 ON SPA.ProgramTypeId = SPAS.ProgramTypeId 
				    AND SPA.ProgramName = SPAS.ProgramName 
					AND SPA.ProgramEducationOrganizationId = SPAS.EducationOrganizationId
					AND SPA.FiscalYear = SPAS.FiscalYear

           LEFT JOIN entity.ServiceDescriptor SDSCE
                 ON SDSCE.ServiceDescriptorId = SPAS.ServiceDescriptorId
				 AND SDSCE.FiscalYear = SPAS.FiscalYear

           LEFT JOIN leadata.StudentSpecialEducationProgramAssociation SSEPA
		         ON SPA.StudentUSI = SSEPA.StudentUSI                         
				    AND SPA.ProgramTypeId = SSEPA.ProgramTypeId
					AND SPA.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
					AND SPA.BeginDate = SSEPA.BeginDate
					AND SPA.ProgramName = SSEPA.ProgramName
					AND SPA.EducationOrganizationId = SSEPA.EducationOrganizationId
					AND SPA.FiscalYear = SSEPA.FiscalYear 

		   --LEFT JOIN leadata.Student S
		   --      ON SPEDDM.StudentUSI = S.StudentUSI

		   LEFT JOIN leadata.Descriptor SESD
		         ON SSEPA.SpecialEducationSettingDescriptorId = SESD.DescriptorId
				 AND SSEPA.FiscalYear = SESD.Fiscalyear

		   --LEFT JOIN leadata.Descriptor SED
		   --      ON SESD.SpecialEducationSettingDescriptorId = SED.DescriptorId


      	   LEFT JOIN leadata.Descriptor RED
		         ON SPA.ReasonExitedDescriptorId = RED.DescriptorId
				 And SPA.FiscalYear = RED.FiscalYear
              
            LEFT join #temp_NextProgram tmp
			 on spa.fiscalyear = tmp.fiscalyear
			 and spa.StudentUSI = tmp.studentusi
			 and spa.ProgramTypeId =tmp.ProgramTypeId
			 and spa.ProgramName =tmp.programName 
			 and spa.ProgramEducationOrganizationId =tmp.ProgramEducationOrganizationId
			 and spa.BeginDate =tmp.BeginDate
			 and spa.EducationOrganizationId =tmp.EducationOrganizationId

			WHERE  SPEDDM.Executionid = @ExecutionId and SPEDDM.messageid = @MessageId	

		   --LEFT JOIN [integrity].[StudentProgramAssociation_IsSPEDConcurrencyForSameDOA] vwSPED
		   --       ON SPA.StudentUSI = vwSPED.StudentUSI
				 --    AND SPA.FiscalYear = vwSPED.FiscalYear
					-- AND SPA.EducationOrganizationId = vwSPED.SchoolId
					-- AND SPA.ProgramName = vwSPED.ProgramName

		   --LEFT JOIN edfi.Descriptor D
		   --      ON RED.ReasonExitedDescriptorId = D.DescriptorId
		ORDER BY SPEDDM.StudentUSI, SPEDDM.SchoolId, SPA.BeginDate 
      Drop table #temp_NextProgram
END
GO

