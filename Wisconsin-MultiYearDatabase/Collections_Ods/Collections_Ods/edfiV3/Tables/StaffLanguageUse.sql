CREATE TABLE [edfiV3].[StaffLanguageUse]
(
	[ApiSchoolYear]	   SMALLINT NOT NULL,
    [LanguageDescriptorId]    INT      NOT NULL,
    [LanguageUseDescriptorId] INT      NOT NULL,
    [StaffUSI]                INT      NOT NULL,
    [CreateDate]              DATETIME2 (7) NOT NULL,
	CONSTRAINT [V3_FK_StaffLanguageUse_LanguageUseDescriptor] FOREIGN KEY ([LanguageUseDescriptorId]) REFERENCES [edfiV3].[LanguageUseDescriptor] ([LanguageUseDescriptorId]), 
    CONSTRAINT [V3_PK_StaffLanguageUse] PRIMARY KEY ([LanguageUseDescriptorId], [LanguageDescriptorId], [StaffUSI], [ApiSchoolYear]), 
    CONSTRAINT [V3_FK_StaffLanguageUse_StaffLanguage] FOREIGN KEY ([ApiSchoolYear], [StaffUSI], [LanguageDescriptorId]) REFERENCES edfiV3.[StaffLanguage]([ApiSchoolYear], [StaffUSI], [LanguageDescriptorId]) ON DELETE CASCADE
)
