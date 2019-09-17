CREATE TABLE [xref].[TrackEventDescriptorType](
	[TrackEventTypeId] [int] NOT NULL,
	[TrackEventDescriptorId] [int] NOT NULL,
	CONSTRAINT [PK_TrackEventDescriptorType] PRIMARY KEY CLUSTERED ([TrackEventTypeId] ASC,[TrackEventDescriptorId] ASC)
) 