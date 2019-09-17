
/********************************************************************************************************
**Procedure Name:
**      [integrity].[GetACCTRuleEnrollmentCurrent]
**
**Author:
**      Rohith Chintamaneni
**
**Description:  
**	Get Current Membership Data for Accountability rule integrity processing  
**               
**Input:
**
**Output:
**	Current Membership Data for integrity processing
**
**Returns:
**
**Revision History:
**	Who						When		What
**	Rohith Chintamaneni		07/30/2015	Initial Creation
**  Sucharita               12/02/2016  Added IntgrityRuleTypeId 15 to bring data for Accountability NonPayment (Task# 168956)
**  Sucharita               01/25/2017  Added field 'FirstInstructionalDayofDOACalendar' (Task# 166284)
**  P Kanyar				04/07/2017  Replaced CalendarDateCalendarEvent with CalendarDateTrackEvent & made Track table changes
**										Fixed DOACTDS, Removed extra joins with SectorType, SchoolType, EducationOrganization 
**										& LocalEducationAgencyCategoryType tables by using views for School & LocalEducationAgency
**	Rchinta					5/12/2017	only FY18 change
**	P Kanyar				06/22/2017	Removed CalendarDateTrackEvent,Track table joins & 5 unused track related fields 
**										removed FirstInstructionalDayofDOACalendar logic, as it can be taken from Calendar collection
**	P Kanyar				06/27/2017	Added SchoolSectorType for -20005 enhancement
**	P Kanyar				07/11/2017	Removed SchoolSectorTypeCode, added IsExceptional,IsResidentialCenter,IsPrivateDaySchool  for -20005 enhancement
**  Sucharita               08/04/2017	Added field PriorYearExitWithdrawalCode Task# 141236
**	Sucharita               08/15/2017  Changed the field name from PriorYearExitWithdrawalCode to PriorYearExitWithdrawCode to match C# changes
**	Amit Verma              08/24/2017  Replace the View integrity.vw_PriorYearLatestEnrollment logic with Temp table
**  Sucharita               09/15/2017  Added field PriorYearSchoolId
**  Sucharita               09/26/2017  Removed field PriorYearExitWithdrawCode and PriorYearSchoolId as we are getting these fields in GetACCTRulePriorYearEnrollmentData
**  Sucharita               02/11/2019  Removed extra left joins with views [integrity].[StudentSchoolAssociation_FirstEnrollment] 
**                                      and [integrity].[StudentSchoolAssociation_IsStudentEnrolledInTwoMainSchools] as we don't need these fields.
**                                      Also commented hard coded value 'Funding' as ResponsibilityDescriptor as this is not the correct way to get ResponsibilityDescriptor.
**                                      Commented DOACTDS,fetching CalendarCode from FY2020 onwards,for previous years default value will be 'Not Applicable'
*****************************************************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetACCTRuleEnrollmentCurrent]
	@ExecutionId as int,
	@MessageId as [nvarchar](36)
AS
BEGIN 

    SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.
         
		
	        -- Get Student Current Membership Data
			SELECT DISTINCT 
				   ssa.StudentUSI, 
			       ssa.SchoolId																AS 'SchoolID',
				   (CASE WHEN sch.IsVirtual = 1 THEN 1 ELSE 0 END)							AS 'IsVirtual',														  				                       
				   mtdd.CodeValue														    AS 'MembershipType',
				   sch.SchoolTypeCode														AS 'SchoolType', 
				   (CASE WHEN sch.IsExceptional = 1 THEN 1 ELSE 0 END)						AS 'SchoolIsExceptional',
				   (CASE WHEN sch.IsPrivateDaySchool = 1 THEN 1 ELSE 0 END) 				AS 'SchoolIsPrivateDaySchool',
				   (CASE WHEN sch.IsResidentialCenter = 1 THEN 1 ELSE 0 END)				AS 'SchoolIsResidentialCenter',		   										  
				   lea.LocalEducationAgencyId											    AS 'DOA_LocalEducationAgencyID', 
				   lea.LocalEducationAgencyCategoryCode										AS 'DistrictOfAttendanceType', 
				  -- lea.LocalEducationAgencyCTDS												AS 'DOACTDS', 
				   glt.GradeLevelTypeId													    AS 'GradeMembership', 
				   ssa.FiscalYear															AS 'FiscalYear', 
				   endes.CodeValue														    AS 'EntryTypeDescriptor', 
				   ewdes.CodeValue														    AS 'ExitWithdrawTypeDescriptor', 
				  -- 'Funding'                                                                AS 'ResponsibilityDescriptor',  
				   CAST(ssa.EntryDate AS DATETIME)										    AS 'Entrydate', 
				   CAST(ssa.ExitWithdrawDate AS DATETIME)								    AS 'ExitDate', 
				   ssa.TrackNumber                                                          AS 'TrackNumber', 
				   ssa.TrackEducationOrganizationId                                         AS 'TrackEducationOrganizationId', 				                                   
				   (CASE WHEN lea.IsOutOfState = 1 THEN 1 ELSE 0 END) 						AS 'DOAIsOutOfState',
				   (CASE WHEN lea.IsCTE = 1 THEN 1 ELSE 0 END)								AS 'DOAIsJTED',
				   (CASE WHEN lea.IsAccommodationDistrict = 1 THEN 1 ELSE 0 END)			AS 'DOAIsAccommodationDistrict',
				   (CASE WHEN lea.IsSecureCare = 1 THEN 1 ELSE 0 END)						AS 'DOAIsSecureCare',
				   (CASE WHEN lea.IsExceptional = 1 THEN 1 ELSE 0 END)						AS 'DOAIsExceptional',
				   (CASE WHEN lea.IsHeadStart = 1 THEN 1 ELSE 0 END)						AS 'DOAIsHeadStart',
				   lea.SectorTypeCode														AS 'DOASectorType',
				   ssa.CalendarCode                                                         AS  'CalendarCode'				                                                           

			FROM [integrity].[vw_GetIntegrityHistoryPerExecution] ih
				
				 INNER JOIN leadata.StudentSchoolAssociation ssa 
					ON ssa.FiscalYear = ih.FiscalYear
						AND ssa.StudentUSI = ih.StudentUSI 
						AND ssa.SchoolId = ih.SchoolId 
						AND ssa.EntryDate = ih.SchoolEntryDate 
						AND ih.IntegrityRuleTypeId in (3,15)				-- Bring data for  Accountability and Accountability-Non-Payment

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

			  WHERE ih.Executionid = @executionid 
				AND ih.messageid = @messageid				 
			  ORDER BY 
				ssa.StudentUSI, 
				ssa.SchoolId, 
				EntryDate
	      
	END
