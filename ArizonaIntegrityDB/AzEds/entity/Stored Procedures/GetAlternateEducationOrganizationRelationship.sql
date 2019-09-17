/************************************************************
**Procedure Name: entity.GetAlternateEducationOrganizationRelationship
**
**Author: Kalyani Kankatala
**
**Description:  Gets the AlternateEducationOrganizationRelationship
**	
**Revision History:
**	Who			When		What
**	KK		07/10/2015	Initial Creation
**
***************************************************************/
CREATE PROC [entity].[GetAlternateEducationOrganizationRelationship] 
   
AS
BEGIN

	SELECT 
	ParentEducationOrganizationId,DependentEducationOrganizationId,AlternateEducationOrganizationRelationshipTypeId,FiscalYear 
	FROM entity.AlternateEducationOrganizationRelationship
	 
			
END
