CREATE TABLE [edfiV3].[StudentEducationOrganizationAssociationElectronicMail] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
    [EducationOrganizationId]        INT            NOT NULL,
    [ElectronicMailTypeDescriptorId] INT            NOT NULL,
    [StudentUSI]                     INT            NOT NULL,
    [ElectronicMailAddress]          NVARCHAR (128) NOT NULL,
    [PrimaryEmailAddressIndicator]   BIT            NULL,
    [DoNotPublishIndicator]          BIT            NULL,
    [CreateDate]                     DATETIME2 (7)       CONSTRAINT [StudentEducationOrganizationAssociationElectronicMail_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [V3_StudentEducationOrganizationAssociationElectronicMail_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [EducationOrganizationId] ASC, [ElectronicMailTypeDescriptorId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationElectronicMail_ElectronicMailTypeDescriptor] FOREIGN KEY ([ElectronicMailTypeDescriptorId]) REFERENCES [edfiV3].[ElectronicMailTypeDescriptor] ([ElectronicMailTypeDescriptorId]),
    CONSTRAINT [V3_FK_StudentEducationOrganizationAssociationElectronicMail_StudentEducationOrganizationAssociation] FOREIGN KEY ([ApiSchoolYear],[EducationOrganizationId], [StudentUSI]) REFERENCES [edfiV3].[StudentEducationOrganizationAssociation] ([ApiSchoolYear],[EducationOrganizationId], [StudentUSI]) ON DELETE CASCADE
);