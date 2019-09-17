
/**************************************************************************
** Script Name:[integrity].[vw_ProgramOutsideCCLCFY] 
** 
**
** Author: SMahapatra
** 
**
** Description: This view will return list of for CCLC Program having BeginDt and EndDt ouside of CCLC FiscalYear(We get this value from config.DataSubmissionWindow table)
** Revision:
** Who          when            What
** Sucharita    09/13/2018      Commented the check for  StudentProgramAssociation EndDate as NULL as for CCLC Program we are allowing EndDate as null.
*******************************************************************************************************************************************************************************/

CREATE VIEW [integrity].[vw_ProgramOutsideCCLCFY] 
AS 

With CTEStudentProgramAssociation as  
(

   SELECT  distinct SPA.FiscalYear,SPA.StudentUSI,SPA.ProgramName,SPA.EducationOrganizationId,
                     DSW.SubmissionStartDate,DSW.SubmissionEndDate
     FROM  leadata.StudentProgramAssociation SPA with (nolock)
	 INNER JOIN config.DataSubmissionWindow DSW with (nolock)   
	 ON SPA.FiscalYear = DSW.FiscalYear
	 and DSW.RequestTypeId = 3
     where SPA.ProgramTypeId = 59     
     AND SPA.ProgramName LIKE '%21st Century Community Learning Centers%'
	 AND ((SPA.BeginDate NOT BETWEEN DSW.SubmissionStartDate and ISNULL(DSW.SubmissionEndDate,CAST(CAST(DSW.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))
	       OR ((SPA.EndDate is not null) AND  (SPA.EndDate NOT BETWEEN (DSW.SubmissionStartDate) and (ISNULL(DSW.SubmissionEndDate,CAST(CAST(DSW.FiscalYear AS VARCHAR(4))+'-06-30' AS DATE))))))
	      -- OR ((SPA.EndDate is null) AND (DSW.SubmissionEndDate is not null))
		  )     
	 
)
SELECT distinct SPA2.FiscalYear,SPA2.Studentusi,SPA2.EducationOrganizationId,ProgramOutsideDSW = STUFF((
            SELECT ', ' + ProgramName from  CTEStudentProgramAssociation SPA1
			  WHERE SPA1.FiscalYear = SPA2.FiscalYear and SPA1.StudentUsi = SPA2.StudentUsi
			 and SPA1.EducationOrganizationId = SPA2.EducationOrganizationId
			 FOR XML PATH('')),1,1,''),SPA2.SubmissionStartDate AS CCLCFYBeginDate,SPA2.SubmissionEndDate AS CCLCFYEndDate         
   FROM  CTEStudentProgramAssociation SPA2
  GROUP BY SPA2.FiscalYear,SPA2.Studentusi,SPA2.EducationOrganizationId,SPA2.SubmissionStartDate,SPA2.SubmissionEndDate
GO


