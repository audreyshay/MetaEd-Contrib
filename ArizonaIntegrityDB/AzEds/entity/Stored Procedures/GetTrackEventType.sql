/************************************************************  
**Procedure Name: [entity].[GetTrackEventType]
**  
**Author: Vinoth K
**  
**Description:  Gets all the Tracks Event from entity table, we are using this 
** information in Rest api to validate the Track even is planned or unplanned
**   
**Revision History:  
** Who   When  What  
** Vinoth K  01/22/2018 Initial Creation  
**  
***************************************************************/  


CREATE PROCEDURE [entity].[GetTrackEventType]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		[CodeValue]
		  ,[IsPlanned]
	FROM  [entity].[TrackEventType]
END

GO


