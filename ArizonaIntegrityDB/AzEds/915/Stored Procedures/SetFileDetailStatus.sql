
CREATE PROCEDURE [915].[SetFileDetailStatus] 
	@FileDetailId bigint, 
	@IsActive bit,
	@LastModifiedBy Varchar(100),
	@LastModifiedDtm DateTime
AS
BEGIN

DECLARE @RequestId INT

SELECT @RequestId = MIN(RequestId) FROM [915].[FileDetail] WHERE FileDetailId = @FileDetailId

BEGIN TRANSACTION 

	UPDATE [915].[FileDetail]
	SET IsActive = @IsActive
	WHERE	FileDetailId = @FileDetailId

	UPDATE [915].[Request]
	SET LastModifiedBy = @LastModifiedBy,
		LastModifiedDtm = @LastModifiedDtm
	WHERE RequestId = @RequestId

COMMIT TRANSACTION

END
