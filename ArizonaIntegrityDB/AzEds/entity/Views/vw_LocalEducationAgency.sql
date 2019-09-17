CREATE VIEW entity.vw_LocalEducationAgency
	AS 
	
	SELECT 
		lea.LocalEducationAgencyId,            
		lea.FiscalYear,      
		eo.NameOfInstitution as LocalEducationAgencyName,
		eo.CTDS as LocalEducationAgencyCTDS,
		SUBSTRING(LTRIM(eo.CTDS), 1, 2) + '-' + SUBSTRING(LTRIM(eo.CTDS), 3, 2) + '-' + SUBSTRING(LTRIM(eo.CTDS), 5, 2) + '-' + SUBSTRING(LTRIM(eo.CTDS), 7, 3) as FormattedLocalEducationAgencyCTDS,
		eo.OperationalStatusTypeId,
		ost.CodeValue as OperationalStatusCode,
		eo.OperationalStatusEffectiveDate,                  
		lea.LocalEducationAgencyCategoryTypeId,
		leact.CodeValue as LocalEducationAgencyCategoryCode,
		lea.SectorTypeId,                      
		st.CodeValue as SectorTypeCode,
		lea.IsOutOfState,                      
		lea.IsCTE,                             
		lea.IsAccommodationDistrict,           
		lea.IsSecureCare,                      
		lea.IsExceptional,                     
		lea.IsHeadStart,                       
		lea.IsValidForDOR,                     
		lea.IsTransportation,                  
		lea.IsElementaryNotInHighSchool,       
		lea.IsHighSchoolDistrict,              
		lea.Has200DayCalendar
	FROM entity.LocalEducationAgency lea (nolock)
	JOIN entity.EducationOrganization eo (nolock)
		  ON eo.EducationOrganizationId = lea.LocalEducationAgencyId
		 AND eo.FiscalYear = lea.FiscalYear
	LEFT JOIN entity.OperationalStatusType ost (nolock)
		  ON ost.OperationalStatusTypeId = eo.OperationalStatusTypeId
	LEFT JOIN entity.SectorType st (nolock)
		  ON st.SectorTypeId = lea.SectorTypeId 
	LEFT JOIN entity.LocalEducationAgencyCategoryType leact (nolock)
		  ON leact.LocalEducationAgencyCategoryTypeId = lea.LocalEducationAgencyCategoryTypeId
