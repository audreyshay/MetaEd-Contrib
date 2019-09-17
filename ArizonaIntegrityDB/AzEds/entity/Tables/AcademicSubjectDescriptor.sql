CREATE TABLE [entity].[AcademicSubjectDescriptor]
(
	[AcademicSubjectDescriptorId] [int] NOT NULL,
	[CodeValue]             NVARCHAR (50)    NOT NULL,
    [Description]           NVARCHAR (1024)  NOT NULL,
	CONSTRAINT [PK_AcademicSubjectDescriptor] PRIMARY KEY CLUSTERED ([AcademicSubjectDescriptorId] ASC)
)