/************************************************************  
**Procedure Name: entity.GetTracks  
**  
**Author: Kalyani Kankatala  
**  
**Description:  Gets all the Tracks for all EdOrgs
**   
**Revision History:  
** Who   When  What  
** KK  07/22/2015 Initial Creation  
** CM  04/03/2019 Adding calendarCode
** CM  04/19/2019 Adding track status check
***************************************************************/  
CREATE PROC [entity].[GetTracks]   
     
AS  
BEGIN  
 SELECT  
  t.EducationOrganizationId
  , t.EducationOrganizationId as SchoolId
  , t.FiscalYear
	, CASE t.TrackNumber
		WHEN -2 THEN t.CalendarCode
		ELSE CAST(t.TrackNumber AS nvarchar(60))
		END AS CalendarCode
  , TrackName
  , BeginDate
  , t.EndDate
  , TotalInstructionalDays
  , NumberOfSessionDaysInWeek
  FROM 
  entity.Track t
	 JOIN entity.TrackStatus ts ON t.CalendarCode = ts.CalendarCode 
			AND t.EducationOrganizationId = ts.EducationOrganizationId
			AND t.FiscalYear = ts.FiscalYear
			AND t.TrackNumber = ts.TrackNumber
			AND t.TrackLocalEducationAgencyId = ts.TrackLocalEducationAgencyId
			AND ts.IsCertified = 1
			AND ts.IsADEApproved = 1
			AND ts.IsValid = 1
     JOIN config.FiscalYear fy ON t.FiscalYear = fy.FiscalYear AND fy.IsActive = 1
	WHERE t.FiscalYear >= 2019
UNION ALL
 SELECT  
  t.EducationOrganizationId
  , t.EducationOrganizationId as SchoolId
  , t.FiscalYear
	, CASE t.TrackNumber
		WHEN -2 THEN t.CalendarCode
		ELSE CAST(t.TrackNumber AS nvarchar(60))
		END AS CalendarCode
  , TrackName
  , BeginDate
  , t.EndDate
  , TotalInstructionalDays
  , NumberOfSessionDaysInWeek
  FROM 
  entity.Track t
	 JOIN entity.TrackStatus ts ON t.CalendarCode = ts.CalendarCode 
			AND t.EducationOrganizationId = ts.EducationOrganizationId
			AND t.FiscalYear = ts.FiscalYear
			AND t.TrackNumber = ts.TrackNumber
			AND t.TrackLocalEducationAgencyId = ts.TrackLocalEducationAgencyId
     JOIN config.FiscalYear fy ON t.FiscalYear = fy.FiscalYear AND fy.IsActive = 1
 WHERE t.FiscalYear < 2019    
END
GO

