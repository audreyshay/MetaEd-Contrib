/************************************************************
**Procedure Name: config.GetSystemStatusMessages
**
**Description:  Gets the List of Messages in System Status Page in Azeds Portal 
**	
**Revision History:
**	Who				When		What
**	Rohith			8/18/2016	Initial Creation
**
***************************************************************/
CREATE PROC [config].[GetSystemStatusMessages] 
AS
BEGIN
Declare @CurrentDate DateTime
Set @CurrentDate = GETDATE()

;WITH CTESystemMessages(
		Title,
		MessageText,
		StartDate,
		EndDate,
		SeverityLevel,
		DENSERANK,
		Createdate
		)
		AS
		(	
	SELECT 
		Title,
		MessageText,
		StartDate,
		EndDate,
		ssml.Description as 'SeverityLevel',
		DENSE_RANK() OVER (ORDER BY ssm.SeverityLevelTypeId) AS DENSERANK,
		ssm.CreateDate
		FROM [config].[SystemStatusMessages] ssm
		JOIN [config].[SystemStatusMessagesSeverityLevel]  ssml
		ON ssm.SeverityLevelTypeId = ssml.SeverityLevelTypeId
		WHERE @CurrentDate BETWEEN StartDate and EndDate
		
		)
	SELECT 
		Title,
		MessageText as 'Message',
		SeverityLevel 
		FROM CTESystemMessages
		ORDER BY DENSERANk, CREATEDATE DESC



			
END