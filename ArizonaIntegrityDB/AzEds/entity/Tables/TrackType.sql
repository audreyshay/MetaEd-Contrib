CREATE TABLE [entity].[TrackType]
(  [TrackTypeId] INT IDENTITY(1,1) NOT NULL
  ,[TrackNumber] INT NOT NULL
  ,[GradeLevelTypeId] INT NOT NULL
  ,[WarningThresholdInDays] INT NOT NULL
  ,[NumberOfSessionDaysInWeek] INT NOT NULL
  ,[NumberOfFullWeeksRequired] INT NOT NULL
  ,[ErrorThresholdInDays] INT NOT NULL
  ,CONSTRAINT [PK_TrackType] PRIMARY KEY CLUSTERED ([TrackTypeId] ASC)
  )