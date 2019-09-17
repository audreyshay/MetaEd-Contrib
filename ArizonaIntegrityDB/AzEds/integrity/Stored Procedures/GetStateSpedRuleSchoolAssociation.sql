/********************************************************************************************************
**Procedure Name:
**      process.[GetStateSpedRuleSchoolAssociation]
**
**Author:
**      Amit Verma
**
**Description:  
**	Get SPEDSchoolAssociationData for integrity processing  
**               
**Input:
**
**Output:
**	SPEDSchoolAssociationData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get SPEDSchoolAssociationData for integrity processing  
**
**Revision History:
**	Who			When		What
**	Amit Verma	12/23/2014	Initial Creation
**	PSharma		06/25/2014  Added ResidentialCenter
**	PSharma		06/25/2014  Treated NULL for ResidentialCenter
**	Rohith		08/10/2015  removing entrydate check in join conditions as SPED AND ELL will be at student and school level
**  Amit Verma  09/11/2015  Added the SchoolIsSecure flag
**	PSharma		10/17/2016	Added IntegrityRuleTypeId for FEDSPED 
**  PSharma		12/07/2016  Replaced StudentProgramAssociation with StudentEnrollmentProgramAssociation
**  PSharma		12/09/2016  Changed InnerJoin to Left Join for ExitWithdraw Descriptor because that can be NULL
**	P Kanyar    04/11/2017	Updated to make Track table changes 
**	PKanyar		04/17/2017  Fixed DOA CTDS not to show SchoolCTDS (bug # 182828)
**  Amit Verma	04/21/2017	Changed the SP to Check the logic for FY2018
**  Britto    	05/01/2017	Added comment for the join of StudentSchoolAssociation with StudentEducationOrganizationAssociation
**	P Kanyar    06/22/2017	Removed Track table join & 2 unused Track fields 
**	Vinoth K    02/21/2019	Added the CalendarCode, FY2020 onwards calendar code is going to be uniquely identified. 
**
**********************************************************************************************************/

CREATE PROCEDURE [integrity].[GetStateSpedRuleSchoolAssociation]
	@ExecutionId INT,
	@MessageId as [nvarchar](36)
AS
BEGIN 

      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  
		   
			--Get FiscalYear for a given ExecutionId
			DECLARE @FiscalYear INT

			SELECT @FiscalYear = FiscalYear
			FROM process.Execution
			WHERE ExecutionId = @ExecutionId

	        IF @FiscalYear < 2018
				BEGIN 
				    --- Get SPED School Association Data
					SELECT DISTINCT 
						 SSA.StudentUSI, 
						 SSA.SchoolId																				AS 'SchoolID',
						 ESCH.IsVirtual,											                            
						 MTD.CodeValue                                                                              AS 'MembershipType',
						 ESCH.SchoolTypeCode                                                                        AS 'SchoolType', 
						 DOA.LocalEducationAgencyId                                                                 AS 'DOA_LocalEducationAgencyID', 
						 SEOA.EducationOrganizationId                                                               AS 'DOR_LocalEducationAgencyID',
						 DOA.LocalEducationAgencyCategoryCode                                                       AS 'DistrictOfAttendanceType',	   
						 DOA.LocalEducationAgencyCTDS																AS 'DOACTDS',
						 DOR.LocalEducationAgencyCTDS																AS 'DORCTDS',
						 IsNull(SSA.FiscalYear,SPEDDM.FiscalYear)                                                   AS 'FiscalYear', 
						 ETDE.CodeValue                                                                             AS 'EntryTypeDescriptor', 
						 EWTD.CodeValue                                                                             AS 'ExitWithdrawTypeDescriptor', 
						 CAST(SSA.EntryDate AS DATETIME)															AS 'Entrydate', 
						 CAST(SSA.ExitWithdrawDate AS DATETIME)														AS 'ExitDate', 
						 SSA.TrackNumber																			AS 'TrackNumber', 				 				 
						 DOA.IsOutOfState																			AS 'DOAIsOutOfState',
						 DOA.IsCTE                                                                                  AS 'DOAIsJTED',  
						 DOA.IsAccommodationDistrict                                                                AS 'DOAIsAccommodationDistrict',
						 DOA.IsSecureCare																	        AS 'DOAIsSecureCare',
						 DOA.IsExceptional																	        AS 'DOAIsSPED',
						 DOA.IsHeadStart																		    AS 'DOAIsHeadStart',
						 DOA.SectorTypeCode																		    AS 'DOASectorType',				  
						 DOR.LocalEducationAgencyCategoryCode                                                       AS 'DistrictOfResidenceType', 
						 DOR.IsOutOfState																	        AS 'DORIsOutOfState',
						 DOR.IsCTE																		            AS 'DORIsJTED', 
						 DOR.IsAccommodationDistrict														        AS 'DORIsAccommodationDistrict',
						 DOR.IsSecureCare																	        AS 'DORIsSecureCare',
						 DOR.IsExceptional																            AS 'DORIsSPED',
						 DOR.IsHeadStart																	        AS 'DORIsHeadStart',
						 DOR.SectorTypeCode																		    AS 'DORSectorType',			   
						 GLT.GradeLevelTypeId																	    AS 'GradeMembership',
						 LEFT(SPA.ProgramName, CHARINDEX(' ', SPA.ProgramName) - 1)                                 AS 'ProgramCode',
					     SPA.SchoolId					                                                            AS 'ProgramSchoolID',
						 SPA.ProgramBeginDate                                                                       AS 'ProgramBeginDate',
						 CAST(1 AS BIT)																				AS 'IsValidSPEDMembership',
						 DOA.IsElementaryNotInHighSchool                                                            AS 'DOAElementaryNotInHighSchool',
						 DOR.IsElementaryNotInHighSchool                                                            AS 'DORElementaryNotInHighSchool',
						 DOA.IsHighSchoolDistrict                                                                   AS 'DOAIsHighSchoolDistrict',
						 DOR.IsHighSchoolDistrict                                                                   AS 'DORIsHighSchoolDistrict',
						 ESCH.IsResidentialCenter																	AS 'ResidentialCenter',  
						 --ESCH.IsPrivateDaySchool,
						 ESCH.IsSecureCare																			AS 'SchoolIsSecureCare',
						 SSA.CalendarCode																			AS 'CalendarCode'
					FROM leadata.StudentSchoolAssociation SSA 
					     
						 INNER JOIN [integrity].[vw_GetIntegrityHistoryPerExecution] SPEDDM
						    ON SSA.StudentUSI = SPEDDM.StudentUSI
							   AND SSA.SchoolId = SPEDDM.SchoolId
							   AND SSA.FiscalYear = SPEDDM.FiscalYear
							   AND SPEDDM.IntegrityRuleTypeId IN (6,8)		-- Brings only data for STATE SPED and FED SPED
					  	 
						 INNER JOIN entity.vw_School ESCH 
					  	    ON SSA.SchoolId = ESCH.SchoolId
							   AND SSA.Fiscalyear = ESCH.FiscalYear
					     
						 INNER JOIN leadata.StudentSchoolAssociationLocalEducationAgency SEOA
					  	    ON SEOA.SchoolId = SSA.SchoolId 
					  		   AND SEOA.StudentUSI = SSA.StudentUSI 
							   AND SEOA.Fiscalyear = SSA.FiscalYear 
					    
						 INNER JOIN entity.vw_LocalEducationAgency DOR 
					  	    ON DOR.LocalEducationAgencyId = SEOA.EducationOrganizationId 
							   AND DOR.Fiscalyear = SEOA.FiscalYear
					    
						 INNER JOIN leadata.StudentEnrollmentProgramAssociation SPA
						    ON SPA.StudentUSI = SSA.StudentUSI
							   AND SPA.SchoolId = SSA.SchoolId
							   AND SPA.Fiscalyear = SSA.FiscalYear
							   AND SPA.EnrollmentEntryDate = SSA.EntryDate
							   AND SPA.ProgramTypeId = 6
						
						 INNER JOIN leadata.Descriptor MTD
						    ON SSA.MembershipTypeDescriptorId = MTD.DescriptorId
							   AND MTD.Fiscalyear = SSA.FiscalYear
						
						 INNER JOIN leadata.Descriptor GLD 
					  		ON GLD.DescriptorId = SSA.EntryGradeLevelDescriptorId 
							   AND GLD.Fiscalyear = SSA.FiscalYear
					   
					     INNER JOIN entity.GradeLevelType GLT 
					  	    ON GLT.GradelevelDescriptorID = GLD.DescriptorId
					    
						 INNER JOIN entity.vw_LocalEducationAgency DOA						-- switched to view
					  	    ON DOA.LocalEducationAgencyId = ESCH.LocalEducationAgencyId 
							   AND DOA.Fiscalyear = ESCH.FiscalYear
					    
						 LEFT JOIN leadata.Descriptor ETDE   -- join SSA entrytypedescriptorID to leadata.descriptor table 
					  	    ON ETDE.DescriptorId = SSA.EntryTypeDescriptorId 
					   
					     LEFT JOIN leadata.Descriptor EWTD  --ExitwithdrawaTypeDescriptorId can be NULL so Left Join
					  		ON EWTD.DescriptorId = SSA.ExitWithdrawTypeDescriptorId 
							   AND EWTD.Fiscalyear = SSA.FiscalYear

					  WHERE  SPEDDM.Executionid = @ExecutionId 
							 AND SPEDDM.messageid = @MessageId	
					  ORDER BY SSA.StudentUSI, 
							   SSA.SchoolId, 
							   EntryDate
				END
				ELSE 
				BEGIN 
				    --- Get SPED School Association Data
					SELECT DISTINCT 
						 SSA.StudentUSI, 
						 SSA.SchoolId																				AS 'SchoolID',
						 ESCH.IsVirtual,											                            
						 MTD.CodeValue                                                                              AS 'MembershipType',
						 ESCH.SchoolTypeCode                                                                        AS 'SchoolType', 
						 DOA.LocalEducationAgencyId                                                                 AS 'DOA_LocalEducationAgencyID', 
						 SEOA.EducationOrganizationId                                                               AS 'DOR_LocalEducationAgencyID',
						 DOA.LocalEducationAgencyCategoryCode                                                       AS 'DistrictOfAttendanceType',	   
						 DOA.LocalEducationAgencyCTDS																AS 'DOACTDS',
						 DOR.LocalEducationAgencyCTDS																AS 'DORCTDS',
						 IsNull(SSA.FiscalYear,SPEDDM.FiscalYear)                                                   AS 'FiscalYear', 
						 ETDE.CodeValue                                                                             AS 'EntryTypeDescriptor', 
						 EWTD.CodeValue                                                                             AS 'ExitWithdrawTypeDescriptor', 
						 CAST(SSA.EntryDate AS DATETIME)															AS 'Entrydate', 
						 CAST(SSA.ExitWithdrawDate AS DATETIME)														AS 'ExitDate', 
						 SSA.TrackNumber																			AS 'TrackNumber', 				 
						 DOA.IsOutOfState																			AS 'DOAIsOutOfState',
						 DOA.IsCTE                                                                                  AS 'DOAIsJTED',  
						 DOA.IsAccommodationDistrict                                                                AS 'DOAIsAccommodationDistrict',
						 DOA.IsSecureCare																	        AS 'DOAIsSecureCare',
						 DOA.IsExceptional																	        AS 'DOAIsSPED',
						 DOA.IsHeadStart																		    AS 'DOAIsHeadStart',
						 DOA.SectorTypeCode																		    AS 'DOASectorType',				  
						 DOR.LocalEducationAgencyCategoryCode                                                       AS 'DistrictOfResidenceType', 
						 DOR.IsOutOfState																	        AS 'DORIsOutOfState',
						 DOR.IsCTE																		            AS 'DORIsJTED', 
						 DOR.IsAccommodationDistrict														        AS 'DORIsAccommodationDistrict',
						 DOR.IsSecureCare																	        AS 'DORIsSecureCare',
						 DOR.IsExceptional																            AS 'DORIsSPED',
						 DOR.IsHeadStart																	        AS 'DORIsHeadStart',
						 DOR.SectorTypeCode																		    AS 'DORSectorType',			   
						 GLT.GradeLevelTypeId																	    AS 'GradeMembership',
						 LEFT(SPA.ProgramName, CHARINDEX(' ', SPA.ProgramName) - 1)                                 AS 'ProgramCode',
					     SPA.SchoolId					                                                            AS 'ProgramSchoolID',
						 SPA.ProgramBeginDate                                                                       AS 'ProgramBeginDate',
						 CAST(1 AS BIT)																				AS 'IsValidSPEDMembership',
						 DOA.IsElementaryNotInHighSchool                                                            AS 'DOAElementaryNotInHighSchool',
						 DOR.IsElementaryNotInHighSchool                                                            AS 'DORElementaryNotInHighSchool',
						 DOA.IsHighSchoolDistrict                                                                   AS 'DOAIsHighSchoolDistrict',
						 DOR.IsHighSchoolDistrict                                                                   AS 'DORIsHighSchoolDistrict',
						 ESCH.IsResidentialCenter																	AS 'ResidentialCenter',  
						 --ESCH.IsPrivateDaySchool,
						 ESCH.IsSecureCare																			AS 'SchoolIsSecureCare',
						 SSA.CalendarCode																			AS 'CalendarCode'
					FROM leadata.StudentSchoolAssociation SSA 
					     
						 INNER JOIN [integrity].[vw_GetIntegrityHistoryPerExecution] SPEDDM
						    ON SSA.StudentUSI = SPEDDM.StudentUSI
							   AND SSA.SchoolId = SPEDDM.SchoolId
							   AND SSA.FiscalYear = SPEDDM.FiscalYear
							   AND SPEDDM.IntegrityRuleTypeId IN (6,8)		-- Brings only data for STATE SPED and FED SPED
					  	 
						 INNER JOIN entity.vw_School ESCH 
					  	    ON SSA.SchoolId = ESCH.SchoolId
							   AND SSA.Fiscalyear = ESCH.FiscalYear
					    
						 INNER JOIN leadata.StudentSchoolAssociationLocalEducationAgency SEOA
					  	    ON SEOA.SchoolId = SSA.SchoolId 
					  		   AND SEOA.StudentUSI = SSA.StudentUSI 
							   AND SEOA.Fiscalyear = SSA.FiscalYear 
							   AND SEOA.EntryDate = SSA.EntryDate			 -- 1:1 relationship for SchoolSchoolAssociationLocalEducationAgency with StudentSchoolAssociation for AzEDS 3.0
					 
					     INNER JOIN entity.vw_LocalEducationAgency DOR 
					  	    ON DOR.LocalEducationAgencyId = SEOA.EducationOrganizationId 
							   AND DOR.Fiscalyear = SEOA.FiscalYear
					 
					     INNER JOIN leadata.StudentEnrollmentProgramAssociation SPA
						    ON SPA.StudentUSI = SSA.StudentUSI
							   AND SPA.SchoolId = SSA.SchoolId
							   AND SPA.Fiscalyear = SSA.FiscalYear
							   AND SPA.EnrollmentEntryDate = SSA.EntryDate
							   AND SPA.ProgramTypeId = 6
					
						 INNER JOIN leadata.Descriptor MTD
						    ON SSA.MembershipTypeDescriptorId = MTD.DescriptorId
							   AND MTD.Fiscalyear = SSA.FiscalYear
					
						 INNER JOIN leadata.Descriptor GLD 
					  		ON GLD.DescriptorId = SSA.EntryGradeLevelDescriptorId 
							   AND GLD.Fiscalyear = SSA.FiscalYear
					
					     INNER JOIN entity.GradeLevelType GLT 
					  	    ON GLT.GradelevelDescriptorID = GLD.DescriptorId
					
					     INNER JOIN entity.vw_LocalEducationAgency DOA						-- switched to view
					  	    ON DOA.LocalEducationAgencyId = ESCH.LocalEducationAgencyId 
							   AND DOA.Fiscalyear = ESCH.FiscalYear
					
					     LEFT JOIN leadata.Descriptor ETDE   -- join SSA entrytypedescriptorID to leadata.descriptor table 
					  	    ON ETDE.DescriptorId = SSA.EntryTypeDescriptorId 
					
					     LEFT JOIN leadata.Descriptor EWTD  --ExitwithdrawaTypeDescriptorId can be NULL so Left Join
					  		ON EWTD.DescriptorId = SSA.ExitWithdrawTypeDescriptorId 
							   AND EWTD.Fiscalyear = SSA.FiscalYear

					  WHERE  SPEDDM.Executionid = @ExecutionId 
							 AND SPEDDM.messageid = @MessageId	
					  ORDER BY SSA.StudentUSI, 
							   SSA.SchoolId, 
							   EntryDate
				END
END

GO


