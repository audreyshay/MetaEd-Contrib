/**********************************************************************
**Procedure Name:
**      report.GetGradeLevelList
**
**Author:
**      Pratibha Kanyar
**
**Description:  
**  Lists Grade Levels for Student Data Verification (STUD10) report
**   
**Input:
**
**Output:
**  List of Grade Level 
**
**Returns:
**	@@Error
**
**Implementation:
**	Called from  Student Data Verification (STUD10) report
**
**Revision History:
**	P Kanyar	02/18/2016	Initial Creation
**
**********************************************************************/
CREATE PROC [report].[GetGradeLevelList]

AS
BEGIN

SET NOCOUNT ON;

	SELECT DISTINCT CodeValue, GradeLevelTypeId
	FROM [entity].[GradeLevelType]
	ORDER BY GradeLevelTypeId
END

/* end report.GetGradeLevelList */