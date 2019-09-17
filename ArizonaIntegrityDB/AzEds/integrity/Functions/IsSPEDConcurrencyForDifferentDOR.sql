
/**************************************************************************
** Script Name:IsSPEDConcurrencyForDifferentDOR
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**				Student is concurrently enrolled in 2 Program for different DOR 
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
**
** Revision History: Created - Amit Verma - 04/08/2015
** Amit Verma				12/16/2015		Updated the Join condition (Added FiscalYear)
**
**************************************************************************/

CREATE FUNCTION [integrity].[IsSPEDConcurrencyForDifferentDOR] 
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
		--SET @StudentUSI =	3319
		--SET @FiscalYear = 2015
		--SET @SchoolId = 4711
		--------------------------------------------

		DECLARE @ISSPEDCONCURRENTLYENROLLEDFORDIFFDOR	BIT

		IF(SELECT COUNT (*) 
                 FROM   (
			   SELECT SSEPA.StudentUSI, 
                                  SSEPA.BeginDate, 
                                  SPA.EndDate, 
                                  SEOA.EducationOrganizationId,
								  SPA.EducationOrganizationId AS SchoolId,
								  SPA.FiscalYear
                           FROM   leadata.StudentProgramAssociation SPA 
                                  INNER JOIN leadata.StudentSpecialEducationProgramAssociation SSEPA 
                                          ON SPA.StudentUSI = SSEPA.StudentUSI 
                                             AND SPA.ProgramTypeId = SSEPA.ProgramTypeId 
                                             AND SPA.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId 
                                             AND SPA.BeginDate = SSEPA.BeginDate 
                                             AND SPA.ProgramName = SSEPA.ProgramName 
                                             AND SPA.EducationOrganizationId = SSEPA.EducationOrganizationId 
											 AND SPA.FiscalYear = SSEPA.FiscalYear
                                  INNER JOIN leadata.StudentSchoolAssociationLocalEducationAgency SEOA 
		  		                          ON SEOA.SchoolId = SPA.EducationOrganizationId 
		  			                         AND SEOA.StudentUSI = SPA.StudentUSI   
											 AND SEOA.FiscalYear = SPA.FiscalYear
                           WHERE  SPA.StudentUSI = @StudentUSI 
                                  AND SPA.ProgramTypeId = 6
								  AND SPA.FiscalYear = @FiscalYear
							) SPEA1 
                INNER JOIN 
						 
						  (
						  SELECT SSEPA.StudentUSI, 
                                  SSEPA.BeginDate, 
                                  SPA.EndDate, 
                                  SEOA.EducationOrganizationId,
								  SPA.EducationOrganizationId AS SchoolId,
								  SPA.FiscalYear
                            FROM   leadata.StudentProgramAssociation SPA 
                                   INNER JOIN leadata.StudentSpecialEducationProgramAssociation SSEPA 
                                          ON SPA.StudentUSI = SSEPA.StudentUSI 
                                             AND SPA.ProgramTypeId = SSEPA.ProgramTypeId 
                                             AND SPA.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId 
                                             AND SPA.BeginDate = SSEPA.BeginDate 
                                             AND SPA.ProgramName = SSEPA.ProgramName 
                                             AND SPA.EducationOrganizationId = SSEPA.EducationOrganizationId 
											 AND SPA.FiscalYear = SSEPA.FiscalYear
                                   INNER JOIN leadata.StudentSchoolAssociationLocalEducationAgency SEOA 
		  		                          ON SEOA.SchoolId = SPA.EducationOrganizationId 
		  			                         AND SEOA.StudentUSI = SPA.StudentUSI 
											 AND SEOA.FiscalYear = SPA.FiscalYear
                            WHERE  SPA.StudentUSI = @StudentUSI 
                                    AND SPA.ProgramTypeId = 6
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
                     AND SPEA1.EducationOrganizationId <> SPEA2.EducationOrganizationId
					 AND SPEA1.SchoolId <> SPEA2.SchoolId
					 AND SPEA1.SchoolId = @SchoolId
					 ) >=1

			BEGIN
				SET @ISSPEDCONCURRENTLYENROLLEDFORDIFFDOR = 1
			END
		ELSE
			BEGIN
				SET @ISSPEDCONCURRENTLYENROLLEDFORDIFFDOR = 0
			END

		RETURN @ISSPEDCONCURRENTLYENROLLEDFORDIFFDOR

	END