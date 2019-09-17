
/************************************************************
**Procedure Name: entity.GetSchools
**
**Author: Kalyani Kankatala
**
**Description:  Gets the School data
**	
**Revision History:
**	Who			When		What
**	KK		06/19/2015	Initial Creation
**  KK      07/17/2015  Added more fields
**  PM		08/17/2015	adding IsSecureCare flag
**	PM		08/24/2015	removed IsRegular flag
***************************************************************/
CREATE PROC [entity].[GetSchools] 
  
AS
BEGIN

	SELECT 
			SchoolId
			, s.FiscalYear
			, LocalEducationAgencyId
			, SchoolTypeId
			, SectorTypeId
			, IsOutOfState
			, IsVirtual
			, IsSecureCare
			, IsJuvenile
			, IsHeadStart
			, IsExceptional
			, IsResidentialCenter
			, IsCTECentral
	FROM 
	entity.School s
	JOIN config.FiscalYear fy ON s.FiscalYear = fy.FiscalYear AND fy.IsActive = 1

END



