/************************************************************  
**Description:  Insert new request
**   
**Revision History:  
** Who When	      What  
** CM  01/29/2018 Last modified  
** CM  03/21/2017 table changes
**  
***************************************************************/  
CREATE PROCEDURE [915].[InsertNewRequest] 
	@FiscalYear int,
	@LocalEducationAgencyId int,
	@CreatedBy varchar(100),
	@AssignedTo varchar(100),
	@LastModifiedBy varchar(100),
	@CreatedDtm DateTime,
	@BeginDtm DateTime,
	@LastModifiedDtm DateTime,
	@EndDtm DateTime,
	@RequestStatusId int,
	@RequestTypeId int = 1,
	@RequestId bigint OUTPUT
AS
BEGIN
INSERT INTO [915].[Request]
           ([FiscalYear]
           ,[LocalEducationAgencyId]
           ,[CreatedBy]
           ,[AssignedTo]
           ,[LastModifiedBy]
           ,[CreatedDtm]
           ,[LastModifiedDtm]
		   ,[BeginDtm]
           ,[EndDtm]
           ,[RequestStatusId]
		   ,[RequestTypeId])
     VALUES
           (@FiscalYear
           ,@LocalEducationAgencyId
           ,@CreatedBy
           ,@AssignedTo
           ,@LastModifiedBy
           ,@CreatedDtm
           ,@LastModifiedDtm
		   ,@BeginDtm
           ,@EndDtm
           ,@RequestStatusId
		   ,@RequestTypeId)
END

SELECT @RequestId = SCOPE_IDENTITY()
