CREATE TABLE [edfi].[Staff](
	[StaffUSI] [int] IDENTITY(1,1) NOT NULL,
	[PersonalTitlePrefix] [nvarchar](30) NULL,
	[FirstName] [nvarchar](75) NOT NULL,
	[MiddleName] [nvarchar](75) NULL,
	[LastSurname] [nvarchar](75) NOT NULL,
	[GenerationCodeSuffix] [nvarchar](10) NULL,
	[MaidenName] [nvarchar](75) NULL,
	[SexTypeId] [int] NULL,
	[BirthDate] [date] NULL,
	[HispanicLatinoEthnicity] [bit] NOT NULL,
	[OldEthnicityTypeId] [int] NULL,
	[HighestCompletedLevelOfEducationDescriptorId] [int] NULL,
	[YearsOfPriorProfessionalExperience] [decimal](5, 2) NULL,
	[YearsOfPriorTeachingExperience] [decimal](5, 2) NULL,
	[HighlyQualifiedTeacher] [bit] NULL,
	[LoginId] [nvarchar](60) NULL,
	[CitizenshipStatusTypeId] [int] NULL,
	[StaffUniqueId] [nvarchar](32) NOT NULL,
	[Id] [uniqueidentifier] NOT NULL CONSTRAINT [Staff_DF_Id]  DEFAULT (newid()),
	[LastModifiedDate] [datetime] NOT NULL CONSTRAINT [Staff_DF_LastModifiedDate]  DEFAULT (getdate()),
	[CreateDate] [datetime] NOT NULL CONSTRAINT [Staff_DF_CreateDate]  DEFAULT (getdate()),
	[SchoolYear] SMALLINT NOT NULL CONSTRAINT [Staff_DF_SchoolYear] DEFAULT (datepart(year,getdate())), 
	[IsActive] BIT CONSTRAINT [Staff_DF_IsActive] DEFAULT ((1)) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[SchoolYear] ASC,
	[StaffUSI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [edfi].[Staff] ADD CONSTRAINT [FK_Staff_CitizenshipStatusType_CitizenshipStatusTypeId] 
	FOREIGN KEY([CitizenshipStatusTypeId])
	REFERENCES [edfi].[CitizenshipStatusType] ([CitizenshipStatusTypeId])
GO

ALTER TABLE [edfi].[Staff] ADD CONSTRAINT [FK_Staff_LevelOfEducationDescriptor_HighestCompletedLevelOfEducationDescriptorId] 
	FOREIGN KEY([HighestCompletedLevelOfEducationDescriptorId])
	REFERENCES [edfi].[LevelOfEducationDescriptor] ([LevelOfEducationDescriptorId])
GO

ALTER TABLE [edfi].[Staff] ADD CONSTRAINT [FK_Staff_OldEthnicityType_OldEthnicityTypeId] 
	FOREIGN KEY([OldEthnicityTypeId])
	REFERENCES [edfi].[OldEthnicityType] ([OldEthnicityTypeId])
GO

ALTER TABLE [edfi].[Staff] ADD CONSTRAINT [FK_Staff_SexType_SexTypeId] 
	FOREIGN KEY([SexTypeId])
	REFERENCES [edfi].[SexType] ([SexTypeId])
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Staff Identity Column' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'StaffUSI'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A prefix used to denote the title, degree, position, or seniority of the person.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'PersonalTitlePrefix'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A name given to an individual at birth, baptism, or during another naming ceremony, or through legal change.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'FirstName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A secondary name given to an individual at birth, baptism, or during another naming ceremony.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'MiddleName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The name borne in common by members of a family.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'LastSurname'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An appendage, if any, used to denote an individual''s generation in his family (e.g., Jr., Sr., III).' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'GenerationCodeSuffix'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The person''s maiden name.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'MaidenName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A person''''s gender.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'SexTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The month, day, and year on which an individual was born.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'BirthDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication that the individual traces his or her origin or descent to Mexico, Puerto Rico, Cuba, Central, and South America, and other Spanish cultures, regardless of race. The term, "Spanish origin," can be used in addition to "Hispanic or Latino."' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'HispanicLatinoEthnicity'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Previous definition of Ethnicity combining Hispanic/latino and race:  1 - American Indian or Alaskan Native  2 - Asian or Pacific Islander  3 - Black, not of Hispanic origin  4 - Hispanic  5 - White, not of Hispanic origin' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'OldEthnicityTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'HighestCompletedLevelOfEducationDescriptorId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total number of years that an individual has previously held a similar professional position in one or more education institutions.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'YearsOfPriorProfessionalExperience'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The total number of years that an individual has previously held a teaching position in one or more education institutions.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'YearsOfPriorTeachingExperience'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An indication of whether a teacher is classified as highly qualified for his/her assignment according to state definition. This attribute indicates the teacher is highly qualified for ALL Sections being taught.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'HighlyQualifiedTeacher'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The login ID for the user; used for security access control interface.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'LoginId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'CitizenshipStatusTypeId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A unique alphanumeric code assigned to a staff.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'StaffUniqueId'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This entity represents an individual who performs specified activities for any public or private education institution or agency that provides instructional and/or support services to students or staff at the early childhood level through high school completion. For example, this includes: 1. An "employee" who performs services under the direction of the employing institution or agency is compensated for such services by the employer and is eligible for employee benefits and wage or salary tax withholdings 2. A "contractor" or "consultant" who performs services for an agreed upon fee or an employee of a management service contracted to work on site 3. A "volunteer" who performs services on a voluntary and uncompensated basis 4. An in-kind service provider 5. An independent contractor or businessperson working at a school site.' , @level0type=N'SCHEMA',@level0name=N'edfi', @level1type=N'TABLE',@level1name=N'Staff'
GO
