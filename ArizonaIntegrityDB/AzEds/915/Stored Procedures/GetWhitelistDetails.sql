-- =============================================
-- Author:		Martez Killens
-- Create date: 05/22/2017
-- Description:	Retrieves Whitelist Details
--  CM 03/21/2018 column changes  (I suspect this SP isn't being used anymore)
-- =============================================
CREATE PROCEDURE [915].[GetWhitelistDetails]
	@LocalEducationAgencyId int
AS
BEGIN
	DECLARE @currentDate DATETIME = GETDATE()
	
	-- Update the status of all open and expired requests
	UPDATE [915].[Request]
	SET [RequestStatusId] = 2,
	[LastSystemModifiedDtm] = @currentDate
	WHERE EndDtm < @currentDate
	AND RequestStatusId = 1

	SELECT 
		WhitelistDetailId
		, wld.StudentUniqueId
		, wld.SchoolId
		, r.FiscalYear
		, r.LocalEducationAgencyId
		, r.BeginDtm
		, r.EndDtm
		, rt.Resource
		, rt.RequestBodyPropertyNameToExtractEducationOrganizationId
		, rs.RequestStatus915Value
	FROM [915].[WhitelistDetail] wld
	JOIN [915].[Request] r				ON wld.RequestId = r.RequestId
	JOIN [915].[FileDetail] fd			ON wld.FileDetailId = fd.FileDetailId
	JOIN [config].[ResourceType] rt		ON wld.ResourceTypeId = rt.ResourceTypeId
	JOIN [config].[RequestStatus915] rs	ON r.RequestStatusId = rs.RequestStatus915Id
	WHERE r.LocalEducationAgencyId = @LocalEducationAgencyId AND fd.IsActive = 1
END