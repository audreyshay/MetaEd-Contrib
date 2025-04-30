CREATE TABLE [edfiV3].[StaffLanguage]
(
	[ApiSchoolYear]	   SMALLINT NOT NULL, 
    [LanguageDescriptorId] INT      NOT NULL,
    [StaffUSI]             INT      NOT NULL,
    [CreateDate]           DATETIME2 (7) NOT NULL,
	CONSTRAINT [V3_FK_StaffLanguage_LanguageDescriptor] FOREIGN KEY ([LanguageDescriptorId]) REFERENCES [edfiV3].[LanguageDescriptor] ([LanguageDescriptorId]),
    CONSTRAINT [V3_PK_StaffLanguage] PRIMARY KEY ([ApiSchoolYear], [StaffUSI], [LanguageDescriptorId]), 
    CONSTRAINT [V3_FK_StaffLanguage_Staff] FOREIGN KEY ([ApiSchoolYear], [StaffUSI]) REFERENCES edfiV3.[Staff]([ApiSchoolYear], [StaffUSI]) ON DELETE CASCADE

)
