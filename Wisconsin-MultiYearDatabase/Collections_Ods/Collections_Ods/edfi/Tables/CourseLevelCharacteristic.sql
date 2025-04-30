CREATE TABLE [edfi].[CourseLevelCharacteristic](
	[EducationOrganizationId] [int] NOT NULL,
	[CourseCode] [nvarchar](60) NOT NULL,
	[CourseLevelCharacteristicTypeId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL CONSTRAINT [CourseLevelCharacteristic_DF_CreateDate]  DEFAULT (getdate()),
	[SchoolYear] SMALLINT NOT NULL DEFAULT (datepart(year,getdate())), 
 CONSTRAINT [PK_CourseLevelCharacteristics] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[EducationOrganizationId] ASC,
	[CourseCode] ASC,
	[CourseLevelCharacteristicTypeId] ASC
	
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[CourseLevelCharacteristic] ADD  CONSTRAINT [FK_CourseLevelCharacteristics_Course_EducationOrganizationId] 
	FOREIGN KEY([SchoolYear], [EducationOrganizationId], [CourseCode])
	REFERENCES [edfi].[Course] ([SchoolYear],[EducationOrganizationId], [CourseCode])
ON DELETE CASCADE
GO

ALTER TABLE [edfi].[CourseLevelCharacteristic] ADD  CONSTRAINT [FK_CourseLevelCharacteristics_CourseLevelCharacteristicsType_CourseLevelCharacteristicsTypeId] 
	FOREIGN KEY([CourseLevelCharacteristicTypeId])
	REFERENCES [edfi].[CourseLevelCharacteristicType] ([CourseLevelCharacteristicTypeId])
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Education Organization that defines the curriculum and courses offered - often the LEA or school.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseLevelCharacteristic', @level2type=N'COLUMN',@level2name=N'EducationOrganizationId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'TThe actual code that identifies the organization of subject matter and related learning experiences provided for the instruction of students.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseLevelCharacteristic', @level2type=N'COLUMN',@level2name=N'CourseCode'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Specification of the specific program or designation associated with the course. For example: Ap, IB, Dual Credit, CTE, etc.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseLevelCharacteristic', @level2type=N'COLUMN',@level2name=N'CourseLevelCharacteristicTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indication of the nature and difficulty of instruction: Remedial, Basic, Honors, AP, IB, Dual Credit, CTE, etc.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'CourseLevelCharacteristic'
GO

