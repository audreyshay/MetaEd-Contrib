CREATE TABLE [edfi].[StudentVisa]
(
	[StudentUSI] INT      NOT NULL,
	[VisaTypeId] INT      NOT NULL,
	[CreateDate] DATETIME CONSTRAINT [StudentVisa_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear]                        SMALLINT      NOT NULL,
	CONSTRAINT [PK_StudentVisa] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [VisaTypeId] ASC),
	CONSTRAINT [FK_StudentVisa_Student_StudentUSI_SchoolYear] 
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI])
		ON DELETE CASCADE,
	CONSTRAINT [FK_StudentVisa_VisaType_VisaTypeId] 
		FOREIGN KEY ([VisaTypeId]) 
		REFERENCES [edfi].[VisaType] ([VisaTypeId])
)
GO

CREATE NONCLUSTERED INDEX [FK_StudentVisa_Student_StudentUSI_SchoolYear]
	ON [edfi].[StudentVisa]([StudentUSI] ASC,[SchoolYear]);


GO
CREATE NONCLUSTERED INDEX [FK_StudentVisa_VisaType_VisaTypeId]
	ON [edfi].[StudentVisa]([VisaTypeId] ASC);


GO