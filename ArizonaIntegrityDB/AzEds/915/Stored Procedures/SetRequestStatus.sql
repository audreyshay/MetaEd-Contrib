
CREATE PROCEDURE [915].[SetRequestStatus] 
	@RequestId bigint, 
	@RequestStatusId int,
	@lastModifiedBy varchar(100),
	@lastModifiedDtm DateTime
AS
BEGIN

UPDATE [915].[Request]
SET RequestStatusId = @RequestStatusId,
	LastModifiedBy = @LastModifiedBy,
	LastModifiedDtm = @lastModifiedDtm
WHERE RequestId = @RequestId

END
