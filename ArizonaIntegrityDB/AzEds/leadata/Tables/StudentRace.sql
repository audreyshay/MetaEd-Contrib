CREATE TABLE [leadata].[StudentRace](
	[StudentUSI] [int] NOT NULL,
	[RaceTypeId] [int] NOT NULL,
	[EducationOrganizationid] [int] CONSTRAINT [StudentRace_DF_EducationOrganizationid] DEFAULT 79275 NOT NULL,
	[SourceCreateDate] [datetime] NOT NULL,
	[LoadDate] [datetime] NOT NULL CONSTRAINT [StudentRace_DF_LoadDate]  DEFAULT (getutcdate()),

 CONSTRAINT [PK_StudentRace] PRIMARY KEY CLUSTERED 
(
	[StudentUSI] ASC,
	[RaceTypeId] ASC,
	[EducationOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [leadata].[StudentRace]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentRace_RaceType_RaceTypeId] FOREIGN KEY([RaceTypeId])
REFERENCES [leadata].[RaceType] ([RaceTypeId])
GO

ALTER TABLE [leadata].[StudentRace] CHECK CONSTRAINT [FK_StudentRace_RaceType_RaceTypeId]
GO

ALTER TABLE [leadata].[StudentRace]  WITH NOCHECK ADD  CONSTRAINT [FK_StudentRace_Student_StudentUSI] FOREIGN KEY([StudentUSI])
REFERENCES [leadata].[Student] ([StudentUSI])
ON DELETE CASCADE
GO

ALTER TABLE [leadata].[StudentRace] CHECK CONSTRAINT [FK_StudentRace_Student_StudentUSI]
GO
