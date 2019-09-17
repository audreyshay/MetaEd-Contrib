/************************************************************
**Procedure Name: entity.GetAlternateEducationOrganizationRelationshipType
**
**Author: Kalyani Kankatala
**
**Description:  Gets the AlternateEducationOrganizationRelationshipType
**	
**Revision History:
**	Who			When		What
**	KK		07/10/2015	Initial Creation
**
***************************************************************/
CREATE PROC [entity].[GetAlternateEducationOrganizationRelationshipType] 
   
AS
BEGIN
   
    SELECT
    AlternateEducationOrganizationRelationshipTypeId,CodeValue,Description  
    FROM entity.AlternateEducationOrganizationRelationshipType
	 
			
END