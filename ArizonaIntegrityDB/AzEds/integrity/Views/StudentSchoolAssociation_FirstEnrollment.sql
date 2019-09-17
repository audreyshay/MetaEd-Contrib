/******************************************************************************************
** Script Name:[integrity].[StudentSchoolAssociation_FirstEnrollment]
** 
**
** Author: Amit Verma
** 
**
** Description: View to to find out if StudentSchoolAssociation is FirstEnrollment or not
**
**
** Revision History: Created - Amit Verma - 12/15/2015
** 
**
********************************************************************************************/
CREATE VIEW [integrity].[StudentSchoolAssociation_FirstEnrollment]
As
	SELECT   StudentUSI
			,SchoolId
			, FiscalYear
			, CONVERT(BIT,CASE WHEN COUNT(*) > 1 THEN 0 ELSE 1 END) AS FirstEnrollment -- if 2 records are found then it is not first enrollment
 			 FROM leadata.StudentSchoolAssociation ssa 
       			 GROUP BY ssa.StudentUSI, ssa.SchoolId,ssa.FiscalYear