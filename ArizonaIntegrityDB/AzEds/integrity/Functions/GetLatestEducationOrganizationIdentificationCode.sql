/**************************************************************************
** Script Name:GetLatestEducationOrganizationIdentificationCode
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a Latest LEA IdentificationCode in 
**              edfi.EducationOrganizationIdentificationCode Table.
**
** Input: @SchoolId							    INT
** 
** Output: IdentificationCode NVARCHAR(60)
**
** Returns: IdentificationCode NVARCHAR(60)
**
** Implementation:
** 
**
** Revision History: Created - Amit Verma - 12/30/2014
** 
**
**************************************************************************/

CREATE FUNCTION [Integrity].[GetLatestEducationOrganizationIdentificationCode]
(
	@SchoolId INT 
)
RETURNS NVARCHAR(60)
AS
BEGIN

	DECLARE @EducationOrganizationIdentificationCode NVARCHAR(60)
	
	SELECT @EducationOrganizationIdentificationCode = LTRIM(RTRIM(dors.CTDS)) 
	FROM   entity.EducationOrganization dors 
	WHERE  dors.EducationOrganizationId = @SchoolId 
			  			
	-- Return the result of the function
	RETURN @EducationOrganizationIdentificationCode

END