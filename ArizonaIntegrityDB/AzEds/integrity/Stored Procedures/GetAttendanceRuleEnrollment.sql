/********************************************************************************************************
**Procedure Name:
**      process.GetIntegrityAttendanceMembershipData
**
**Author:
**      Amit Verma
**
**Description:  
**	Get MembershipData for Attendance rules   
**               
**Input:
**
**Output:
**	Attendance MembershipData for integrity processing
**
**Returns:
**
**Implementation:
**	Used to get MembershipData for Attendance rules   
**
**Revision History:
**	Who			When		What
**	Amit Verma	04/01/2015	Initial Creation
**	Rohith		10/22/2015 commentiing join condition on school entry date as for attendance the Schoolentry date will be null in IntegrityNeed table
**  PS			04/19/2016  142586	Added ExitWithdrawCode in the select list
**  PS			04/29/2016  144378  Fixed the join
**  PS			09/29/2016  160805  Added IsAlternative
**	PKanyar		04/18/2017  Fixed DOA CTDS not to show SchoolCTDS (bug # 182828)
**  Sucharita   02/13/2019  Commented join with EducationOrganization table as we don't need DOACTDS field,commented extra join on school table.
****************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetAttendanceRuleEnrollment]
	@ExecutionId INT,
	@MessageId as [nvarchar](36)
AS
BEGIN 
      SET NOCOUNT ON;
	  SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  -- this is simiar to Nolock. Instead of doing for each table I set this at SP level.


	  SELECT ssa.StudentUSI
		,ssa.SchoolId
		,ssa.FiscalYear
		,ssa.TrackNumber
		,ssa.HasAttendance
		,ssa.EntryDate
		,ssa.ExitWithdrawDate
		,ssa.MembershipTypeDescriptorId
		,ssa.EntryGradeLevelDescriptorId
		,ssa.ExitWithdrawTypeDescriptorId
	  INTO #StudentEnrollments
	  FROM  [integrity].[vw_GetIntegrityHistoryPerExecution] ADM
		           INNER JOIN integrity.[EnrollmentHasAttendance_View] ssa 
			            ON ssa.StudentUSI = ADM.StudentUSI
			       		   AND ssa.SchoolId = ADM.SchoolId
			       		--   AND ssa.EntryDate = ADM.SchoolEntryDate
						   AND ssa.FiscalYear = ADm.FiscalYear 
		Where ADM.Executionid = @executionid and ADM.messageid = @messageid	
		And  ADM.IntegrityRuleTypeId = 2  -- for Attendance data only

		--- Get Student Attendance Membership Data
	  SELECT DISTINCT ssa.StudentUSI, 																	   
			       ssa.SchoolId                                                                                     AS 'SchoolID',
				   esch.IsVirtual,
				   esch.IsAlternative,														                           
				   mtd.CodeValue                                                                                    AS 'MembershipType',
				   sst.CodeValue                                                                                    AS 'SchoolType', 
				   doa.LocalEducationAgencyId                                                                       AS 'DOA_LocalEducationAgencyID', 
				   doaType.CodeValue                                                                                AS 'DistrictOfAttendanceType', 
				   --Integrity.GetLatestEducationOrganizationIdentificationCode(ssa.SchoolId)                          AS 'DOACTDS', 
				  -- LTRIM(RTRIM(dors.CTDS))																		    AS 'DOACTDS',
				   glt.GradeLevelTypeId                                                                             AS 'GradeMembership',
				   CAST(ssa.EntryDate AS DATETIME)                                                                  AS 'Entrydate', 
				   CAST(ssa.ExitWithdrawDate AS DATETIME)                                                           AS 'ExitDate',
				   ssamfte.FTEStartDate, 
				   CASE 
                      WHEN ssamfte.FTEEndDate IS NULL 
                           AND ssa.ExitWithdrawDate IS NOT NULL THEN ssa.ExitWithdrawDate 
                      ELSE ssamfte.FTEEndDate 
                   END                                                                                              AS 'FTEEndDate',  
				   mfted.CodeValue                                                                                  AS 'FTEMembership',
				   ssa.TrackNumber,
				   --Integrity.EnrollmentHasAttendance(ssa.StudentUSI,ssa.SchoolId,ssa.EntryDate,ssa.ExitWithdrawDate) AS 'EnrollmentHasAttendance'
				   ssa.HasAttendance AS EnrollmentHasAttendance,
				   wd.codevalue																						AS 'ExitWithdrawalCode'
		    FROM   #StudentEnrollments ssa 
		  	       INNER JOIN entity.School esch 
		  	       	    ON ssa.SchoolId = esch.SchoolId and esch.Fiscalyear = ssa.FiscalYear
				--INNER JOIN entity.EducationOrganization dors 
				--	ON dors.EducationOrganizationId = esch.LocalEducationAgencyId
				--	and dors.FiscalYear = esch.FiscalYear
               --    INNER JOIN entity.School sch
			            --ON esch.SchoolId = sch.SchoolId and sch.Fiscalyear = ssa.FiscalYear
			       INNER JOIN leadata.StudentSchoolAssociationMembershipFTE ssamfte 
		  	            ON ssamfte.StudentUSI = ssa.StudentUSI 
		  	          	   AND ssamfte.SchoolId = ssa.SchoolId 
		  	          	   AND ssamfte.EntryDate = ssa.EntryDate 
						   AND ssamfte.Fiscalyear = ssa.FiscalYear
		           LEFT JOIN leadata.Descriptor mfted 
		  	            ON mfted.DescriptorId = ssamfte.MembershipFTEDescriptorId 
							AND mfted.Fiscalyear = ssamfte.FiscalYear						  
		           --LEFT JOIN leadata.Descriptor mdes 
		  	        --    ON mdes.DescriptorId = mfted.MembershipFTEDescriptorId   -- commenting few joins as per AZEDS design
			       --LEFT JOIN leadata.CharterStatusType cst
			       --     ON sch.CharterStatusTypeId = cst.CharterStatusTypeId
			       LEFT JOIN leadata.Descriptor mtd
			            ON ssa.MembershipTypeDescriptorId = mtd.DescriptorId
						AND mtd.Fiscalyear = ssa.FiscalYear	
			       --LEFT JOIN leadata.Descriptor mtdd
			       --     ON mtd.DescriptorId = mtdd.DescriptorId
		           LEFT JOIN leadata.Descriptor gld 
		  	       	    ON gld.DescriptorId = ssa.EntryGradeLevelDescriptorId 
						AND gld.Fiscalyear = ssa.FiscalYear	
		           LEFT JOIN entity.GradeLevelType glt 
		  	       	    ON glt.GradeLevelDescriptorId = gld.DescriptorId 
		           LEFT JOIN entity.LocalEducationAgency doa 
		  	       	    ON doa.LocalEducationAgencyId = esch.LocalEducationAgencyId 
						AND doa.Fiscalyear = esch.FiscalYear	
		           LEFT JOIN entity.LocalEducationAgencyCategoryType doaType 
		  	       	    ON doaType.LocalEducationAgencyCategoryTypeId = doa.LocalEducationAgencyCategoryTypeId 
		           LEFT JOIN entity.SchoolType sst 
		  	       	    ON sst.SchoolTypeId = esch.SchoolTypeId
				   LEFT JOIN leadata.Descriptor wd
						ON ssa.ExitWithdrawTypeDescriptorId = wd.descriptorid
		    ORDER BY ssa.StudentUSI, ssa.SchoolId, EntryDate, ssamfte.FTEStartDate, ssa.TrackNumber
END
