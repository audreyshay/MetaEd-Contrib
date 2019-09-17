/************************************************************  
**Author: Chris Mullert  
**  
**Description:  Insert new calendar request
**   
**Revision History:  
** Who   When  What  
** CM  01/29/2018 Initial Creation  
** CM  03/21/2017 table changes
** VM  03/21/2019 Azed 5.0 changes adding calendarcode
***************************************************************/  
CREATE PROCEDURE [915].[InsertCalendarRequest]
	      @RequestId    INT,
      @TrackNumber  INT,
      @SchoolId     INT,
      @CalendarCode VARCHAR(100) = NULL,
      @CalendarType VARCHAR(50)  = NULL
AS
     BEGIN
         SET NOCOUNT OFF;
         IF(@CalendarType IS NOT NULL)
             BEGIN
                 INSERT INTO [915].[CalendarRequest]([RequestId], [TrackNumber], [SchoolId], CalendarCode, CalendarType)
                 VALUES(@RequestId, @TrackNumber, @SchoolId, @CalendarCode, @CalendarType);
             END;
         ELSE
             BEGIN
                 INSERT INTO [915].[CalendarRequest]([RequestId], [TrackNumber], [SchoolId])
                 VALUES(@RequestId, @TrackNumber, @SchoolId);
             END;
     END;