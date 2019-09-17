/************************************************************************************************************
**Procedure Name:
**      process.GetDRPRuleProgramParticipation
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Student Program Participation Data for DRP integrity processing  
**               
**Input:
**
**Output:
**	Student Program Participation Data for DRP integrity processing  
**
**Returns:
**
**Implementation:
**	Used to get Student Program Participation Data for DRP integrity processing   
**
**Revision History:
**	Who				When		What
**	Amit Verma		07/29/2016	Initial Creation
**	Amit Verma		08/08/2016	Added the Join with EnrollmentProgramAssociation Table to Validate the 
**                              Program falls with in specific Enrollment
**	P Kanyar		08/18/2016	Added System date fields
**  Amit Verma      08/19/2016  Added StudentSchoolAssociation logic in Program Association
**  Amit Verma      08/19/2016  Updated the Output Column name as per changes in InRule Entity
**	P Kanyar		08/25/2016	Removed Top 1 & Order by for System date fields' SELECT stmnts
**								do not fall within any enrollment
**  Amit Verma      09/12/2016  Added IsApproved flag from entity.Program Table
**								Added SubsequentNonDRPEnmrollment30Days flag
**  Martez Killens	09/13/2016	Moved GradeLevelTypeId to bottom of column list to correspond with Object
								Mapper requirements
**	RChinta			03/12/2019	Performance Improvements and removing unnecessary columns
************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetDRPRuleProgramParticipation]
@ExecutionId INT,
@MessageId  NVARCHAR(36)

AS
BEGIN 

      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock but at SP level.
	 
	DROP TABLE IF EXISTS #NonDRPEnrollmentWithin30Days
DROP TABLE IF EXISTS #StudSchAsso_IsConcurrentOtherThanJTED
DROP TABLE IF EXISTS #SubsequentNonDRPEnmrollment30Days

-----------------------------------------------------------------------------------------------------------------------------------------------------
Create table #NonDRPEnrollmentWithin30Days (FiscalYear int ,StudentUSI int,SchoolId int,EntryDate datetime, NonDRPEnrollmentWithin30Days bit); 
insert into #NonDRPEnrollmentWithin30Days (FiscalYear ,StudentUSI ,SchoolId ,EntryDate,NonDRPEnrollmentWithin30Days )
select FiscalYear ,StudentUSI ,SchoolId ,EntryDate,NonDRPEnrollmentWithin30Days from integrity.DRPStudentSchoolAssociation_NonDRPEnrollmentWithin30Days 
-------------------------------------------------------------------------------------------------------------------------------------------------------

Create table #SubsequentNonDRPEnmrollment30Days (FiscalYear int ,StudentUSI int,SchoolId int,EntryDate datetime, SubsequentNonDRPEnmrollment30Days bit); 
insert into #SubsequentNonDRPEnmrollment30Days (FiscalYear ,StudentUSI ,SchoolId ,EntryDate,SubsequentNonDRPEnmrollment30Days )
select FiscalYear ,StudentUSI ,SchoolId ,EntryDate,SubsequentNonDRPEnmrollment30Days from integrity.DRPSSA_SubsequentNonDRPEnmrollment
-----------------------------------------------------------------------------------------------------------------------------------------------------------

Create table #StudSchAsso_IsConcurrentOtherThanJTED(FiscalYear int ,StudentUSI int,SchoolId int,EntryDate datetime,ConcurrentEnrollment_at_otherthanJTED bit); 
insert into #StudSchAsso_IsConcurrentOtherThanJTED (FiscalYear ,StudentUSI ,SchoolId ,EntryDate,ConcurrentEnrollment_at_otherthanJTED )
select FiscalYear ,StudentUSI ,SchoolId ,EntryDate,ConcurrentEnrollment_at_otherthanJTED from [integrity].[StudSchAsso_IsConcurrentOtherThanJTED] SSA_JTED


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT 
	          SDRPPA.StudentUSI
			 ,SDRPPA.FiscalYear
			 ,DRP.SchoolId
	         ,PT.CodeValue												AS 'ProgramType'
	         ,SDRPPA.EducationOrganizationId							AS 'EducationOrganization'
			 ,SDRPPA.BeginDate											AS 'ProgramBeginDate'
			 ,SPA.EndDate												AS 'ProgramEndDate'
			 ,REASD.CodeValue											AS 'ReasonDescriptor'
			 ,SDRPPA.WrittenLearningPlanDate
			 ,ISNULL((SELECT DAY(OverrideDate)
				     FROM config.SystemDateOverride),DAY(GETDATE()))	AS 'DayOfSystemDate'
			 ,ISNULL((SELECT MONTH(OverrideDate) 
					 FROM config.SystemDateOverride),MONTH(GETDATE()))	AS 'MonthOfSystemDate'
			 ,ISNULL((SELECT YEAR(OverrideDate)
			  	     FROM config.SystemDateOverride),YEAR(GETDATE()))	AS 'YearOfSystemDate'
			 ,SCH.IsVirtual
			 ,LEA.IsCTE													AS 'IsJTED'
			
			 ,LEA.LocalEducationAgencyId								AS 'DOA_LocalEducationAgencyID'
												
			 ,EXTD.CodeValue											AS 'ExitWithdrawTypeDescriptor'
			 ,EPA.EnrollmentEntryDate									AS 'EnrollmentBeginDate'
			 ,EPA.EnrollmentExitWithdrawDate							AS 'EnrollmentEndDate'
			
			 ,ISNULL(VWDRP.NonDRPEnrollmentWithin30Days,0)				AS 'NonDRPEnrollmentWithin30Days'
			 ,ISNULL(SSA_JTED.ConcurrentEnrollment_at_otherthanJTED,0)	AS 'ConcurrentEnrollment_at_otherthanJTED'
			
			 ,ISNULL(VWDRPSUB.SubsequentNonDRPEnmrollment30Days,0)		AS 'SubsequentNonDRPEnmrollment30Days'		
		
			
	  FROM integrity.vw_GetIntegrityHistoryPerExecution DRP with (nolock)

	       JOIN leadata.StudentDropOutRecoveryProgramAssociation SDRPPA with (nolock)
		     ON DRP.StudentUSI = SDRPPA.StudentUSI
			    AND DRP.FiscalYear = SDRPPA.FiscalYear
				AND DRP.SchoolId = SDRPPA.EducationOrganizationId
				AND DRP.IntegrityRuleTypeId = 4				

		   JOIN leadata.StudentProgramAssociation SPA with (nolock)
		     ON SPA.StudentUSI = SDRPPA.StudentUSI 
                AND SPA.FiscalYear = SDRPPA.FiscalYear 
                AND SPA.ProgramTypeId = SDRPPA.ProgramTypeId 
				AND SPA.ProgramName = SDRPPA.ProgramName
                AND SPA.ProgramEducationOrganizationId = SDRPPA.ProgramEducationOrganizationId 
                AND SPA.BeginDate = SDRPPA.BeginDate 
                AND SPA.EducationOrganizationId = SDRPPA.EducationOrganizationId
				AND SPA.ProgramTypeId = 61    -- DRP Program type						
				

		   JOIN entity.School SCH with (nolock)
		     ON SPA.EducationOrganizationId = SCH.SchoolId
		        AND SPA.FiscalYear = SCH.FiscalYear

		   JOIN entity.ProgramType PT with (nolock)
		     ON SDRPPA.ProgramTypeId = PT.ProgramTypeId

		   LEFT JOIN leadata.StudentEnrollmentProgramAssociation EPA with (nolock)
		     ON SPA.FiscalYear = EPA.FiscalYear
		        AND SPA.StudentUSI = EPA.StudentUSI
		   	 AND SPA.ProgramTypeId = EPA.ProgramTypeId
		   	 AND SPA.ProgramName = EPA.ProgramName
		   	 AND SPA.ProgramEducationOrganizationId = EPA.ProgramEducationOrganizationId
		   	 AND SPA.BeginDate = EPA.ProgramBeginDate
		   	 AND SPA.EducationOrganizationId = EPA.SchoolId
		   	 AND EPA.MembershipTypeDescriptorId = 11743
			 AND EPA.ProgramTypeId =61
			 AND EPA.ProgramName = 'DRP Dropout Recovery Program'		
			 

		   LEFT JOIN leadata.Descriptor REASD with (nolock)
		     ON SPA.ReasonExitedDescriptorId = REASD.DescriptorId
		        AND SPA.FiscalYear = REASD.FiscalYear
		   LEFT JOIN leadata.Descriptor EXTD  with (nolock)
		     ON EXTD.FiscalYear = EPA.FiscalYear
		   	 AND EXTD.DescriptorId = EPA.ExitWithdrawTypeDescriptorId
			 AND EPA.ProgramTypeId =61
		     LEFT JOIN entity.LocalEducationAgency LEA with (nolock)
             ON SCH.LocalEducationAgencyId = LEA.LocalEducationAgencyId
                AND SCH.FiscalYear = LEA.FiscalYear				
              LEFT JOIN  #NonDRPEnrollmentWithin30Days VWDRP with (nolock)
		         ON  EPA.FiscalYear = VWDRP.FiscalYear
			     AND EPA.StudentUSI = VWDRP.StudentUSI
		     	 AND EPA.SchoolId = VWDRP.SchoolId
		     	 AND EPA.EnrollmentEntryDate = VWDRP.EntryDate				  
			    LEFT JOIN #StudSchAsso_IsConcurrentOtherThanJTED SSA_JTED with (nolock)
		     ON EPA.FiscalYear = SSA_JTED.FiscalYear 
			    AND EPA.StudentUSI = SSA_JTED.StudentUSI
		        AND EPA.SchoolId = SSA_JTED.SchoolId 		   
		   	   AND EPA.EnrollmentEntryDate = SSA_JTED.EntryDate		 				 
		   LEFT JOIN #SubsequentNonDRPEnmrollment30Days VWDRPSUB with (nolock)
		     ON EPA.FiscalYear = VWDRPSUB.FiscalYear
			     AND EPA.StudentUSI = VWDRPSUB.StudentUSI
		     	 AND EPA.SchoolId = VWDRPSUB.SchoolId				 
		         AND EPA.EnrollmentEntryDate = VWDRPSUB.EntryDate			
				 
	      WHERE  DRP.Executionid = @ExecutionId ---10770
			 AND DRP.messageid = @MessageId---5331746

		
END
