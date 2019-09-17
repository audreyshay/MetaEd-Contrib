/************************************************************
**Procedure Name: leadata.GetAzEDSIdentityDisplay
**
**Author: Martez Killens
**
**Description:  Gets display information for a given studentUniqueId
**	
**Revision History:
**	Who			When		What
**	M Killens	06/09/2015	Initial Creation
***************************************************************/
CREATE PROC [leadata].[GetAzEDSIdentityDisplay] 
      @studentUniqueId nvarchar(32)
AS
BEGIN

    BEGIN TRY

    DECLARE @studentUSI as INT

    SELECT @studentUSI = StudentUSI 
      FROM leadata.Student 
     WHERE StudentUniqueId = @studentUniqueId	 	  

    SELECT [FiscalYear]
          ,[StudentUSI]
          ,[EducationOrganizationId] AS Entity
          ,[StartDate] AS EntryDate
          ,'StudentEducationOrganizationAssociation' AS Type
          ,'ResponsibilityDescriptorId: ' + COALESCE(CAST(ResponsibilityDescriptorId AS VARCHAR(10)), '') +  
           ', SchoolId: ' + COALESCE(CAST(SchoolId AS VARCHAR (10)), '') + 
           ', EndDate: ' + COALESCE(CAST(EndDate AS VARCHAR(10)), '') AS Data
      FROM [leadata].StudentSchoolAssociationLocalEducationAgency WITH (NOLOCK)
     WHERE StudentUSI = @studentUSI

     UNION ALL

    SELECT [FiscalYear]
          ,[StudentUSI]
          ,[ReportingEducationOrganizationID] AS Entity
          ,[StudentNeedEntryDate] AS EntryDate
          ,'StudentNeed' AS Type
          ,'StudentNeedDescriptorId: ' + COALESCE(CAST(StudentNeedDescriptorId AS VARCHAR(10)), '') +  
           ', StudentNeedExitDate: ' + COALESCE(CAST(StudentNeedExitDate AS VARCHAR (10)), '') + 
           ', PrimaryStudentNeedIndicator: ' + COALESCE(CAST(PrimaryStudentNeedIndicator AS VARCHAR(10)), '') AS Data
      FROM [leadata].[StudentNeed] WITH (NOLOCK) 
     WHERE StudentUSI = @studentUSI
  
     UNION ALL

    SELECT [FiscalYear]
          ,[StudentUSI]
          ,[EducationOrganizationId] AS Entity
          ,[BeginDate] AS EntryDate
          ,'StudentProgramAssociation' AS Type
          ,'ProgramTypeId: ' + COALESCE(CAST(ProgramTypeId AS VARCHAR(10)), '') +  
           ', ProgramName: ' + COALESCE(CAST(ProgramName AS VARCHAR (50)), '') + 
           ', ProgramEducationOrganizationId: ' + COALESCE(CAST(ProgramEducationOrganizationId AS VARCHAR(10)), '') +
           ', EndDate: ' + COALESCE(CAST(EndDate AS VARCHAR (50)), '') + 
           ', ReasonExitedDescriptorId: ' + COALESCE(CAST(ReasonExitedDescriptorId AS VARCHAR (50)), '') AS Data
      FROM [leadata].[StudentProgramAssociation] WITH (NOLOCK)
     WHERE StudentUSI = @studentUSI
  
     UNION ALL

    SELECT [FiscalYear]
          ,[StudentUSI]
          ,[SchoolId] AS Entity
          ,[EntryDate]
          ,'StudentSchoolAssociationSpecialEnrollment' AS Type
          ,'SpecialEnrollmentStartDate: ' + COALESCE(CAST(SpecialEnrollmentStartDate AS VARCHAR(10)), '') +  
           ', SpecialEnrollmentEndDate: ' + COALESCE(CAST(SpecialEnrollmentEndDate AS VARCHAR (10)), '') + 
           ', SpecialEnrollmentDescriptorId: ' + COALESCE(CAST(SpecialEnrollmentDescriptorId AS VARCHAR(10)), '') AS Data
      FROM [leadata].[StudentSchoolAssociationSpecialEnrollment] WITH (NOLOCK) 
     WHERE StudentUSI = @studentUSI
  
     UNION ALL

    SELECT [FiscalYear]
          ,[StudentUSI]
          ,[SchoolId] AS Entity
          ,[EntryDate]
          ,'StudentSchoolAssociationTuitionPayer' AS Type
          ,'PayerStartDate: ' + COALESCE(CAST(PayerStartDate AS VARCHAR(10)), '') +  
           ', PayerEndDate: ' + COALESCE(CAST(PayerEndDate AS VARCHAR (10)), '') + 
           ', TuitionPayerDescriptorId: ' + COALESCE(CAST(TuitionPayerDescriptorId AS VARCHAR(10)), '') AS Data
      FROM [leadata].[StudentSchoolAssociationTuitionPayer] WITH (NOLOCK)
     WHERE StudentUSI = @studentUSI
  
     UNION ALL

    SELECT [FiscalYear]
          ,[StudentUSI]
          ,[EducationOrganizationId] AS Entity
          ,[BeginDate] AS EntryDate
          ,'StudentSpecialEducationProgramAssociation' AS Type
          ,'ProgramTypeId: ' + COALESCE(CAST(ProgramTypeId AS VARCHAR(10)), '') +  
           ', ProgramName: ' + COALESCE(CAST(ProgramName AS VARCHAR (10)), '') + 
           ', ProgramEducationOrganizationId: ' + COALESCE(CAST(ProgramEducationOrganizationId AS VARCHAR (10)), '') + 
           ', SpecialEducationSettingDescriptorId: ' + COALESCE(CAST(SpecialEducationSettingDescriptorId AS VARCHAR (10)), '') + 
           ', MainSPEDSchool: ' + COALESCE(CAST(MainSPEDSchool AS VARCHAR(10)), '') AS Data
      FROM [leadata].[StudentSpecialEducationProgramAssociation] WITH (NOLOCK) 
     WHERE StudentUSI = @studentUSI
  
     UNION ALL

    SELECT [FiscalYear]
          ,[StudentUSI]
          ,[SchoolId] AS Entity
          ,[EntryDate]
          ,'StudentSchoolAssociation' AS Type
          ,'EntryGradeLevelDescriptorId: ' + COALESCE(CAST(EntryGradeLevelDescriptorId AS VARCHAR(10)), '') +  
           ', EntryTypeDescriptorId: ' + COALESCE(CAST(EntryTypeDescriptorId AS VARCHAR (10)), '') + 
           ', ExitWithdrawDate: ' + COALESCE(CAST(ExitWithdrawDate AS VARCHAR (10)), '') + 
           ', ExitWithdrawTypeDescriptorId: ' + COALESCE(CAST(ExitWithdrawTypeDescriptorId AS VARCHAR (10)), '') + 
           ', ClassOfSchoolYear: ' + COALESCE(CAST(ClassOfSchoolYear AS VARCHAR(10)), '') + 
           ', ExitWithdrawReasonDescriptorId: ' + COALESCE(CAST(ExitWithdrawReasonDescriptorId AS VARCHAR (10)), '') + 
           ', MembershipTypeDescriptorId: ' + COALESCE(CAST(MembershipTypeDescriptorId AS VARCHAR (10)), '') + 
           ', TrackEducationOrganizationId: ' + COALESCE(CAST(TrackEducationOrganizationId AS VARCHAR (10)), '') + 
           ', TrackNumber: ' + COALESCE(CAST(TrackNumber AS VARCHAR (10)), '') AS Data
      FROM [leadata].[StudentSchoolAssociation] WITH (NOLOCK)
     WHERE StudentUSI = @studentUSI

    UNION ALL

    SELECT [FiscalYear]
          ,[StudentUSI]
          ,[SchoolId]  AS Entity
          ,[EntryDate]
          ,'StudentSchoolAssociationMembershipFTE' AS Type
          ,'FTEStartDate: ' + COALESCE(CAST(FTEStartDate AS VARCHAR(10)), '') +  
           ', FTEEndDate: ' + COALESCE(CAST(FTEEndDate AS VARCHAR (10)), '') + 
           ', MembershipFTEDescriptorId: ' + COALESCE(CAST(MembershipFTEDescriptorId AS VARCHAR(10)), '') AS Data
      FROM [leadata].[StudentSchoolAssociationMembershipFTE] WITH (NOLOCK) 
     WHERE StudentUSI = @studentUSI

     UNION ALL

     ---Begin STC Changes
     SELECT [FiscalYear]
            ,[StudentUSI]
            ,[SchoolId] AS Entity
            ,[EventDate] AS EntryDate
            ,'StudentSchoolAttendanceEvent' AS Type
            , 'TermTypeId: ' + COALESCE(CAST(TermTypeId AS VARCHAR(10)), '') +
            ', SchoolYear: ' + COALESCE(CAST(SchoolYear AS VARCHAR (10)), '') +
            ', AttendanceEventCategoryDescriptorId: ' + COALESCE(CAST(AttendanceEventCategoryDescriptorId AS VARCHAR (10)), '') +
            ', AbsenceAmountDescriptorId: ' + COALESCE(CAST(AbsenceAmountDescriptorId AS VARCHAR (10)), '') +
            ', InstructionalMinutes: ' + COALESCE(CAST(InstructionalMinutes AS VARCHAR (10)), '')
      FROM [leadata].[StudentSchoolAttendanceEvent] WITH (NOLOCK)
     WHERE StudentUSI = @studentUSI

     UNION ALL

     SELECT [FiscalYear]
            ,[StudentUSI]
            ,[SchoolId] AS Entity
            ,[BeginDate] AS EntryDate
            ,'StudentSectionAssociation' AS Type
            , 'ClassPeriodName: ' + COALESCE(CAST(ClassPeriodName AS VARCHAR(20)), '') +
            ', ClassroomIdentificationCode: ' + COALESCE(CAST(ClassroomIdentificationCode AS VARCHAR (20)), '') +
            ', LocalCourseCode: ' + COALESCE(CAST(LocalCourseCode AS VARCHAR (60)), '') +
            ', TermTypeId: ' + COALESCE(CAST(TermTypeId AS VARCHAR (10)), '') +
            ', RepeatIdentifierTypeId: ' + COALESCE(CAST(RepeatIdentifierTypeId AS VARCHAR (10)), '') +
            ', EndDate: ' + COALESCE(CAST(EndDate AS VARCHAR (10)), '') +
            ', HomeroomIndicator: ' + COALESCE(CAST(HomeroomIndicator AS VARCHAR (10)), '') +
            ', TeacherStudentDataLinkExclusion: ' + COALESCE(CAST(TeacherStudentDataLinkExclusion AS VARCHAR (10)), '') +
            ', CourseEntryDescriptorId: ' + COALESCE(CAST(CourseEntryDescriptorId AS VARCHAR (10)), '') +
            ', CourseExitDescriptorId: ' + COALESCE(CAST(CourseExitDescriptorId AS VARCHAR (10)), '') +
            ', DualCredit: ' + COALESCE(CAST(DualCredit AS VARCHAR (10)), '') +
            ', ConcurrentEnrollment: ' + COALESCE(CAST(ConcurrentEnrollment AS VARCHAR (10)), '') +
            ', Note: ' + COALESCE(CAST(Note AS VARCHAR (250)), '')
      FROM [leadata].[StudentSectionAssociation] WITH (NOLOCK)
     WHERE StudentUSI = @studentUSI

     UNION ALL

     -- Beginning Dropout Recover Changes
     SELECT [FiscalYear]
            ,[StudentUSI]
            ,[EducationOrganizationId] AS Entity
            ,[BeginDate] AS EntryDate
            ,'StudentDropOutRecoveryProgramAssociation' AS Type
            , 'ProgramTypeId: ' + COALESCE(CAST(ProgramTypeId AS VARCHAR(10)), '') +
            ', ProgramEducationOrganizationId: ' + COALESCE(CAST(ProgramEducationOrganizationId AS VARCHAR (10)), '') +
            ', ProgramName: ' + COALESCE(CAST(ProgramName AS VARCHAR (60)), '') +
            ', WrittenLearningPlanDate: ' + COALESCE(CAST(WrittenLearningPlanDate AS VARCHAR (10)), '')
      FROM [leadata].[StudentDropOutRecoveryProgramAssociation] WITH (NOLOCK)
     WHERE StudentUSI = @studentUSI

     UNION ALL

     SELECT [FiscalYear]
            ,[StudentUSI]
            ,[EducationOrganizationId] AS Entity
            ,[BeginDate] AS EntryDate
            ,'StudentDropOutRecoveryProgramMonthlyUpdate' AS Type
            , 'ProgramTypeId: ' + COALESCE(CAST(ProgramTypeId AS VARCHAR(10)), '') +
            ', ProgramEducationOrganizationId: ' + COALESCE(CAST(ProgramEducationOrganizationId AS VARCHAR (10)), '') +
            ', ProgramName: ' + COALESCE(CAST(ProgramName AS VARCHAR (60)), '') +
            ', RevisedWrittenLearningPlanDate: ' + COALESCE(CAST(RevisedWrittenLearningPlanDate AS VARCHAR (10)), '') +
            ', MonthDescriptorId: ' + COALESCE(CAST(MonthDescriptorId AS VARCHAR (10)), '') +
            ', [SatisfactoryProgress]: ' + COALESCE(CAST([SatisfactoryProgress] AS VARCHAR (10)), '')
      FROM [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate] WITH (NOLOCK)
     WHERE StudentUSI = @studentUSI

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