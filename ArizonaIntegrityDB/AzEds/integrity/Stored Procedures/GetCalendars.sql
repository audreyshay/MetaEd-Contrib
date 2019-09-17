/**************************************************************************************
**Procedure Name:
**      [integrity].[GetCalendars]
**
**Author:
**      Britto Augustine
**
**Description:  
**	Get active calendar track events for a fiscal year, From 2019 Onwards it wont check IsActive Flag
**               
**Implementation:
**	Used to get calendars for integrityprocessing
**
**Revision History:
**	Who					When		What
**	Britto Augustine	06/05/2017	Initial Creation
**	Vinoth K			01/10/2018  Added the condition based on Fiscal Year to fetch the Calendar, going forward Is Active Flag will not get populate from enterprise.
**  Sucharita M         04/20/2018  Added condition based on Fiscal Year to fetch calendar only if IsCertified,IsADEApproved,IsValid flags are true.Task#41747
**  Venu M				08/10/2018  for 2019 Joining with Trackeventtype table to use 'IsInstructional' flag for bringing Instructional days
**  Vinoth K			02/12/2019  Added the calendar code as part of 2020 change, for 2019 we are loading with default value as Not Applicable.
** Vinoth K				5/1/2019	adding nolock to the table
****************************************************************************************************************************************************************************/
CREATE PROCEDURE [integrity].[GetCalendars]
	@fiscalyear as int  
AS 
  BEGIN 
	IF @FiscalYear < 2019
		BEGIN
			SELECT  DISTINCT
				t.EducationOrganizationId as TrackEducationOrganizationId,
				t.TrackNumber,	
				t.TrackLocalEducationAgencyId,
				cd.Date AS InstructionalDate
				,t.CalendarCode
			FROM entity.CalendarDateTrackEvent cd (nolock)
			JOIN entity.Track t (nolock)
				ON cd.EducationOrganizationId = t.EducationOrganizationId
				AND cd.FiscalYear = t.FiscalYear
				AND cd.TrackNumber = t.TrackNumber
				AND cd.TrackLocalEducationAgencyId = t.TrackLocalEducationAgencyId
				AND cd.CalendarCode = t.CalendarCode
				AND t.IsActive = 1
				AND t.FiscalYear = @fiscalyear
				AND cd.FiscalYear = @fiscalyear
				AND cd.TrackEventTypeId = 1 
			ORDER BY t.EducationOrganizationId,
				t.TrackNumber,	
				t.TrackLocalEducationAgencyId,
				cd.Date
		END
	ELSE
		BEGIN
			SELECT  DISTINCT
				t.EducationOrganizationId as TrackEducationOrganizationId,
				t.TrackNumber,	
				t.TrackLocalEducationAgencyId,
				cd.Date AS InstructionalDate,
				t.CalendarCode
			FROM entity.CalendarDateTrackEvent cd (nolock)
			JOIN entity.Track t (nolock)
				ON cd.EducationOrganizationId = t.EducationOrganizationId
				AND cd.FiscalYear = t.FiscalYear
				AND cd.TrackNumber = t.TrackNumber
				AND cd.TrackLocalEducationAgencyId = t.TrackLocalEducationAgencyId
				AND cd.CalendarCode = t.CalendarCode
				AND t.FiscalYear = @fiscalyear
				AND cd.FiscalYear = @fiscalyear
             JOIN entity.TrackStatus ts (nolock)
			     ON  t.EducationOrganizationId =ts.EducationOrganizationId
				 AND t.FiscalYear = ts.FiscalYear
				 AND t.TrackNumber =ts.TrackNumber
				 AND t.TrackLocalEducationAgencyId = ts.TrackLocalEducationAgencyId
				 AND t.CalendarCode = ts.CalendarCode
				 AND ts.IsCertified =1
				 AND ts.IsADEApproved =1
				 AND ts.IsValid =1
		   JOIN entity.TrackEventType tet (nolock)
				ON tet.TrackEventTypeId = cd.TrackEventTypeId AND tet.IsInstructional =1
			ORDER BY t.EducationOrganizationId,
				t.TrackNumber,	
				t.TrackLocalEducationAgencyId,
				cd.Date
		END

  END
