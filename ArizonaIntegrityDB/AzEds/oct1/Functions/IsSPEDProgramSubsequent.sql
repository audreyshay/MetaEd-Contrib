/***************************************************************************************
** Script Name: oct1.IsSPEDProgramSubsequent
**
** Author: Pratibha kanyar
** 
** Description: Retrieves a bit indicating whether or not the identified 
**				Student is subsequently enrolled in 2 Program in a school 
**              based on the StudentUSI and ProgramType.
**
** Input: @StudentUSI			    INT
**        @NeedCategoryType	        INT
**        @FiscalYear               INT
** 
** Output: BIT
**
** Returns: BIT
**
** Implementation:
**
** Revision History:
** P Kanyar    11/21/2016    Initial creation
** P Kanyar    07/31/2017    Enhancement to look for subsequent SPED pgm across schools
**
****************************************************************************************/
CREATE FUNCTION [oct1].[IsSPEDProgramSubsequent] 
(
	@StudentUSI			    INT
   ,@FiscalYear             INT
   ,@SchoolId               INT
)
RETURNS BIT
AS
	BEGIN

		-- Test Data -------------------------------
		--DECLARE @StudentUSI			INT  =  48878213 --48878272 
		--DECLARE @FiscalYear           INT	 = 2017
		--DECLARE @SchoolId             INT	 = 85932   --4780 
		--------------------------------------------
	--October 1 Child Count Rules – Student with ProgramEndDate on last instructional day before Oct 1, the subsequent program begin date at new School on the first 
	--instructional day after Oct 1, and Oct 1 is non-instructional – should be counted.

		DECLARE @IsSPEDProgramSubsequent	BIT
		IF(SELECT COUNT (*) 
                 FROM   (
						   SELECT ssepa.StudentUSI, 
                                  ssepa.BeginDate, 
                                  spa.EndDate, 
								  spa.EducationOrganizationId AS SchoolId,
								  spa.FiscalYear
                           FROM   leadata.StudentProgramAssociation spa 
                                  INNER JOIN leadata.StudentSpecialEducationProgramAssociation ssepa 
                                          ON spa.StudentUSI = ssepa.StudentUSI 
                                             AND spa.ProgramTypeId = ssepa.ProgramTypeId 
                                             AND spa.ProgramEducationOrganizationId = ssepa.ProgramEducationOrganizationId 
                                             AND spa.BeginDate = ssepa.BeginDate 
                                             AND spa.ProgramName = ssepa.ProgramName 
                                             AND spa.EducationOrganizationId = ssepa.EducationOrganizationId 
											 AND spa.FiscalYear = ssepa.FiscalYear
                           WHERE  spa.StudentUSI = @StudentUSI 
                                  AND spa.ProgramTypeId = 6
								  AND spa.FiscalYear = @FiscalYear
								  AND spa.EducationOrganizationId = @SchoolId
						) spa1 
                INNER JOIN 
						 
						(
						  SELECT ssepa.StudentUSI, 
                                  ssepa.BeginDate, 
                                  spa.EndDate, 
								  spa.EducationOrganizationId AS SchoolId,
								  spa.FiscalYear
                            FROM   leadata.StudentProgramAssociation spa 
                                   INNER JOIN leadata.StudentSpecialEducationProgramAssociation ssepa 
                                          ON spa.StudentUSI = ssepa.StudentUSI 
                                             AND spa.ProgramTypeId = ssepa.ProgramTypeId 
                                             AND spa.ProgramEducationOrganizationId = ssepa.ProgramEducationOrganizationId 
                                             AND spa.BeginDate = ssepa.BeginDate 
                                             AND spa.ProgramName = ssepa.ProgramName 
                                             AND spa.EducationOrganizationId = ssepa.EducationOrganizationId 
											 AND spa.FiscalYear = ssepa.FiscalYear
                            WHERE  spa.StudentUSI = @StudentUSI 
                                    AND spa.ProgramTypeId = 6
									AND spa.FiscalYear = @FiscalYear
						) spa2 
                  ON 
					 ( spa2.BeginDate > spa1.BeginDate 
                       AND spa2.BeginDate > ISNULL(spa1.EndDate, CONVERT(DATE,CONVERT(VARCHAR(4), @FiscalYear-1 ) + '-06-30' )) 
                        OR ( spa1.BeginDate > spa2.BeginDate 
								AND spa1.BeginDate > ISNULL(spa2.EndDate, CONVERT(DATE,CONVERT(VARCHAR(4), @FiscalYear-1 ) + '-06-30' ))
					       ) 
					  ) 
                     AND spa1.StudentUSI = spa2.StudentUSI 
					 AND spa1.FiscalYear = spa2.FiscalYear
			) >=1

				SET @IsSPEDProgramSubsequent = 1
		ELSE
				SET @IsSPEDProgramSubsequent = 0

	RETURN @IsSPEDProgramSubsequent
	END