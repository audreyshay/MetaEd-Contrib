
/**************************************************************************************
**Function Name: [StudentAnalysis].[GetEdorglist]
**
**Author: Pratibha Kanyar
**
**Description: Gets list of LEAs based on comma separated list of schools/ districts
**	
**Revision History:
**	Who			When		What
**  P Kanyar	02/16/2017  Initial Creation
**  P Kanyar	03/09/2017  Changed the logic to pull Districts for user with 
**							permissions for multiple entities( both school and distrcit)
**
***************************************************************************************/
CREATE
 FUNCTION [StudentAnalysis].[GetLocalEducationAgencyIdList]
  ( 
	@permittedEdOrgs NVARCHAR(MAX),
	 @FiscalYear INT
  )
RETURNS 
	@LocalEducationAgencyIdList TABLE 
	( LocalEducationAgencyId INT
	)

AS
BEGIN
	IF EXISTS (SELECT 1 FROM [util].[Split](@permittedEdOrgs,',') pe
				JOIN [entity].[vw_School] ON schoolid = pe.token
					AND FiscalYear = @FiscalYear 
			  ) 
		BEGIN
			INSERT INTO @LocalEducationAgencyIdList
				SELECT LocalEducationAgencyId
				FROM [entity].[vw_School] sc
				JOIN [util].[Split](@permittedEdOrgs,',') pe  
					ON sc.SchoolId = pe.Token
						AND sc.FiscalYear = @FiscalYear
				UNION

				SELECT lea.localeducationAgencyid
				FROM [util].[Split](@permittedEdOrgs,',') pe
				JOIN [entity].[vw_LocalEducationAgency] lea 
					ON  pe.token = lea.LocalEducationAgencyId
						AND lea.FiscalYear = @FiscalYear
		END
	ELSE
		BEGIN
			INSERT INTO @LocalEducationAgencyIdList
				SELECT TOKEN
				FROM [util].[Split](@permittedEdOrgs,',') pe
		END

  RETURN
END