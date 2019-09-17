/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetACCTRuleEnrollmentNext]
**
**Author:
**      Rohith CHintamaneni
**
**Description:  
**	Get nextMembershipData for integrity Accountability rule processing  
**               
**Input:
**
**Output:
**	NextMembershipData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get NextMembershipData for integrity processing  
**
**Revision History:
**	Who			When		What
**	Rohith		12/29/2014	Initial Creation
**  Sucharita	12/02/2016  Added IntgrityRuleTypeId 15 to bring data for Accountability NonPayment (Task# 168956)
**  Sucharita	02/07/2017  Changed the order of selection from Descending to Ascending (Task#176759)
**  P Kanyar	04/11/2017  Replaced CalendarDateCalendarEvent with CalendarDateTrackEvent & made Track table changes
**							Fixed DOACTDS, Removed extra joins with SectorType, SchoolType, EducationOrganization 
**							& LocalEducationAgencyCategoryType tables by using views for School & LocalEducationAgency
**	Rchinta		5/12/2017	only FY18 change
**	P Kanyar	06/22/2017	Removed CalendarDateTrackEvent,Track table joins & 5 unused track related fields 
**	P Kanyar	06/27/2017	Added SchoolSectorTypeCode for -20005 enhancement
**	P Kanyar	07/11/2017	Removed SchoolSectorTypeCode, added IsExceptional,IsResidentialCenter,IsPrivateDaySchool  for -20005 enhancement
**  Sucharita               02/11/2019  Removed extra left joins with views [integrity].[StudentSchoolAssociation_FirstEnrollment] 
**                                      and [integrity].[StudentSchoolAssociation_IsStudentEnrolledInTwoMainSchools] as we don't need these fields.
**                                      Also commented hard coded value 'Funding' as ResponsibilityDescriptor as this is not the correct way to get ResponsibilityDescriptor.
**                                      Commented DOACTDS,Fetching CalendarCode from FY2020 onwards,for previous years default value will be 'Not Applicable'.
***********************************************************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetACCTRuleEnrollmentNext]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 

    SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.

	       --- Get Student Next Membership Data
			SELECT DISTINCT 
				   ssa.StudentUSI, 
			       ssa.SchoolId														AS 'SchoolID', 
				   (CASE WHEN sch.IsVirtual = 1 THEN 1 ELSE 0 END)					AS 'IsVirtual',														  				                       
				   mtdd.CodeValue													AS 'MembershipType',
				   sch.SchoolTypeCode												AS 'SchoolType', 
				   (CASE WHEN sch.IsExceptional = 1 THEN 1 ELSE 0 END)				AS 'SchoolIsExceptional',
				   (CASE WHEN sch.IsPrivateDaySchool = 1 THEN 1 ELSE 0 END) 		AS 'SchoolIsPrivateDaySchool',
				   (CASE WHEN sch.IsResidentialCenter = 1 THEN 1 ELSE 0 END)		AS 'SchoolIsResidentialCenter',	
				   doa.LocalEducationAgencyId										AS 'DOA_LocalEducationAgencyID', 
				   doa.LocalEducationAgencyCategoryCode								AS 'DistrictOfAttendanceType', 
				  -- doa.LocalEducationAgencyCTDS										AS 'DOACTDS', 
				   glt.GradeLevelTypeId												AS 'GradeMembership', 
				   ssa.FiscalYear						  							AS 'FiscalYear', 
				   endes.CodeValue													AS 'EntryTypeDescriptor', 
				   ewdes.CodeValue													AS 'ExitWithdrawTypeDescriptor',  
				  -- 'Funding'														AS 'ResponsibilityDescriptor', 
				   CAST(ssa.EntryDate AS DATETIME)									AS 'Entrydate', 
				   CAST(ssa.ExitWithdrawDate AS DATETIME)							AS 'ExitDate', 
				   ssa.TrackNumber													AS 'TrackNumber', 
				   ssa.TrackEducationOrganizationId                                 AS 'TrackEducationOrganizationId',                                               
				   (CASE WHEN doa.IsOutOfState = 1 THEN 1 ELSE 0 END)				AS 'DOAIsOutOfState',
				   (CASE WHEN doa.IsCTE = 1 THEN 1 ELSE 0 END)						AS 'DOAIsJTED',
				   (CASE WHEN doa.IsAccommodationDistrict = 1 THEN 1 ELSE 0 END)	AS 'DOAIsAccommodationDistrict',
				   (CASE WHEN doa.IsSecureCare = 1 THEN 1 ELSE 0 END)				AS 'DOAIsSecureCare',
				   (CASE WHEN doa.IsExceptional = 1 THEN 1 ELSE 0 END)				AS 'DOAIsExceptional',
				   (CASE WHEN doa.IsHeadStart = 1 THEN 1 ELSE 0 END)				AS 'DOAIsHeadStart',
				   doa.SectorTypeCode												AS 'DOASectorType',
				   ssa.CalendarCode                                                 AS  'CalendarCode'

		    FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ssadup    
				
			 INNER JOIN leadata.StudentSchoolAssociation ssa
				ON ssa.FiscalYear = ssadup.FiscalYear
					 AND ssa.StudentUSI = ssadup.StudentUSI
				     AND ssa.SchoolId = ssadup.SchoolId 
					 AND ssa.EntryDate = integrity.GetNextEnrollmentEntryDate(ssadup.FiscalYear, ssadup.StudentUSI, ssadup.SchoolId, ssadup.SchoolEntryDate)
					 AND ssadup.IntegrityRuleTypeId in (3,15) -- only for Accountability and Accountability-Non-Payment
				
			 INNER JOIN entity.vw_School sch 
		  		ON ssa.SchoolId = sch.SchoolId 
					AND ssa.FiscalYear = sch.FiscalYear
				
			 LEFT JOIN leadata.Descriptor mtdd
			    ON ssa.MembershipTypeDescriptorId = mtdd.DescriptorId
					AND ssa.FiscalYear = mtdd.FiscalYear
				
			 LEFT JOIN entity.vw_LocalEducationAgency doa
				ON sch.LocalEducationAgencyId = doa.LocalEducationAgencyId
					AND sch.FiscalYear = doa.FiscalYear
		     
			 LEFT JOIN entity.GradeLevelType glt 
		  		ON glt.GradeLevelDescriptorId = ssa.EntryGradeLevelDescriptorId 
			 
			 LEFT JOIN leadata.Descriptor endes
			    ON endes.DescriptorId = ssa.EntryTypeDescriptorId
					AND endes.FiscalYear = ssa.FiscalYear
			 
			 LEFT JOIN leadata.Descriptor ewdes
			    ON ewdes.DescriptorId = ssa.ExitWithdrawTypeDescriptorId
					AND ewdes.FiscalYear = ssa.FiscalYear			 	

			WHERE ssadup.Executionid = @executionid 
				AND ssadup.messageid = @messageid		 
		    ORDER BY 
				ssa.StudentUSI, 
				ssa.SchoolId, 
				EntryDate 
END
