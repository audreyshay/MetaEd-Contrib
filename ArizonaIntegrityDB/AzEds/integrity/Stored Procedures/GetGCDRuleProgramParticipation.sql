/************************************************************************************************************
**Procedure Name:
**      process.GetGCDRuleProgramParticipation
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Student Program Participation Data for GCD integrity processing  
**               
**Input:
**
**Output:
**	Student Program Participation Data for GCD integrity processing  
**
**Returns:
**
**Implementation:
**	Used to get Student Program Participation Data for GCD integrity processing   
**
**Revision History:
**	Who				When		What
**	Amit Verma		02/09/2017	Initial Creation
**  P Kanyar        04/10/2017  Updated for Track table change
**	P Kanyar		06/22/2017	Removed Track table join & switched to school & LEA views 
**
************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetGCDRuleProgramParticipation]
@ExecutionId INT,
@MessageId  NVARCHAR(36)

AS
BEGIN 

      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock but at SP level.
	 
	  --Get Student Program Participation Data for GCD integrity processing 
      SELECT DISTINCT 
	          SPA.StudentUSI
			 ,SPA.FiscalYear
			 ,GCD.SchoolId
			 ,MTDD.CodeValue											AS 'MembershipType'
	         ,PT.CodeValue												AS 'ProgramType'
	         ,SPA.EducationOrganizationId								AS 'EducationOrganization'
			 ,SPA.BeginDate												AS 'ProgramBeginDate'
			 ,SPA.EndDate												AS 'ProgramEndDate'
			 ,REASD.CodeValue											AS 'ReasonDescriptor'
			 ,SCH.IsVirtual
			 ,LEA.IsCTE													AS 'IsJTED'
			 ,P.IsApproved
			 ,LEA.LocalEducationAgencyId								AS 'DOA_LocalEducationAgencyID'
			 ,ENTD.CodeValue											AS 'EntryTypeDescriptor'
			 ,EXTD.CodeValue											AS 'ExitWithdrawTypeDescriptor'
			 ,EPA.EnrollmentEntryDate									AS 'EnrollmentBeginDate'
			 ,EPA.EnrollmentExitWithdrawDate							AS 'EnrollmentEndDate'
			 ,EPA.TrackNumber
			 ,GLT.GradeLevelTypeId
	  FROM integrity.vw_GetIntegrityHistoryPerExecution GCD

		   JOIN leadata.StudentProgramAssociation SPA
		     ON GCD.StudentUSI = SPA.StudentUSI 
                AND GCD.FiscalYear = SPA.FiscalYear 
                AND GCD.SchoolId = SPA.EducationOrganizationId
				AND GCD.IntegrityRuleTypeId = 5

		   JOIN entity.Program P
		     ON SPA.FiscalYear = P.FiscalYear
		        AND SPA.ProgramEducationOrganizationId = P.EducationOrganizationId
				AND SPA.ProgramTypeId = P.ProgramTypeId
				AND SPA.ProgramName = P.ProgramName
				AND SPA.ProgramTypeId = 60

		   JOIN entity.vw_School SCH
		     ON SPA.EducationOrganizationId = SCH.SchoolId
		        AND SPA.FiscalYear = SCH.FiscalYear

		   JOIN entity.ProgramType PT
		     ON SPA.ProgramTypeId = PT.ProgramTypeId

		   LEFT JOIN leadata.StudentEnrollmentProgramAssociation EPA
		     ON SPA.FiscalYear = EPA.FiscalYear
		        AND SPA.StudentUSI = EPA.StudentUSI
		   		AND SPA.ProgramTypeId = EPA.ProgramTypeId
		   		AND SPA.ProgramName = EPA.ProgramName
		   		AND SPA.ProgramEducationOrganizationId = EPA.ProgramEducationOrganizationId
		   		AND SPA.BeginDate = EPA.ProgramBeginDate
		   		AND SPA.EducationOrganizationId = EPA.SchoolId

		   LEFT JOIN leadata.Descriptor REASD
		     ON SPA.ReasonExitedDescriptorId = REASD.DescriptorId
		        AND SPA.FiscalYear = REASD.FiscalYear

		   LEFT JOIN leadata.Descriptor ENTD 
		     ON ENTD.FiscalYear = EPA.FiscalYear
		   		AND ENTD.DescriptorId = EPA.EntryTypeDescriptorId

		   LEFT JOIN leadata.Descriptor EXTD 
		     ON ENTD.FiscalYear = EPA.FiscalYear
		   		AND EXTD.DescriptorId = EPA.ExitWithdrawTypeDescriptorId

		   LEFT JOIN leadata.Descriptor MTDD
             ON EPA.MembershipTypeDescriptorId = MTDD.DescriptorId
		   		AND EPA.FiscalYear = MTDD.FiscalYear

		   LEFT JOIN entity.vw_LocalEducationAgency LEA
             ON SCH.LocalEducationAgencyId = LEA.LocalEducationAgencyId
                AND SCH.FiscalYear = LEA.FiscalYear

		   LEFT JOIN entity.GradeLevelType GLT 
             ON GLT.GradeLevelDescriptorId = EPA.EntryGradeLevelDescriptorId

	  WHERE  GCD.Executionid = @ExecutionId 
			 AND GCD.messageid = @MessageId	
END