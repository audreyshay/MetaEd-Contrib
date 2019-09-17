CREATE TABLE [xref].[CourseAttemptResultDescriptorType]
(
	[CourseAttemptResultTypeId] int NOT NULL, 
	[CourseAttemptResultTypeCodeValue] nvarchar(50) NOT NULL,
	[CourseAttemptResultTypeDescription] nvarchar(1024) NOT NULL,
	constraint [PK_CourseAttemptResultDescriptorType] PRIMARY KEY ([CourseAttemptResultTypeId]ASC,[CourseAttemptResultTypeCodeValue] ASC )
);