/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetMembershipRuleEnrollmentPrevious]
**
**Author:
**      Amit Verma
**
**Description:  
**	Get Previous enrollment data for integrity membership rule processing  
**               
**Input:
**
**Output:
**	Previous enrollment Data for integrity processing
**
**Returns:
**
**Revision History:
**	Who			When		What
**	Amit Verma	12/29/2014	Initial Creation
**	P Kanyar    04/10/2017	Replaced CalendarDateCalendarEvent with CalendarDateTrackEvent & made Track table changes,  
**							Fixed DOACTDS, Removed extra joins with SectorType, SchoolType, EducationOrganization &
**							LocalEducationAgencyCategoryType tables by using views
**	Rchinta		05/12/2017	only FY18 change
**	P Kanyar    06/22/2017	Removed CalendarDateTrackEvent, Track joins & 5 unused track related fields
**  Vinoth K	02/13/2019  Added CalendarCode condition as part of Track Status from 2020 onwards, for perviours years Not Applicable will be default.
**
**********************************************************************************************************/
CREATE PROCEDURE [integrity].[GetMembershipRuleEnrollmentPrevious]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)

AS
BEGIN 
      SET NOCOUNT ON;
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.   
	     
	       --- Get Student Previous Membership Data
			SELECT DISTINCT 
				   ssa.StudentUSI, 
			       ssa.SchoolId																					AS 'SchoolID', 
				   (CASE WHEN sch.IsVirtual = 1 THEN 1 ELSE 0 END)												AS 'IsVirtual',														  				                       
				   CAST(CASE WHEN sch.SchoolTypeId = 5                                                                    
                             THEN 1 ELSE 0 END AS BIT)															AS 'IsCharter', 
				   mtdd.CodeValue																				AS 'MembershipType',
				   sch.SchoolTypeCode																			AS 'SchoolType', 
				   lea.LocalEducationAgencyId																	AS 'DOA_LocalEducationAgencyID', 
				   lea.LocalEducationAgencyCategoryCode															AS 'DistrictOfAttendanceType', 
				   lea.LocalEducationAgencyCTDS																	AS 'DOACTDS', 
				   glt.GradeLevelTypeId																			AS 'GradeMembership', 
				   ssa.FiscalYear						  														AS 'FiscalYear', 
				   endes.CodeValue																				AS 'EntryTypeDescriptor', 
				   ewdes.CodeValue																			    AS 'ExitWithdrawTypeDescriptor',  
				   'Funding'																					AS 'ResponsibilityDescriptor', 
				   CAST(ssa.EntryDate AS DATETIME)																AS 'Entrydate', 
				   CAST(ssa.ExitWithdrawDate AS DATETIME)														AS 'ExitDate', 
				   ssa.TrackNumber																				AS 'TrackNumber',
				   ssa.TrackEducationOrganizationId															    AS 'TrackEducationOrganizationId', 
                   ssafe.FirstEnrollment																		AS 'FirstEnrollment',
				   ssaisetms.IsStudentEnrolledInTwoMainSchools													AS 'IsEnrollInTwoMainSchool',                          
				   (CASE WHEN lea.IsOutOfState = 1 THEN 1 ELSE 0 END)											AS 'DOAIsOutOfState',
				   (CASE WHEN lea.IsCTE = 1 THEN 1 ELSE 0 END)													AS 'DOAIsJTED',
				   (CASE WHEN lea.IsAccommodationDistrict = 1 THEN 1 ELSE 0 END)								AS 'DOAIsAccommodationDistrict',
				   (CASE WHEN lea.IsSecureCare = 1 THEN 1 ELSE 0 END)											AS 'DOAIsSecureCare',
				   (CASE WHEN lea.IsExceptional = 1 THEN 1 ELSE 0 END)											AS 'DOAIsExceptional',
				   (CASE WHEN lea.IsHeadStart = 1 THEN 1 ELSE 0 END)											AS 'DOAIsHeadStart',
				   lea.SectorTypeCode																			AS 'DOASectorType',
				   ssa.CalendarCode																				AS 'CalendarCode'
		 FROM 
		  -- Get student enrollment records, along with previous entry date
		   (SELECT LAG(sa.EntryDate) OVER (PARTITION BY sa.fiscalyear, sa.StudentUSI, sa.schoolid ORDER BY sa.EntryDate ASC) AS PrevEntryDate, 
				sa.fiscalyear, 
				sa.StudentUSI, 
				sa.schoolid,
				sa.EntryDate,
				ih.IntegrityRuleTypeId
		    FROM [leadata].[StudentSchoolAssociation] sa
			INNER JOIN [integrity].[vw_GetIntegrityHistoryPerExecution] ih
				ON sa.FiscalYear = ih.FiscalYear
					AND sa.StudentUSI = ih.StudentUSI
					AND sa.SchoolId = ih.SchoolId 
					AND sa.EntryDate <= ih.SchoolEntryDate
				WHERE ih.Executionid = @executionid AND ih.messageid = @messageid) ssadup

			INNER JOIN leadata.StudentSchoolAssociation ssa
				ON ssa.FiscalYear = ssadup.FiscalYear
				AND ssa.StudentUSI = ssadup.StudentUSI
				AND ssa.SchoolId = ssadup.SchoolId 
				AND ssa.EntryDate = ssadup.PrevEntryDate
				AND ssadup.IntegrityRuleTypeId = 1			-- for Membership data only
		     
			 INNER JOIN entity.vw_School sch 
		  		  ON ssa.SchoolId = sch.SchoolId 
				  AND ssa.FiscalYear = sch.FiscalYear
			
			 LEFT JOIN leadata.Descriptor mtdd
			      ON ssa.MembershipTypeDescriptorId = mtdd.DescriptorId
				 AND ssa.FiscalYear = mtdd.FiscalYear
            
			 LEFT JOIN entity.vw_LocalEducationAgency lea
				  ON sch.LocalEducationAgencyId = lea.LocalEducationAgencyId
				 AND sch.FiscalYear = lea.FiscalYear
		     
			 LEFT JOIN entity.GradeLevelType glt 
		  		  ON glt.GradeLevelDescriptorId = ssa.EntryGradeLevelDescriptorId 
			 
			 LEFT JOIN leadata.Descriptor endes
			      ON endes.DescriptorId = ssa.EntryTypeDescriptorId
			     AND endes.FiscalYear = ssa.FiscalYear
			 
			 LEFT JOIN leadata.Descriptor ewdes
			      ON ewdes.DescriptorId = ssa.ExitWithdrawTypeDescriptorId
				  AND ewdes.FiscalYear = ssa.FiscalYear
			
			 LEFT JOIN [integrity].[StudentSchoolAssociation_FirstEnrollment] ssafe 
				ON ssafe.Studentusi =  ssadup.Studentusi 
					AND ssafe.SchoolId =  ssadup.Schoolid 
					AND ssafe.FiscalYear =  ssadup.FiscalYear
			
			 LEFT JOIN [integrity].[StudentSchoolAssociation_IsStudentEnrolledInTwoMainSchools]  ssaisetms 
				ON ssaisetms.Studentusi =  ssadup.Studentusi 						
					AND ssaisetms.FiscalYear =  ssadup.FiscalYear
		   
		   ORDER BY 
				ssa.StudentUSI, 
				ssa.SchoolId, 
				EntryDate DESC
END