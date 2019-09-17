/**************************************************************************
** Script Name:ISNeedApprovedForSchool
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**				Program School is LEA.
**
** Input: @StudentUSI	INT
** 
** Output: BIT
**
** Returns: BIT
**
** Implementation:
** 
**
** Revision History: Created - Amit Verma - 04/14/2015
**	PSharma - 06/15/2015	Changed the logic to pull the Approved need. 
**
**************************************************************************/

CREATE FUNCTION [integrity].[ISNeedApprovedForSchool] 
(
	 @SchoolId			    INT,
	 @Need                VARCHAR(10)
 
)
RETURNS BIT
AS
	BEGIN

		-- Test Data -------------------------------
		--declare @SchoolId			INT
		--declare @Need           VARCHAR(10)
		--set @SchoolId =	4711		
		--set @Need = 'DD'
		--------------------------------------------

		DECLARE @ISNeedApprovedForSchool	BIT

		IF(SELECT COUNT(*) FROM (
		                         SELECT s.SchoolId
									FROM entity.School s
										INNER JOIN entity.ApprovedNeeds an
											ON s.SchoolId = an.EducationOrganizationId
										INNER JOIN leadata.descriptor d
											ON an.NeedDescriptorId = d.DescriptorId
									WHERE s.SchoolId = @SchoolId and
										  d.CodeValue = @Need
								UNION
								SELECT s.SchoolId
									FROM entity.school s
										INNER JOIN entity.ApprovedNeeds an
											ON s.LocalEducationAgencyId = an.EducationOrganizationId
										INNER JOIN leadata.descriptor d
											ON an.NeedDescriptorId = d.DescriptorId
									WHERE s.SchoolId = @SchoolId and
										  d.CodeValue = @Need 
			                         ) Sch
			 )   >= 1
			    BEGIN
			    	SET @ISNeedApprovedForSchool = 1
			    END
		ELSE
			    BEGIN
			    	SET @ISNeedApprovedForSchool = 0
			    END

		RETURN @ISNeedApprovedForSchool

	END
GO


