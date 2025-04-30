CREATE TABLE [edfi].[StudentAcademicRecord] (
	[StudentUSI]                          INT              NOT NULL,
	[EducationOrganizationId]             INT              NOT NULL,
	[SchoolYear]                          SMALLINT         NOT NULL,
	[CumulativeEarnedCreditTypeId]        INT              NULL,
	[CumulativeEarnedCreditConversion]    DECIMAL (9, 2)   NULL,
	[CumulativeEarnedCredits]             DECIMAL (9, 2)   NULL,
	[CumulativeAttemptedCreditTypeId]     INT              NULL,
	[CumulativeAttemptedCreditConversion] DECIMAL (9, 2)   NULL,
	[CumulativeAttemptedCredits]          DECIMAL (9, 2)   NULL,
	[CumulativeGradePointsEarned]         DECIMAL (18, 4)  NULL,
	[CumulativeGradePointAverage]         DECIMAL (18, 4)  NULL,
	[GradeValueQualifier]                 NVARCHAR (80)    NULL,
	[ProjectedGraduationDate]             DATE             NULL,
	[SessionEarnedCreditTypeId]           INT              NULL,
	[SessionEarnedCreditConversion]       DECIMAL (9, 2)   NULL,
	[SessionEarnedCredits]                DECIMAL (9, 2)   NULL,
	[SessionAttemptedCreditTypeId]        INT              NULL,
	[SessionAttemptedCreditConversion]    DECIMAL (9, 2)   NULL,
	[SessionAttemptedCredits]             DECIMAL (9, 2)   NULL,
	[SessionGradePointsEarned]            DECIMAL (18, 4)  NULL,
	[SessionGradePointAverage]            DECIMAL (18, 4)  NULL,
	[Id]                                  UNIQUEIDENTIFIER CONSTRAINT [StudentAcademicRecord_DF_Id] DEFAULT (newid()) NOT NULL,
	[LastModifiedDate]                    DATETIME         CONSTRAINT [StudentAcademicRecord_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
	[CreateDate]                          DATETIME         CONSTRAINT [StudentAcademicRecord_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[TermDescriptorId]                    INT              NOT NULL,
	[IsActive]                            BIT              CONSTRAINT [DF_StudentAcademicRecord_IsActive] DEFAULT ((1)) NOT NULL,
	CONSTRAINT [PK_StudentAcademicRecord] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [EducationOrganizationId] ASC, [TermDescriptorId] ASC),
	CONSTRAINT [FK_StudentAcademicRecord_CreditType_CumulativeAttemptedCreditTypeId] 
		FOREIGN KEY ([CumulativeAttemptedCreditTypeId]) 
		REFERENCES [edfi].[CreditType] ([CreditTypeId]),
	CONSTRAINT [FK_StudentAcademicRecord_CreditType_CumulativeEarnedCreditTypeId] 
		FOREIGN KEY ([CumulativeEarnedCreditTypeId]) 
		REFERENCES [edfi].[CreditType] ([CreditTypeId]),
	CONSTRAINT [FK_StudentAcademicRecord_CreditType_SessionAttemptedCreditTypeId] 
		FOREIGN KEY ([SessionAttemptedCreditTypeId]) 
		REFERENCES [edfi].[CreditType] ([CreditTypeId]),
	CONSTRAINT [FK_StudentAcademicRecord_CreditType_SessionEarnedCreditTypeId] 
		FOREIGN KEY ([SessionEarnedCreditTypeId]) 
		REFERENCES [edfi].[CreditType] ([CreditTypeId]),
	CONSTRAINT [FK_StudentAcademicRecord_EducationOrganization_EducationOrganizationId] 
		FOREIGN KEY ([SchoolYear],[EducationOrganizationId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear],[EducationOrganizationId]),
	CONSTRAINT [FK_StudentAcademicRecord_SchoolYearType_SchoolYear] 
		FOREIGN KEY ([SchoolYear]) 
		REFERENCES [edfi].[SchoolYearType] ([SchoolYear]),
	CONSTRAINT [FK_StudentAcademicRecord_Student_StudentUSI_SchoolYear] 
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI]),
	CONSTRAINT [FK_StudentAcademicRecord_TermDescriptor_TermDescriptorId] 
		FOREIGN KEY ([TermDescriptorId]) 
		REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
);

GO
CREATE UNIQUE NONCLUSTERED INDEX [GUID_StudentAcademicRecord]
	ON [edfi].[StudentAcademicRecord]([Id] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This educational entity represents the cumulative record of academic achievement for a student.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'EducationOrganization Identity Column', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'EducationOrganizationId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The identifier for the school year.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'SchoolYear';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Credit', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeEarnedCreditTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeEarnedCreditConversion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cumulative number of credits an individual earns by completing courses or examinations during his or her enrollment in the current school as well as those credits transferred from schools in which the individual had been previously enrolled.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeEarnedCredits';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Credit', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeAttemptedCreditTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeAttemptedCreditConversion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cumulative number of credits an individual attempts to earn by taking courses during his or her enrollment in the current school as well as those credits transferred from schools in which the individual had been previously enrolled.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeAttemptedCredits';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The cumulative number of grade points an individual earns by successfully completing courses or examinations during his or her enrollment in the current school as well as those transferred from schools in which the individual had been previously enrolled.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeGradePointsEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A measure of average performance in all courses taken by an individual during his or her school career as determined for record-keeping purposes. This is obtained by dividing the total grade points received by the total number of credits attempted. This usually includes grade points received and credits attempted in his or her current school as well as those transferred from schools in which the individual was previously enrolled.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'CumulativeGradePointAverage';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The scale of equivalents, if applicable, for grades awarded as indicators of performance in schoolwork. For example, numerical equivalents for letter grades used in determining a student''s Grade Point Average (A=4, B=3, C=2, D=1 in a four-point system) or letter equivalents for percentage grades (90-100%=A, 80-90%=B, etc.).', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'GradeValueQualifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The month and year the student is projected to graduate.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'ProjectedGraduationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Credit', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'SessionEarnedCreditTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'SessionEarnedCreditConversion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of an credits an individual earned in this session.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'SessionEarnedCredits';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Key for Credit', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'SessionAttemptedCreditTypeId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Conversion factor that when multiplied by the number of credits is equivalent to Carnegie units.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'SessionAttemptedCreditConversion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of an credits an individual attempted to earn in this session.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'SessionAttemptedCredits';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of grade points an individual earned for this session.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'SessionGradePointsEarned';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The grade point average for an individual computed as the grade points earned during the session divided by the number of credits attempted.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentAcademicRecord', @level2type = N'COLUMN', @level2name = N'SessionGradePointAverage';

GO

CREATE NONCLUSTERED INDEX [IX_StudentAcademicRecord_LastModified]
    ON [edfi].[StudentAcademicRecord](   IsActive DESC,
    EducationOrganizationId,
	SchoolYear DESC,
    LastModifiedDate DESC)
GO