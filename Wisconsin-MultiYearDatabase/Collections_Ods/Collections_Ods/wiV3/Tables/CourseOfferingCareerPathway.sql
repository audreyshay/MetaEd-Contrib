CREATE TABLE [wiV3].[CourseOfferingCareerPathway](
    [ApiSchoolYear]					SMALLINT NOT NULL,
	[CareerPathwayDescriptorId]		[int] NOT NULL,
	[LocalCourseCode]				[nvarchar](60) NOT NULL,
	[SchoolId]						[int] NOT NULL,
	[SchoolYear]					[smallint] NOT NULL,
	[SessionName]					[nvarchar](60) NOT NULL,
	[CreateDate]					DATETIME2 (7) NOT NULL,
	CONSTRAINT [V3_PK_CourseOfferingCareerPathway] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [CareerPathwayDescriptorId] ASC, [LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SessionName] ASC),
    CONSTRAINT [V3_FK_CourseOfferingCareerPathway_CareerPathwayDescriptor] FOREIGN KEY ([CareerPathwayDescriptorId]) REFERENCES [edfiV3].[CareerPathwayDescriptor] ([CareerPathwayDescriptorId]),
    CONSTRAINT [V3_FK_CourseOfferingCareerPathway_CourseOffering] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [SchoolYear], [LocalCourseCode], [SessionName]) REFERENCES [edfiV3].[CourseOffering] ([ApiSchoolYear], [SchoolId], [SchoolYear], [LocalCourseCode], [SessionName]) ON DELETE CASCADE
)