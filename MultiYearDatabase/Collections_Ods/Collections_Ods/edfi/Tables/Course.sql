CREATE TABLE [edfi].[Course](
	[EducationOrganizationId] [int] NOT NULL,
	[CourseCode] [nvarchar](60) NOT NULL,
	[CourseTitle] [nvarchar](100) NOT NULL,
	[NumberOfParts] [int] NOT NULL,
	[AcademicSubjectDescriptorId] [int] NULL,
	[CourseDescription] [nvarchar](1024) NULL,
	[DateCourseAdopted] [date] NULL,
	[HighSchoolCourseRequirement] [bit] NULL,
	[CourseGPAApplicabilityTypeId] [int] NULL,
	[CourseDefinedByTypeId] [int] NULL,
	[MinimumAvailableCreditTypeId] [int] NULL,
	[MinimumAvailableCreditConversion] [decimal](9, 2) NULL,
	[MinimumAvailableCredits] [decimal](9, 2) NULL,
	[MaximumAvailableCreditTypeId] [int] NULL,
	[MaximumAvailableCreditConversion] [decimal](9, 2) NULL,
	[MaximumAvailableCredits] [decimal](9, 2) NULL,
	[CareerPathwayTypeId] [int] NULL,
	[TimeRequiredForCompletion] [int] NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [Course_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [Course_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [Course_DF_CreateDate]  DEFAULT (getdate()),
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
	[IsActive] BIT CONSTRAINT [Course_DF_IsActive] DEFAULT ((1)) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[EducationOrganizationId] ASC,
	[CourseCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[Course]  ADD CONSTRAINT [FK_Course_AcademicSubjectDescriptorId] 
	FOREIGN KEY([AcademicSubjectDescriptorId])
	REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

ALTER TABLE [edfi].[Course]  ADD CONSTRAINT [FK_Course_CareerPathwayType_CareerPthwayTypeId] 
	FOREIGN KEY([CareerPathwayTypeId])
	REFERENCES [edfi].[CareerPathwayType] ([CareerPathwayTypeId])
GO

ALTER TABLE [edfi].[Course]  ADD CONSTRAINT [FK_Course_CourseDefinedByType_CourseDefinedByTypeId] 
	FOREIGN KEY([CourseDefinedByTypeId])
	REFERENCES [edfi].[CourseDefinedByType] ([CourseDefinedByTypeId])
GO

ALTER TABLE [edfi].[Course] ADD  CONSTRAINT [FK_Course_CourseGPAApplicabilityType_CourseGPAApplicabilityTypeId] 
	FOREIGN KEY([CourseGPAApplicabilityTypeId])
	REFERENCES [edfi].[CourseGPAApplicabilityType] ([CourseGPAApplicabilityTypeId])
GO

ALTER TABLE [edfi].[Course] ADD  CONSTRAINT [FK_Course_CreditType_MaximumAvailableCreditTypeId] 
	FOREIGN KEY([MaximumAvailableCreditTypeId])
	REFERENCES [edfi].[CreditType] ([CreditTypeId])
GO

ALTER TABLE [edfi].[Course] ADD CONSTRAINT [FK_Course_CreditType_MinimumAvailableCreditTypeId] 
	FOREIGN KEY([MinimumAvailableCreditTypeId])
	REFERENCES [edfi].[CreditType] ([CreditTypeId])
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Education Organization that defines the curriculum and courses offered - often the LEA or school.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'EducationOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'CourseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The descriptive name given to a course of study offered in a school or other institution or organization. In departmentalized classes at the elementary, secondary, and postsecondary levels (and for staff development activities), this refers to the name by which a course is identified (e.g., American History, English III). For elementary and other non-departmentalized classes, it refers to any portion of the instruction for which a grade or report is assigned (e.g., reading, composition, spelling, and language arts).' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'CourseTitle'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of parts identified for a course.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'NumberOfParts'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The intended major subject area of the course.  NEDM: Secondary Course Subject Area' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'AcademicSubjectDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A description of the content standards and goals covered in the course. Reference may be made to state or national content standards.  NEDM: Course Description' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'CourseDescription'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the course was adopted by the education agency.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'DateCourseAdopted'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication that this course may satisfy high school graduation requirements in the course''s subject area.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'HighSchoolCourseRequirement'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indicator of whether or not this course being described is included in the computation of the student''s Grade Point Average, and if so, if it weighted differently from regular courses.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'CourseGPAApplicabilityTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for CourseDefinedByType.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'CourseDefinedByTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for Credit' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'MinimumAvailableCreditTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'MinimumAvailableCreditConversion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The minimum amount of credit available to a student who successfully completes the course' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'MinimumAvailableCredits'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for Credit' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'MaximumAvailableCreditTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'MaximumAvailableCreditConversion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The maximum amount of credit available to a student who successfully completes the course' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'MaximumAvailableCredits'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key for CareerPathway' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'CareerPathwayTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The actual or estimated number of clock minutes required for class completion. This number is especially important for career and technical education classes and may represent (in minutes) the clock hour requirement of the class.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course', @level2type=N'COLUMN',@level2name=N'TimeRequiredForCompletion'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This educational entity represents the organization of subject matter and related learning experiences provided for the instruction of students on a regular or systematic basis.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Course'
GO
