CREATE TABLE [edfiV3].[StudentEducationOrganizationAssociationStudentIdentificationCode] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
	[AssigningOrganizationIdentificationCode] NVARCHAR (60) NOT NULL,
    [EducationOrganizationId]                 INT           NOT NULL,
    [StudentIdentificationSystemDescriptorId] INT           NOT NULL,
    [StudentUSI]                              INT           NOT NULL,
    [IdentificationCode]                      NVARCHAR (60) NOT NULL,
    [CreateDate]                              DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_StudentEducationOrganizationAssociationStudentIdentificationCode_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC,[AssigningOrganizationIdentificationCode] ASC, [EducationOrganizationId] ASC, [StudentIdentificationSystemDescriptorId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationStudentIdentificationCode_StudentEducationOrganizationAssociation] FOREIGN KEY ([ApiSchoolYear],[EducationOrganizationId], [StudentUSI]) REFERENCES [edfiV3].[StudentEducationOrganizationAssociation] ([ApiSchoolYear],[EducationOrganizationId], [StudentUSI]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationStudentIdentificationCode_StudentIdentificationSystemDescriptor] FOREIGN KEY ([StudentIdentificationSystemDescriptorId]) REFERENCES [edfiV3].[StudentIdentificationSystemDescriptor] ([StudentIdentificationSystemDescriptorId])
);