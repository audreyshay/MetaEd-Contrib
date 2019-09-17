CREATE TABLE [dashboard].[EventDate]
(
	[EventDateId] INT NOT NULL IDENTITY(1,1),	 
	[EventDate] DATETIME NOT NULL,
	[CreateDate] DATETIME NOT NULL default getdate(),
    CONSTRAINT [PK_EventDate] PRIMARY KEY CLUSTERED ([EventDateId]), 
)
GO;
