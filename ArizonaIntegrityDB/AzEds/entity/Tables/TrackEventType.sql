CREATE TABLE [entity].[TrackEventType] 
(
    [TrackEventTypeId]	INT IDENTITY (1, 1) NOT NULL,
    [CodeValue]			NVARCHAR (50)   NOT NULL,
    [Description]       NVARCHAR (1024) NOT NULL,
	[IsInstructional]	BIT	NOT NULL DEFAULT 0,
	[IsPlanned]			BIT NOT NULL DEFAULT 0,
	[IsHoliday]			BIT NOT NULL DEFAULT 0,
    CONSTRAINT [PK_TrackEventType] PRIMARY KEY CLUSTERED ([TrackEventTypeId] ASC)
);