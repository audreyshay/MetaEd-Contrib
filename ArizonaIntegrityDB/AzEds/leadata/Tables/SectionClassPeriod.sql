
CREATE TABLE [leadata].[SectionClassPeriod](
	[FiscalYear] [int] NOT NULL,
	[ClassPeriodName] [nvarchar](60) NOT NULL,
	[LocalCourseCode] [nvarchar](60) NOT NULL,
	[SchoolId] [int] NOT NULL,
	[SchoolYear] [smallint] NOT NULL,
	[SectionIdentifier] [nvarchar](255) NOT NULL,
	[SessionName] [nvarchar](60) NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
 CONSTRAINT [SectionClassPeriod_PK] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
	[ClassPeriodName] ASC,
	[LocalCourseCode] ASC,
	[SchoolId] ASC,
	[SchoolYear] ASC,
	[SectionIdentifier] ASC,
	[SessionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[SectionClassPeriod] ADD  CONSTRAINT [SectionClassPeriod_DF_LoadDate]  DEFAULT (getutcdate()) FOR [LoadDate]
GO

ALTER TABLE [leadata].[SectionClassPeriod]  WITH CHECK ADD  CONSTRAINT [FK_SectionClassPeriod_ClassPeriod] FOREIGN KEY([FiscalYear], [SchoolId], [ClassPeriodName])
REFERENCES [leadata].[ClassPeriod] ([FiscalYear], [SchoolId], [ClassPeriodName])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[SectionClassPeriod] CHECK CONSTRAINT [FK_SectionClassPeriod_ClassPeriod]
GO
