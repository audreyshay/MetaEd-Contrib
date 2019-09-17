/**************************************************************************
** Script Name:ELLProgramHasSubsequentSPED
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**				ELL has Subsequent SPED Program based on the StudentUSI 
**              and EducationOrganizationId.
**
** Input: @StudentUSI			    INT
**        @EducationOrganization	INT
** 
** Output: BIT
**
** Returns: BIT
**
** Implementation:
** 
**
** Revision History: Created - Amit Verma - 04/08/2015
** Amit Verma    12/16/2015    Updated the Join condition (Added FiscalYear)
**
**************************************************************************/

CREATE FUNCTION [Integrity].[ELLProgramHasSubsequentSPED] 
(
	@StudentUSI			     INT
   ,@EducationOrganizationId INT
   
)
RETURNS BIT
AS
	BEGIN

		-- Test Data -------------------------------
		--DECLARE @StudentUSI			        INT
		--DECLARE @EducationOrganizationId		INT
		--SET @StudentUSI =	46602105	
		--SET @EducationOrganizationId = 4711
		--------------------------------------------

		DECLARE @ELLProgramHasSubsequentSPED	BIT

		IF((SELECT COUNT(*)
			  FROM leadata.StudentProgramAssociation SPA1
			      INNER JOIN leadata.StudentProgramAssociation SPA2 
				  ON SPA1.StudentUSI = SPA2.StudentUSI
				    AND SPA1.EducationOrganizationId = SPA2.EducationOrganizationId
					AND SPA1.FiscalYear = SPA2.FiscalYear
					AND SPA1.EducationOrganizationId = @EducationOrganizationId
				    AND SPA1.ProgramTypeId = 1
					AND SPA2.ProgramTypeId = 6
					AND SPA1.ReasonExitedDescriptorId = 10172
			WHERE SPA1.StudentUSI = @StudentUSI
			  AND SPA1.EndDate = SPA2.BeginDate)>=1)

			BEGIN
				SET @ELLProgramHasSubsequentSPED = 1
			END
		ELSE
			BEGIN
				SET @ELLProgramHasSubsequentSPED = 0
			END

		RETURN @ELLProgramHasSubsequentSPED

	END
GO


