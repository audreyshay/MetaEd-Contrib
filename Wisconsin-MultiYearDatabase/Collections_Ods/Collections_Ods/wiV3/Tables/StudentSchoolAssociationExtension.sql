CREATE TABLE [wiV3].[StudentSchoolAssociationExtension] (
    [ApiSchoolYear]				 SMALLINT		NOT NULL,
	[EntryDate]                               DATE           NOT NULL,
    [SchoolId]                                INT            NOT NULL,
    [StudentUSI]                              INT            NOT NULL,
    [CompletedSchoolTerm]                     BIT            NULL,
    [ExpectedTransferLocalEducationAgencyId] INT            NULL,
    [ExpectedTransferSchoolId]                INT            NULL,
    [ActualDaysAttendance]                    DECIMAL (4, 1) NULL,
    [PossibleDaysAttendance]                  DECIMAL (4, 1) NULL,
    [PrivateSchoolChoiceProgramParticipant]   BIT            NULL,
    [CreateDate]                              DATETIME2 (7)       NOT NULL,
    CONSTRAINT [V3_StudentSchoolAssociationExtension_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolId] ASC, [StudentUSI] ASC, [EntryDate] ASC),
    CONSTRAINT [V3_FK_StudentSchoolAssociationExtension_LocalEducationAgency] FOREIGN KEY ([ApiSchoolYear], [ExpectedTransferLocalEducationAgencyId]) REFERENCES [edfiV3].[LocalEducationAgency] ([ApiSchoolYear], [LocalEducationAgencyId]),
    CONSTRAINT [V3_FK_StudentSchoolAssociationExtension_School] FOREIGN KEY ([ApiSchoolYear], [ExpectedTransferSchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear], [SchoolId]),
    CONSTRAINT [V3_FK_StudentSchoolAssociationExtension_StudentSchoolAssociation] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [StudentUSI], [EntryDate]) REFERENCES [edfiV3].[StudentSchoolAssociation] ([ApiSchoolYear], [SchoolId], [StudentUSI], [EntryDate]) ON DELETE CASCADE ON UPDATE CASCADE
);


