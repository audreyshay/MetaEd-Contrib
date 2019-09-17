
CREATE PROCEDURE [915].[InsertWhitelistDetails] 
	@WhitelistDetails AS [915].WhitelistDetailTableType READONLY
AS
BEGIN
	SET NOCOUNT ON;

INSERT INTO [915].[WhitelistDetail]
           ([RequestId]
           ,[FileDetailId]
           ,[StudentUniqueId]
           ,[SchoolId]
           ,[PropertyLocator]
           ,[OldValue]
		   ,[NewValue]
           ,[ResourceTypeId]
           )
     SELECT
           RequestId
           ,FileDetailId
           ,StudentUniqueId
           ,SchoolId
           ,PropertyLocator
           ,OldValue
		   ,NewValue
           ,ResourceTypeId
	FROM @WhitelistDetails
END
