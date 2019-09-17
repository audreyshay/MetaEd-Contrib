/************************************************************
**Procedure Name: entity.GetInternalStateEducationOrganization
**
**Author: Martez Killens
**
**Description:  Gets the state ed org to concat with the results of 
**                         GetEducationOrganizationList.
**     
**Revision History:
**     Who                  When          What
**     MKillen              04/10/2017    Initial Creation
**
***************************************************************/
CREATE PROCEDURE entity.GetInternalStateEducationOrganization 
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
              EO.FiscalYear,
              EO.OperationalStatusTypeId,
              EO.OperationalStatusEffectiveDate
       FROM 
              entity.EducationOrganization EO
       WHERE
              (EO.FiscalYear = ISNULL(@fiscalYear, '') OR (@fiscalYear IS NULL AND EO.FiscalYear IS NOT NULL))
       AND EO.EducationOrganizationId = 79275

END
