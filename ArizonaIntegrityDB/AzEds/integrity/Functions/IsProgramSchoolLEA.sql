
/**************************************************************************
** Script Name:IsProgramSchoolLEA
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**				Program School is LEA.
**
** Input: @StudentUSI	INT
** 
** Output: BIT
**
** Returns: BIT
**
** Implementation:
** 
**
** Revision History: Created - Amit Verma - 04/14/2015
** Amit Verma    12/16/2015    Updated the Join condition (Added FiscalYear)
** 
**
**************************************************************************/
/* Bring EducationOrganizationId as parameter and then check if that ID exist in edfi.school table. If yes return true else false*/
CREATE FUNCTION [integrity].[IsProgramSchoolLEA] 
(
	 @EducationOrganizationId			    INT,
	 @FiscalYear                            INT
)
RETURNS BIT
AS
	BEGIN

		-- Test Data -------------------------------
		--declare @EducationOrganizationId			INT
		--set @EducationOrganizationId =	4711		
		--------------------------------------------

		DECLARE @IsProgramSchoolLEA	BIT

		IF((SELECT COUNT(*)
		    FROM leadata.StudentProgramAssociation spa
			  INNER JOIN entity.School elea
			      on spa.EducationOrganizationId = elea.SchoolId
				     and spa.FiscalYear = elea.FiscalYear
            WHERE spa.EducationOrganizationId = @EducationOrganizationId
			      and spa.FiscalYear = @FiscalYear
			) >= 1)
			    BEGIN
			    	SET @IsProgramSchoolLEA = 0
			    END
		ELSE
			    BEGIN
			    	SET @IsProgramSchoolLEA = 1
			    END

					--declare @EducationOrganizationId int = 0, @IsProgramSchoolLEA int = 0
	--IF EXISTS (
	--SELECT DISTINCT elea.SchoolId
	--	    FROM leadata.StudentProgramAssociation spa
	--		  INNER JOIN entity.School elea
	--		      ON spa.EducationOrganizationId = elea.SchoolId
	--			     AND spa.FiscalYear = elea.FiscalYear
	--				 AND spa.FiscalYear = @FiscalYear
	--			  WHERE spa.EducationOrganizationId=@EducationOrganizationId) 
	--			  SELECT @IsProgramSchoolLEA=0
	--			  ELSE SELECT @IsProgramSchoolLEA=1
				  
		RETURN @IsProgramSchoolLEA

	END