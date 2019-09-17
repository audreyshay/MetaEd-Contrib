CREATE VIEW [dashboard].[SISVendorLEA]
	AS 

	with cteLEASubmittedToAzEDS as
	(
		SELECT DISTINCT	
			SubmittedByLocalEducationAgencyID
		FROM
			[dashboard].[AzEDSSubmissions] with (nolock) 
	),
	cteLEASuccessfullSubmissionToAzEDS as
	(
		SELECT DISTINCT	
			SubmittedByLocalEducationAgencyID
		FROM
			[dashboard].[AzEDSSubmissions] with (nolock) 
		WHERE [SuccessfulSubmissions] > 0
	)
	SELECT 
		SV.VendorName,
		SVLEA.FiscalYear, 
		SVLEA.LocalEducationAgencyID, 
		EO.NameOfInstitution,
		eo.CTDS as LocalEducationAgencyCTDS,
		eo.OperationalStatusTypeId,
		ost.CodeValue as OperationalStatusCode,
		ost.IsActive,
		SVLEA.SelfHosted, 
		SVLEA.OnAzeds,
		CASE
			WHEN AzEDSSub.SubmittedByLocalEducationAgencyId IS NULL THEN 0
			ELSE 1
		END AS SubmittedToAzEds,
		CASE
			WHEN AzEDSSucessSub.SubmittedByLocalEducationAgencyId IS NULL THEN 0
			ELSE 1
		END AS SubmittedToAzEdsSuccessfully
	FROM
		[entity].[SISVendorLocalEducationAgency] SVLEA with (nolock)
		JOIN [entity].[SISVendors] SV with (nolock) 
			ON SVLEA.SisVendorID = SV.VendorID
		JOIN [entity].[EducationOrganization] EO with (nolock) 
			ON SVLEA.LocalEducationAgencyID = EO.EducationOrganizationID
           AND SVLEA.FiscalYear = EO.FiscalYear
		JOIN entity.OperationalStatusType ost
			ON ost.OperationalStatusTypeId = eo.OperationalStatusTypeId
		LEFT OUTER JOIN cteLEASubmittedToAzEDS AzEDSSub 
			ON SVLEA.LocalEducationAgencyID = AzEDSSub.SubmittedByLocalEducationAgencyId
		LEFT OUTER JOIN cteLEASuccessfullSubmissionToAzEDS AzEDSSucessSub 
			ON SVLEA.LocalEducationAgencyID = AzEDSSucessSub.SubmittedByLocalEducationAgencyId


GO