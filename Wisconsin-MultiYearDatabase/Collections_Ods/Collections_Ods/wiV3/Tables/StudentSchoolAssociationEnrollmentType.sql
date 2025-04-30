CREATE TABLE [wiV3].[StudentSchoolAssociationEnrollmentType](
    [ApiSchoolYear]				 SMALLINT		NOT NULL,
	[EnrollmentTypeDescriptorId] [int] NOT NULL,
	[EntryDate] [date] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[CreateDate] DATETIME2 (7) NOT NULL,
	CONSTRAINT [V3_PK_StudentSchoolAssociationEnrollmentType] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EnrollmentTypeDescriptorId] ASC, [EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC),
	CONSTRAINT [V3_FK_StudentSchoolAssociationEnrollmentType_EnrollmentTypeDescriptor] FOREIGN KEY([EnrollmentTypeDescriptorId]) REFERENCES [wiV3].[EnrollmentTypeDescriptor] ([EnrollmentTypeDescriptorId]),
	CONSTRAINT [V3_FK_StudentSchoolAssociationEnrollmentType_StudentSchoolAssociation] FOREIGN KEY([ApiSchoolYear], [SchoolId], [StudentUSI], [EntryDate]) REFERENCES [edfiV3].[StudentSchoolAssociation] ([ApiSchoolYear], [SchoolId], [StudentUSI], [EntryDate]) ON UPDATE CASCADE ON DELETE CASCADE
)
GO