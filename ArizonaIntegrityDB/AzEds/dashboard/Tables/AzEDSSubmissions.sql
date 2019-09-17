CREATE TABLE [dashboard].[AzEDSSubmissions]
(
	AzEDSSubmissionsId INT NOT NULL IDENTITY(1,1),
	FiscalYear INT NOT NULL,
	SubmissionDate date NOT NULL,
	SubmittedByLocalEducationAgencyId int NOT NULL,
	TotalSubmissions int NOT NULL,
	SuccessfulSubmissions int NOT NULL,
	[CreateDate] DATETIME NOT NULL default getdate(),
	CONSTRAINT [PK_AzEDSSubmissions] PRIMARY KEY CLUSTERED ([AzEDSSubmissionsId]),
)
