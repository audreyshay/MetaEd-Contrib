/****************************************************************************************
**Procedure Name:
**      report.GetCategory
**
**Author:
**      Martez Killens
**
**Description:  
**  Returns a reprot category
**   
**Input:
**  @category -  The name of the category
**
**Revision History:
**	M Killens		01/13/2016	Initial creation
**  Vinoth K	    06/11/2018  Removed the ReportServerName and Report Path, we have an new table ServerName path
*****************************************************************************************/

CREATE PROCEDURE [report].[GetCategory]
	@category nvarchar(50)
AS
	SELECT 
	  CategoryId AS Id
	, Name
	, Description
FROM [report].[Category]
WHERE CategoryId = @category
