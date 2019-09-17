CREATE VIEW [entity].[vw_School]
	AS

	SELECT 
		sch.SchoolId,
		sch.FiscalYear,
		scheo.NameOfInstitution as SchoolName,
		scheo.CTDS as SchoolCTDS,
		SUBSTRING(LTRIM(scheo.CTDS), 1, 2) + '-' + SUBSTRING(LTRIM(scheo.CTDS), 3, 2) + '-' + SUBSTRING(LTRIM(scheo.CTDS), 5, 2) + '-' + SUBSTRING(LTRIM(scheo.CTDS), 7, 3) as FormattedSchoolCTDS,
		scheo.OperationalStatusTypeId,
		ost.CodeValue as OperationalStatusCode,
		scheo.OperationalStatusEffectiveDate,
		sch.LocalEducationAgencyId, 
		leaeo.NameOfInstitution as LocalEducationAgencyName,
		leaeo.CTDS as LocalEducationAgencyCTDS,
		SUBSTRING(LTRIM(leaeo.CTDS), 1, 2) + '-' + SUBSTRING(LTRIM(leaeo.CTDS), 3, 2) + '-' + SUBSTRING(LTRIM(leaeo.CTDS), 5, 2) + '-' + SUBSTRING(LTRIM(leaeo.CTDS), 7, 3) as FormattedLocalEducationAgencyCTDS,
		sch.SchoolTypeId, 
		scht.CodeValue as SchoolTypeCode,
		sch.SectorTypeId, 
		st.CodeValue as SectorTypeCode,
		sch.IsOutOfState, 
		sch.IsVirtual, 
		sch.IsSecureCare, 
		sch.IsJuvenile, 
		sch.IsHeadStart, 
		sch.IsExceptional, 
		sch.IsAlternative, 
		sch.IsResidentialCenter, 
		sch.IsCTECentral,
		sch.IsPrivateDaySchool
	FROM entity.School sch (nolock)
	JOIN entity.EducationOrganization scheo (nolock)
		  ON scheo.EducationOrganizationId = sch.SchoolId
		 AND scheo.FiscalYear = sch.FiscalYear
    JOIN entity.EducationOrganization leaeo (nolock)
		  ON leaeo.EducationOrganizationId = sch.LocalEducationAgencyId
		 AND leaeo.FiscalYear = sch.FiscalYear  
	LEFT JOIN entity.OperationalStatusType ost (nolock)
		  ON ost.OperationalStatusTypeId = scheo.OperationalStatusTypeId
	LEFT JOIN entity.SectorType st (nolock)
		  ON st.SectorTypeId = sch.SectorTypeId 
	LEFT JOIN entity.SchoolType scht (nolock)
		  ON scht.SchoolTypeId = sch.SchoolTypeId