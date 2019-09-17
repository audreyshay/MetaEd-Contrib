/************************************************************  
**  
**Author: Chris Mullert 
**  
**Description:  Used by the Calendar UI.
**   
**Revision History:  
** Who   When  What  
** CM  01/29/2018 Initial Creation  
**  
***************************************************************/ 
CREATE PROCEDURE [config].[GetDataSubmissionWindows]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		[SubmissionStartDate]
		  ,[SubmissionEndDate]
		  ,[FiscalYear]
		  ,[RequestTypeId]
	FROM config.DataSubmissionWindow
END