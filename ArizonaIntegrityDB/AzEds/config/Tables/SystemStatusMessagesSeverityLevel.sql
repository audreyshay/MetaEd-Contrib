CREATE TABLE [Config].[SystemStatusMessagesSeverityLevel]
(
	SeverityLevelTypeId INT NOT NULL IDENTITY(1,1),
	Description NVarchar(150) NOT NULL,
	CONSTRAINT [PK_SeverityLevelTypeId] PRIMARY KEY CLUSTERED (SeverityLevelTypeId)
);