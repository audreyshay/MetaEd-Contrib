CREATE TABLE [edfiV3].[StudentEducationOrganizationAssociationStudentCharacteristicPeriod] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [BeginDate]                         DATE     NOT NULL,
    [EducationOrganizationId]           INT      NOT NULL,
    [StudentCharacteristicDescriptorId] INT      NOT NULL,
    [StudentUSI]                        INT      NOT NULL,
    [EndDate]                           DATE     NULL,
    [CreateDate]                        DATETIME2 (7) NOT NULL,
    CONSTRAINT [V3_StudentEducationOrganizationAssociationStudentCharacteristicPeriod_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [BeginDate] ASC, [EducationOrganizationId] ASC, [StudentCharacteristicDescriptorId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationStudentCharacteristicPeriod_StudentEducationOrganizationAssociationStudentCharacter] FOREIGN KEY ([ApiSchoolYear], [EducationOrganizationId], [StudentCharacteristicDescriptorId], [StudentUSI]) REFERENCES [edfiV3].[StudentEducationOrganizationAssociationStudentCharacteristic] ([ApiSchoolYear],[EducationOrganizationId], [StudentCharacteristicDescriptorId], [StudentUSI]) ON DELETE CASCADE
);


