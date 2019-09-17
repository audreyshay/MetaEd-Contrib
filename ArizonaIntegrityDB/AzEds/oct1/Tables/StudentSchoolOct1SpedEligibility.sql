CREATE TABLE [oct1].[StudentSchoolOct1SpedEligibility] (
	[FiscalYear]					INT           NOT NULL,
	[StudentUSI]					INT           NOT NULL,
	[SchoolId]						INT           NOT NULL,
	[IsOct1SpedEligible]		    BIT			  NOT NULL,
	[Oct1SpedReasonId]				INT			  NULL,
	[CreatedDate]					DATETIME      CONSTRAINT [DF_StudentSchoolOct1SpedEligibility_CreatedDate] DEFAULT (getdate()) NOT NULL,
	CONSTRAINT [PK_StudentSchoolOct1SpedEligibility] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [StudentUSI] ASC, [SchoolId] ASC ),
	CONSTRAINT [FK_StudentSchoolOct1SpedEligibility_Oct1SpedReason] FOREIGN KEY ([Oct1SpedReasonId]) REFERENCES [oct1].[Oct1SpedReason] ([Oct1SpedReasonId])
)