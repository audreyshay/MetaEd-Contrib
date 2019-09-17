/**************************************************************************
** Script Name:MultipleMainSPEDSchool
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**				Student is concurrently enrolled in 2 Program for EducationOrganization 
**              based on the StudentUSI and ProgramType.
**
** Input: @StudentUSI			    INT
**        @NeedCategoryType	        INT
**        @FiscalYear               INT
** 
** Output: VARCHAR(MAX)
**
** Returns: VARCHAR(MAX)
**
** Implementation:
** 
**
** Revision History: Created - Amit Verma - 04/08/2015
** Fixed logic and modified to return the list of schools
** Amit Verma    12/16/2015    Updated the Join condition (Added FiscalYear)
** Amit Verma    03/14/2016    Updated the Join Predicates for performance tunning (Moved them from WHERE to Join)
**
**************************************************************************/

CREATE FUNCTION [integrity].[MultipleMainSPEDSchool] 
(
	@StudentUSI			     INT
   ,@EducationOrganizationId INT
   ,@FiscalYear              INT
)
RETURNS VARCHAR(MAX)
AS
	BEGIN

		------ Test Data -------------------------------
		--DECLARE @StudentUSI			   INT
		--DECLARE @EducationOrganizationId INT 
		--DECLARE @FiscalYear              INT
		--SET @StudentUSI =	19846
		--SET @EducationOrganizationId = 5861
		--SET @FiscalYear = 2016
		------------------------------------------------


		
				DECLARE @listStr VARCHAR(MAX)
				SELECT @listStr = COALESCE(@listStr+',' ,'') + replace((replace(SPEA2.NameOfInstitution, '(', '')), ')', '')  + ' (' + CAST(SPEA2.EducationOrganizationId as VARCHAR(100)) + ')'
                   FROM   

						  (SELECT DISTINCT EO.NameOfInstitution,
										   SPA.EducationOrganizationId
                                      FROM   leadata.StudentProgramAssociation SPA 
                          INNER JOIN leadata.StudentSpecialEducationProgramAssociation SSEPA 
                                  ON SPA.StudentUSI = SSEPA.StudentUSI 
                                     AND SPA.ProgramTypeId = SSEPA.ProgramTypeId 
                                     AND SPA.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId 
                                     AND SPA.BeginDate = SSEPA.BeginDate 
                                     AND SPA.ProgramName = SSEPA.ProgramName 
                                     AND SPA.EducationOrganizationId = SSEPA.EducationOrganizationId
									 AND SPA.FiscalYear = SSEPA.FiscalYear
									 AND SPA.ProgramTypeId = 6 
									 AND SSEPA.MainSPEDSchool = 1 
						  INNER JOIN entity.EducationOrganization EO 
						          ON EO.EducationOrganizationId = SPA.EducationOrganizationId
								     AND EO.FiscalYear = SPA.FiscalYear
                          WHERE  SPA.StudentUSI = @StudentUSI 
						         AND SPA.FiscalYear = @FiscalYear 
								 AND SSEPA.EducationOrganizationId <> @EducationOrganizationId
											 ) SPEA2 
				IF((ISNULL(@listStr,''))<>'')
					SELECT @listStr = COALESCE(@listStr+',' ,'') + replace((replace(NameOfInstitution, '(', '')), ')', '')  + ' (' +  CAST(@EducationOrganizationId AS VARCHAR(100)) + ')' FROM 
					(SELECT DISTINCT NameOfInstitution FROM entity.EducationOrganization WHERE EducationOrganizationId=@EducationOrganizationId) E
				RETURN @listStr


	END

GO


