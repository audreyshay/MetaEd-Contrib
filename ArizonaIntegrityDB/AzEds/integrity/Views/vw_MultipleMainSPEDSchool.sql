/**************************************************************************
** Script Name:[vw_MultipleMainSPEDSchool]
** 
**
** Author: SMahapatra
** 
**
** Description: This view returns (a flag) 1 if a student has a Main SPED School Indicator at multiple schools at a single point in time 
** and 0 if he doesn't have.
**
**
** 
** 
**
** Revision History: Created -SMahapatra -10/21/2016
** 01-25-2017  PSharma TFS#172871 Added SchoolId in the selected fields
** 01-31-2017  PSharma Fixed the overlap of One day
**************************************************************************/

CREATE VIEW  [integrity].[vw_MultipleMainSPEDSchool] 
AS
With CTESPEDProgramParicipation as

(SELECT DISTINCT SPA.StudentUSI,
				 SPA.EducationOrganizationId AS SchoolId ,
				 SSEPA.MainSPEDSchool,
				 SPA.FiscalYear,
				 SPA.ProgramTypeId,
				 SPA.BeginDate,
				  SPA.Enddate					
FROM   leadata.StudentProgramAssociation SPA 
	   JOIN leadata.StudentSpecialEducationProgramAssociation SSEPA 
         ON SPA.StudentUSI = SSEPA.StudentUSI 
            AND SPA.ProgramTypeId = SSEPA.ProgramTypeId 
           AND SPA.ProgramEducationOrganizationId = SSEPA.ProgramEducationOrganizationId
            AND SPA.BeginDate = SSEPA.BeginDate 
            AND SPA.ProgramName = SSEPA.ProgramName 
            AND SPA.EducationOrganizationId = SSEPA.EducationOrganizationId
			AND SPA.FiscalYear = SSEPA.FiscalYear
			AND SPA.ProgramTypeId = 6 
			AND SSEPA.MainSPEDSchool = 1 )
			
select SPA1.FiscalYear, 
       SPA1.StudentUSI,    
        SPA1.SchoolId ,   
       --CONVERT(BIT, CASE WHEN COUNT(*) > 1 THEN 1 ELSE 0 END) AS HaveMultipleMainSPEDSchool --Replacing this line with the line below to add SchoolId to the Group By because we need SchoolId in the proc GetStateSpedRuleStudent. Refer to TFS#172871 for more details. 
	   CONVERT(BIT, 1) AS HaveMultipleMainSPEDSchool 
from CTESPEDProgramParicipation SPA1
	 JOIN CTESPEDProgramParicipation SPA2
	 ON SPA1.StudentUSI = SPA2.StudentUSI
     And  SPA1.SchoolId <>SPA2.SchoolId
     AND (SPA1.BeginDate <= SPA2.EndDate OR SPA2.EndDate IS NULL)   
     AND (SPA1.EndDate >= SPA2.BeginDate OR SPA1.EndDate IS NULL)
     AND SPA1.FiscalYear = SPA2.FiscalYear 
     AND SPA1.SchoolId <> SPA2.SchoolId
GROUP BY SPA1.FiscalYear, 
         SPA1.StudentUSI,
		 SPA1.SchoolId
GO


	