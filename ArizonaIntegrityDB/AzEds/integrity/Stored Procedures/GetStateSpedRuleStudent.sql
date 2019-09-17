
/********************************************************************************************************
**Procedure Name:
**      process.GetIntegritySPEDStudentData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Student SPED Program Participation Data for integrity processing  
**               
**Input:
**
**Output:
**	Student SPED Program Participation Data for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get Student SPED Program Participation Data for integrity processing  
**
**Revision History:
**	Who					When		What
**	Amit Verma			04/13/2015	Initial Creation
**	Venugopal Metukuru	06/26/2015	Fix to bring Stundents with  ProgramParticipations
**	Rohith				08/10/2015  removing entrydate check in join conditions as SPED AND ELL will be at student and school level
**  PSharma				10/17/2016	Added IntegrityRuleTypeId and TodaysDate and Added FED SPED IntegrityRuleType
**  SMahapatra          10/21/2016  Added HaveMultipleMainSPEDSchool
**  PSharma				11/17/2016  Modified the Join to StudentSchoolAssociation to bring in data for Rule#40003
**  PSharma				01/25/2017  Added SchoolId to the join with vw_MultipleMainSPEDSchool for fixing 40057 (So that error is repprted to only those two schools who have overlapping participation)
**  SMahapatra          04/03/2017  Added AccrossLEAMultipleMainSPEDSchool
**  Vinoth				01/09/2019  Added Main membership condition on Student school association, in order to avoid the following scenario, if a school has an two membership one with main and another
									with DRP and it's entry dates are different. when we join back for SPED  program with SSA we are getting both the membership to avoid this
									we have added main membership condition on SSA. As an Assumption SPED program can be associated with Main membership.
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[GetStateSpedRuleStudent]
@ExecutionId int,
@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

	  --Get Student SPED Program Participation Data
      SELECT DISTINCT S.StudentUSI,
	         S.BirthDate,
			 SPEDDM.SchoolId																					   AS 'SchoolID',
             integrity.IsSPEDProgramConcurrentlyEnrolled(SPA.StudentUSI,1,SSA.FiscalYear)					   AS 'HaveMultiplePrimaryNeeds',
			 SSA.TrackEducationOrganizationId																   AS 'TrackEducationOrganizationId',
			 SPEDDM.IntegrityRuleTypeId,
			 ISNULL((SELECT OverrideDate FROM config.SystemDateOverride),GETDATE())							   AS 'TodaysDate',
			 ISNULL (VWMMSS.HaveMultipleMainSPEDSchool,0)                                                      AS  'HaveMultipleMainSPEDSchool',
			 ISNULL (VWLEAMMSS.AccrossLEAMultipleMainSPEDSchool,0)                                             AS  'AccrossLEAMultipleMainSPEDSchool'                                                                                    
      FROM  [integrity].[vw_GetIntegrityHistoryPerExecution] SPEDDM
	       INNER JOIN leadata.StudentProgramAssociation SPA
                 ON SPEDDM.SchoolId = SPA.EducationOrganizationId
					AND SPEDDM.StudentUSI = SPA.StudentUSI
					AND SPEDDm.FiscalYear = SPA.Fiscalyear
					AND SPA.ProgramTypeId IN (6)
			INNER JOIN leadata.Student S
		         ON SPEDDM.StudentUSI = S.StudentUSI
		    LEFT JOIN leadata.StudentSchoolAssociation SSA
		         ON SSA.StudentUSI = SPEDDM.StudentUSI
				    AND SSA.SchoolId = SPEDDM.SchoolId
					AND ssa.FiscalYear = SPEDDM.FiscalYear
					AND SSA.MembershipTypeDescriptorId <>11743
            LEFT JOIN integrity.vw_MultipleMainSPEDSchool VWMMSS
		         ON VWMMSS.StudentUSI = S.StudentUSI
				 AND VWMMSS.FiscalYear = SSA.FiscalYear
				 AND VWMMSS.SchoolId = SSA.SchoolId
             LEFT JOIN integrity.vw_AccrossLEAMultipleMainSPEDSchool VWLEAMMSS
		         ON VWLEAMMSS.StudentUSI = S.StudentUSI
				 AND VWLEAMMSS.FiscalYear = SSA.FiscalYear
			   WHERE  SPEDDM.Executionid = @ExecutionId and SPEDDM.messageid = @MessageId
				AND SPEDDM.IntegrityRuleTypeId in (6,8)   -- Brings only data for STATE and FED SPED
END
