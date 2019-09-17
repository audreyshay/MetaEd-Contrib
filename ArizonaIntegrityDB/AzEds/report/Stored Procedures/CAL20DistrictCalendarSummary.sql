/************************************************************************************************************************
**Procedure Name:
**      report.[CAL20DistrictCalendarSummary]
**
**Author:
**      Pratibha Kanyar
**
**Description: 
**    
**Input:
**  @FiscalYear - FiscalYear to filter upon
**  @SchoolsList - Id of School to filter upon
**	@LEAId - Id of LEA to filter upon
**  @IntegrityStatus - Integrity passed or failed to filter upon
**
**Output:
**  None
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from CAL20DistrictCalendarSummary report
**
**Revision History:
**	Pratibha Kanyar		09/06/2017	Initial Creation
**	Pratibha Kanyar		12/15/2017	Modified the logic to implement the newly added descriptors, & data security of only
**									submitted LEA can see the data 
**  Harsha Kankanala    04/10/2019  Changed the code to fetch Calendar Code for Fiscal Year 2020
*************************************************************************************************************************/
CREATE PROC [report].[CAL20DistrictCalendarSummary]	--2020,4235,'4913',2
	 @FiscalYear INT,
	 @LocalEducationAgencyId INT, 
	 @SchoolList NVARCHAR(MAX),
	 @IntegrityStatus SMALLINT		-- 1 PASSED / 2 FAILED

AS
BEGIN

--DECLARE 	 @FiscalYear INT = 2018,
--	 @LocalEducationAgencyId INT = 4248,
--	 @SchoolList NVARCHAR(MAX) = '7318,4902,4903', --'4916,4917,4918,4919,4920,4921,4922,4923',
--	 @IntegrityStatus SMALLINT = 1

SET NOCOUNT ON;
			
IF (@FiscalYear <2020)
BEGIN				 
		SELECT 
			 tr.FiscalYear
			,tr.EducationOrganizationId										AS 'SchoolId'
			,sc.FormattedSchoolCTDS											AS 'SchoolCTDS'					
			,sc.SchoolName + ' (' + CONVERT(NVARCHAR(20),sc.SchoolId) +')'	AS 'SchoolName'
			,tr.TrackLocalEducationAgencyId
			,tr.TrackNumber													AS 'Track/CalendarCode'
			,CASE ts.[IsCertified] WHEN 1 THEN 'Yes'
				ELSE 'No' END												AS 'Certified'
			,CONVERT(NVARCHAR(8),ts.[CertificationDate], 1)					AS 'DateCertified'
			,ts.CertifiedBy													AS 'CertifiedBy'
			,cdte.[Date]
			,cdte.TrackEventTypeId
			,CONVERT(NVARCHAR(8), tr.BeginDate, 1)							AS 'FirstDay'
			,CONVERT(NVARCHAR(8), tr.EndDate, 1)							AS 'LastDay'
			,tr.TotalInstructionalDays										AS 'InstructionalDays'
			,CASE ih.IntegrityResultTypeId WHEN 1 THEN 'Passed'																					
								WHEN 2 THEN 'Failed' END					AS 'IntegrityResult'
			,tet.IsHoliday
		INTO #TempTrackCalendar 
		FROM [entity].[Track] tr (NOLOCK) 

		INNER JOIN util.Split(@SchoolList,',') us 
			ON us.Token = tr.EducationOrganizationId
				AND tr.FiscalYear = @FiscalYear

		INNER JOIN entity.vw_School sc (NOLOCK)
			ON sc.SchoolId = tr.EducationOrganizationId
				AND sc.FiscalYear = tr.FiscalYear	
				
		INNER JOIN integrity.IntegrityNeed iin (NOLOCK)
			ON iin.FiscalYear = tr.FiscalYear 
				AND iin.SchoolId = tr.EducationOrganizationId
				AND iin.TrackLocalEducationAgencyId = tr.TrackLocalEducationAgencyId
				AND iin.TrackNumber = tr.TrackNumber
				AND iin.IntegrityRuleTypeId = 16	
				AND iin.SubmittedByEducationOrganizationId = @LocalEducationAgencyId			-- LEA that is running the report can see only data submitted by it for pvt. schools
				
		INNER JOIN integrity.IntegrityHistory ih (NOLOCK)
			ON ih.FiscalYear = iin.FiscalYear
				AND ih.IntegrityNeedId = iin.IntegrityNeedId
				AND ih.IntegrityResultTypeId = @IntegrityStatus				
										
		LEFT JOIN [entity].[TrackStatus] ts (NOLOCK)
				ON ts.FiscalYear = tr.FiscalYear
					AND ts.EducationOrganizationId = tr.EducationOrganizationId 
					AND ts.TrackNumber = tr.TrackNumber
					AND ts.TrackLocalEducationAgencyId = tr.TrackLocalEducationAgencyId

		LEFT JOIN [entity].[CalendarDateTrackEvent] cdte (NOLOCK)								-- Calendar integrity runs even without CalendarDateTrackEvent data
			ON tr.FiscalYear = cdte.FiscalYear
				AND tr.EducationOrganizationId = cdte.EducationOrganizationId 
				AND tr.TrackLocalEducationAgencyId = cdte.TrackLocalEducationAgencyId
				AND tr.TrackNumber = cdte.TrackNumber

		LEFT JOIN [entity].[TrackEventType] tet (NOLOCK)
			ON tet.TrackEventTypeId = cdte.TrackEventTypeId

	
		  SELECT 
			 cdte.SchoolId																			
			,cdte.SchoolCTDS
			,cdte.SchoolName
			,cdte.[Track/CalendarCode]	
			,cdte.TrackLocalEducationAgencyId -- added
			,cdte.Certified
			,cdte.DateCertified
			,cdte.CertifiedBy																		
			,cdte.FirstDay
			,cdte.LastDay
			,cdte.InstructionalDays
			,(SELECT COUNT(*) FROM #TempTrackCalendar
			  WHERE [TrackEventTypeId] = 2 AND SchoolId = cdte.SchoolId)	AS 'TeacherOnlyDays'							  															 
																								 
			,(SELECT COUNT(*) FROM #TempTrackCalendar						 
			  WHERE [IsHoliday] = 1 AND SchoolId = cdte.SchoolId)			AS 'Holidays'								  															 
																								 
			,(SELECT COUNT(*) FROM #TempTrackCalendar						 
			  WHERE [TrackEventTypeId] = 6 AND SchoolId = cdte.SchoolId)	AS 'ShortDays'		--Late Start Or Early Dismissal							  															
																								 
			,(SELECT COUNT(*) FROM #TempTrackCalendar						 
			  WHERE [TrackEventTypeId] = 9 AND SchoolId = cdte.SchoolId)	AS 'OtherDays'		--Other Non Session Days 
			,cdte.IntegrityResult
		  FROM #TempTrackCalendar cdte
		  GROUP BY 
				 cdte.SchoolId
				,[Track/CalendarCode]
				,TrackLocalEducationAgencyId
				,Certified
				,DateCertified
				,CertifiedBy	
				,SchoolCTDS
				,SchoolName
				,FirstDay
				,LastDay
				,InstructionalDays
				,IntegrityResult

  DROP TABLE #TempTrackCalendar
  END
  ELSE 
   
  BEGIN		
  
  SELECT 
			 tr.FiscalYear
			,tr.EducationOrganizationId										AS 'SchoolId'
			,sc.FormattedSchoolCTDS											AS 'SchoolCTDS'					
			,sc.SchoolName + ' (' + CONVERT(NVARCHAR(20),sc.SchoolId) +')'	AS 'SchoolName'
			,tr.TrackLocalEducationAgencyId
			,tr.CalendarCode													AS 'Track/CalendarCode'
			,CASE ts.[IsCertified] WHEN 1 THEN 'Yes'
				ELSE 'No' END												AS 'Certified'
			,CONVERT(NVARCHAR(8),ts.[CertificationDate], 1)					AS 'DateCertified'
			,ts.CertifiedBy													AS 'CertifiedBy'
			,cdte.[Date]
			,cdte.TrackEventTypeId
			,CONVERT(NVARCHAR(8), tr.BeginDate, 1)							AS 'FirstDay'
			,CONVERT(NVARCHAR(8), tr.EndDate, 1)							AS 'LastDay'
			,tr.TotalInstructionalDays										AS 'InstructionalDays'
			,CASE ih.IntegrityResultTypeId WHEN 1 THEN 'Passed'																					
								WHEN 2 THEN 'Failed' END					AS 'IntegrityResult'
			,tet.IsHoliday
		INTO #TempTrackCalendar2020 
		FROM [entity].[Track] tr (NOLOCK) 

		INNER JOIN util.Split(@SchoolList,',') us 
			ON us.Token = tr.EducationOrganizationId
				AND tr.FiscalYear = @FiscalYear

		INNER JOIN entity.vw_School sc (NOLOCK)
			ON sc.SchoolId = tr.EducationOrganizationId
				AND sc.FiscalYear = tr.FiscalYear	
				
		INNER JOIN integrity.IntegrityNeed iin (NOLOCK)
			ON iin.FiscalYear = tr.FiscalYear 
				AND iin.SchoolId = tr.EducationOrganizationId
				AND iin.TrackLocalEducationAgencyId = tr.TrackLocalEducationAgencyId
				AND iin.CalendarCode = tr.CalendarCode
				AND iin.IntegrityRuleTypeId = 16	
				AND iin.SubmittedByEducationOrganizationId = @LocalEducationAgencyId			-- LEA that is running the report can see only data submitted by it for pvt. schools
				
		INNER JOIN integrity.IntegrityHistory ih (NOLOCK)
			ON ih.FiscalYear = iin.FiscalYear
				AND ih.IntegrityNeedId = iin.IntegrityNeedId
				AND ih.IntegrityResultTypeId = @IntegrityStatus				
										
		LEFT JOIN [entity].[TrackStatus] ts (NOLOCK)
				ON ts.FiscalYear = tr.FiscalYear
					AND ts.EducationOrganizationId = tr.EducationOrganizationId 
					AND ts.CalendarCode = tr.CalendarCode
					AND ts.TrackLocalEducationAgencyId = tr.TrackLocalEducationAgencyId

		LEFT JOIN [entity].[CalendarDateTrackEvent] cdte (NOLOCK)								-- Calendar integrity runs even without CalendarDateTrackEvent data
			ON tr.FiscalYear = cdte.FiscalYear
				AND tr.EducationOrganizationId = cdte.EducationOrganizationId 
				AND tr.TrackLocalEducationAgencyId = cdte.TrackLocalEducationAgencyId
				AND tr.CalendarCode = cdte.CalendarCode

		LEFT JOIN [entity].[TrackEventType] tet (NOLOCK)
			ON tet.TrackEventTypeId = cdte.TrackEventTypeId

	
		  SELECT 
			 cdte.SchoolId																			
			,cdte.SchoolCTDS
			,cdte.SchoolName
			,cdte.[Track/CalendarCode]
			,cdte.TrackLocalEducationAgencyId -- added
			,cdte.Certified
			,cdte.DateCertified
			,cdte.CertifiedBy																		
			,cdte.FirstDay
			,cdte.LastDay
			,cdte.InstructionalDays
			,(SELECT COUNT(*) FROM #TempTrackCalendar2020 
			  WHERE [TrackEventTypeId] = 2 AND SchoolId = cdte.SchoolId)	AS 'TeacherOnlyDays'							  															 
																								 
			,(SELECT COUNT(*) FROM #TempTrackCalendar2020 						 
			  WHERE [IsHoliday] = 1 AND SchoolId = cdte.SchoolId)			AS 'Holidays'								  															 
																								 
			,(SELECT COUNT(*) FROM #TempTrackCalendar2020 						 
			  WHERE [TrackEventTypeId] = 6 AND SchoolId = cdte.SchoolId)	AS 'ShortDays'		--Late Start Or Early Dismissal							  															
																								 
			,(SELECT COUNT(*) FROM #TempTrackCalendar2020 						 
			  WHERE [TrackEventTypeId] = 9 AND SchoolId = cdte.SchoolId)	AS 'OtherDays'		--Other Non Session Days 
			,cdte.IntegrityResult
		  FROM #TempTrackCalendar2020 cdte
		  GROUP BY 
				 cdte.SchoolId
				,[Track/CalendarCode]
				,TrackLocalEducationAgencyId
				,Certified
				,DateCertified
				,CertifiedBy	
				,SchoolCTDS
				,SchoolName
				,FirstDay
				,LastDay
				,InstructionalDays
				,IntegrityResult

  DROP TABLE #TempTrackCalendar2020
END
END 
/* End of [report].[CAL20DistrictCalendarSummary] */

