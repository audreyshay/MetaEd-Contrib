/**********************************************************************************************************
**Procedure Name:
**      report.INTEG35_IntegritySchoolCalendarData
**
**Author:
**      Britto Augustine
**
**Description:  
**  Get integrity result data for INTEG35 report. Returns integrity results and error messages for
**  School Calendar Integrity rules
** 
**Input:
**  @FiscalYear - Fiscal year to filter upon
**	@ReportLEAId - LEAId to filter upon
**  @SchoolsList -  SchoolId(s) to filter upon
**	@IntegrityResultTypeId - Result type to filter upon
**
**Output:
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from INTEG35 report
**
**Execution:
		declare @SchoolList as varchar(max)
		select @SchoolList =  COALESCE(@SchoolList +',' ,'') + CONVERT(NVARCHAR(5),SchoolId ) 
		FROM entity.School where Fiscalyear = 2017 and localeducationagencyid = 4228	
	    exec [report].[INTEG35_IntegritySchoolCalendarData] 2018, 4228, @SchoolList, 2
**
**Revision History:
**	Amit Verma	09/07/2017	Initial creation
**	Amit Verma	09/08/2017	Added the TackLocalEducationAgencyId in the Report
**  Pratibha K	12/13/2017	Removed extra fields,6 joins, data security & changed to pull dynamic error messages.
**  Pratibha K	12/15/2017	Implemented back data security- only show data submitted by the LEA that runs the report
**  Harsha Kankanala 04/5/2019 Changed the stored proc to fetch Calendar Code for FiscalYear 2020
******************************************************************************************************************/
CREATE PROC [report].[INTEG35_IntegritySchoolCalendarData] --2020,4153,'4517',2
	@FiscalYear INT,
	@ReportLEAId INT,
	@SchoolsList NVARCHAR(MAX),						-- comma separated list of school id(s)
	@IntegrityResultTypeId SMALLINT					-- 1 Passed/2 Failed 
AS
BEGIN

  SELECT DISTINCT 
		 sch.SchoolId							AS 'SchoolID'
		,sch.SchoolName							AS 'SchoolName'
		,sch.FormattedSchoolCTDS				AS 'SchoolCTDS'
		,CASE WHEN @FiscalYear<2020 then CONVERT(NVARCHAR(60),trk.TrackNumber)                      
		      ELSE  trk.CalendarCode END AS  'TrackNumber/CalendarCode'
		,trk.TrackLocalEducationAgencyId
		,CASE ih.IntegrityResultTypeId 
			WHEN 1 THEN 'Passed'
			WHEN 2 THEN 'Failed'
 		  END									AS 'IntegrityStatus'
		,ies.Description						AS 'Severity'
		,iie.ExceptionMessageCode				AS 'ErrorCode'	
		,iie.ExceptionDetails					AS 'ErrorDescription'
		,ies.ExceptionSeverityId
	FROM 
		integrity.IntegrityHistory ih WITH (NOLOCK)				--getting all data from IntegrityHistory because integrity runs state wide every night. when that changes this has to be updated
			INNER JOIN
		integrity.IntegrityNeed ind WITH (NOLOCK) 
				ON ih.IntegrityNeedId = ind.IntegrityNeedId
				   AND ih.FiscalYear = ind.FiscalYear
				   AND ih.FiscalYear = @FiscalYear
				   AND ind.IntegrityRuleTypeId = 16								-- Calendar integ rule type
				   AND ih.IntegrityResultTypeId = @IntegrityResultTypeId		-- filter on failed or passed
				   AND ind.SubmittedByEducationOrganizationId = @ReportLEAId    -- only show data submitted by the LEA that runs the report
			INNER JOIN 
		[util].[Split](@SchoolsList,',') s
				ON s.Token = ind.SchoolId			
			INNER JOIN 
		entity.vw_School sch WITH(NOLOCK) 
				ON sch.SchoolId = ind.SchoolId
				AND sch.FiscalYear = ind.FiscalYear
			INNER JOIN 
		entity.Track trk WITH(NOLOCK) 
				 ON ind.FiscalYear = trk.FiscalYear			
				AND ind.SchoolId = trk.EducationOrganizationId
				AND CASE WHEN trk.FiscalYear <2020 THEN CONVERT(NVARCHAR(60),ind.TrackNumber) ELSE ind.CalendarCode END = CASE WHEN trk.FiscalYear <2020 THEN CONVERT(NVARCHAR(60),trk.TrackNumber) ELSE trk.CalendarCode END
				AND ind.TrackLocalEducationAgencyId = trk.TrackLocalEducationAgencyId  
			LEFT JOIN
		[integrity].[IntegrityException] iie WITH(NOLOCK) 
				ON iie.IntegrityHistoryId = ih.IntegrityHistoryId
			LEFT JOIN
		[integrity].[ExceptionSeverity] ies WITH(NOLOCK) 
				ON ies.ExceptionSeverityId = iie.ExceptionSeverityId 
	ORDER BY 
		 SchoolName
		,ies.ExceptionSeverityId
		,ErrorCode	
		,CASE WHEN @FiscalYear<2020 then CONVERT(NVARCHAR(60),trk.TrackNumber)                      
		      ELSE  trk.CalendarCode END
		,trk.TrackLocalEducationAgencyId

END
/* end of report.INTEG35_IntegritySchoolCalendarData   */