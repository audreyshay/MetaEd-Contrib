/************************************************************
**Procedure Name: process.InsertSpliStageData
**
**Author: Viju Viswanathan
**
**Description:  Insert possible records to split for a given studentUniqueId
**	
**Revision History:
**	Who			When		What
**	Viju V		01/18/2017	Initial Creation
**	M Killens	02/14/2017	Added Entity Column
***************************************************************/
CREATE PROCEDURE [process].[InsertSplitStageData]
      @studentUniqueId nvarchar(32)
	  ,@SplitDetailId INT
AS
BEGIN

    BEGIN TRY

		DECLARE @studentUSI as INT

		SELECT @studentUSI = StudentUSI 
		  FROM leadata.Student 
		 WHERE StudentUniqueId = @studentUniqueId	 	 	  
	 
		 INSERT INTO [process].[SplitStage]
			([SplitDetailId]
			,[SourceTable]
			,[ParentTable]
			,[SourceId]
			,[Entity])

		 SELECT
			@SplitDetailId
			,'leadata.StudentSchoolAssociationLocalEducationAgency'
			,NULL
			,SourceId
			,EducationOrganizationId
		 FROM [leadata].[StudentSchoolAssociationLocalEducationAgency]
			WHERE StudentUSI = @studentUSI

		 UNION ALL

		 SELECT 
			@SplitDetailId
			,'leadata.StudentNeed'
			,NULL
			,SourceId
			,ReportingEducationOrganizationID
		 FROM [leadata].[StudentNeed] 
		 WHERE StudentUSI = @studentUSI
  
		 UNION ALL

		 SELECT 
			@SplitDetailId
			,'leadata.StudentProgramAssociation'
			,NULL
			,SourceId
			,EducationOrganizationID
		 FROM [leadata].[StudentProgramAssociation]
		 WHERE StudentUSI = @studentUSI
  
		 UNION ALL

		 SELECT 
			@SplitDetailId	
			,'leadata.StudentSchoolAssociationSpecialEnrollment'
			,NULL
			,SourceId
			,SchoolId
		 FROM [leadata].[StudentSchoolAssociationSpecialEnrollment] 
		 WHERE StudentUSI = @studentUSI
  
		 UNION ALL

		 SELECT 
			@SplitDetailId
			,'leadata.StudentSchoolAssociationTuitionPayer'
			,NULL
			,SourceId
			,SchoolId
		 FROM [leadata].[StudentSchoolAssociationTuitionPayer]
		 WHERE StudentUSI = @studentUSI
  
		 UNION ALL

		 SELECT
			@SplitDetailId
			,'leadata.StudentSpecialEducationProgramAssociation'
			,'leadata.StudentProgramAssociation'
			,SourceId
			,spa.EducationOrganizationId
		 FROM [leadata].[StudentProgramAssociation] spa
		 JOIN leadata.StudentSpecialEducationProgramAssociation spepa
		 ON spa.FiscalYear = spepa.FiscalYear 
			AND spa.StudentUSI = spepa.StudentUSI 
			AND spa.ProgramTypeId = spepa.ProgramTypeId 
			AND spa.ProgramName = spepa.ProgramName 
			AND spa.ProgramEducationOrganizationId = spepa.ProgramEducationOrganizationId 
			AND spa.BeginDate = spepa.BeginDate 
			and spa.EducationOrganizationId = spepa.EducationOrganizationId 
		 WHERE spa.StudentUSI = @studentUSI
  
		 UNION ALL

		 SELECT
	
			@SplitDetailId
			,'leadata.StudentSchoolAssociation'
			,NULL
			,SourceId
			,SchoolId
		 FROM [leadata].[StudentSchoolAssociation]
		 WHERE StudentUSI = @studentUSI

		 UNION ALL

		 SELECT
	
			@SplitDetailId
			,'leadata.StudentSchoolAssociationMembershipFTE'
			,NULL
			,SourceId
			,SchoolId
		 FROM [leadata].[StudentSchoolAssociationMembershipFTE] 
		 WHERE StudentUSI = @studentUSI

		 UNION ALL


		 SELECT
			@SplitDetailId
			,'leadata.StudentSchoolAttendanceEvent'
			,NULL
			,SourceId
			,SchoolId
		 FROM [leadata].[StudentSchoolAttendanceEvent]
		 WHERE StudentUSI = @studentUSI

		 UNION ALL

		 SELECT
			@SplitDetailId
			,'leadata.StudentSectionAssociation'
			,NULL
			,SourceId	
			,SchoolId
		 FROM [leadata].[StudentSectionAssociation]
		 WHERE StudentUSI = @studentUSI

		 UNION ALL
		 SELECT
			@SplitDetailId
			,'leadata.StudentDropOutRecoveryProgramAssociation'
			,'leadata.StudentProgramAssociation'
			,SourceId
			,sdorpa.EducationOrganizationId	
		 FROM [leadata].[StudentProgramAssociation] spa
		 JOIN leadata.StudentDropOutRecoveryProgramAssociation sdorpa
		 ON spa.FiscalYear = sdorpa.FiscalYear 
			AND spa.StudentUSI = sdorpa.StudentUSI 
			AND spa.ProgramTypeId = sdorpa.ProgramTypeId 
			AND spa.ProgramName = sdorpa.ProgramName 
			AND spa.ProgramEducationOrganizationId = sdorpa.ProgramEducationOrganizationId 
			AND spa.BeginDate = sdorpa.BeginDate 
			and spa.EducationOrganizationId = sdorpa.EducationOrganizationId 
		 WHERE spa.StudentUSI = @studentUSI


		 UNION ALL
		 SELECT
			@SplitDetailId
			,'leadata.StudentDropOutRecoveryProgramMonthlyUpdate'
			,NULL
			,SourceId	
			,EducationOrganizationId
		 FROM [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate]
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