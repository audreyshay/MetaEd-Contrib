/**************************************************************************
** Script Name:[vw_AccrossLEAMultipleMainSPEDSchool]
**
** Author: SMahapatra
** **
** Description: This view returns (a flag) 1 if a student has a Main SPED School Indicator at multiple schools at a single point in time 
** and 0 if he doesn't have.
**
** Revision History: Created -SMahapatra -04/03/2017
** SMahapatra : Fixed view 08/01/2017
**************************************************************************/

CREATE VIEW  [integrity].[vw_AccrossLEAMultipleMainSPEDSchool] 
AS

With CTESPEDProgramParicipation as

(SELECT DISTINCT SPA.StudentUSI,
				 SPA.EducationOrganizationId AS SchoolId,
				 SSEPA.MainSPEDSchool,
				 SPA.FiscalYear,
				 SPA.ProgramTypeId,
				 SPA.BeginDate,
				  SPA.Enddate,
				  SPA.SourceId					
FROM   leadata.StudentProgramAssociation SPA with (nolock)
	   JOIN leadata.StudentSpecialEducationProgramAssociation SSEPA with (nolock)
         ON SPA.StudentUSI = SSEPA.StudentUSI 
            AND SPA.ProgramTypeId = SSEPA.ProgramTypeId 
           AND SPA.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
            AND SPA.BeginDate = SSEPA.BeginDate 
            AND SPA.ProgramName = SSEPA.ProgramName 
            AND SPA.EducationOrganizationId = SSEPA.EducationOrganizationId
			AND SPA.FiscalYear = SSEPA.FiscalYear
			AND SPA.ProgramTypeId = 6 )
			
	   
	   		
select  SPA1.FiscalYear, 
       SPA1.StudentUSI,         
     -- CONVERT(BIT, CASE WHEN COUNT(*) > 0 THEN 1 ELSE 0 END) AS AccrossLEAMultipleMainSPEDSchool 
	  CONVERT(BIT, 1) AS AccrossLEAMultipleMainSPEDSchool 
from CTESPEDProgramParicipation SPA1
	JOIN CTESPEDProgramParicipation SPA2
	 ON	((SPA2.BeginDate <= SPA1.BeginDate AND ISNULL(SPA2.EndDate,CAST(CAST(SPA2.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE)) >= ISNULL(SPA1.EndDate,CAST(CAST(SPA1.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE)) and SPA2.MainSPEDSchool =1 )
		OR (SPA1.BeginDate <= SPA2.BeginDate AND ISNULL(SPA1.EndDate,CAST(CAST(SPA1.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE)) >= ISNULL(SPA2.EndDate,CAST(CAST(SPA2.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))and SPA1.MainSPEDSchool =1))
		and SPA1.StudentUSI = SPA2.StudentUSI
	    AND SPA1.FiscalYear = SPA2.FiscalYear 
        AND SPA1.SourceId <> SPA2.SourceId
	GROUP BY SPA1.FiscalYear, 
        SPA1.StudentUSI