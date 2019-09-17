/**************************************************************************************
**Procedure Name:
**      dashboard.GetVerificationRecordCounts
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Gives Record Counts for Schools selected for Verification DashBoard on AzEDS Portal
**   
**Input:
**	@LocalEducationAgencyId - LEAId for which the record counts are shown
**	@SchoolsList - SchoolId(s) which the record counts are shown
**	@RecordTypeList - Type of Records that are to be counted
**	@AsOfDate - Date for which the record counts to be shown
**	@FiscalYear -  Fiscal Year to filter upon
**
**Output:
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from Verification DashBoard on AzEDS Portal
**
**Revision History:
**	P Kanyar	02/17/2016	Initial creation
**  M Killens	02/18/2016  Limit to AzEDS
**  B Augustine	08/30/2016  Modifications ot accomodate new table changes
**  B Augustine 09/27/2016  Changed to query based on EventDateId
**  B Augustine 07/17/2017  bug fix 190733- Changed logic to get @EventDateId based on FY and ExecutionProcessTyepId = 1
***************************************************************************************/
CREATE PROC [dashboard].[GetVerificationRecordCounts]
	@LocalEducationAgencyId int, 
	@SchoolsList nvarchar(max), 
	@RecordTypeList nvarchar(max),
	@AsOfDate date,
	@FiscalYear int

AS
BEGIN 

	DECLARE @EventDateId as int

	SELECT @EventDateId = MAX(ed.EventDateId)
	FROM dashboard.EventDate ed
	JOIN dashboard.EventDateExecution ede
		ON ede.EventDateId = ed.EventDateId			 
	JOIN process.Execution e
		ON e.ExecutionId = ede.ExecutionId
	WHERE CONVERT(date, EventDate) = @AsOfDate
	  AND e.FiscalYear = @FiscalYear
	  AND e.ProcessTypeId = 1		--processtypeid 1 is ADM Integrityand that Active batch job loads the verification dashboard counts

	DECLARE @Schools TABLE (SchoolId int) 
	INSERT INTO @Schools SELECT DISTINCT [Token] FROM [util].[Split](@SchoolsList, ',')

	DECLARE @RecordType TABLE (RecordTypeId int)
	INSERT INTO @RecordType SELECT DISTINCT [Token] FROM [util].[Split](@RecordTypeList, ',') 

		SELECT 
			AsOfDate, 
			AttendingLocalEducationAgencyId as LocalEducationAgencyId, 
			LocalEducationAgencyName,
			SchoolId,
			SchoolName,
			ISNULL([300], 0) AS AzEDSEnrollmentCount, 
			ISNULL([350], 0) AS AzEDSELLProgramCount,
			ISNULL([351], 0) AS AzEDSSPEDProgramCount,
			ISNULL([375], 0) AS AzEDSSPEDNeedCount

		FROM
		(
			SELECT 
				 e.EventDate							AS AsOfDate
				,rc.AttendingLocalEducationAgencyId
				,vlea.LocalEducationAgencyName
				,rc.SchoolId
				,vsc.SchoolName
				,rc.RecordCountTypeId
				,rc.RecordCount	
			FROM 
			dashboard.RecordCount rc 
				JOIN 
			dashboard.EventDate e ON e.EventDateId = rc.EventDateId
				JOIN 
			@RecordType rt ON rt.RecordTypeId = rc.RecordCountTypeId
				JOIN
			@Schools sc ON sc.SchoolId = rc.SchoolId
				LEFT JOIN
			[entity].[vw_School] vsc ON vsc.SchoolId = rc.SchoolId 
					AND vsc.FiscalYear = @FiscalYear
				LEFT JOIN
			[entity].[vw_LocalEducationAgency] vlea ON vlea.LocalEducationAgencyId = rc.AttendingLocalEducationAgencyId 
					AND vlea.FiscalYear = @FiscalYear
			WHERE rc.AttendingLocalEducationAgencyId = @LocalEducationAgencyId
			  AND rc.FiscalYear = @FiscalYear
			  AND rc.EventDateId = @EventDateId
		) p
		pivot 
		(
			SUM (RecordCount)
			FOR RecordCountTypeId IN ([300], [350], [351], [375])
		) AS pvt
		WHERE ( [300] IS NOT NULL OR 
			    [350] IS NOT NULL OR 
			    [351] IS NOT NULL OR 
			    [375] IS NOT NULL )

END
