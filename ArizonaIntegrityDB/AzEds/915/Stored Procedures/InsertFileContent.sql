
CREATE PROCEDURE [915].[InsertFileContent] 
	@FileDetailId bigint,
	@Content varbinary(max)
AS
BEGIN
	SET NOCOUNT ON;

INSERT INTO [915].[FileContent]
           ([FileDetailId]
           ,[Content]
           )
     VALUES(
           @FileDetailId
           ,@Content
		   )
	
END

