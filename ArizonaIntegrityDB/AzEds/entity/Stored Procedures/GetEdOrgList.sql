
CREATE PROC [entity].[GetEdOrgList] 
AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
		EO.EducationOrganizationId,
		EO.FiscalYear,
		EO.OperationalStatusTypeId,
		EO.OperationalStatusEffectiveDate,
		OST.IsActive
	FROM 
		entity.EducationOrganization EO
		INNER JOIN entity.OperationalStatusType OST	ON 
			EO.OperationalStatusTypeId =  OST.OperationalStatusTypeId
		JOIN config.FiscalYear fy ON eo.FiscalYear = fy.FiscalYear AND fy.IsActive = 1
END