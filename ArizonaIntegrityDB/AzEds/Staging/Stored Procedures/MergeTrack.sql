/**************************************************************************
**Procedure Name: staging.MergeTrack
**
**Author: Pratibha Kanyar
**
**Description: Merges rows from staging.Track into entity.Track   
**    
**Input: None
**
**Output: None
**
**Returns: @@Error
**
**Implementation: Called from Track ETL package
**
**Revision History:
**	P Kanyar		03/27/2017	Initial Creation
**
**************************************************************************/
CREATE PROC [Staging].[MergeTrack]

AS
BEGIN

SET NOCOUNT ON;

	WITH TrackCTE
	AS
	(
		SELECT
			 EducationOrganizationId
			,FiscalYear
			,TrackNumber
			,TrackLocalEducationAgencyId
			,TrackName
			,BeginDate
			,EndDate
			,TotalInstructionalDays
			,NumberOfSessionDaysInWeek
			,IsActive
		FROM
			staging.Track 
	)
	MERGE entity.Track WITH (HOLDLOCK) AS Dest
		USING TrackCTE
			ON TrackCTE.EducationOrganizationId = Dest.EducationOrganizationId
				AND TrackCTE.FiscalYear = Dest.FiscalYear
				AND TrackCTE.TrackNumber = Dest.TrackNumber
				AND TrackCTE.TrackLocalEducationAgencyId = Dest.TrackLocalEducationAgencyId

		WHEN MATCHED THEN
			UPDATE SET
				 TrackName = TrackCTE.TrackName
				,BeginDate = TrackCTE.BeginDate
				,EndDate = TrackCTE.EndDate
				,TotalInstructionalDays = TrackCTE.TotalInstructionalDays
				,NumberOfSessionDaysInWeek = TrackCTE.NumberOfSessionDaysInWeek
				,IsActive = TrackCTE.IsActive

		WHEN NOT MATCHED THEN
			INSERT
				(
					 EducationOrganizationId
					,FiscalYear
					,TrackNumber
					,TrackLocalEducationAgencyId
					,TrackName
					,BeginDate
					,EndDate
					,TotalInstructionalDays
					,NumberOfSessionDaysInWeek
					,IsActive
				)
			VALUES
				(
					 TrackCTE.EducationOrganizationId
					,TrackCTE.FiscalYear
					,TrackCTE.TrackNumber
					,TrackCTE.TrackLocalEducationAgencyId
					,TrackCTE.TrackName
					,TrackCTE.BeginDate
					,TrackCTE.EndDate
					,TrackCTE.TotalInstructionalDays
					,TrackCTE.NumberOfSessionDaysInWeek
					,TrackCTE.IsActive
				);
	    
    RETURN(@@ERROR)

/*End MergeTrack*/
END