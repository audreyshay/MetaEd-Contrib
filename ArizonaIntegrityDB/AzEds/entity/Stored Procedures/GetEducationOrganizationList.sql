/************************************************************
**Procedure Name: entity.GetEducationOrganizationList
**
**Author: Pallavi Mecconda
**
**Description:  Gets list of Ed Org filtered by FiscalYear
**	
**Revision History:
**	Who			When		What
**	PM			06/03/2015	Initial Creation
**	CM			01/05/2016	Changed to incorporate extra fields needed by ACE.  
**							FiscalYear parameter passed as NULL will grab all years.  FiscalYear paramater passed as 0 or no parameter at all will grab current year.
**
***************************************************************/
CREATE PROC [entity].[GetEducationOrganizationList] 
      @fiscalYear INT = 0
	 ,@includeInactive BIT = 0
AS
BEGIN

	SET NOCOUNT ON;

	-- when fiscal year is not passed (null), get all years.  
	-- when fiscal year is passed as 0 or not passed as a parameter at all, it will get current year from fiscalYear table.
	IF @fiscalYear = 0
	BEGIN
		SELECT @fiscalYear = FiscalYear 
		FROM config.FiscalYear
		WHERE IsCurrent = 1
	END

	SELECT 
		EO.EducationOrganizationId,
		EO.CTDS,
		EO.NameOfInstitution,
		S.LocalEducationAgencyId,
		EO_LEA.NameOfInstitution as LocalEducationAgencyName,
		EO_LEA.CTDS as LocalEducationAgencyCTDS,
		CONVERT(BIT, CASE
						WHEN S.SchoolId IS NULL THEN 0
						ELSE  1
					 END) AS IsSchool,
		EO.FiscalYear,
		EO.OperationalStatusTypeId,
		EO.OperationalStatusEffectiveDate,
		OST.IsActive
	FROM 
		entity.EducationOrganization EO
		INNER JOIN entity.OperationalStatusType OST
		ON EO.OperationalStatusTypeId =  OST.OperationalStatusTypeId
		LEFT OUTER JOIN entity.School S ON
			(EO.EducationOrganizationId = S.SchoolId AND
			 EO.FiscalYear = s.FiscalYear)
		LEFT OUTER JOIN entity.EducationOrganization EO_LEA ON
			(EO_LEA.EducationOrganizationId = S.LocalEducationAgencyId AND
			 EO_LEA.FiscalYear = S.FiscalYear)
	WHERE
		(EO.FiscalYear = ISNULL(@fiscalYear, '') OR (@fiscalYear IS NULL AND EO.FiscalYear IS NOT NULL))
		AND 
		(ISNULL(@includeInactive, 0)=1 OR OST.IsActive = 1)

END
