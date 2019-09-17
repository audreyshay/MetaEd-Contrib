/************************************************************  
**Author: Chris Mullert  
**  
**Description:  Update post submission window dates
**   
**Revision History:  
** Who   When  What  
** CM  01/29/2018 Initial Creation  
**  
***************************************************************/  

CREATE PROCEDURE [915].[UpdateRequestWindowDates]
	@RequestId bigint,
	@BeginDtm DateTime,
	@EndDtm DateTime,
	@LastModifiedBy varchar(100),
	@LastModifiedDtm DateTime
AS
BEGIN
	SET NOCOUNT OFF;

    UPDATE [915].Request
	SET BeginDtm = @BeginDtm,
		EndDtm = @EndDtm,
		LastModifiedBY = @LastModifiedBy,
		LastModifiedDtm = @LastModifiedDtm
	WHERE RequestId = @RequestId 
END