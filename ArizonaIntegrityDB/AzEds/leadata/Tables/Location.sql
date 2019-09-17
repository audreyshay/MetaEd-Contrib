CREATE TABLE [leadata].[Location]
(
	[FiscalYear] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[ClassroomIdentificationCode] [nvarchar](60) NOT NULL,
	[MaximumNumberOfSeats] [int] NULL,
	[OptimalNumberOfSeats] [int] NULL,
	[SourceId] [uniqueidentifier] NOT NULL,
	[SourceLastModifiedDate] [datetime] NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[Loaddate] [datetime] CONSTRAINT [Location_DF_LoadDate] DEFAULT (GETUTCDATE()) NOT NULL,
	[HashValue]				[binary](64)	  CONSTRAINT [Location_DF_HashValue] DEFAULT (00) NOT NULL,
	CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [SchoolId] ASC, [ClassroomIdentificationCode] ASC),
	CONSTRAINT [FK_Location_School_SchoolId] FOREIGN KEY([SchoolId], [FiscalYear]) REFERENCES [entity].[School] ([SchoolId], [FiscalYear])
);