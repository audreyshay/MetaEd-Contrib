CREATE VIEW [dashboard].[AzEDSLocalEducationAgencies]
	AS 

	select distinct eo.EducationOrganizationId as LocalEducationAgencyId, eo.NameOfInstitution 
	from entity.SISVendorLocalEducationAgency  sislea
	join entity.EducationOrganization eo 
		on eo.EducationOrganizationId = sislea.LocalEducationAgencyId
	   and eo.FiscalYear = sislea.FiscalYear
	join config.Fiscalyear fy 
		on fy.FiscalYear = eo.Fiscalyear
		and fy.IsCurrent = 1
	where sislea.OnAzEDS = 1

GO

