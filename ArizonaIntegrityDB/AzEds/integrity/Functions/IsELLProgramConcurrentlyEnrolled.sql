
/**************************************************************************
** Script Name:IsELLProgramConcurrentlyEnrolled
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**				Student is concurrently enrolled in 2 Program based on the 
**              StudentUSI and ProgramType.
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
** Revision History: Created - Amit Verma - 04/08/2015
** Amit Verma    12/16/2015    Updated the Join condition (Added FiscalYear)
** 
**
**************************************************************************/

CREATE FUNCTION [Integrity].[IsELLProgramConcurrentlyEnrolled] 
(
	@StudentUSI			    INT
   ,@ProgramType			INT
   ,@FiscalYear             INT
)
RETURNS BIT
AS
	BEGIN

		-- Test Data -------------------------------
		--DECLARE @StudentUSI			INT
		--DECLARE @ProgramType			INT
		--DECLARE @FiscalYear           INT
		--SET @StudentUSI =	46602105		
		--SET @ProgramType = 1	
		--SET @FiscalYear = 2015
		--------------------------------------------

		DECLARE @ISELLCONCURRENTLYENROLLED	BIT

		IF((SELECT COUNT(*) 
			  FROM leadata.StudentProgramAssociation SPA1
			      INNER JOIN leadata.StudentProgramAssociation SPA2
				  ON (SPA2.BeginDate >= SPA1.BeginDate 
                    AND  SPA2.BeginDate < ISNULL(SPA1.EndDate,CAST(CAST(@FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))
					OR (SPA1.BeginDate > SPA2.BeginDate 
                    AND  SPA1.BeginDate < ISNULL(SPA2.EndDate,CAST(CAST(@FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))))
			        AND  SPA1.StudentUSI = SPA2.StudentUSI
				    AND SPA1.EducationOrganizationId <> SPA2.EducationOrganizationId
				    AND SPA1.ProgramTypeId = SPA2.ProgramTypeId
					AND SPA1.FiscalYear = SPA2.FiscalYear
			  WHERE SPA1.StudentUSI = @StudentUSI
				    AND SPA1.ProgramTypeId = @ProgramType
					AND SPA1.FiscalYear = @FiscalYear)>1)

			BEGIN
				SET @ISELLCONCURRENTLYENROLLED = 1
			END
		ELSE
			BEGIN
				SET @ISELLCONCURRENTLYENROLLED = 0
			END

		RETURN @ISELLCONCURRENTLYENROLLED

	END