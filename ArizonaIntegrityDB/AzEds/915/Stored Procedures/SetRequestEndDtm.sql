
CREATE PROCEDURE [915].[SetRequestEndDtm] 
	@RequestId bigint, 
	@endDtm DateTime,
	@lastModifiedBy varchar(100),
	@lastModifiedDtm DateTime
AS
BEGIN

UPDATE [915].[Request]
SET EndDtm = @endDtm,
	LastModifiedBy = @LastModifiedBy,
	LastModifiedDtm = @lastModifiedDtm
WHERE RequestId = @RequestId

END