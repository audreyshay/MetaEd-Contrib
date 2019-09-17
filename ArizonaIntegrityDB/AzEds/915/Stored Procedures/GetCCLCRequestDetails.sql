-- =============================================
-- Author:		Vinoth K
-- Create date: 03/07/2019
-- Description:	Retrieves Non Student Request Details
-- =============================================
CREATE PROCEDURE [915].[GetCCLCRequestDetails]
	@LocalEducationAgencyId int
AS
BEGIN
	
	SELECT 
		 r.FiscalYear
		, r.LocalEducationAgencyId
		, r.BeginDtm
		, r.EndDtm
		, rt.Resource
		, rt.RequestBodyPropertyNameToExtractEducationOrganizationId
		, rt.AggregateRootEntityName
		, rs.RequestStatus915Value
	FROM [915].[Request] r				
	JOIN [config].[RequestStatus915] rs	ON r.RequestStatusId = rs.RequestStatus915Id
	JOIN [915].[NonStudentRequest] nrs	ON r.RequestId = nrs.RequestId
	JOIN [config].[ResourceType] rt		ON nrs.ResourceTypeId = rt.ResourceTypeId
	WHERE r.LocalEducationAgencyId = @LocalEducationAgencyId 
END

GO
