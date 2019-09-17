/********************************************************************************************************
**Procedure Name:
**      process.GetIntegrityELLMembershipData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get ELL Program Membership Data for integrity processing  
**               
**Input:
**
**Output:
**	ELL Program Membership Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get ELL Program Membership Data for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	03/06/2015	Initial Creation
**	Rohith		08/10/2015 removing entrydate check in join conditions as SPED AND ELL will be at student and school level
**	Rohith		08/10/2015 updating the schema names for tables
**	Rohith		12/31/2015 IN prod this SP was taking about 1 hour 22 mins to finish, Adding Local Variables reduced it to 10 secs
**  Praneetha   05/09/2016 included the IsVirtual Column
**	PSharma		06/08/2016 added MembershipType in the main select
**  Sucharita   02/20/2019  Commented extra left join with entity.LocalEducationAgency
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[GetStateELLRuleEnrollment]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 

      SET NOCOUNT ON;
 SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

	  --Get Student ELL Program Membership Data
	    SELECT DISTINCT ssa.StudentUSI, 
			    ssa.SchoolId																		AS 'SchoolID',
				(CASE WHEN esch.IsVirtual = 1 THEN 1 ELSE 0 END)									AS 'IsVirtual',
				ELLDM.FiscalYear						                                            AS 'SchoolYear',
				elea.LocalEducationAgencyId															AS 'DOA_LocalEducationAgencyID', 
				doaType.CodeValue																	AS 'DistrictOfAttendanceType', 
				elea.IsOutOfState																	AS 'DOAIsOutOfState',
				glt.GradeLevelTypeId																AS 'GradeMembership', 
				CAST(ssa.EntryDate AS DATETIME)														AS 'Entrydate', 
				CAST(ssa.ExitWithdrawDate AS DATETIME)												AS 'ExitDate'
				,ewtd.CodeValue																		AS 'ExitWithdrawTypeDescriptor'
				,mtd.CodeValue																		AS 'MembershipType'
				,SPA.BeginDate																		AS 'ProgramBeginDate'
				,SPA.EndDate																		AS 'ProgramEndDate'
				,CAST(CASE WHEN (SPA.BeginDate >= ssa.EntryDate) AND SPA.BeginDate <= ISNULL(ssa.ExitWithdrawDate,CAST(CAST(ELLDM.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))
				           OR (SPA.BeginDate >= ssa.EntryDate) AND ISNULL(SPA.EndDate,CAST(CAST(ELLDM.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE)) 
						      <= ISNULL(ssa.ExitWithdrawDate,CAST(CAST(ELLDM.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))
				      THEN 1 ELSE 0
			     END AS BIT)																		AS 'IsValidELLMembership',
				 est.CodeValue                                                                      AS 'DOASectorType',                
				 elea.IsCTE                                                                        AS 'DOAIsJTED',
				 elea.IsAccommodationDistrict														AS 'DOAIsAccommodationDistrict', 
				 elea.IsSecureCare																	AS 'DOAIsSecureCare', 
				 elea.IsExceptional																	AS 'DOAIsExceptional', 
				 elea.IsHeadStart																	AS 'DOAIsHeadStart', 
				 elea.IsValidForDOR																	AS 'DOAIsValidForDOR',  
				 elea.IsTransportation															    AS 'DOAIsTransportation',  
				 elea.IsElementaryNotInHighSchool														AS 'DOAElementaryNotInHighSchool',  
				 elea.IsHighSchoolDistrict															AS 'DOAHighSchoolDistrict'
		FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ELLDM
      	     INNER JOIN leadata.StudentProgramAssociation SPA
                  ON ELLDM.StudentUSI = SPA.StudentUSI
      		         AND ELLDM.SchoolId = SPA.EducationOrganizationId
					 AND ELLDM.FiscalYear = SPA.FiscalYear
					 AND SPA.ProgramTypeId = 1
					 AND ELLDM.IntegrityRuleTypeId = 7   -- Brings only data for STATE ELL Type
		     INNER JOIN leadata.StudentSchoolAssociation ssa 
		          ON ssa.StudentUSI = SPA.StudentUSI
					 AND ssa.SchoolId = SPA.EducationOrganizationId
					 AND ssa.FiscalYear = SPA.FiscalYear
			 INNER JOIN entity.School esch 
		  		  ON ssa.SchoolId = esch.SchoolId 
				   AND ssa.FiscalYear = esch.FiscalYear            
			 --LEFT JOIN edfi.CharterStatusType cst
			 --     ON sch.CharterStatusTypeId = cst.CharterStatusTypeId
			 LEFT JOIN leadata.Descriptor mtd
			      ON ssa.MembershipTypeDescriptorId = mtd.DescriptorId
				  AND mtd.FiscalYear = SSa.FiscalYear
			 --LEFT JOIN leadata.Descriptor mtdd
			 --     ON mtd.MembershipTypeDescriptorId = mtdd.DescriptorId
             LEFT JOIN entity.LocalEducationAgency elea
				  ON esch.LocalEducationAgencyId = elea.LocalEducationAgencyId
				  AND elea.Fiscalyear = esch.Fiscalyear
             LEFT JOIN entity.SectorType est
			      ON elea.SectorTypeId = est.SectorTypeId
		     LEFT JOIN leadata.Descriptor gld						-- in AZEDS everthing is mapped to descriptor and 
		  		  ON gld.DescriptorId = ssa.EntryGradeLevelDescriptorId 
				  AND gld.FiscalYear = ssa.FiscalYear
		     LEFT JOIN entity.GradeLevelType glt 
		  		  ON glt.GradeLevelDescriptorId = gld.DescriptorId 
		    -- LEFT JOIN entity.LocalEducationAgency doa 
		  		--  ON doa.LocalEducationAgencyId = esch.LocalEducationAgencyId 
				  --AND doa.FiscalYear = esch.FiscalYear
		     LEFT JOIN entity.LocalEducationAgencyCategoryType doaType 
		  		  ON doaType.LocalEducationAgencyCategoryTypeId = elea.LocalEducationAgencyCategoryTypeId
			 LEFT JOIN leadata.Descriptor ewtd
				  ON ssa.ExitWithdrawTypeDescriptorId = ewtd.DescriptorId
				  and ssa.FiscalYear = ewtd.Fiscalyear
		  WHERE  ELLDM.Executionid = @ExecutionId and ELLDM.messageid = @MessageId			  
		ORDER BY ssa.StudentUSI, ssa.SchoolId, EntryDate
END
