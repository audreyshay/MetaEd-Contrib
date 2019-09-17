/****************************************************************************************** 
** Script Name:[integrity].[vw_IsCourseSimultaneouslyEnrolled]  
**  
** 
** Author: Venugopal Metukuru-
**  
** 
** Description: View to identified if a student is enrolled for same course simultaneously 
**              
** 
** 
** Revision History:
**                   Created - Venugopal Metukuru- 06/20/2016 
**							   PSharma			   06/23/2016	Added SchoolYear
**                             Venugopal Metukuru- 06/26/2016   Bringing Iscoursesimultaneouslyenrolled flag across schools
********************************************************************************************/
CREATE VIEW [integrity].[vw_IsCourseSimultaneouslyEnrolled] 
AS 
  SELECT ssa1.studentusi, 
         ssa1.schoolid, 
         ssa1.fiscalyear, 
         ssa1.schoolyear, 
         ssa1.localcoursecode, 
         ssa1.termtypeid, 
         CONVERT(BIT, CASE 
                        WHEN Count(*) > 1 THEN 1 
                        ELSE 0 
                      END) AS Iscoursesimultaneouslyenrolled 
  FROM   leadata.studentsectionassociation ssa1 
         JOIN leadata.studentsectionassociation ssa2 
           ON ( ssa2.begindate >= ssa1.begindate 
                AND ssa2.begindate < Isnull(ssa1.enddate, Cast( 
                                     Cast(ssa1.fiscalyear AS VARCHAR(4)) + '-06-30' AS DATE)) 
                 OR ( ssa1.begindate > ssa2.begindate 
                      AND ssa1.begindate < Isnull(ssa2.enddate, Cast( 
                                           Cast(ssa1.fiscalyear AS VARCHAR (4)) + '-06-30' AS DATE)) ) ) 
              AND ssa1.studentusi = ssa2.studentusi 
              --AND SPA1.EducationOrganizationId <> ssa2.EducationOrganizationId 
              AND ssa1.localcoursecode = ssa2.localcoursecode 
              AND ssa1.termtypeid = ssa2.termtypeid 
              AND ssa1.schoolyear = ssa2.schoolyear 
              AND ssa1.fiscalyear = ssa2.fiscalyear 
              AND ( ssa1.begindate <> ssa2.begindate 
                     OR ssa2.enddate <> ssa1.enddate ) 
  GROUP  BY ssa1.studentusi, 
            ssa1.schoolid, 
            ssa1.fiscalyear, 
            ssa1.schoolyear, 
            ssa1.localcoursecode, 
            ssa1.termtypeid 

go 