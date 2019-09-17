-- =============================================
-- Author:		Martez Killens
-- Create date: 05/26/2017
-- Description:	Get Authorization Messages
-- =============================================
CREATE PROCEDURE [config].[GetAuthorizationMessages]
AS
BEGIN
	SELECT 
		AuthorizationMessageId,
		AuthorizationMessageCodeValue,
		AuthorizationMessage
	FROM [config].[AuthorizationMessage]
END