
/********************************************************************************************************
**Procedure Name:
**      integrity.GetMembershipRuleEnrollmentCurrent
**
**Author:
**      Amit Verma
**
**Description:  
**     Get Current Membership Data for membership rule integrity processing  
**               
**Input:
**
**Output:
**     Current Membership Data for integrity processing
**
**Returns:
**
**Revision History:
**     Who           When          What
**     Amit Verma    12/23/2014    Initial Creation
**	   PSharma		 05-17-16	   Added ConcurrentMembershipType
**	   PSharma		 05-20-16	   Modified a join condititon on ConcurrentMembership view
**	   PSharma		 10-07-16	   Added a flag for GraduateFromPast for rule 10200
**	   PSharma		 10-13-16	   Adde DOAIsValidForDOR, IsActive and replaced LocalEducationAgency with vw_LocalEducationAgency for rule 10049
**	   PSharma		 10-28-16	   Commented vw_GraduateFromPast for production rollout untill I resolve the performance
**	   PSharma		 11-02-16      Modified the sproc to use the temp table instead of View because using View was causing long wait time
**	   P Kanyar      04/10/2017	   Replaced CalendarDateCalendarEvent with CalendarDateTrackEvent & made Track table changes,  
**								   Fixed DOACTDS, Removed extra joins with SectorType, SchoolType, EducationOrganization &
**								   LocalEducationAgencyCategoryType tables by using views
**
**	   Rchinta		 5/12/2017	   only FY18 change
**	   P Kanyar     06/22/2017	   Removed CalendarDateTrackEvent, Track joins & 5 unused track related fields
**	   Sucharita     01/11/2018    Commented logic related to #tmpGraduateFromPast and 'GraduateFromPast' as 'GraduateFromPast'  field is not getting used in the rule	
**     Sucharita     01/11/2018    Added flag IsCertifiedTrack,IsADEApprovedTrack,IsValidTrack for new rule 10124. Task# 203528	
**     Vinoth K	     02/13/2019    Added CalendarCode condition as part of Track Status from 2020 onwards, for perviours years Not Applicable will be default
**     Sucharita     05/08/2019   Fetching schoolId for which the student has any program irrespective of the program is within the enrollment or not.(as per the requirement of rule 10129)
**                                Cleaned commented codes related to temp table for GraduationfromPast as we are not using this field anymore.
***********************************************************************************************************************************************************************************************/
Create PROCEDURE [integrity].[GetMembershipRuleEnrollmentCurrent]
       @ExecutionId as int,
	   @MessageId as [nvarchar](36)
AS
BEGIN
 
      SET NOCOUNT ON;        
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.  
	    
	

	  ----------------------------------------------------------------------------------------------------------------------------------------------
  
              --- Get Student Current Membership Data
              SELECT DISTINCT 
							  ssa.StudentUSI, 
                              ssa.SchoolId																AS 'SchoolID',
                              (CASE WHEN sch.IsVirtual = 1 THEN 1 ELSE 0 END)                           AS 'IsVirtual',                                                                                                                                             
                              CAST(CASE WHEN sch.SchoolTypeId = 5                                                                    
                                          THEN 1 ELSE 0 END AS BIT)                                     AS 'IsCharter',                                                                                                    
                              mtdd.CodeValue                                                            AS 'MembershipType',
                              sch.SchoolTypeCode                                                        AS 'SchoolType',                                                                       
                              lea.LocalEducationAgencyId                                                AS 'DOA_LocalEducationAgencyID', 
                              lea.LocalEducationAgencyCategoryCode                                      AS 'DistrictOfAttendanceType', 
                              lea.LocalEducationAgencyCTDS                                              AS 'DOACTDS',					
                              glt.GradeLevelTypeId                                                      AS 'GradeMembership', 
                              ssa.FiscalYear                                                            AS 'FiscalYear', 
                              endes.CodeValue                                                           AS 'EntryTypeDescriptor', 
                              ewdes.CodeValue                                                           AS 'ExitWithdrawTypeDescriptor', 
                              'Funding'                                                                 AS 'ResponsibilityDescriptor', 
                              CAST(ssa.EntryDate AS DATETIME)                                           AS 'Entrydate', 
                              CAST(ssa.ExitWithdrawDate AS DATETIME)                                    AS 'ExitDate', 
							  ssa.TrackNumber															AS 'TrackNumber', 
							  ssa.TrackEducationOrganizationId                                          AS 'TrackEducationOrganizationId', 
                              ssafe.FirstEnrollment														AS 'FirstEnrollment',
							  ssaisetms.IsStudentEnrolledInTwoMainSchools								AS 'IsEnrollInTwoMainSchool',
                              (CASE WHEN lea.IsOutOfState = 1 THEN 1 ELSE 0 END)                        AS 'DOAIsOutOfState',
                              (CASE WHEN lea.IsCTE = 1 THEN 1 ELSE 0 END)                               AS 'DOAIsJTED',
                              (CASE WHEN lea.IsAccommodationDistrict = 1 THEN 1 ELSE 0 END)             AS 'DOAIsAccommodationDistrict',
                              (CASE WHEN lea.IsSecureCare = 1 THEN 1 ELSE 0 END)                        AS 'DOAIsSecureCare',
                              (CASE WHEN lea.IsExceptional = 1 THEN 1 ELSE 0 END)                       AS 'DOAIsExceptional',
                              (CASE WHEN lea.IsHeadStart = 1 THEN 1 ELSE 0 END)                         AS 'DOAIsHeadStart',
							  (CASE WHEN lea.IsValidForDOR = 1 THEN 1 ELSE 0 END)                       AS 'DOAIsValidForDOR',
							  (CASE WHEN lea.OperationalStatusTypeId = 1 THEN 1 ELSE 0 END)				AS 'DOAIsActive',
                              lea.SectorTypeCode                                                        AS 'DOASectorType',
							  cmtdd.CodeValue															AS 'ConcurrentMembershipType',							 
							  (CASE WHEN ts.IsCertified =1 THEN 1 ELSE 0 END)                           AS  'IsCertifiedTrack',
							  (CASE WHEN ts.IsADEApproved =1 THEN 1 ELSE 0 END)                         AS  'IsADEApprovedTrack',
							  (CASE WHEN ts.IsValid =1 THEN 1 ELSE 0 END)                               AS  'IsValidTrack',      
							  ssa.CalendarCode															AS 'CalendarCode',
							  SPA.EducationOrganizationId                                               AS  'SchoolhavingProgram'
              FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih 				
			     
                    INNER JOIN leadata.StudentSchoolAssociation ssa 
						ON ssa.FiscalYear = ih.FiscalYear
                           AND ssa.StudentUSI = ih.StudentUSI 
                           AND ssa.SchoolId = ih.SchoolId 
                           AND ssa.EntryDate = ih.SchoolEntryDate 
						   AND ih.IntegrityRuleTypeId = 1				-- for Membership data only 

                    INNER JOIN [entity].[vw_School] sch 
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
						ON ssafe.Studentusi =  ih.Studentusi 
							AND ssafe.SchoolId =  ih.Schoolid 
							AND ssafe.FiscalYear =  ih.FiscalYear
					
					LEFT JOIN [integrity].[StudentSchoolAssociation_IsStudentEnrolledInTwoMainSchools]  ssaisetms 
						ON ssaisetms.Studentusi =  ih.Studentusi 						
							AND ssaisetms.FiscalYear =  ih.FiscalYear 
					
					LEFT JOIN Integrity.ConcurrentMembershipsForAStudent cms 
						ON cms.FiscalYearForConcurrentEnrollment = ssa.fiscalyear 
							AND cms.studentusi = ssa.studentusi 
							AND cms.concurrentschoolid <> ssa.schoolid 
							--cms.ConcurrentEntryDate BETWEEN ssa.EntryDate AND COALESCE(ssa.ExitWithdrawDate, '6-30-' + CONVERT(varchar(4), ssa.FiscalYear))
							AND cms.ConcurrentEntryDate < COALESCE(ssa.ExitWithdrawDate, '6-30-' + CONVERT(varchar(4), ssa.FiscalYear))
					
					LEFT JOIN leadata.Descriptor cmtdd
                           ON cms.ConcurrentMembershipType = cmtdd.DescriptorId
							AND cms.FiscalYearForConcurrentEnrollment = cmtdd.FiscalYear 
					
					
					LEFT JOIN entity.TrackStatus ts
					       ON ssa.FiscalYear =ts.FiscalYear
						   AND ssa.SchoolId =ts.EducationOrganizationId
						   AND ssa.TrackEducationOrganizationId = ts.TrackLocalEducationAgencyId
						   AND ssa.TrackNumber =ts.TrackNumber
						   AND ssa.CalendarCode =ts.CalendarCode

                    LEFT JOIN azeds.leadata.StudentProgramAssociation spa  ---Checking if the student has any program in the school, irrespective of the program is within the enrollment or not.
                            ON ssa.FiscalYear =spa.FiscalYear
                            AND ssa.StudentUSI =spa.StudentUSI
                            AND ssa.SchoolId = spa.EducationOrganizationId					
							
				WHERE ih.Executionid = @ExecutionId 
					AND ih.messageid = @MessageId										 
                ORDER BY 
					ssa.StudentUSI, 
					ssa.SchoolId, 
					EntryDate
			
			
END
