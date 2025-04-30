
CREATE TABLE [extension].[CourseOfferingCareerPathway] (
    [LocalCourseCode]          NVARCHAR (60)    NOT NULL,
    [SchoolId]                 INT              NOT NULL,
    [SchoolYear]               SMALLINT         NOT NULL,
    [TermDescriptorId]         INT              NOT NULL,
    [CareerPathwayTypeId]		 INT			  NOT NULL,
	[CreateDate] [datetime] NOT NULL,
    CONSTRAINT [PK_CourseOfferingCareerPathway] PRIMARY KEY CLUSTERED ([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [TermDescriptorId] ASC,[CareerPathwayTypeId] ASC),
    CONSTRAINT [FK_CourseOfferingCareerPathway_CourseOffering] FOREIGN KEY ([SchoolYear], [LocalCourseCode], [SchoolId], [TermDescriptorId]) REFERENCES [edfi].[CourseOffering] ( [SchoolYear],[LocalCourseCode], [SchoolId], [TermDescriptorId]) ON DELETE CASCADE,
    CONSTRAINT [FK_CourseOfferingCareerPathway_CareerPathwayType] FOREIGN KEY ([CareerPathwayTypeId]) REFERENCES [edfi].[CareerPathwayType] ([CareerPathwayTypeId])
);
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Additional CTE details for courses offered', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'CourseOfferingCareerPathway';
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for Career Pathway Type' , @level0type=N'SCHEMA',@level0name=N'extension', @level1type=N'TABLE',@level1name=N'CourseOfferingCareerPathway', @level2type=N'COLUMN',@level2name=N'CareerPathwayTypeId'
GO
