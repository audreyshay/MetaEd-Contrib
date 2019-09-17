
/**************************************************************************
** Script Name:IsSPEDConcurrencyForSameDOA
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**              Student is concurrently enrolled in 2 Program for Same DOA 
**              based on the StudentUSI and ProgramType.
**
** Input: @StudentUSI                        INT
**        @NeedCategoryType         INT
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
** Amit Verma    12/16/2015    Updated the Join condition (Added FiscalYear)
** 
**
**************************************************************************/

CREATE FUNCTION [Integrity].[IsSPEDConcurrencyForSameDOA] 
(
    @StudentUSI             INT
   ,@FiscalYear             INT
   ,@SchoolId               INT
)
RETURNS BIT
AS
       BEGIN

              -- Test Data -------------------------------
              --DECLARE @StudentUSI             INT
                    --DECLARE @FiscalYear     INT
                    --DECLARE @SchoolId       INT
                    --SET @StudentUSI =  46602106
                    --SET @FiscalYear =   2015
                    --SET @SchoolId =     4711
              --------------------------------------------

              DECLARE @ISSPEDCONCURRENTLYENROLLEDFORSAMEDOA   BIT

              IF(SELECT COUNT (*) 
                   FROM   (SELECT SSEPA.StudentUSI, 
                                  SSEPA.BeginDate, 
                                  SPA.EndDate, 
                                  S.LocalEducationAgencyId,
                                  SPA.EducationOrganizationId AS SchoolId,
                                  SPA.ProgramName,
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
                                  INNER JOIN entity.School S 
                                          ON SSEPA.EducationOrganizationId = S.SchoolId 
										     AND SSEPA.FiscalYear = S.FiscalYear
                           WHERE  SPA.StudentUSI = @StudentUSI 
                                  AND SPA.ProgramTypeId = 6
								  AND SPA.FiscalYear = @FiscalYear
								  ) SPEA1 
                          INNER JOIN (SELECT SSEPA.StudentUSI, 
                                             SSEPA.BeginDate, 
                                             SPA.EndDate, 
                                             S.LocalEducationAgencyId,
											 SPA.EducationOrganizationId AS SchoolId,
                                             SPA.ProgramName,
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
                                      INNER JOIN entity.School S 
                                              ON SSEPA.EducationOrganizationId = S.SchoolId
											     AND SSEPA.FiscalYear = S.FiscalYear 
                                      WHERE  SPA.StudentUSI = @StudentUSI 
                                             AND SPA.ProgramTypeId = 6
											 AND SPA.FiscalYear = @FiscalYear
											 ) SPEA2 
                          ON ( SPEA2.BeginDate >= SPEA1.BeginDate 
                               AND SPEA2.BeginDate <= ISNULL(SPEA1.EndDate, Cast(Cast(@FiscalYear AS VARCHAR(4)) + '-06-30' AS DATE)) 
                               OR ( SPEA1.BeginDate >= SPEA2.BeginDate 
                               AND SPEA1.BeginDate <= ISNULL(SPEA2.EndDate, Cast(Cast(@FiscalYear AS VARCHAR(4)) + '-06-30' AS DATE)) ) ) 
                             AND SPEA1.StudentUSI = SPEA2.StudentUSI 
                             AND SPEA1.LocalEducationAgencyId = SPEA2.LocalEducationAgencyId
							 AND SPEA1.FiscalYear = SPEA2.FiscalYear
							 AND SPEA1.SchoolId = @SchoolId
							 AND SPEA1.SchoolId <> SPEA2.SchoolId
						     AND SPEA1. ProgramName <> SPEA2.ProgramName) >=1

                     BEGIN
                           SET @ISSPEDCONCURRENTLYENROLLEDFORSAMEDOA = 1
                     END
              ELSE
                     BEGIN
                           SET @ISSPEDCONCURRENTLYENROLLEDFORSAMEDOA = 0
                     END

              RETURN @ISSPEDCONCURRENTLYENROLLEDFORSAMEDOA

       END
