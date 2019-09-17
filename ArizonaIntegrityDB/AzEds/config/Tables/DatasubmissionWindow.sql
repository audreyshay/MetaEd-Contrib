

CREATE TABLE [config].[DataSubmissionWindow](
	[FiscalYear] [int] NOT NULL,
	[RequestTypeId] [int] NOT NULL,
	[SubmissionStartDate] [datetime] NOT NULL,
	[SubmissionEndDate] [datetime] NULL,
	CONSTRAINT [PK_DataSubmissionWindow] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [RequestTypeId] ASC, [SubmissionStartDate] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [config].[DataSubmissionWindow]  WITH CHECK ADD  CONSTRAINT [FK_CalendarSubmissionWindow_RequestType915] FOREIGN KEY([RequestTypeId])
REFERENCES [config].[RequestType915] ([RequestTypeId])
GO

ALTER TABLE [config].[DataSubmissionWindow] CHECK CONSTRAINT [FK_CalendarSubmissionWindow_RequestType915]
GO

