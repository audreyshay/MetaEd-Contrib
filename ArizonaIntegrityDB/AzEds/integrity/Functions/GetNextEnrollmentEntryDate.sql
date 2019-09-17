/**************************************************************************
** Script Name:[integrity].[GetNextEnrollmentEntryDate] 
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a Next Entry Date for the submitted StudentUSI 
**              and SchoolId in leadata.StudentSchoolAssociation Table.
**
** Input: @StudentUSI						    INT
**	      @SchoolId							    INT
**	      @EntryDate							DATE
** 
** Output: DATE
**
** Returns: DATE
**
** Implementation:
** 
**
** Revision History: Created - Amit Verma - 01/21/2015
** 
**
**************************************************************************/
CREATE FUNCTION [integrity].[GetNextEnrollmentEntryDate] 
(
	 @FiscalYear						INT
    ,@StudentUSI						INT
	,@SchoolId							INT
	,@EntryDate							DATE
)
RETURNS DATE
AS
BEGIN
    
	DECLARE @RESULT						DATE
	
	SET @RESULT = (SELECT TOP(1) seo.EntryDate  
						   FROM [leadata].[StudentSchoolAssociation] seo
						  WHERE seo.FiscalYear = @FiscalYear
							AND seo.StudentUSI = @StudentUSI
							AND seo.SchoolId = @SchoolId
							AND seo.EntryDate > @EntryDate
						ORDER BY seo.EntryDate ASC)

	RETURN @Result;

END
