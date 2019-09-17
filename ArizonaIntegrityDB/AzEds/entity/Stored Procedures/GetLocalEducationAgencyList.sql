  
/************************************************************  
**Procedure Name: entity.GetLocalEducationAgencyList  
**  
**Author: Chris Mullert  
**  
**Description:  Gets all the local education agencies with names
**   
***************************************************************/  
CREATE PROC [entity].[GetLocalEducationAgencyList]   
AS  
BEGIN  
  
SELECT lea.[FiscalYear]
	  , [LocalEducationAgencyId]
	  , eo.[NameOfInstitution]
	  , eo.[CTDS]
  FROM [AzEds].[entity].[LocalEducationAgency] lea
  inner join azeds.entity.EducationOrganization eo on lea.FiscalYear = eo.FiscalYear AND lea.LocalEducationAgencyId = eo.EducationOrganizationId
  ORDER BY eo.[NameOfInstitution]
       
END