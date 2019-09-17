
CREATE TABLE [oct1].[Oct1SpedReason] (
	[Oct1SpedReasonId]		INT			   NOT NULL,
	[ReasonDescription]     NVARCHAR(1024) NOT NULL,
	CONSTRAINT [PK_Oct1SpedReason] PRIMARY KEY CLUSTERED ([Oct1SpedReasonId] ASC )
)