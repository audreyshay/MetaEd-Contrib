CREATE TABLE [xref].[CourseRepeatCodeDescriptorType]
(
	[CourseRepeatCodeTypeId] int NOT NULL, 
	[CourseRepeatCodeTypeCodeValue] nvarchar(50) NOT NULL, 
	[CourseRepeatCodeTypeDescription] nvarchar(1024) NOT NULL,
	CONSTRAINT [PK_CourseRepeatCodeDescriptorType] PRIMARY KEY ( [CourseRepeatCodeTypeId] ASC, [CourseRepeatCodeTypeCodeValue] ASC )
);