CREATE TABLE [edfiV3].[StaffIdentificationCode] (
    [ApiSchoolYear]	   SMALLINT NOT NULL,
	[StaffIdentificationSystemDescriptorId]   INT           NOT NULL,
    [StaffUSI]                                INT           NOT NULL,
    [IdentificationCode]                      NVARCHAR (60) NOT NULL,
    [AssigningOrganizationIdentificationCode] NVARCHAR (60) NULL,
    [CreateDate]                              DATETIME2 (7)      NOT NULL,
	CONSTRAINT [V3_StaffIdentificationCode_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [StaffUSI] ASC, [StaffIdentificationSystemDescriptorId] ASC),
    CONSTRAINT [V3_FK_StaffIdentificationCode_Staff] FOREIGN KEY ([ApiSchoolYear], [StaffUSI]) REFERENCES [edfiV3].[Staff] ([ApiSchoolYear], [StaffUSI]) ON DELETE CASCADE,
    CONSTRAINT [V3_FK_StaffIdentificationCode_StaffIdentificationSystemDescriptor] FOREIGN KEY ([StaffIdentificationSystemDescriptorId]) REFERENCES [edfiV3].[StaffIdentificationSystemDescriptor] ([StaffIdentificationSystemDescriptorId])
);
