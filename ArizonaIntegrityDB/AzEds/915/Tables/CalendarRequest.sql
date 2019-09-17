
CREATE TABLE [915].[CalendarRequest](
	[RequestId] [bigint] NOT NULL,
	[TrackNumber] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[CalendarCode] NVARCHAR (60) NOT NULL DEFAULT ('Not Applicable'), 
    [CalendarType] NCHAR(50) NOT NULL DEFAULT ('Not Applicable'), 
) ON [PRIMARY]
GO

ALTER TABLE [915].[CalendarRequest]  WITH CHECK ADD  CONSTRAINT [FK_CalendarRequest_Request] FOREIGN KEY([RequestId])
REFERENCES [915].[Request] ([RequestId])
GO

ALTER TABLE [915].[CalendarRequest] CHECK CONSTRAINT [FK_CalendarRequest_Request]
GO

