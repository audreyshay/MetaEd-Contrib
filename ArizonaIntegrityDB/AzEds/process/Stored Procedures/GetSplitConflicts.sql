/************************************************************
**Procedure Name: process.GetSplitConflicts
**
**Author: Viju Viswanathan
**
**Description:  Get potential confilct records for split
**	
**Revision History:
**	Who			When		What
**	Viju V		02/09/2017	Initial Creation
**	Viju V		03/02/2017	Fixed a bug that returns duplicate records
**	Viju V		03/28/2017	Fixed a bug where conflicts were not showing
**  Viju V		04/06/2017	Bug fix : Target student records not showing
**	Viju V		04/20/2017	Added Target sourceid
**	Viju V		04/27/2017	Added Record ownership
**	Viju V		05/10/2017	AzEDS 3.0 Changes
***************************************************************/
CREATE PROCEDURE process.GetSplitConflicts
		@SplitDetailId		INT
		,@TargetUniqueId	NVARCHAR(32)
AS
BEGIN

    BEGIN TRY

		DECLARE @TargetStudentUSI AS INT = 0
		DECLARE @SourceStudentUSI AS INT = 0

		SELECT @TargetStudentUSI = StudentUSI 
									FROM leadata.Student 
									WHERE StudentUniqueId = @TargetUniqueId
		SELECT @SourceStudentUSI = StudentUSI 
							FROM leadata.Student st
								JOIN process.SplitDetail sd
								ON st.StudentUniqueId = sd.SourceSplitId
							WHERE sd.SplitDetailId = @SplitDetailId

		SELECT seoa.SourceId
		  ,ss.IsSelected
		  ,seoa.FiscalYear
          ,seoa.StudentUSI
          ,seoa.EducationOrganizationId AS Entity
          ,seoa.EntryDate
          ,'StudentEducationOrganizationAssociation' AS Type
          ,'ResponsibilityDescriptorId: ' + COALESCE(CAST(seoa.ResponsibilityDescriptorId AS VARCHAR(10)), '') +  
           ', SchoolId: ' + COALESCE(CAST(seoa.SchoolId AS VARCHAR (10)), '') + 
		   ', StartDate: ' + COALESCE(CAST(seoa.StartDate AS VARCHAR(10)), '') +
           ', EndDate: ' + COALESCE(CAST(seoa.EndDate AS VARCHAR(10)), '') AS Data
		  ,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict	
		  ,ro.SubmittedByEducationOrganizationId
		FROM leadata.StudentSchoolAssociationLocalEducationAgency seoa
		LEFT JOIN leadata.StudentSchoolAssociationLocalEducationAgency confl
			ON seoa.FiscalYear = confl .FiscalYear 
			AND seoa.EducationOrganizationId = confl .EducationOrganizationId 
			AND seoa .ResponsibilityDescriptorId = confl.ResponsibilityDescriptorId 
			AND seoa. SchoolId = confl. SchoolId 
			AND seoa .EntryDate = confl .EntryDate
			AND seoa .StartDate = confl .StartDate
			AND confl .StudentUSI = @SourceStudentUSI
		LEFT JOIN leadata .RecordOwnership ro
			ON seoa .SourceId = ro.ResourceId 
			AND seoa .FiscalYear = ro.FiscalYear 
		LEFT JOIN process.SplitStage ss
			ON confl.SourceId = ss.SourceId
			AND ss.SplitDetailId = @SplitDetailId
		WHERE seoa.StudentUSI  = @TargetStudentUSI
				 
		UNION ALL

		SELECT sn.SourceId
		  ,ss.IsSelected
		  ,sn.FiscalYear
          ,sn.StudentUSI
          ,sn.ReportingEducationOrganizationID AS Entity
          ,sn.StudentNeedEntryDate AS EntryDate
          ,'StudentNeed' AS Type
          ,'StudentNeedDescriptorId: ' + COALESCE(CAST(sn.StudentNeedDescriptorId AS VARCHAR(10)), '') +  
           ', StudentNeedExitDate: ' + COALESCE(CAST(sn.StudentNeedExitDate AS VARCHAR (10)), '') + 
           ', PrimaryStudentNeedIndicator: ' + COALESCE(CAST(sn.PrimaryStudentNeedIndicator AS VARCHAR(10)), '') AS Data
		  ,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict	
		  ,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentNeed sn
		LEFT JOIN leadata.StudentNeed confl
			ON sn.FiscalYear = confl .FiscalYear
			AND sn.ReportingEducationOrganizationID = confl .ReportingEducationOrganizationID 
			AND sn.StudentNeedDescriptorId = confl .StudentNeedDescriptorId 
			AND sn.StudentNeedEntryDate = confl .StudentNeedEntryDate  
			AND confl.StudentUSI = @SourceStudentUSI
		LEFT JOIN leadata .RecordOwnership ro
			ON sn.SourceId = ro.ResourceId 
			AND sn.FiscalYear = ro.FiscalYear  
		LEFT JOIN process.SplitStage ss
			ON confl.SourceId = ss.SourceId
			AND ss.SplitDetailId = @SplitDetailId
		WHERE sn.StudentUSI = @TargetStudentUSI
		  
		UNION ALL

		SELECT spa.SourceId
		  ,ss.IsSelected
		  ,spa.FiscalYear
          ,spa.StudentUSI
          ,spa.EducationOrganizationId AS Entity
          ,spa.BeginDate AS EntryDate
          ,'StudentProgramAssociation' AS Type
          ,'ProgramTypeId: ' + COALESCE(CAST(spa.ProgramTypeId AS VARCHAR(10)), '') +  
           ', ProgramName: ' + COALESCE(CAST(spa.ProgramName AS VARCHAR (50)), '') + 
           ', ProgramEducationOrganizationId: ' + COALESCE(CAST(spa.ProgramEducationOrganizationId AS VARCHAR(10)), '') +
           ', EndDate: ' + COALESCE(CAST(spa.EndDate AS VARCHAR (50)), '') + 
           ', ReasonExitedDescriptorId: ' + COALESCE(CAST(spa.ReasonExitedDescriptorId AS VARCHAR (50)), '') AS Data
		  ,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict
		  ,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentProgramAssociation spa
		LEFT JOIN leadata.StudentProgramAssociation confl
			ON spa.FiscalYear = confl .FiscalYear 
			AND spa.ProgramTypeId = confl .ProgramTypeId 
			AND spa.ProgramName = confl.ProgramName 
			AND spa.ProgramEducationOrganizationId = confl.ProgramEducationOrganizationId 
			AND spa.BeginDate = confl .BeginDate 
			AND spa.EducationOrganizationId = confl.EducationOrganizationId 
			AND confl.StudentUSI = @SourceStudentUSI
		LEFT JOIN leadata .RecordOwnership ro
			ON spa.SourceId = ro.ResourceId 
			AND spa.FiscalYear = ro.FiscalYear 		
		LEFT JOIN process.SplitStage ss
			ON confl.SourceId = ss.SourceId
			AND ss.SplitDetailId = @SplitDetailId 
			AND ss.SourceTable = 'leadata.StudentProgramAssociation'
		WHERE spa.StudentUSI = @TargetStudentUSI

		UNION ALL

		SELECT ssase.SourceId
			  ,ss.IsSelected
			  ,ssase.FiscalYear
			  ,ssase.StudentUSI
			  ,ssase.SchoolId AS Entity
			  ,ssase.EntryDate
			  ,'StudentSchoolAssociationSpecialEnrollment' AS Type
			  ,'SpecialEnrollmentStartDate: ' + COALESCE(CAST(ssase.SpecialEnrollmentStartDate AS VARCHAR(10)), '') +  
			   ', SpecialEnrollmentEndDate: ' + COALESCE(CAST(ssase.SpecialEnrollmentEndDate AS VARCHAR (10)), '') + 
			   ', SpecialEnrollmentDescriptorId: ' + COALESCE(CAST(ssase.SpecialEnrollmentDescriptorId AS VARCHAR(10)), '') AS Data
			  ,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict
			  ,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentSchoolAssociationSpecialEnrollment ssase
		LEFT JOIN leadata.StudentSchoolAssociationSpecialEnrollment confl
			ON ssase .FiscalYear = confl .FiscalYear 
			AND ssase .SchoolId = confl .SchoolId 
			AND ssase .EntryDate = confl.EntryDate 
			AND ssase .SpecialEnrollmentStartDate = confl .SpecialEnrollmentStartDate
			AND confl.StudentUSI = @SourceStudentUSI
		LEFT JOIN leadata .RecordOwnership ro
			ON ssase .SourceId = ro.ResourceId 
			AND ssase .FiscalYear = ro.FiscalYear 
		LEFT JOIN process.SplitStage ss
			ON confl.SourceId = ss.SourceId
			AND ss.SplitDetailId  = @SplitDetailId
		WHERE ssase  .StudentUSI = @TargetStudentUSI 

		UNION ALL

		SELECT ssatp.SourceId
			  ,ss.IsSelected
			  ,ssatp.FiscalYear
			  ,ssatp.StudentUSI
			  ,ssatp.SchoolId AS Entity
			  ,ssatp.EntryDate
			  ,'StudentSchoolAssociationTuitionPayer' AS Type
			  ,'PayerStartDate: ' + COALESCE(CAST(ssatp.PayerStartDate AS VARCHAR(10)), '') +  
			   ', PayerEndDate: ' + COALESCE(CAST(ssatp.PayerEndDate AS VARCHAR (10)), '') + 
			   ', TuitionPayerDescriptorId: ' + COALESCE(CAST(ssatp.TuitionPayerDescriptorId AS VARCHAR(10)), '') AS Data
			  ,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict
			  ,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentSchoolAssociationTuitionPayer ssatp
		LEFT JOIN leadata.StudentSchoolAssociationTuitionPayer confl
			ON ssatp .FiscalYear = confl .FiscalYear 
			AND ssatp .SchoolId = confl .SchoolId 
			AND ssatp .EntryDate = confl .EntryDate 
			AND ssatp .PayerStartDate = confl.PayerStartDate 
			AND confl.StudentUSI = @SourceStudentUSI
		LEFT JOIN leadata .RecordOwnership ro
			ON ssatp .SourceId = ro.ResourceId 
			AND ssatp .FiscalYear = ro.FiscalYear 
		LEFT JOIN process.SplitStage ss
			ON confl.SourceId = ss.SourceId
			AND ss.SplitDetailId  = @SplitDetailId
		WHERE ssatp  .StudentUSI = @TargetStudentUSI 

		UNION ALL

		SELECT spa.SourceId
			  ,ss.IsSelected
			  ,ssepa.FiscalYear
			  ,ssepa.StudentUSI
			  ,ssepa.EducationOrganizationId AS Entity
			  ,ssepa.BeginDate AS EntryDate
			  ,'StudentSpecialEducationProgramAssociation' AS Type
			  ,'ProgramTypeId: ' + COALESCE(CAST(ssepa.ProgramTypeId AS VARCHAR(10)), '') +  
			   ', ProgramName: ' + COALESCE(CAST(ssepa.ProgramName AS VARCHAR (10)), '') + 
			   ', ProgramEducationOrganizationId: ' + COALESCE(CAST(ssepa.ProgramEducationOrganizationId AS VARCHAR (10)), '') + 
			   ', SpecialEducationSettingDescriptorId: ' + COALESCE(CAST(ssepa.SpecialEducationSettingDescriptorId AS VARCHAR (10)), '') + 
			   ', MainSPEDSchool: ' + COALESCE(CAST(ssepa.MainSPEDSchool AS VARCHAR(10)), '') AS Data
			  ,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict
			  ,ro.SubmittedByEducationOrganizationId
		FROM leadata.StudentSpecialEducationProgramAssociation ssepa
		LEFT JOIN leadata.StudentSpecialEducationProgramAssociation confl
			ON ssepa.FiscalYear = confl .FiscalYear 
			AND ssepa .ProgramTypeId = confl .ProgramTypeId 
			AND ssepa.ProgramName = confl .ProgramName 
			AND ssepa.ProgramEducationOrganizationId = confl .ProgramEducationOrganizationId 
			AND ssepa .BeginDate = confl .BeginDate 
			AND ssepa.EducationOrganizationId = confl .EducationOrganizationId 
			AND confl.StudentUSI = @SourceStudentUSI
		JOIN leadata.StudentProgramAssociation spa
			ON spa.FiscalYear = confl.FiscalYear 
			AND spa.StudentUSI = confl.StudentUSI 
			AND spa.ProgramTypeId = confl.ProgramTypeId 
			AND spa.ProgramName = confl.ProgramName 
			AND spa.ProgramEducationOrganizationId = confl.ProgramEducationOrganizationId 
			AND spa.BeginDate = confl.BeginDate 
			and spa.EducationOrganizationId = confl.EducationOrganizationId
		LEFT JOIN leadata .RecordOwnership ro
			ON spa.SourceId = ro.ResourceId 
			AND spa.FiscalYear = ro.FiscalYear 
		LEFT JOIN process.SplitStage ss
			ON spa .SourceId = ss.SourceId
			AND ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentSpecialEducationProgramAssociation'
		WHERE ssepa  .StudentUSI = @TargetStudentUSI 

		UNION ALL

		SELECT ssa.SourceId
			  ,ss.IsSelected
			  ,ssa.FiscalYear
			  ,ssa.StudentUSI
			  ,ssa.SchoolId AS Entity
			  ,ssa.EntryDate
			  ,'StudentSchoolAssociation' AS Type
			  ,'EntryGradeLevelDescriptorId: ' + COALESCE(CAST(ssa.EntryGradeLevelDescriptorId AS VARCHAR(10)), '') +  
			   ', EntryTypeDescriptorId: ' + COALESCE(CAST(ssa.EntryTypeDescriptorId AS VARCHAR (10)), '') + 
			   ', ExitWithdrawDate: ' + COALESCE(CAST(ssa.ExitWithdrawDate AS VARCHAR (10)), '') + 
			   ', ExitWithdrawTypeDescriptorId: ' + COALESCE(CAST(ssa.ExitWithdrawTypeDescriptorId AS VARCHAR (10)), '') + 
			   ', ClassOfSchoolYear: ' + COALESCE(CAST(ssa.ClassOfSchoolYear AS VARCHAR(10)), '') + 
			   ', ExitWithdrawReasonDescriptorId: ' + COALESCE(CAST(ssa.ExitWithdrawReasonDescriptorId AS VARCHAR (10)), '') + 
			   ', MembershipTypeDescriptorId: ' + COALESCE(CAST(ssa.MembershipTypeDescriptorId AS VARCHAR (10)), '') + 
			   ', TrackEducationOrganizationId: ' + COALESCE(CAST(ssa.TrackEducationOrganizationId AS VARCHAR (10)), '') + 
			   ', TrackNumber: ' + COALESCE(CAST(ssa.TrackNumber AS VARCHAR (10)), '') AS Data
			  ,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict
			  ,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentSchoolAssociation ssa
		LEFT JOIN leadata.StudentSchoolAssociation confl
			ON ssa.FiscalYear = confl .FiscalYear 
			AND ssa.SchoolId = confl .SchoolId 
			AND ssa.EntryDate = confl .EntryDate 
			AND confl.StudentUSI = @SourceStudentUSI
		LEFT JOIN leadata .RecordOwnership ro
			ON ssa.SourceId = ro.ResourceId 
			AND ssa.FiscalYear = ro.FiscalYear 
		LEFT JOIN process.SplitStage ss
			ON confl.SourceId = ss.SourceId
			AND ss.SplitDetailId  = @SplitDetailId 
		WHERE ssa .StudentUSI = @TargetStudentUSI 

		UNION ALL

		SELECT ssamfte.SourceId
			  ,ss.IsSelected
			  ,ssamfte.FiscalYear
			  ,ssamfte.StudentUSI
			  ,ssamfte.SchoolId  AS Entity
			  ,ssamfte.EntryDate
			  ,'StudentSchoolAssociationMembershipFTE' AS Type
			  ,'FTEStartDate: ' + COALESCE(CAST(ssamfte.FTEStartDate AS VARCHAR(10)), '') +  
			   ', FTEEndDate: ' + COALESCE(CAST(ssamfte.FTEEndDate AS VARCHAR (10)), '') + 
			   ', MembershipFTEDescriptorId: ' + COALESCE(CAST(ssamfte.MembershipFTEDescriptorId AS VARCHAR(10)), '') AS Data
			  ,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict
			  ,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentSchoolAssociationMembershipFTE ssamfte
		LEFT JOIN leadata.StudentSchoolAssociationMembershipFTE confl
			ON ssamfte .FiscalYear = confl .FiscalYear 
			AND ssamfte .SchoolId = confl .SchoolId 
			AND ssamfte .EntryDate = confl .EntryDate 
			AND ssamfte .FTEStartDate = confl .FTEStartDate
			AND confl.StudentUSI = @SourceStudentUSI
		LEFT JOIN leadata .RecordOwnership ro
			ON ssamfte .SourceId = ro.ResourceId 
			AND ssamfte .FiscalYear = ro.FiscalYear 
		LEFT JOIN process.SplitStage ss
			ON confl.SourceId = ss.SourceId
			AND ss.SplitDetailId  = @SplitDetailId 
		WHERE ssamfte .StudentUSI = @TargetStudentUSI
			
		UNION ALL

		SELECT ssae.SourceId
			,ss.IsSelected
			,ssae.FiscalYear
			,ssae.StudentUSI
			,ssae.SchoolId AS Entity
			,ssae.EventDate AS EntryDate
			,'StudentSchoolAttendanceEvent' AS Type
			, 'TermTypeId: ' + COALESCE(CAST(ssae.TermTypeId AS VARCHAR(10)), '') +
			', SchoolYear: ' + COALESCE(CAST(ssae.SchoolYear AS VARCHAR (10)), '') +
			', AttendanceEventCategoryDescriptorId: ' + COALESCE(CAST(ssae.AttendanceEventCategoryDescriptorId AS VARCHAR (10)), '') +
			', AbsenceAmountDescriptorId: ' + COALESCE(CAST(ssae.AbsenceAmountDescriptorId AS VARCHAR (10)), '') +
			', InstructionalMinutes: ' + COALESCE(CAST(ssae.InstructionalMinutes AS VARCHAR (10)), '')
			,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict
			,ro.SubmittedByEducationOrganizationId
		FROM leadata.StudentSchoolAttendanceEvent ssae
		LEFT JOIN leadata.StudentSchoolAttendanceEvent confl
			ON ssae.FiscalYear = confl .FiscalYear 
			AND ssae.SchoolId = confl .SchoolId 
			AND ssae.TermTypeId = confl .TermTypeId 
			AND ssae.SchoolYear = confl .SchoolYear 
			AND ssae.EventDate = confl .EventDate 
			AND ssae.AttendanceEventCategoryDescriptorId = confl .AttendanceEventCategoryDescriptorId 
			AND confl.StudentUSI = @SourceStudentUSI
		LEFT JOIN leadata .RecordOwnership ro
			ON ssae .SourceId = ro.ResourceId 
			AND ssae .FiscalYear = ro.FiscalYear 
		LEFT JOIN process.SplitStage ss
			 ON confl.SourceId = ss.SourceId
			 AND ss.SplitDetailId = @SplitDetailId 
		WHERE ssae  .StudentUSI = @TargetStudentUSI

		UNION ALL

		SELECT ssa.SourceId
			,ss.IsSelected
			,ssa.FiscalYear
			,ssa.StudentUSI
			,ssa.SchoolId AS Entity
			,ssa.BeginDate AS EntryDate
			,'StudentSectionAssociation' AS Type
			, 'ClassPeriodName: ' + COALESCE(CAST(ssa.ClassPeriodName AS VARCHAR(20)), '') +
			', ClassroomIdentificationCode: ' + COALESCE(CAST(ssa.ClassroomIdentificationCode AS VARCHAR (20)), '') +
			', LocalCourseCode: ' + COALESCE(CAST(ssa.LocalCourseCode AS VARCHAR (60)), '') +
			', TermTypeId: ' + COALESCE(CAST(ssa.TermTypeId AS VARCHAR (10)), '') +			
			', UniqueSectionCode: ' + COALESCE(CAST(ssa.UniqueSectionCode AS VARCHAR (255)), '') +
			', SequenceOfCourse: ' + COALESCE(CAST(ssa.SequenceOfCourse AS VARCHAR (10)), '') +
			', RepeatIdentifierTypeId: ' + COALESCE(CAST(ssa.RepeatIdentifierTypeId AS VARCHAR (10)), '') +
			', EndDate: ' + COALESCE(CAST(ssa.EndDate AS VARCHAR (10)), '') +
			', HomeroomIndicator: ' + COALESCE(CAST(ssa.HomeroomIndicator AS VARCHAR (10)), '') +
			', TeacherStudentDataLinkExclusion: ' + COALESCE(CAST(ssa.TeacherStudentDataLinkExclusion AS VARCHAR (10)), '') +
			', CourseEntryDescriptorId: ' + COALESCE(CAST(ssa.CourseEntryDescriptorId AS VARCHAR (10)), '') +
			', CourseExitDescriptorId: ' + COALESCE(CAST(ssa.CourseExitDescriptorId AS VARCHAR (10)), '') +
			', DualCredit: ' + COALESCE(CAST(ssa.DualCredit AS VARCHAR (10)), '') +
			', ConcurrentEnrollment: ' + COALESCE(CAST(ssa.ConcurrentEnrollment AS VARCHAR (10)), '') +
			', Note: ' + COALESCE(CAST(ssa.Note AS VARCHAR (250)), '')
			,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict
			,ro.SubmittedByEducationOrganizationId
		FROM leadata.StudentSectionAssociation ssa
		LEFT JOIN leadata.StudentSectionAssociation confl
			ON ssa.FiscalYear = confl .FiscalYear 
			AND ssa.SchoolId = confl.SchoolId 
			AND ssa.ClassPeriodName = confl.ClassPeriodName 
			AND ssa.ClassroomIdentificationCode = confl.ClassroomIdentificationCode 
			AND ssa.LocalCourseCode = confl.LocalCourseCode 
			AND ssa.TermTypeId = confl.TermTypeId 
			AND ssa.SchoolYear = confl .SchoolYear 
			AND ssa.BeginDate = confl.BeginDate 
			AND ssa.UniqueSectionCode = confl .UniqueSectionCode 
			AND ssa.SequenceOfCourse = confl .SequenceOfCourse
			AND confl.StudentUSI = @SourceStudentUSI
		LEFT JOIN leadata .RecordOwnership ro
			ON ssa.SourceId = ro.ResourceId 
			AND ssa.FiscalYear = ro.FiscalYear 
		LEFT JOIN process.SplitStage ss
			ON confl.SourceId = ss.SourceId
			AND ss.SplitDetailId = @SplitDetailId 
		WHERE ssa .StudentUSI = @TargetStudentUSI

		UNION ALL

     -- Beginning Dropout Recovery Changes
		SELECT spa.SourceId
			,ss.IsSelected
			,sdorpa.FiscalYear
			,sdorpa.StudentUSI
			,sdorpa.EducationOrganizationId AS Entity
			,sdorpa.BeginDate AS EntryDate
			,'StudentDropOutRecoveryProgramAssociation' AS Type
			, 'ProgramTypeId: ' + COALESCE(CAST(sdorpa.ProgramTypeId AS VARCHAR(10)), '') +
			', ProgramEducationOrganizationId: ' + COALESCE(CAST(sdorpa.ProgramEducationOrganizationId AS VARCHAR (10)), '') +
			', ProgramName: ' + COALESCE(CAST(sdorpa.ProgramName AS VARCHAR (60)), '') +
			', WrittenLearningPlanDate: ' + COALESCE(CAST(sdorpa.WrittenLearningPlanDate AS VARCHAR (10)), '')
			,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict
			,ro.SubmittedByEducationOrganizationId
		FROM  leadata.StudentDropOutRecoveryProgramAssociation sdorpa
		LEFT JOIN leadata.StudentDropOutRecoveryProgramAssociation confl
			ON sdorpa .FiscalYear = confl .FiscalYear 
			AND sdorpa .ProgramTypeId = confl .ProgramTypeId 
			AND sdorpa .ProgramEducationOrganizationId = confl .ProgramEducationOrganizationId 
			AND sdorpa .BeginDate = confl .BeginDate 
			AND sdorpa .ProgramName = confl .ProgramName 
			AND sdorpa .EducationOrganizationId = confl .EducationOrganizationId 
			AND confl.StudentUSI = @SourceStudentUSI
		JOIN leadata.StudentProgramAssociation spa
			ON spa.FiscalYear = confl.FiscalYear 
			AND spa.StudentUSI = confl.StudentUSI 
			AND spa.ProgramTypeId = confl.ProgramTypeId 
			AND spa.ProgramName = confl.ProgramName 
			AND spa.ProgramEducationOrganizationId = confl.ProgramEducationOrganizationId 
			AND spa.BeginDate = confl.BeginDate 
			AND spa.EducationOrganizationId = confl.EducationOrganizationId
		LEFT JOIN leadata .RecordOwnership ro
			ON spa.SourceId = ro.ResourceId 
			AND spa.FiscalYear = ro.FiscalYear 
		LEFT JOIN process.SplitStage ss
			ON spa.SourceId = ss.SourceId
			AND ss.SplitDetailId = @SplitDetailId 
			AND ss.SourceTable = 'leadata.StudentDropOutRecoveryProgramAssociation'
		WHERE sdorpa .StudentUSI = @TargetStudentUSI

		UNION ALL

		SELECT sdorpmu.SourceId
			,ss.IsSelected
			,sdorpmu.FiscalYear
			,sdorpmu.StudentUSI
			,sdorpmu.EducationOrganizationId AS Entity
			,sdorpmu.BeginDate AS EntryDate
			,'StudentDropOutRecoveryProgramMonthlyUpdate' AS Type
			, 'ProgramTypeId: ' + COALESCE(CAST(sdorpmu.ProgramTypeId AS VARCHAR(10)), '') +
			', ProgramEducationOrganizationId: ' + COALESCE(CAST(sdorpmu.ProgramEducationOrganizationId AS VARCHAR (10)), '') +
			', ProgramName: ' + COALESCE(CAST(sdorpmu.ProgramName AS VARCHAR (60)), '') +
			', RevisedWrittenLearningPlanDate: ' + COALESCE(CAST(sdorpmu.RevisedWrittenLearningPlanDate AS VARCHAR (10)), '') +
			', MonthDescriptorId: ' + COALESCE(CAST(sdorpmu.MonthDescriptorId AS VARCHAR (10)), '') +
			', SatisfactoryProgress: ' + COALESCE(CAST(sdorpmu.SatisfactoryProgress AS VARCHAR (10)), '')
			,CASE WHEN ss.IsSelected = 1 AND confl.StudentUSI = @SourceStudentUSI THEN 1 ELSE 0 END AS Conflict
			,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentDropOutRecoveryProgramMonthlyUpdate sdorpmu
		LEFT JOIN leadata.StudentDropOutRecoveryProgramMonthlyUpdate confl
			ON sdorpmu .FiscalYear = confl .FiscalYear 
			AND sdorpmu .ProgramTypeId = confl .ProgramTypeId 
			AND sdorpmu .ProgramEducationOrganizationId = confl .ProgramEducationOrganizationId 
			AND sdorpmu .BeginDate = confl .BeginDate 
			AND sdorpmu .EducationOrganizationId = confl .EducationOrganizationId 
			AND sdorpmu .MonthDescriptorId = confl.MonthDescriptorId
			AND confl.StudentUSI = @SourceStudentUSI
		LEFT JOIN leadata .RecordOwnership ro
			ON sdorpmu .SourceId = ro.ResourceId 
			AND sdorpmu .FiscalYear = ro.FiscalYear 
		LEFT JOIN process.SplitStage ss
			ON confl.SourceId = ss.SourceId
			AND SS.SplitDetailId = @SplitDetailId 
		WHERE sdorpmu .StudentUSI = @TargetStudentUSI
     END TRY
    
    BEGIN CATCH
        BEGIN 
                
            DECLARE @ErrorNumber INT = ERROR_NUMBER();
            DECLARE @ErrorLine INT = ERROR_LINE();
            DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
            DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
            DECLARE @ErrorState INT = ERROR_STATE();

            PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
            PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));

            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        END
    END CATCH
END
