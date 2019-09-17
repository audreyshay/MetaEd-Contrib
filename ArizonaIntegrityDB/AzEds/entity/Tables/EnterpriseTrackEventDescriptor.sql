CREATE TABLE [entity].[EnterpriseTrackEventDescriptor]
(  [ID] INT NOT NULL
  ,[TrackEventDescriptorId] INT NOT NULL
  ,[TrackEventTypeId] INT NOT NULL
  ,CONSTRAINT [PK_EnterpriseTrackEventDescriptor] PRIMARY KEY CLUSTERED ([ID] ASC, [TrackEventDescriptorId] ASC)
  ,CONSTRAINT [FK_EnterpriseTrackEventDescriptor] FOREIGN KEY ([TrackEventTypeId]) REFERENCES [entity].[TrackEventType] ([TrackEventTypeId])
)