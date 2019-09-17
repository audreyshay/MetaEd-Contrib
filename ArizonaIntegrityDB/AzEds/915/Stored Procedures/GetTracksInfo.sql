/************************************************************
**Procedure Name: process.GetRequestsByLeaId
**
**Author: Vinoth
**
**Description:  Gets list of Request which are open for given fiscal year and LEA ID
**	
**Revision History:
**	Who			When		What
**	VenuM		10/18/2018	Initial Creation
** Harsha Kankanala 05/22/2019  Changed the stored to proc to return only Calendar for 2020 and removed coalesce function
***************************************************************/

CREATE PROCEDURE [915].[GetTracksInfo] @fiscalYear INT 
AS
     BEGIN
	 IF (@fiscalYear<2020)
	 BEGIN
       
         SELECT TrackNumber,
                Description,
				CalendarType
         FROM [915].[VwTracksForPostSubmissionWindow]
         WHERE Fiscalyear = @fiscalYear 
	    ORDER BY TrackNumber asc;
	END
		ELSE  
		BEGIN
		 SELECT TrackNumber,
                Description,
				CalendarType
         FROM [915].[VwTracksForPostSubmissionWindow]
         WHERE Fiscalyear = @fiscalYear 
		 AND TrackNumber = 0
	    ORDER BY TrackNumber asc;
		END
     END;
