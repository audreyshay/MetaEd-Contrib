/************************************************************
**Procedure Name: process.GetSplitStagedData
**
**Author: Viju Viswanathan
**
**Description:  Gets staged data for student id split process
**	
**Revision History:
**	Who			When		What
**	Viju V		01/19/2017	Initial Creation
**	Viju V		01/20/2017	Modifed to select all or limited set
**	M Killens	01/20/2017	Added columns
**	M Killens	01/20/2017	Resetting is selected everytime we retrieve all (@RetrieveSelected = 0)
**	Viju V		03/07/2017	Added parentId of each child records in the list
**  M Killens   03/15/2017  Changed ParentId to ParentIdString as it comes from db as string and dapper needs to convert it
**	Viju V		03/27/2017	Modified to handle duplicate sourceid (due to an incomplete split process)
**	Viju V		03/30/2017	Modified to show the final list of records after the split
**	Viju V		04/12/2017	Added DOA/DOR
**	Viju V		04/24/2017	Replaced DOA/DOR with Record ownership
**	Viju V		05/09/2017	AzEDS 3.0 changes
***************************************************************/
CREATE PROCEDURE process.GetSplitStagedData
		@SplitDetailId INT
		,@RetrieveSelected BIT = 0
AS
BEGIN

	BEGIN TRY

		-- Handle multi-processing of data in short term...if a user backtracks through application
		UPDATE process.SplitStage
		SET IsSelected = 0
		WHERE SplitDetailId = @SplitDetailId AND @RetrieveSelected = 0

		--Local variables
		DECLARE @StudentUSI AS INT = 0		

		SELECT @StudentUSI = StudentUSI FROM leadata.Student 
									  WHERE StudentUniqueId = (SELECT IIF(ProcessCompleteDate IS NULL,SourceSplitId,TargetSplitId)
																	FROM process.SplitDetail 
																	WHERE SplitDetailId = @SplitDetailId)

		SELECT DISTINCT ss.SourceId
			,NULL AS ParentIdString
			,ss.IsSelected
			,ssa.FiscalYear
			,ssa.StudentUSI
			,ssa.SchoolId AS Entity
			,EntryDate
			,'StudentSchoolAssociation' AS Type
			,'EntryGradeLevelDescriptorId: ' + COALESCE(CAST(EntryGradeLevelDescriptorId AS VARCHAR(10)), '') +  
			', EntryTypeDescriptorId: ' + COALESCE(CAST(EntryTypeDescriptorId AS VARCHAR (10)), '') + 
			', ExitWithdrawDate: ' + COALESCE(CAST(ExitWithdrawDate AS VARCHAR (10)), '') + 
			', ExitWithdrawTypeDescriptorId: ' + COALESCE(CAST(ExitWithdrawTypeDescriptorId AS VARCHAR (10)), '') + 
			', ClassOfSchoolYear: ' + COALESCE(CAST(ClassOfSchoolYear AS VARCHAR(10)), '') + 
			', ExitWithdrawReasonDescriptorId: ' + COALESCE(CAST(ExitWithdrawReasonDescriptorId AS VARCHAR (10)), '') + 
			', MembershipTypeDescriptorId: ' + COALESCE(CAST(MembershipTypeDescriptorId AS VARCHAR (10)), '') + 
			', TrackEducationOrganizationId: ' + COALESCE(CAST(TrackEducationOrganizationId AS VARCHAR (10)), '') + 
			', TrackNumber: ' + COALESCE(CAST(TrackNumber AS VARCHAR (10)), '')AS Data
			,ro.SubmittedByEducationOrganizationId
		FROM leadata.StudentSchoolAssociation ssa
		LEFT JOIN leadata .RecordOwnership ro
			ON ssa.SourceId = ro.ResourceId 
			AND ssa.FiscalYear = ro.FiscalYear 
		JOIN process.SplitStage ss
			ON ssa.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END  
			AND ssa.StudentUSI = @StudentUSI

		UNION ALL

		SELECT DISTINCT ss.SourceId
			,ssa.SourceId AS ParentIdString
			,ss.IsSelected
			,ssamfte.FiscalYear
			,ssamfte.StudentUSI
			,ssamfte.SchoolId  AS Entity
			,ssamfte.EntryDate
			,'StudentSchoolAssociationMembershipFTE' AS Type
			,'FTEStartDate: ' + COALESCE(CAST(FTEStartDate AS VARCHAR(10)), '') +  
			', FTEEndDate: ' + COALESCE(CAST(FTEEndDate AS VARCHAR (10)), '') + 
			', MembershipFTEDescriptorId: ' + COALESCE(CAST(MembershipFTEDescriptorId AS VARCHAR(10)), '') AS Data
			,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentSchoolAssociationMembershipFTE ssamfte
		JOIN process.SplitStage ss
			ON ssamfte.SourceId = ss.SourceId
		LEFT JOIN leadata .RecordOwnership ro
			ON ssamfte .SourceId = ro.ResourceId 
			AND ssamfte .FiscalYear = ro.FiscalYear  
		JOIN leadata.StudentSchoolAssociation ssa
			ON ssamfte.FiscalYear = ssa.FiscalYear 
			AND ssamfte .StudentUSI = ssa.StudentUSI 
			AND ssamfte .SchoolId = ssa.SchoolId 
			AND ssamfte .EntryDate = ssa.EntryDate 
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END  
			AND ssamfte .StudentUSI = @StudentUSI

		UNION ALL

		SELECT DISTINCT ss.SourceId
			,ssa.SourceId  AS ParentIdString
			,ss.IsSelected
			,ssase.FiscalYear
			,ssase.StudentUSI
			,ssase.SchoolId AS Entity
			,ssase.EntryDate
			,'StudentSchoolAssociationSpecialEnrollment' AS Type
			,'SpecialEnrollmentStartDate: ' + COALESCE(CAST(SpecialEnrollmentStartDate AS VARCHAR(10)), '') +  
			', SpecialEnrollmentEndDate: ' + COALESCE(CAST(SpecialEnrollmentEndDate AS VARCHAR (10)), '') + 
			', SpecialEnrollmentDescriptorId: ' + COALESCE(CAST(SpecialEnrollmentDescriptorId AS VARCHAR(10)), '') AS Data
			,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentSchoolAssociationSpecialEnrollment ssase
		JOIN process.SplitStage ss
			ON ssase.SourceId = ss.SourceId
		LEFT JOIN leadata .RecordOwnership ro
			ON ssase .SourceId = ro.ResourceId 
			AND ssase .FiscalYear = ro.FiscalYear 
		JOIN leadata.StudentSchoolAssociation ssa
			ON ssase .FiscalYear = ssa.FiscalYear 
			AND ssase .StudentUSI = ssa.StudentUSI 
			AND ssase .SchoolId = ssa.SchoolId 
			AND ssase .EntryDate = ssa .EntryDate 
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END
			AND ssase .StudentUSI = @StudentUSI

		UNION ALL

	   SELECT DISTINCT ss.SourceId
			,ssa.SourceId AS ParentIdString
			,ss.IsSelected
			,ssatp.FiscalYear
			,ssatp.StudentUSI
			,ssatp.SchoolId AS Entity
			,ssatp.EntryDate
			,'StudentSchoolAssociationTuitionPayer' AS Type
			,'PayerStartDate: ' + COALESCE(CAST(PayerStartDate AS VARCHAR(10)), '') +  
			', PayerEndDate: ' + COALESCE(CAST(PayerEndDate AS VARCHAR (10)), '') + 
			', TuitionPayerDescriptorId: ' + COALESCE(CAST(TuitionPayerDescriptorId AS VARCHAR(10)), '') AS Data
			,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentSchoolAssociationTuitionPayer ssatp
		JOIN process.SplitStage ss
			ON ssatp.SourceId = ss.SourceId
		LEFT JOIN leadata .RecordOwnership ro
			ON ssatp .SourceId = ro.ResourceId
			AND ssatp .FiscalYear = ro.FiscalYear   
		JOIN leadata.StudentSchoolAssociation ssa
			ON ssatp .FiscalYear = ssa.FiscalYear 
			AND ssatp .StudentUSI = ssa.StudentUSI 
			AND ssatp.SchoolId = ssa.SchoolId 
			AND ssatp.EntryDate = ssa.EntryDate 
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END  
			AND ssatp .StudentUSI = @StudentUSI

		UNION ALL

		SELECT DISTINCT ss.SourceId
			,NULL AS ParentIdString
			,ss.IsSelected
			,spa.FiscalYear
			,StudentUSI
			,EducationOrganizationId AS Entity
			,BeginDate AS EntryDate
			,'StudentProgramAssociation' AS Type
			,'ProgramTypeId: ' + COALESCE(CAST(ProgramTypeId AS VARCHAR(10)), '') +  
			', ProgramName: ' + COALESCE(CAST(ProgramName AS VARCHAR (50)), '') + 
			', ProgramEducationOrganizationId: ' + COALESCE(CAST(ProgramEducationOrganizationId AS VARCHAR(10)), '') +
			', EndDate: ' + COALESCE(CAST(EndDate AS VARCHAR (50)), '') + 
			', ReasonExitedDescriptorId: ' + COALESCE(CAST(ReasonExitedDescriptorId AS VARCHAR (50)), '') AS Data
			,ro.SubmittedByEducationOrganizationId
		FROM leadata.StudentProgramAssociation spa
		JOIN process.SplitStage ss
			ON spa.SourceId = ss.SourceId
		LEFT JOIN leadata .RecordOwnership ro
			ON spa.SourceId = ro.ResourceId  
			AND spa.FiscalYear = ro.FiscalYear 
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentProgramAssociation'
 			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END 
			AND spa.StudentUSI = @StudentUSI

		UNION ALL

		SELECT DISTINCT ss.SourceId
			,spa.SourceId AS ParentIdString
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
			,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentProgramAssociation spa
		JOIN leadata.StudentSpecialEducationProgramAssociation ssepa
			ON spa.FiscalYear = ssepa.FiscalYear 
			AND spa.StudentUSI = ssepa.StudentUSI 
			AND spa.ProgramTypeId = ssepa.ProgramTypeId 
			AND spa.ProgramName = ssepa.ProgramName 
			AND spa.ProgramEducationOrganizationId = ssepa.ProgramEducationOrganizationId 
			AND spa.BeginDate = ssepa.BeginDate 
			and spa.EducationOrganizationId = ssepa.EducationOrganizationId 
		JOIN process.SplitStage ss
			ON spa.SourceId = ss.SourceId
		LEFT JOIN leadata .RecordOwnership ro
			ON spa.SourceId = ro.ResourceId  
			AND spa.FiscalYear = ro.FiscalYear 
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentSpecialEducationProgramAssociation'
			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END  
			AND ssepa .StudentUSI = @StudentUSI
				  
		UNION ALL

		SELECT DISTINCT ss.SourceId
			,spa.SourceId AS ParentIdString
			,ss.IsSelected
			,sdorpa.FiscalYear
			,sdorpa.StudentUSI
			,sdorpa.EducationOrganizationId AS Entity
			,sdorpa.BeginDate AS EntryDate
			,'StudentDropOutRecoveryProgramAssociation' AS Type
			, 'ProgramTypeId: ' + COALESCE(CAST(sdorpa.ProgramTypeId AS VARCHAR(10)), '') +
			', ProgramEducationOrganizationId: ' + COALESCE(CAST(sdorpa.ProgramEducationOrganizationId AS VARCHAR (10)), '') +
			', ProgramName: ' + COALESCE(CAST(sdorpa.ProgramName AS VARCHAR (60)), '') +
			', WrittenLearningPlanDate: ' + COALESCE(CAST(sdorpa.WrittenLearningPlanDate AS VARCHAR (10)), '') AS Data
			,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentProgramAssociation spa
		JOIN  leadata.StudentDropOutRecoveryProgramAssociation sdorpa
			ON spa.FiscalYear = sdorpa.FiscalYear 
			AND spa.StudentUSI = sdorpa.StudentUSI 
			AND spa.ProgramTypeId = sdorpa.ProgramTypeId 
			AND spa.ProgramName = sdorpa.ProgramName 
			AND spa.ProgramEducationOrganizationId = sdorpa.ProgramEducationOrganizationId 
			AND spa.BeginDate = sdorpa.BeginDate 
			AND spa.EducationOrganizationId = sdorpa.EducationOrganizationId 
		JOIN process.SplitStage ss
			ON spa.SourceId = ss.SourceId
		LEFT JOIN leadata .RecordOwnership ro
			ON spa.SourceId = ro.ResourceId 
			AND spa.FiscalYear = ro.FiscalYear 
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentDropOutRecoveryProgramAssociation'
			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END
			AND sdorpa .StudentUSI = @StudentUSI

		UNION ALL

		SELECT DISTINCT ss.SourceId
			,spa.SourceId AS ParentIdString
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
			', MonthDescriptorId: ' + COALESCE(CAST(MonthDescriptorId AS VARCHAR (10)), '') +
			', SatisfactoryProgress: ' + COALESCE(CAST(SatisfactoryProgress AS VARCHAR (10)), '')
			,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentDropOutRecoveryProgramMonthlyUpdate sdorpmu
		JOIN process.SplitStage ss
			ON sdorpmu.SourceId = ss.SourceId
		LEFT JOIN leadata .RecordOwnership ro
			ON sdorpmu .SourceId = ro.ResourceId 
			AND sdorpmu .FiscalYear = ro.FiscalYear  
		JOIN leadata.StudentProgramAssociation spa
			ON sdorpmu .FiscalYear = spa.FiscalYear 
			AND sdorpmu .StudentUSI = spa.StudentUSI 
			AND sdorpmu .ProgramTypeId = spa.ProgramTypeId 
			AND sdorpmu .ProgramName = spa.ProgramName 
			AND sdorpmu .ProgramEducationOrganizationId = spa.ProgramEducationOrganizationId 
			AND sdorpmu .BeginDate = spa.BeginDate 
			AND sdorpmu .EducationOrganizationId = spa.EducationOrganizationId 
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END  
			AND sdorpmu .StudentUSI = @StudentUSI

		UNION ALL

		SELECT DISTINCT ss.SourceId
			,NULL AS ParentIdString
			,ss.IsSelected
			,seoa.FiscalYear
			,StudentUSI
			,EducationOrganizationId AS Entity
			,EntryDate
			,'StudentEducationOrganizationAssociation' AS Type
			,'ResponsibilityDescriptorId: ' + COALESCE(CAST(ResponsibilityDescriptorId AS VARCHAR(10)), '') +  
			', SchoolId: ' + COALESCE(CAST(SchoolId AS VARCHAR (10)), '') + 
			', StartDate: ' + COALESCE(CAST(StartDate AS VARCHAR(10)), '') +
			', EndDate: ' + COALESCE(CAST(EndDate AS VARCHAR(10)), '') AS Data
			,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentSchoolAssociationLocalEducationAgency seoa
		JOIN process.SplitStage ss
			ON seoa.SourceId = ss.SourceId
		LEFT JOIN leadata .RecordOwnership ro
			ON seoa .SourceId = ro.ResourceId  
			AND seoa .FiscalYear = ro.FiscalYear 
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END
			AND seoa .StudentUSI = @StudentUSI
		 
		UNION ALL

		SELECT DISTINCT ss.SourceId
			,NULL AS ParentIdString
			,ss.IsSelected
			,sn.FiscalYear
			,StudentUSI
			,ReportingEducationOrganizationID AS Entity
			,StudentNeedEntryDate AS EntryDate
			,'StudentNeed' AS Type
			,'StudentNeedDescriptorId: ' + COALESCE(CAST(StudentNeedDescriptorId AS VARCHAR(10)), '') +  
			', StudentNeedExitDate: ' + COALESCE(CAST(StudentNeedExitDate AS VARCHAR (10)), '') + 
			', PrimaryStudentNeedIndicator: ' + COALESCE(CAST(PrimaryStudentNeedIndicator AS VARCHAR(10)), '') AS Data
			,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentNeed sn
			JOIN process.SplitStage ss
			ON sn.SourceId = ss.SourceId
		LEFT JOIN leadata .RecordOwnership ro
			ON sn.SourceId = ro.ResourceId 
			AND sn.FiscalYear = ro.FiscalYear 
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END
			AND sn.StudentUSI = @StudentUSI
		  
		UNION ALL

		SELECT DISTINCT ss.SourceId
			,NULL AS ParentIdString
			,ss.IsSelected
			,ssae.FiscalYear
			,StudentUSI
			,SchoolId AS Entity
			,EventDate AS EntryDate
			,'StudentSchoolAttendanceEvent' AS Type
			, 'TermTypeId: ' + COALESCE(CAST(TermTypeId AS VARCHAR(10)), '') +
			', SchoolYear: ' + COALESCE(CAST(SchoolYear AS VARCHAR (10)), '') +
			', AttendanceEventCategoryDescriptorId: ' + COALESCE(CAST(AttendanceEventCategoryDescriptorId AS VARCHAR (10)), '') +
			', AbsenceAmountDescriptorId: ' + COALESCE(CAST(AbsenceAmountDescriptorId AS VARCHAR (10)), '') +
			', InstructionalMinutes: ' + COALESCE(CAST(InstructionalMinutes AS VARCHAR (10)), '')AS Data
			,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentSchoolAttendanceEvent ssae
		JOIN process.SplitStage ss
			ON ssae.SourceId = ss.SourceId
		LEFT JOIN leadata .RecordOwnership ro
			ON ssae .SourceId = ro.ResourceId  
			AND ssae .FiscalYear = ro.FiscalYear 
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END 
			AND ssae .StudentUSI = @StudentUSI

		UNION ALL

		SELECT DISTINCT ss.SourceId
			,NULL AS ParentIdString
			,ss.IsSelected
			,sse.FiscalYear
			,StudentUSI
			,SchoolId AS Entity
			,BeginDate AS EntryDate
			,'StudentSectionAssociation' AS Type
			, 'ClassPeriodName: ' + COALESCE(CAST(ClassPeriodName AS VARCHAR(20)), '') +
			', ClassroomIdentificationCode: ' + COALESCE(CAST(ClassroomIdentificationCode AS VARCHAR (20)), '') +
			', LocalCourseCode: ' + COALESCE(CAST(LocalCourseCode AS VARCHAR (60)), '') +
			', TermTypeId: ' + COALESCE(CAST(TermTypeId AS VARCHAR (10)), '') +
			', UniqueSectionCode: ' + COALESCE(CAST(UniqueSectionCode AS VARCHAR (255)), '') +
			', SequenceOfCourse: ' + COALESCE(CAST(SequenceOfCourse AS VARCHAR (10)), '') +
			', RepeatIdentifierTypeId: ' + COALESCE(CAST(RepeatIdentifierTypeId AS VARCHAR (10)), '') +
			', EndDate: ' + COALESCE(CAST(EndDate AS VARCHAR (10)), '') +
			', HomeroomIndicator: ' + COALESCE(CAST(HomeroomIndicator AS VARCHAR (10)), '') +
			', TeacherStudentDataLinkExclusion: ' + COALESCE(CAST(TeacherStudentDataLinkExclusion AS VARCHAR (10)), '') +
			', CourseEntryDescriptorId: ' + COALESCE(CAST(CourseEntryDescriptorId AS VARCHAR (10)), '') +
			', CourseExitDescriptorId: ' + COALESCE(CAST(CourseExitDescriptorId AS VARCHAR (10)), '') +
			', DualCredit: ' + COALESCE(CAST(DualCredit AS VARCHAR (10)), '') +
			', ConcurrentEnrollment: ' + COALESCE(CAST(ConcurrentEnrollment AS VARCHAR (10)), '') +
			', Note: ' + COALESCE(CAST(Note AS VARCHAR (250)), '')AS Data
			,ro.SubmittedByEducationOrganizationId 
		FROM leadata.StudentSectionAssociation sse
		JOIN process.SplitStage ss
			ON sse.SourceId = ss.SourceId
		LEFT JOIN leadata .RecordOwnership ro
			ON sse.SourceId = ro.ResourceId  
			AND sse.FiscalYear = ro.FiscalYear 
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ISNULL(ss.IsSelected,0) = CASE @RetrieveSelected	WHEN 1 THEN 1 ELSE ISNULL(ss.IsSelected,0) END   
			AND sse.StudentUSI = @StudentUSI
     
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
