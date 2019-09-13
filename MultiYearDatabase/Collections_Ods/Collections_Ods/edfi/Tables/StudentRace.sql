CREATE TABLE [edfi].[StudentRace] (
	[StudentUSI] INT      NOT NULL,
	[RaceTypeId] INT      NOT NULL,
	[CreateDate] DATETIME CONSTRAINT [StudentRace_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear] SMALLINT DEFAULT (datepart(year,getdate())) NOT NULL,
	CONSTRAINT [PK_StudentRace] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [RaceTypeId] ASC),
	CONSTRAINT [FK_StudentRace_RaceType_RaceTypeId] 
		FOREIGN KEY ([RaceTypeId]) 
		REFERENCES [edfi].[RaceType] ([RaceTypeId]),
	CONSTRAINT [FK_StudentRace_Student_StudentUSI_SchoolYear] 
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI])
		ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The general racial category which most clearly reflects the individual''s recognition of his or her community or with which the individual most identifies. The data model allows for multiple entries so that each individual can specify all appropriate races.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentRace';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentRace', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Race', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentRace', @level2type = N'COLUMN', @level2name = N'RaceTypeId';

