/**************************************************************************
** Script Name:SameGradeForSPEDConcurrencyForSameDOA
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**				Student is concurrently enrolled in 2 Program with same Grade 
**              for different DOA based on the StudentUSI and ProgramType.
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
**
** Revision History: Created - Amit Verma - 04/08/2015
** 
** Amit Verma		12/17/2015			Added the missing predicate on 
**										StudenSchoolAssociation Join
**
**************************************************************************/

CREATE FUNCTION [Integrity].[SameGradeForSPEDConcurrencyForSameDOA] 
(
	@StudentUSI			    INT
   ,@FiscalYear             INT
   ,@SchoolId               INT
)
RETURNS BIT
AS
	BEGIN

		-- Test Data -------------------------------
		--DECLARE @StudentUSI			INT
		--DECLARE @FiscalYear           INT
		--DECLARE @SchoolId             INT
		--SET @StudentUSI =	46602106
		--SET @FiscalYear = 2015
		--SET @SchoolId = 4711
		--------------------------------------------

		DECLARE @SAMEGRADEFORSPEDCONCURRENCYFORSAMEDOA	BIT

		IF(SELECT COUNT (*) 
                   FROM   (SELECT SSEPA.StudentUSI, 
                                  SSEPA.BeginDate, 
                                  SPA.EndDate, 
                                  SCH.LocalEducationAgencyId,
								  SSA.EntryGradeLevelDescriptorId,
								  SSA.FiscalYear
                           FROM   leadata.StudentProgramAssociation SPA 
                                  INNER JOIN leadata.StudentSpecialEducationProgramAssociation SSEPA 
                                          ON SPA.StudentUSI = SSEPA.StudentUSI 
                                             AND SPA.ProgramTypeId = SSEPA.ProgramTypeId 
                                             AND SPA.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId 
                                             AND SPA.BeginDate = SSEPA.BeginDate 
                                             AND SPA.ProgramName = SSEPA.ProgramName 
                                             AND SPA.EducationOrganizationId = SSEPA.EducationOrganizationId 
											 AND SPA.FiscalYear = SSEPA.FiscalYear
                                  INNER JOIN entity.School SCH 
		  		                          ON SCH.SchoolId = SPA.EducationOrganizationId  
										     AND SCH.FiscalYear = SPA.FiscalYear
								  INNER JOIN leadata.StudentSchoolAssociation SSA 
		  		                          ON SCH.SchoolId = SSA.SchoolId
										     AND SCH.FiscalYear = SSA.FiscalYear
											 AND SPA.StudentUSI = SSA.StudentUSI
                           WHERE  SPA.StudentUSI = @StudentUSI 
                                  AND SPA.ProgramTypeId = 6
								  AND SPA.EducationOrganizationId = @SchoolId
								  AND SPA.FiscalYear = @FiscalYear
							) SPEA1 
                INNER JOIN 
						  (SELECT SSEPA.StudentUSI, 
                                  SSEPA.BeginDate, 
                                  SPA.EndDate, 
                                  SCH.LocalEducationAgencyId,
								  SSA.EntryGradeLevelDescriptorId,
								  SSA.FiscalYear 
                            FROM   leadata.StudentProgramAssociation SPA 
                                   INNER JOIN leadata.StudentSpecialEducationProgramAssociation SSEPA 
                                          ON SPA.StudentUSI = SSEPA.StudentUSI 
                                             AND SPA.ProgramTypeId = SSEPA.ProgramTypeId 
                                             AND SPA.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId 
                                             AND SPA.BeginDate = SSEPA.BeginDate 
                                             AND SPA.ProgramName = SSEPA.ProgramName 
                                             AND SPA.EducationOrganizationId = SSEPA.EducationOrganizationId 
											 AND SPA.FiscalYear = SSEPA.FiscalYear
                                   INNER JOIN entity.School SCH 
		  		                          ON SCH.SchoolId = SPA.EducationOrganizationId 
										     AND SCH.FiscalYear = SPA.FiscalYear
								   INNER JOIN leadata.StudentSchoolAssociation SSA 
		  		                          ON SCH.SchoolId = SSA.SchoolId
										     AND SCH.FiscalYear = SSA.FiscalYear
											 AND SPA.StudentUSI = SSA.StudentUSI
                            WHERE  SPA.StudentUSI = @StudentUSI 
                                    AND SPA.ProgramTypeId = 6
								    AND SPA.EducationOrganizationId = @SchoolId
									AND SPA.FiscalYear = @FiscalYear
							) SPEA2 
                  ON ( SPEA2.BeginDate >= SPEA1.BeginDate 
                       AND SPEA2.BeginDate <= ISNULL(SPEA1.EndDate, Cast(Cast(@FiscalYear AS VARCHAR(4)) + '-06-30' AS DATE)) 
                        OR ( SPEA1.BeginDate >= SPEA2.BeginDate 
                        AND SPEA1.BeginDate <= ISNULL(SPEA2.EndDate, Cast(Cast(@FiscalYear AS VARCHAR(4)) + '-06-30' AS DATE)) 
					        ) 
					  ) 
                     AND SPEA1.StudentUSI = SPEA2.StudentUSI 
					 AND SPEA1.FiscalYear = SPEA2.FiscalYear
					 AND SPEA1.EntryGradeLevelDescriptorId = SPEA2.EntryGradeLevelDescriptorId 
                     AND SPEA1.LocalEducationAgencyId = SPEA2.LocalEducationAgencyId) >=1

			BEGIN
				SET @SAMEGRADEFORSPEDCONCURRENCYFORSAMEDOA = 1
			END
		ELSE
			BEGIN
				SET @SAMEGRADEFORSPEDCONCURRENCYFORSAMEDOA = 0
			END

		RETURN @SAMEGRADEFORSPEDCONCURRENCYFORSAMEDOA

	END
GO


