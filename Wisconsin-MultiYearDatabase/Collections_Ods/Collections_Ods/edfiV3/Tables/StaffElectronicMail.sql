CREATE TABLE [edfiV3].[StaffElectronicMail]
(
	[ApiSchoolYear]	   SMALLINT NOT NULL,
	[ElectronicMailTypeDescriptorId] INT            NOT NULL,
    [StaffUSI]                       INT            NOT NULL,
    [ElectronicMailAddress]          NVARCHAR (128) NOT NULL,
    [PrimaryEmailAddressIndicator]   BIT            NULL,
    [DoNotPublishIndicator]          BIT            NULL,
    [CreateDate]                     DATETIME2 (7)       NOT NULL,
	CONSTRAINT [V3_FK_StaffElectronicMail_ElectronicMailTypeDescriptor] FOREIGN KEY ([ElectronicMailTypeDescriptorId]) REFERENCES [edfiV3].[ElectronicMailTypeDescriptor] ([ElectronicMailTypeDescriptorId]),
    CONSTRAINT [V3_PK_StaffElectronicMail] PRIMARY KEY ([ApiSchoolYear], [StaffUSI], [ElectronicMailTypeDescriptorId]), 
    CONSTRAINT [V3_FK_StaffElectronicMail_Staff] FOREIGN KEY ([ApiSchoolYear], [StaffUSI]) REFERENCES [edfiV3].[Staff]([ApiSchoolYear], [StaffUSI]) ON DELETE CASCADE
)
