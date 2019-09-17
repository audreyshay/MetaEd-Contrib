
CREATE PROCEDURE [915].[InsertFileDetail] 
	@RequestId bigint,
	@IsActive bit,
	@FileName varchar(255),
	@FileSizeBytes int,
	@CreatedDtm DateTime,
	@CreatedBy varchar(100),
	@Comments varchar(max),
	@LastModifiedBy Varchar(100),
	@LastModifiedDtm DateTime,
	@FileTypeId int,

	@FileDetailId bigint OUTPUT
AS
BEGIN

BEGIN TRANSACTION

INSERT INTO [915].[FileDetail]
      ([RequestId]
      ,[IsActive]
      ,[FileName]
      ,[FileSizeBytes]
      ,[CreatedDtm]
      ,[CreatedBy]
      ,[Comments]
      ,[FiletypeId])
     VALUES
           (
			@RequestId,
			@IsActive,
			@FileName,
			@FileSizeBytes,
			@CreatedDtm,
			@CreatedBy,
			@Comments,
			@FileTypeId
		)
 
UPDATE [915].[Request]
SET LastModifiedBy = @LastModifiedBy,
	LastModifiedDtm = @LastModifiedDtm
WHERE RequestId = @RequestId

COMMIT TRANSACTION 

END

SELECT @FileDetailId = SCOPE_IDENTITY()
