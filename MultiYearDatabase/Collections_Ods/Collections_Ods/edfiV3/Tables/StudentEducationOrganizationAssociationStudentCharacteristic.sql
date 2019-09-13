CREATE TABLE [edfiV3].[StudentEducationOrganizationAssociationStudentCharacteristic] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [EducationOrganizationId]           INT           NOT NULL,
    [StudentCharacteristicDescriptorId] INT           NOT NULL,
    [StudentUSI]                        INT           NOT NULL,
    [DesignatedBy]                      NVARCHAR (60) NULL,
    [CreateDate]                        DATETIME2 (7)      NOT NULL,
    CONSTRAINT [V3_StudentEducationOrganizationAssociationStudentCharacteristic_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [StudentCharacteristicDescriptorId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationStudentCharacteristic_StudentCharacteristicDescriptor] FOREIGN KEY ([StudentCharacteristicDescriptorId]) REFERENCES [edfiV3].[StudentCharacteristicDescriptor] ([StudentCharacteristicDescriptorId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationStudentCharacteristic_StudentEducationOrganizationAssociation] FOREIGN KEY ([ApiSchoolYear],[EducationOrganizationId], [StudentUSI]) REFERENCES [edfiV3].[StudentEducationOrganizationAssociation] ([ApiSchoolYear],[EducationOrganizationId], [StudentUSI]) ON DELETE CASCADE
);


