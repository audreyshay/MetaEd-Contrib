

/**************************************************************************
** Script Name:IsProgramConcurrentlyEnrolled
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**				Student is concurrently enrolled in 2 Program based on the 
**              StudentUSI, EducationOrganizationId and ProgramType.
**
** Input: @StudentUSI			    INT
**        @EducationOrganization	INT
**		  @ProgramType			    INT
** 
** Output: BIT
**
** Returns: BIT
**
** Implementation:
** 
**
** Revision History: Created - Amit Verma - 03/31/2015
** Amit Verma    12/16/2015    Updated the Join condition (Added FiscalYear)
** 
**
**************************************************************************/

CREATE FUNCTION [integrity].[IsProgramConcurrentlyEnrolled] 
(
	@StudentUSI			    INT
   ,@EducationOrganization	INT
   ,@ProgramType			INT
   ,@FiscalYear             INT
)
RETURNS BIT
AS
	BEGIN

		-- Test Data -------------------------------
		--DECLARE @StudentUSI			INT
		--DECLARE @EducationOrganization			INT
		--DECLARE @ProgramType			INT
		--DECLARE @FiscalYear INT
		--SET @StudentUSI =	3205		
		--SET @EducationOrganization = 4711
		--SET @ProgramType = 1	
		--SET @FiscalYear=2015
		--------------------------------------------

		DECLARE @ISCONCURRENTLYENROLLED	BIT

		IF((SELECT COUNT(*) 
			  FROM leadata.StudentProgramAssociation SPA1
			      INNER JOIN leadata.StudentProgramAssociation SPA2
				     ON (SPA1.BeginDate < SPA2.EndDate OR SPA2.EndDate IS NULL)
                      AND  (SPA1.EndDate >= SPA2.BeginDate OR SPA1.EndDate IS NULL)
				      AND  SPA1.StudentUSI = SPA2.StudentUSI
				      AND SPA1.EducationOrganizationId = SPA2.EducationOrganizationId
				      AND SPA1.ProgramTypeId = SPA2.ProgramTypeId
					  AND SPA1.FiscalYear = SPA2.FiscalYear
				      WHERE SPA1.StudentUSI = @StudentUSI
				      AND SPA1.EducationOrganizationId = @EducationOrganization
				      AND SPA1.ProgramTypeId = @ProgramType
					  AND SPA1.FiscalYear = @FiscalYear)>2)

			BEGIN
				SET @ISCONCURRENTLYENROLLED = 1
			END
		ELSE
			BEGIN
				SET @ISCONCURRENTLYENROLLED = 0
			END

		RETURN @ISCONCURRENTLYENROLLED

	END

