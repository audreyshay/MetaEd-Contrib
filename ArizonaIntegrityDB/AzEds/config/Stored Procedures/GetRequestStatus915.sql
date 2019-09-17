
CREATE PROCEDURE [config].[GetRequestStatus915]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [RequestStatus915Id]
      ,[RequestStatus915Description]
	FROM [AzEds].[config].[RequestStatus915]
END 