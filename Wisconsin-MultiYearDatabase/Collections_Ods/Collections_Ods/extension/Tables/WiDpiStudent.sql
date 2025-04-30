CREATE TABLE [extension].[WiDpiStudent] (
	[StudentUSI] INT NOT NULL,
	[SchoolYear]                                SMALLINT         DEFAULT (datepart(year,getdate())) NOT NULL,
	[WiDpiStudentResidentEducationOrganizationId] INT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [WiDpiStudent_DF_CreateDate]  DEFAULT (getdate()),
	CONSTRAINT [FK_WiDpiStudent_Student] 
		FOREIGN KEY ([SchoolYear], [StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI])
		ON DELETE CASCADE,
	CONSTRAINT [FK_WiDpiStudent_WiDpiStudentResidentEducationOrganization] 
		FOREIGN KEY ([SchoolYear],[WiDpiStudentResidentEducationOrganizationId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear],[EducationOrganizationId]),
	CONSTRAINT [PK_WiDpiStudent] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC)
)
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Wisconsin DPI student extensions.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'WiDpiStudent';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The district in which the student resides', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'WiDpiStudent', @level2type = N'COLUMN', @level2name = N'WiDpiStudentResidentEducationOrganizationId';
GO