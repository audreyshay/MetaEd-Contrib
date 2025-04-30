CREATE TABLE [extension].[WiDpiStudentSchoolAssociation] (
	[StudentUSI] INT NOT NULL,
	[SchoolId] INT NOT NULL,
	[EntryDate] DATE NOT NULL,
	[SchoolYear] SMALLINT DEFAULT (datepart(year,getdate())) NOT NULL,
	[WiDpiSsaProgramScheduleTypeId] INT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [WiDpiStudentSchoolAssociation_DF_CreateDate]  DEFAULT (getdate()),
	CONSTRAINT [FK_WiDpiStudentSchoolAssociation_Student] 
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI]),
	CONSTRAINT [FK_WiDpiStudentSchoolAssociation_School] 
		FOREIGN KEY ([SchoolYear],[SchoolId]) 
		REFERENCES [edfi].[School] ([SchoolYear],[SchoolId]),
	CONSTRAINT [FK_WiDpiStudentSchoolAssociation_StudentSchoolAssociation] 
		FOREIGN KEY ([SchoolYear],[StudentUSI], [SchoolId], [EntryDate]) 
		REFERENCES [edfi].[StudentSchoolAssociation]([SchoolYear],[StudentUSI],[SchoolId], [EntryDate])
		ON DELETE CASCADE,
	CONSTRAINT [FK_StudentSchoolAssociation_WiDpiSsaProgramScheduleTypeId] 
		FOREIGN KEY ([WiDpiSsaProgramScheduleTypeId]) 
		REFERENCES [extension].[WiDpiProgramScheduleType] ([WiDpiProgramScheduleTypeId]),
	CONSTRAINT [PK_WiDpiStudentSchoolAssociation] PRIMARY KEY CLUSTERED 
		([SchoolYear], [StudentUSI], [SchoolId], [EntryDate])
)
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Wisconsin DPI studentSchoolAssociation extensions.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'WiDpiStudentSchoolAssociation';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicator of school day schedule for Four year old and Five year old Kindergartners', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'WiDpiStudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'WiDpiSsaProgramScheduleTypeId';
GO