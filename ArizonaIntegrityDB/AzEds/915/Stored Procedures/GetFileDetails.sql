
CREATE PROCEDURE [915].[GetFileDetails] 
	@RequestId int
AS
BEGIN

SELECT     [FileDetailId]
		   ,[RequestId]
		   ,[IsActive]
		   ,[FileName]
		   ,[FileSizeBytes]
           ,[CreatedDtm]
           ,[CreatedBy]
		   ,[Comments]
		   ,[FiletypeId]
     FROM  [915].[FileDetail] 
	 WHERE [RequestId] = @RequestId
END
