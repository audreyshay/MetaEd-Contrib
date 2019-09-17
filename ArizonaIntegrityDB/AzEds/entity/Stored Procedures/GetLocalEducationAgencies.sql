  
/************************************************************  
**Procedure Name: entity.GetLocalEducationAgencies  
**  
**Author: Kalyani Kankatala  
**  
**Description:  Gets all the local education agencies
**   
**Revision History:  
** Who   When  What  
** KK  07/22/2015 Initial Creation 
** PM	8/20/2015 Added Has200DayCalendar column in select 
**  
***************************************************************/  
CREATE PROC [entity].[GetLocalEducationAgencies]   
     
AS  
BEGIN  
  
 SELECT  
		  LocalEducationAgencyId
		  , la.FiscalYear
		  , LocalEducationAgencyCategoryTypeId
		  , SectorTypeId
		  , IsOutOfState
		  , IsAccommodationDistrict
		  , IsSecureCare
		  , IsExceptional
		  , IsHeadStart
		  , IsValidForDOR
		  , IsTransportation
		  , IsElementaryNotInHighSchool
		  , IsHighSchoolDistrict
		  , Has200DayCalendar
  FROM 
 entity.LocalEducationAgency la
     JOIN config.FiscalYear fy ON la.FiscalYear = fy.FiscalYear AND fy.IsActive = 1
     
END