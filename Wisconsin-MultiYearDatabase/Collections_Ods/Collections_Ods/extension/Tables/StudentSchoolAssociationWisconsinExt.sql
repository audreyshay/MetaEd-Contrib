CREATE TABLE [extension].[StudentSchoolAssociationWisconsinExt] (
	[Id]                                    UNIQUEIDENTIFIER CONSTRAINT [StudentSchoolAssociationWisconsinExt_DF_Id] DEFAULT (newid()) NOT NULL,
	[SchoolId]                              INT              NOT NULL,
	[StudentUSI]                            INT              NOT NULL,
	[SchoolYear]                            SMALLINT         NOT NULL,
	[EntryDate]                             DATE             NOT NULL,
	[CompletedSchoolTerm]                   BIT              NULL,
	[ExpectedTransferEducationOrganizationId] INT              NULL,
	[ExpectedTransferSchoolId]                INT              NULL,
	[ExpectedTransferResponse]              INT              NULL,
	[ActualDaysAttendance]                  DECIMAL (4, 1)   NULL,
	[PossibleDaysAttendance]                DECIMAL (4, 1)   NULL,
	[PrivateSchoolChoiceProgramParticipant] BIT              NULL,
	[CreateDate]                            DATETIME         CONSTRAINT [StudentSchoolAssociationWisconsinExt_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[LastModifiedDate]                      DATETIME         CONSTRAINT [StudentSchoolAssociationWisconsinExt_DF_LastModifiedDate] DEFAULT (getdate()) NOT NULL,
	[IsActive]                              BIT              CONSTRAINT [DF_StudentSchoolAssociationWisconsinExt_IsActive] DEFAULT ((1)) NOT NULL,
	[DpiCalcDateModified]					DATETIME         NULL,
	CONSTRAINT [PK_StudentSchoolAssociationWisconsinExt_1] PRIMARY KEY CLUSTERED 
		( [SchoolYear] ASC, [StudentUSI] ASC, [SchoolId] ASC,[EntryDate] ASC),
	CONSTRAINT [FK_StudentSchoolAssociationWisconsinExt_ExpectedTransferEducationOrganizationId] 
		FOREIGN KEY ([SchoolYear],[ExpectedTransferEducationOrganizationId]) 
		REFERENCES [edfi].[EducationOrganization] ([SchoolYear],[EducationOrganizationId]),
	CONSTRAINT [FK_StudentSchoolAssociationWisconsinExt_ExpectedTransferSchoolId] 
		FOREIGN KEY ([SchoolYear],[ExpectedTransferSchoolId]) 
		REFERENCES [edfi].[School] ([SchoolYear],[SchoolId]),
	--CONSTRAINT [FK_StudentSchoolAssociationWisconsinExt_ExpectedTransferResponse] 
	--	FOREIGN KEY ([ExpectedTransferResponse]) 
	--	REFERENCES [validate].[ExpectedTransferResponse] ([Id]),
	CONSTRAINT [FK_StudentSchoolAssociationWisconsinExt_StudentUSI_SchoolId_SchoolYear_EntryDate] 
		FOREIGN KEY ([SchoolYear], [StudentUSI], [SchoolId],  [EntryDate]) 
		REFERENCES [edfi].[StudentSchoolAssociation] ([SchoolYear],[StudentUSI], [SchoolId], [EntryDate]) 
		ON UPDATE CASCADE
);





GO
CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociationWisconsinExt_IsActive] ON [extension].[StudentSchoolAssociationWisconsinExt]
(
	[IsActive] ASC
)
INCLUDE ( 	[SchoolId],
	[StudentUSI],
	[SchoolYear],
	[EntryDate],
	[ActualDaysAttendance],
	[PossibleDaysAttendance],
	[Id]);
GO


CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociationWisconsinExt_Id_IsActive] ON [extension].[StudentSchoolAssociationWisconsinExt]
(
	[Id] ASC,
	[IsActive] ASC
)
INCLUDE ( 	[EntryDate]) 
GO


EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Wisconsin''s extension of studentSchoolAssociation which includes CompletedSchoolTerm, ExpectedTransferEducationOrganizationId, ExpectedTransferSchoolId, ActualDaysAttendance (aggregate), PossibleDaysAttendance (aggregate)', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExt';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'School enrolling the Student.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExt', @level2type = N'COLUMN', @level2name = N'SchoolId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Student enrolled in the School.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExt', @level2type = N'COLUMN', @level2name = N'StudentUSI';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The entry date associated with the student''s enrollment.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExt', @level2type = N'COLUMN', @level2name = N'EntryDate';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether or not a student completed the school term during the school enrollment period.  It is collected for every student enrollment record and is not related to graduation.  A student could have more than one enrollment record for a school year.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExt', @level2type = N'COLUMN', @level2name = N'CompletedSchoolTerm';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The student''s expected transfer agency (EducationOrganizationId)', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExt', @level2type = N'COLUMN', @level2name = 'ExpectedTransferEducationOrganizationId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The student''s expected transfer school (SchoolId)', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExt', @level2type = N'COLUMN', @level2name = 'ExpectedTransferSchoolId';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Aggregate value that captures the actual days in attendance for a student.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExt', @level2type = N'COLUMN', @level2name = N'ActualDaysAttendance';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Aggregate value that capture the possible days in attendance for a student', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExt', @level2type = N'COLUMN', @level2name = N'PossibleDaysAttendance';
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Indicates whether a student is a choice student or not', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExt', @level2type = N'COLUMN', @level2name = N'PrivateSchoolChoiceProgramParticipant';
GO

GO

CREATE NONCLUSTERED INDEX [IX_StudentSchoolAssociationWisconsinExt_LastModified]
    ON [extension].[StudentSchoolAssociationWisconsinExt](   IsActive DESC,
    SchoolID,
	SchoolYear DESC,
    LastModifiedDate DESC)
GO