CREATE PROC [report].[SAISFileProcessing]
AS
SELECT
	1 AS InProcess,
	ta.SystemActivityID,
	sa.EntityID,
	e.Name,
	e.County,
	sa.FiscalYear,
	ISNULL(SV.[VendorName], ' ') AS SISVendor,
	ISNULL(LEA.[SelfHosted],0) AS SelfHosted,
	ISNULL(LEA.[OnAzeds],0) AS OnAzeds,
	MIN(sa.ActivityDtm) AS FirstProcTime
FROM         
	[STUDENTDETAILS_LS].StudentDetails.dbo.SdTransactionActivities AS ta WITH (nolock) 
	RIGHT OUTER JOIN [STUDENTDETAILS_LS].StudentDetails.dbo.SdSystemActivity AS sa WITH (nolock) ON 
		(sa.ID = ta.SystemActivityID)
	LEFT OUTER JOIN [STUDENTDETAILS_LS].StudentDetails.dbo.Entity AS e WITH (nolock) ON 
		(sa.EntityID = e.ID)
	LEFT OUTER JOIN AZEDS.[entity].[SISVendorLocalEducationAgency] LEA ON
		(sa.EntityID = LEA.LocalEducationAgencyID)
	LEFT OUTER JOIN AZEDS.[entity].[SISVendors] SV ON
		(LEA.SISVendorID = SV.VendorID)
WHERE
	sa.ActivityDtm > ((GetDate()+ '00:00:00')-7) AND
	sa.ActivityTypeID = 1 AND
	sa.refactivitystatusid in (1,2,3,4,5,9,11,15)  AND
	sa.entityid <> 0 AND
	sa.ActivityCompletionDtm is null AND
	ta.SystemActivityID is not null
GROUP BY
	ta.SystemActivityID,
	sa.EntityID,
	e.Name,
	e.County,
	sa.FiscalYear,
	SV.[VendorName],
	LEA.[SelfHosted],
	LEA.[OnAzeds]
UNION ALL
SELECT     
	0 AS InProcess,
	ta.SystemActivityID,
	sa.EntityID,
	e.Name,
	e.County,
	sa.FiscalYear,
	ISNULL(SV.[VendorName], ' ') AS SISVendor,
	ISNULL(LEA.[SelfHosted], 0) AS SelfHosted,
	ISNULL(LEA.[OnAzeds], 0) AS OnAzeds,
	CONVERT(datetime, MIN(sa.ActivityDtm), 120) AS FirstProcTime
FROM         
	[STUDENTDETAILS_LS].StudentDetails.dbo.SdTransactionActivities AS ta WITH (nolock) 
	RIGHT OUTER JOIN [STUDENTDETAILS_LS].StudentDetails.dbo.SdSystemActivity AS sa WITH (nolock) ON 
		(sa.ID = ta.SystemActivityID)
	LEFT OUTER JOIN [STUDENTDETAILS_LS].StudentDetails.dbo.Entity AS e WITH (nolock) ON 
		(sa.EntityID = e.ID)
	LEFT OUTER JOIN AZEDS.[entity].[SISVendorLocalEducationAgency] LEA ON
		(sa.EntityID = LEA.LocalEducationAgencyID)
	LEFT OUTER JOIN AZEDS.[entity].[SISVendors] SV ON
		(LEA.SISVendorID = SV.VendorID)
WHERE
	sa.ActivityDtm > ((GetDate()+ '00:00:00')-7) AND 
	ta.SystemActivityID IS NULL AND 
	sa.ActivityTypeID = 1 AND
    sa.refactivitystatusid in (1,9,11,15) AND
	sa.entityid <> 0
GROUP BY
	ta.SystemActivityID,
	sa.EntityID,
	e.Name,
	e.County,
	sa.FiscalYear,
	SV.[VendorName],
	LEA.[SelfHosted],
	LEA.[OnAzeds]
ORDER BY
	InProcess DESC,
	FirstProcTime