/************************************************************
**Procedure Name: process.InsertSplitData
**
**Author: Viju Viswanathan
**
**Description:  Insert selected records to split for a given studentUniqueId
**	
**Revision History:
**	Who			When		What
**	Viju V		02/03/2017	Initial Creation
**  M Killens	03/27/2017	Set ProcessEndDate
**	Viju V		04/03/2017	Exit procedure when target student is not available
**							in AzEDS database
**	Viju V		04/25/2017	Delete source records if TargetId is not available
**							in AzEDS database
**	Viju V		05/16/2017	AzEDS 3.0 Changes
**	Vinoth K	03/26/2019	Modified the ED-Fi 3.0 changes

***************************************************************/
CREATE PROCEDURE [process].[InsertSplitData]
	@SplitDetailId INT
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY

		DECLARE @TargetStudentUSI AS INT

		SELECT @TargetStudentUSI = StudentUSI 
		  FROM leadata.Student 
		  WHERE StudentUniqueId = (SELECT TargetSplitID
										FROM process.SplitDetail
										WHERE SplitDetailId =@SplitDetailId )
		
		--Exit procedure if Target student is unavailable
		--IF @TargetStudentUSI IS NULL
		--	RETURN

		BEGIN TRANSACTION SplitStudent;

		--Student Education Organization
		SELECT seoa.*
			INTO #StudentSchoolAssociationLocalEducationAgency
		FROM leadata.StudentSchoolAssociationLocalEducationAgency seoa
		JOIN process.SplitStage ss
		  ON seoa.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentSchoolAssociationLocalEducationAgency'
			AND ss.IsSelected = 1
			AND @TargetStudentUSI IS NOT NULL

		DELETE seoa
		FROM leadata.StudentSchoolAssociationLocalEducationAgency seoa
		JOIN process.SplitStage ss
		  ON seoa.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentSchoolAssociationLocalEducationAgency'
			AND ss.IsSelected = 1
		
		UPDATE #StudentSchoolAssociationLocalEducationAgency
			SET StudentUSI = @TargetStudentUSI

	   INSERT INTO leadata.StudentSchoolAssociationLocalEducationAgency
		SELECT * FROM #StudentSchoolAssociationLocalEducationAgency new
		WHERE NOT EXISTS (SELECT 1
							FROM leadata.[StudentSchoolAssociationLocalEducationAgency] old
							WHERE new.StudentUSI = old.StudentUSI
							AND new.FiscalYear = old.FiscalYear
							AND new.EducationOrganizationId = old.EducationOrganizationId
							AND new.ResponsibilityDescriptorId = old.ResponsibilityDescriptorId
							AND new.SchoolId = old.SchoolId
							AND new.EntryDate = old.EntryDate
							AND new.StartDate = old.StartDate)

		DROP TABLE #StudentSchoolAssociationLocalEducationAgency

		--Student Need
		SELECT sn.* 
			INTO #StudentNeed
		FROM leadata.StudentNeed sn
		JOIN process.SplitStage ss
		  ON sn.SourceId = ss.SourceId
		 WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.IsSelected = 1
			AND @TargetStudentUSI IS NOT NULL

		DELETE sn
			FROM leadata.StudentNeed sn
		JOIN process.SplitStage ss
		  ON sn.SourceId = ss.SourceId
		 WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.IsSelected = 1
		
		UPDATE #StudentNeed
			SET StudentUSI = @TargetStudentUSI

	   INSERT INTO leadata.StudentNeed
		SELECT * FROM #StudentNeed new
		WHERE NOT EXISTS (SELECT 1
							FROM leadata.StudentNeed old
							WHERE new.StudentUSI = old.StudentUSI
							AND new.FiscalYear = old.FiscalYear
							AND new.ReportingEducationOrganizationID = old.ReportingEducationOrganizationID
							AND new.StudentNeedDescriptorId = old.StudentNeedDescriptorId
							AND new.StudentNeedEntryDate = old.StudentNeedEntryDate)

		DROP TABLE #StudentNeed 
		
		--Student Program Association and dependent records
		SELECT spa.* 
			INTO #StudentProgramAssociation
		FROM leadata.StudentProgramAssociation	spa
		  JOIN process.SplitStage ss
		  ON spa.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentProgramAssociation'
			AND ss.IsSelected = 1
			AND @TargetStudentUSI IS NOT NULL

		SELECT ssepa.* 
			INTO #StudentSpecialEducationProgramAssociation
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
			WHERE ss.SplitDetailId  = @SplitDetailId
				AND ss.SourceTable = 'leadata.StudentSpecialEducationProgramAssociation'
				AND ss.IsSelected = 1
				AND @TargetStudentUSI IS NOT NULL

		SELECT sdorpa.* INTO
			#StudentDropOutRecoveryProgramAssociation
  		FROM leadata.StudentProgramAssociation spa
		 JOIN  leadata.StudentDropOutRecoveryProgramAssociation sdorpa
		 ON spa.FiscalYear = sdorpa.FiscalYear 
			AND spa.StudentUSI = sdorpa.StudentUSI 
			AND spa.ProgramTypeId = sdorpa.ProgramTypeId 
			AND spa.ProgramName = sdorpa.ProgramName 
			AND spa.ProgramEducationOrganizationId = sdorpa.ProgramEducationOrganizationId 
			AND spa.BeginDate = sdorpa.BeginDate 
			and spa.EducationOrganizationId = sdorpa.EducationOrganizationId 
		JOIN process.SplitStage ss
			  ON spa.SourceId = ss.SourceId
			WHERE ss.SplitDetailId  = @SplitDetailId
				AND ss.SourceTable = 'leadata.StudentDropOutRecoveryProgramAssociation'
				AND ss.IsSelected = 1
				AND @TargetStudentUSI IS NOT NULL

		SELECT sdorpmu.* 
			INTO #StudentDropOutRecoveryProgramMonthlyUpdate
		FROM leadata.StudentDropOutRecoveryProgramMonthlyUpdate sdorpmu
		JOIN process.SplitStage ss
		  ON sdorpmu.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentDropOutRecoveryProgramMonthlyUpdate'
			AND ss.IsSelected = 1
			AND @TargetStudentUSI IS NOT NULL

		DELETE sdorpmu 			
		FROM leadata.StudentDropOutRecoveryProgramMonthlyUpdate sdorpmu
		JOIN process.SplitStage ss
		  ON sdorpmu.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.IsSelected = 1
			AND ss.SourceTable = 'leadata.StudentDropOutRecoveryProgramMonthlyUpdate'

		DELETE sdorpa
		FROM leadata.StudentProgramAssociation spa
			JOIN  leadata.StudentDropOutRecoveryProgramAssociation sdorpa
			ON spa.FiscalYear = sdorpa.FiscalYear 
			AND spa.StudentUSI = sdorpa.StudentUSI 
			AND spa.ProgramTypeId = sdorpa.ProgramTypeId 
			AND spa.ProgramName = sdorpa.ProgramName 
			AND spa.ProgramEducationOrganizationId = sdorpa.ProgramEducationOrganizationId 
			AND spa.BeginDate = sdorpa.BeginDate 
			and spa.EducationOrganizationId = sdorpa.EducationOrganizationId 
		JOIN process.SplitStage ss
				ON spa.SourceId = ss.SourceId
			WHERE ss.SplitDetailId  = @SplitDetailId
				AND ss.SourceTable = 'leadata.StudentDropOutRecoveryProgramAssociation'
				AND ss.IsSelected = 1

		DELETE ssepa
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
			WHERE ss.SplitDetailId  = @SplitDetailId
				AND ss.SourceTable = 'leadata.StudentSpecialEducationProgramAssociation'
				AND ss.IsSelected = 1

		DELETE spa
		FROM leadata.StudentProgramAssociation	spa
			JOIN process.SplitStage ss
			ON spa.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentProgramAssociation'
			AND ss.IsSelected = 1

		UPDATE #StudentProgramAssociation
			SET StudentUSI = @TargetStudentUSI 

		UPDATE #StudentSpecialEducationProgramAssociation
			SET StudentUSI = @TargetStudentUSI 

		UPDATE #StudentDropOutRecoveryProgramAssociation
			SET StudentUSI = @TargetStudentUSI 

		UPDATE #StudentDropOutRecoveryProgramMonthlyUpdate
			SET StudentUSI = @TargetStudentUSI 

		INSERT INTO leadata.StudentProgramAssociation
			SELECT * FROM #StudentProgramAssociation new
			WHERE NOT EXISTS (SELECT 1 
									FROM leadata.StudentProgramAssociation old
									WHERE new.StudentUSI = old.StudentUSI
									AND new.FiscalYear = old.FiscalYear
									AND new.ProgramTypeId = old.ProgramTypeId
									AND new.ProgramName = old.ProgramName
									AND new.ProgramEducationOrganizationId = old.ProgramEducationOrganizationId
									AND new.BeginDate = old.BeginDate
									AND new.EducationOrganizationId = old.EducationOrganizationId )

		INSERT INTO leadata.StudentDropOutRecoveryProgramAssociation
			SELECT * FROM #StudentDropOutRecoveryProgramAssociation new
			WHERE NOT EXISTS (SELECT 1
								FROM leadata.StudentDropOutRecoveryProgramAssociation old
								WHERE new.StudentUSI = old.StudentUSI
								AND new.FiscalYear = old.FiscalYear
								AND new.ProgramTypeId = old.ProgramTypeId
								AND new.ProgramName = old.ProgramName
								AND new.ProgramEducationOrganizationId = old.ProgramEducationOrganizationId
								AND new.BeginDate = old.BeginDate
								AND new.EducationOrganizationId = old.EducationOrganizationId)

		INSERT INTO leadata.StudentDropOutRecoveryProgramMonthlyUpdate
			SELECT * FROM #StudentDropOutRecoveryProgramMonthlyUpdate new
			WHERE NOT EXISTS (SELECT 1
								FROM leadata.StudentDropOutRecoveryProgramMonthlyUpdate old
								WHERE new.StudentUSI = old.StudentUSI
								AND new.FiscalYear = old.FiscalYear
								AND new.ProgramTypeId = old.ProgramTypeId
								AND new.ProgramName = old.ProgramName
								AND new.ProgramEducationOrganizationId = old.ProgramEducationOrganizationId
								AND new.BeginDate = old.BeginDate
								AND new.EducationOrganizationId = old.EducationOrganizationId
								AND new.MonthDescriptorId = old.MonthDescriptorId)

		INSERT INTO leadata.StudentSpecialEducationProgramAssociation
			SELECT * FROM #StudentSpecialEducationProgramAssociation new
			WHERE NOT EXISTS (SELECT 1
								FROM leadata.StudentSpecialEducationProgramAssociation old
								WHERE new.StudentUSI = old.StudentUSI
								AND new.FiscalYear = old.FiscalYear
								AND new.ProgramTypeId = old.ProgramTypeId
								AND new.ProgramName = old.ProgramName
								AND new.ProgramEducationOrganizationId = old.ProgramEducationOrganizationId
								AND new.BeginDate = old.BeginDate
								AND new.EducationOrganizationId = old.EducationOrganizationId)

		DROP TABLE #StudentProgramAssociation
		DROP TABLE #StudentDropOutRecoveryProgramAssociation
		DROP TABLE #StudentSpecialEducationProgramAssociation
		DROP TABLE #StudentDropOutRecoveryProgramMonthlyUpdate 	

		--Student School Association and dependent records
		SELECT ssa.* 
			INTO #StudentSchoolAssociation
		FROM leadata.StudentSchoolAssociation ssa
		JOIN process.SplitStage ss
			  ON ssa.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentSchoolAssociation'
			AND ss.IsSelected = 1
			AND @TargetStudentUSI IS NOT NULL 
			
		SELECT ssape.*
			INTO #StudentSchoolAssociationSpecialEnrollment
		FROM leadata.StudentSchoolAssociationSpecialEnrollment ssape
		JOIN process.SplitStage ss
		  ON ssape.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentSpecialEducationProgramAssociation'
			AND ss.IsSelected = 1
			AND @TargetStudentUSI IS NOT NULL
		
		SELECT ssatp.*
			INTO #StudentSchoolAssociationTuitionPayer
		FROM leadata.StudentSchoolAssociationTuitionPayer ssatp
		JOIN process.SplitStage ss
		  ON ssatp.SourceId = ss.SourceId
		 WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.SourceTable = 'leadata.StudentSchoolAssociationTuitionPayer'
			AND ss.IsSelected = 1	
			AND @TargetStudentUSI IS NOT NULL	

		SELECT ssamfte.* 
			INTO #StudentSchoolAssociationMembershipFTE
		FROM leadata.StudentSchoolAssociationMembershipFTE ssamfte
		JOIN process.SplitStage ss
			  ON ssamfte.SourceId = ss.SourceId
			WHERE ss.SplitDetailId  = @SplitDetailId
			 AND ss.IsSelected = 1
			 AND ss.SourceTable = 'leadata.StudentSchoolAssociationMembershipFTE'
			 AND @TargetStudentUSI IS NOT NULL
		
		DELETE ssamfte
		FROM leadata.StudentSchoolAssociationMembershipFTE ssamfte
		JOIN process.SplitStage ss
			  ON ssamfte.SourceId = ss.SourceId
			WHERE ss.SplitDetailId  = @SplitDetailId
			 AND ss.IsSelected = 1
			 AND ss.SourceTable = 'leadata.StudentSchoolAssociationMembershipFTE'

		DELETE ssatp
		FROM leadata.StudentSchoolAssociationTuitionPayer ssatp
		JOIN process.SplitStage ss
		  ON ssatp.SourceId = ss.SourceId
		 WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.IsSelected = 1	
			AND ss.SourceTable = 'leadata.StudentSchoolAssociationTuitionPayer'

		DELETE ssape
		FROM leadata.StudentSchoolAssociationSpecialEnrollment ssape
		JOIN process.SplitStage ss
		  ON ssape.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.IsSelected = 1
			AND ss.SourceTable = 'leadata.StudentSpecialEducationProgramAssociation'
		
		DELETE ssa
		FROM leadata.StudentSchoolAssociation ssa
		JOIN process.SplitStage ss
			  ON ssa.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
			AND ss.IsSelected = 1 
			AND ss.SourceTable = 'leadata.StudentSchoolAssociation'

		UPDATE #StudentSchoolAssociation
			SET StudentUSI = @TargetStudentUSI

		UPDATE #StudentSchoolAssociationSpecialEnrollment
			SET StudentUSI = @TargetStudentUSI

		UPDATE #StudentSchoolAssociationTuitionPayer
			SET StudentUSI = @TargetStudentUSI

		UPDATE #StudentSchoolAssociationMembershipFTE
			SET StudentUSI = @TargetStudentUSI

	    INSERT INTO leadata.StudentSchoolAssociation
		SELECT * FROM #StudentSchoolAssociation new
		WHERE NOT EXISTS (SELECT 1
							FROM leadata.StudentSchoolAssociation old
							WHERE new.StudentUSI = old.StudentUSI
							AND new.FiscalYear = old.FiscalYear
							AND new.SchoolId = old.SchoolId
							AND new.EntryDate = old.EntryDate)

		INSERT INTO leadata.StudentSchoolAssociationSpecialEnrollment
		SELECT * FROM #StudentSchoolAssociationSpecialEnrollment new
		WHERE NOT EXISTS (SELECT 1
							FROM leadata.StudentSchoolAssociationSpecialEnrollment old
							WHERE new.StudentUSI = old.StudentUSI
							AND new.FiscalYear = old.FiscalYear
							AND new.SchoolId = old.SchoolId
							AND new.EntryDate = old.EntryDate
							AND new.SpecialEnrollmentStartDate = old.SpecialEnrollmentStartDate)


	    INSERT INTO leadata.StudentSchoolAssociationTuitionPayer
		SELECT * FROM #StudentSchoolAssociationTuitionPayer new
		WHERE NOT EXISTS (SELECT 1
							FROM leadata.StudentSchoolAssociationTuitionPayer old
							WHERE new.StudentUSI = old.StudentUSI
							AND new.FiscalYear = old.FiscalYear
							AND new.SchoolId = old.SchoolId
							AND new.EntryDate = old.EntryDate
							AND new.PayerStartDate = old.PayerStartDate)

		INSERT INTO leadata.StudentSchoolAssociationMembershipFTE
		SELECT * FROM #StudentSchoolAssociationMembershipFTE new
		WHERE NOT EXISTS (SELECT 1
							FROM leadata.StudentSchoolAssociationMembershipFTE old
							WHERE new.StudentUSI = old.StudentUSI
							AND new.FiscalYear = old.FiscalYear
							AND new.SchoolId = old.SchoolId
							AND new.EntryDate = old.EntryDate
							AND new.FTEStartDate = old.FTEStartDate)

		drop table #StudentSchoolAssociation
		drop table #StudentSchoolAssociationSpecialEnrollment
		drop table #StudentSchoolAssociationTuitionPayer
		drop table #StudentSchoolAssociationMembershipFTE 

		--Student school attendance event
		SELECT ssae.*
			INTO #StudentSchoolAttendanceEvent
		FROM leadata.StudentSchoolAttendanceEvent ssae
		JOIN process.SplitStage ss
			  ON ssae.SourceId = ss.SourceId
			WHERE ss.SplitDetailId  = @SplitDetailId
			 AND ss.IsSelected = 1
			 AND @TargetStudentUSI IS NOT NULL

		DELETE ssae
		FROM leadata.StudentSchoolAttendanceEvent ssae
		JOIN process.SplitStage ss
			  ON ssae.SourceId = ss.SourceId
			WHERE ss.SplitDetailId  = @SplitDetailId
			 AND ss.IsSelected = 1

		UPDATE #StudentSchoolAttendanceEvent
			SET StudentUSI = @TargetStudentUSI


		INSERT INTO leadata.StudentSchoolAttendanceEvent
		SELECT * FROM #StudentSchoolAttendanceEvent new
		WHERE NOT EXISTS (SELECT 1
							FROM leadata.StudentSchoolAttendanceEvent old
							WHERE new.StudentUSI = old.StudentUSI
							AND new.FiscalYear = old.FiscalYear
							AND new.SchoolId = old.SchoolId
							AND new.TermTypeId = old.TermTypeId
							AND new.SchoolYear = old.SchoolYear
							AND new.EventDate = old.EventDate
							AND new.AttendanceEventCategoryDescriptorId = old.AttendanceEventCategoryDescriptorId)

		DROP TABLE #StudentSchoolAttendanceEvent

		--Student section association

		SELECT ssa.*
			INTO #StudentSectionAssociation			
		FROM leadata.StudentSectionAssociation ssa
		JOIN process.SplitStage ss
		  ON ssa.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
		 AND ss.IsSelected = 1
		 AND @TargetStudentUSI IS NOT NULL

		DELETE ssa
		FROM leadata.StudentSectionAssociation ssa
		JOIN process.SplitStage ss
		  ON ssa.SourceId = ss.SourceId
		WHERE ss.SplitDetailId  = @SplitDetailId
		 AND ss.IsSelected = 1
		 
		 UPDATE #StudentSectionAssociation 
			SET StudentUSI = @TargetStudentUSI 

		INSERT INTO leadata.StudentSectionAssociation
		SELECT * FROM #StudentSectionAssociation new
		WHERE NOT EXISTS (SELECT 1
							FROM leadata.StudentSectionAssociation old
							WHERE new.StudentUSI = old.StudentUSI
							AND new.FiscalYear = old.FiscalYear
							AND new.SchoolId = old.SchoolId
							AND new.ClassPeriodName = old.ClassPeriodName
							AND new.ClassroomIdentificationCode = old.ClassroomIdentificationCode
							AND new.LocalCourseCode = old.LocalCourseCode
							AND new.TermTypeId = old.TermTypeId
							AND new.SchoolYear = old.SchoolYear
							AND new.BeginDate = old.BeginDate
							AND new.UniqueSectionCode = old.UniqueSectionCode
							AND new.SequenceOfCourse = old.SequenceOfCourse )

		DROP TABLE #StudentSectionAssociation 

		UPDATE process.SplitDetail
		SET ProcessCompleteDate = GETDATE()
		WHERE SplitDetailId = @SplitDetailId 

		COMMIT TRANSACTION SplitStudent;
     END TRY
    
    BEGIN CATCH
        BEGIN 
            
			ROLLBACK TRANSACTION SplitStudent;

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


