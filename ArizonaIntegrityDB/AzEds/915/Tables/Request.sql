
CREATE TABLE [915].[Request](
	[RequestId] [bigint] IDENTITY(1,1) NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[LocalEducationAgencyId] [int] NOT NULL,
	[CreatedBy] [nchar](100) NOT NULL,
	[AssignedTo] [nchar](100) NOT NULL,
	[LastModifiedBy] [nchar](100) NOT NULL,
	[CreatedDtm] [datetime] NOT NULL,
	[LastModifiedDtm] [datetime] NOT NULL,
	[EndDtm] [datetime] NOT NULL,
	[RequestStatusId] [int] NOT NULL,
	[BeginDtm] [datetime] NOT NULL,
	[LastSystemModifiedDtm] [datetime] NULL,
	[RequestTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [915].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_FiscalYear] FOREIGN KEY([FiscalYear])
REFERENCES [config].[FiscalYear] ([FiscalYear])
GO

ALTER TABLE [915].[Request] CHECK CONSTRAINT [FK_Request_FiscalYear]
GO

ALTER TABLE [915].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_RequestStatustypeId] FOREIGN KEY([RequestStatusId])
REFERENCES [config].[RequestStatus915] ([RequestStatus915Id])
GO

ALTER TABLE [915].[Request] CHECK CONSTRAINT [FK_Request_RequestStatustypeId]
GO

