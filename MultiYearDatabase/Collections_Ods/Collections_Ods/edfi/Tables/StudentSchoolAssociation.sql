CREATE TABLE [edfi].[StudentSchoolAssociation] (
	[StudentUSI]                             INT              NOT NULL,
	[SchoolId]                               INT              NOT NULL,
	[SchoolYear]                             SMALLINT         NOT NULL,
	[EntryDate]                              DATE             NOT NULL,
	[EntryGradeLevelDescriptorId]            INT              NOT NULL,
	[EntryGradeLevelReasonTypeId]            INT              NULL,
	[EntryTypeDescriptorId]                  INT              NULL,
	[RepeatGradeIndicator]                   BIT              NULL,
	[SchoolChoiceTransfer]                   BIT              NULL,
	[ExitWithdrawDate]                       DATE             NULL,
	[ExitWithdrawTypeDescriptorId]           INT              NULL,
	[ResidencyStatusDescriptorId]            INT              NULL,
	[PrimarySchool]                          BIT              NULL,
	[EmployedWhileEnrolled]                  BIT              NULL,
	[ClassOfSchoolYear]                      SMALLINT         NULL,
	[EducationOrganizationId]                INT              NULL,
	[GraduationPlanTypeDescriptorId]         INT              NULL,
	[GraduationSchoolYear]                   SMALLINT         NULL,
	[Id]                                     UNIQUEIDENTIFIER CONSTRAINT [StudentSchoolAssociation_DF_Id] DEFAULT (newid()) NOT NULL,
	[LastModifiedDate]                       DATETIME         CONSTRAINT [StudentSchoolAssociation_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
	[CreateDate]                             DATETIME         CONSTRAINT [StudentSchoolAssociation_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[IsActive]                               BIT              CONSTRAINT [DF_StudentSchoolAssociation_IsActive] DEFAULT ((1)) NOT NULL,
	[DpiDropoutIndicator]                    CHAR              NULL,
	[DpiDropoutMidtermIndicator]             CHAR              NULL,
	[DpiDropoutFulltermIndicator]            CHAR              NULL,
	[DpiDropoutSchoolYear]                   SMALLINT         NULL,
	[DpiDropoutAccountableDistrictId]        INT              NULL,
	[DpiDropoutAccountableSchoolId]          INT              NULL,
	[DpiDropoutGradeLevel]                   VARCHAR (2)      NULL,
	[DpiExpectedTransferAgency] INT NULL, 
	[DpiCalcDateModified]                    DATETIME         NULL,
	[DpiCalcPpp] BIT NULL , 
	[EffectiveBeginDate]				  DATE		 NULL,
	[EffectiveEndDate]					  DATE		 NULL,
	[DpiCalcOverlap] BIT NULL, 
	[DpiAccountableSchoolId]          INT              NULL,
	[CountInclusion3rdFriSept]              BIT              NULL,
	[CountInclusionOct1]					BIT              NULL,
	[DpiCalcCteParticipant]					BIT              NULL,
	CONSTRAINT [PK_StudentSchoolAssociation] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [SchoolId] ASC, [EntryDate] ASC),
	CONSTRAINT [FK_StudentSchoolAssociation_EntryGradeLevelDescriptorId] 
		FOREIGN KEY ([EntryGradeLevelDescriptorId]) 
		REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId]),
	CONSTRAINT [FK_StudentSchoolAssociation_EntryGradeLevelReasonType_EntryGradeLevelReasonTypeId] 
		FOREIGN KEY ([EntryGradeLevelReasonTypeId]) 
		REFERENCES [edfi].[EntryGradeLevelReasonType] ([EntryGradeLevelReasonTypeId]),
	CONSTRAINT [FK_StudentSchoolAssociation_EntryTypeDescriptor_EntryTypeDescriptorId] 
		FOREIGN KEY ([EntryTypeDescriptorId]) 
		REFERENCES [edfi].[EntryTypeDescriptor] ([EntryTypeDescriptorId]),
	CONSTRAINT [FK_StudentSchoolAssociation_ExitWithdrawTypeDescriptor_ExitWithdrawTypeDescriptorId] 
		FOREIGN KEY ([ExitWithdrawTypeDescriptorId]) 
		REFERENCES [edfi].[ExitWithdrawTypeDescriptor] ([ExitWithdrawTypeDescriptorId]),
	CONSTRAINT [FK_StudentSchoolAssociation_GraduationPlan] 
		FOREIGN KEY ([SchoolYear],[EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear]) 
		REFERENCES [edfi].[GraduationPlan] ([SchoolYear],[EducationOrganizationId], [GraduationPlanTypeDescriptorId], [GraduationSchoolYear]),
	CONSTRAINT [FK_StudentSchoolAssociation_ResidencyStatusDescriptor_ResidencyStatusDescriptorId] 
		FOREIGN KEY ([ResidencyStatusDescriptorId]) 
		REFERENCES [edfi].[ResidencyStatusDescriptor] ([ResidencyStatusDescriptorId]),
	CONSTRAINT [FK_StudentSchoolAssociation_School_SchoolId] 
		FOREIGN KEY ([SchoolYear],[SchoolId]) 
		REFERENCES [edfi].[School] ([SchoolYear],[SchoolId]),
	CONSTRAINT [FK_StudentSchoolAssociation_SchoolYearType_ClassOfSchoolYear] 
		FOREIGN KEY ([ClassOfSchoolYear]) 
		REFERENCES [edfi].[SchoolYearType] ([SchoolYear]),
	CONSTRAINT [FK_StudentSchoolAssociation_SchoolYearType_SchoolYear] 
		FOREIGN KEY ([SchoolYear]) 
		REFERENCES [edfi].[SchoolYearType] ([SchoolYear]),
	CONSTRAINT [FK_StudentSchoolAssociation_Student_StudentUSI_SchoolYear] 
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI]),
	CONSTRAINT [FK_StudentSchoolAssociation_EducationOrganization_DpiExpectedTransferAgency] 
		FOREIGN KEY ([SchoolYear],[DpiExpectedTransferAgency]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear],[EducationOrganizationId]),
	
);

GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_StudentSchoolAssociation]
	ON [edfi].[StudentSchoolAssociation]([Id] ASC, [SchoolYear] ASC);


GO


CREATE NONCLUSTERED INDEX IX_StudentSchoolAssociation_SchoolId_SchoolYear_IsActive
	ON [edfi].[StudentSchoolAssociation] ([SchoolYear],[SchoolId], [IsActive])
	INCLUDE ( [StudentUSI], [EntryDate], [Id]);

GO

CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociation_ExitWithdrawDateStudentUSI]
	ON [edfi].[StudentSchoolAssociation]([ExitWithdrawDate] ASC, [StudentUSI] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociation_StudentUSI]
	ON [edfi].[StudentSchoolAssociation]([StudentUSI] ASC);


GO
CREATE NONCLUSTERED INDEX IX_StudentSchoolAssociation_SchoolYear_PrimarySchool_IsActive
ON [edfi].[StudentSchoolAssociation] ([SchoolYear],[PrimarySchool],[IsActive])
INCLUDE ([StudentUSI],[SchoolId],[EntryDate],[Id])

GO
CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociation_SchoolId_SchoolYear]
	ON [edfi].[StudentSchoolAssociation]([SchoolId] ASC, [SchoolYear] ASC)
	INCLUDE([StudentUSI], [EntryDate], [EntryGradeLevelDescriptorId]);
GO

CREATE NONCLUSTERED INDEX [IX_T3]
	ON [edfi].[StudentSchoolAssociation]([SchoolId] ASC, [SchoolYear] ASC, [PrimarySchool] ASC, [IsActive] ASC)
	INCLUDE([StudentUSI]);


GO
CREATE NONCLUSTERED INDEX [IX_T2]
	ON [edfi].[StudentSchoolAssociation]([SchoolYear] ASC, [EntryGradeLevelDescriptorId] ASC, [PrimarySchool] ASC, [IsActive] ASC)
	INCLUDE([StudentUSI], [SchoolId], [EntryDate]);


GO

CREATE NONCLUSTERED INDEX [IX_Attendance]
	ON [edfi].[StudentSchoolAssociation]([PrimarySchool] ASC, [IsActive] ASC)
	INCLUDE([StudentUSI], [SchoolId], [SchoolYear], [EntryDate], [Id], [ExitWithdrawDate]);

	GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This association represents the school in which a student is enrolled.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'School Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'SchoolId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identifier for a school year.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year on which an individual enters and begins to receive instructional services in a campus.
NEDM: School Entry Date
NEDM: LEA Entry Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'EntryDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade level or primary instructional level at which a student enters and receives services in a school or an educational institution during a given academic session.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'EntryGradeLevelDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'EntryGradeLevelReasonTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'EntryTypeDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indicator of whether the student is enrolling to repeat a grade level, either by failure or an agreement to hold the student back.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'RepeatGradeIndicator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An indication of whether students transferred in or out of the school did so during the school year under the provisions for public school choice in accordance with Title I, Part A, Section 1116.
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'SchoolChoiceTransfer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month, day, and year of the first day after the date of an individual''''s last attendance at a campus (if known), the day on which an individual graduated, or the date on which it becomes known officially that an individual left school.
NEDM: Exit/Withdraw Date
', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'ExitWithdrawDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'ExitWithdrawTypeDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'ResidencyStatusDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates if a given enrollment record should be considered the primary record for a student. If omitted, the default is true.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'PrimarySchool';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An individual who is a paid employee or works in his or her own business, profession, or farm and at the same time is enrolled in secondary, postsecondary, or adult education.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'EmployedWhileEnrolled';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Projected High School graduation year', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociation', @level2type = N'COLUMN', @level2name = N'ClassOfSchoolYear';

GO

CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociation_LastModified]
    ON [edfi].[StudentSchoolAssociation](   IsActive DESC,
    SchoolId,
	SchoolYear DESC,
    LastModifiedDate DESC)
GO

CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociation_UpdateDpiCalcPpp]
	ON [edfi].[StudentSchoolAssociation] ([SchoolYear],[IsActive])
	INCLUDE ([StudentUSI],[SchoolId],[EntryDate],[ExitWithdrawDate])
GO