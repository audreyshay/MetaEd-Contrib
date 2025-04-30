CREATE TABLE [edfiV3].[StaffRace]
(
	[ApiSchoolYear]	   SMALLINT NOT NULL,
	[RaceDescriptorId] INT      NOT NULL,
    [StaffUSI]         INT      NOT NULL,
    [CreateDate]       DATETIME2 (7) NOT NULL,
	CONSTRAINT [V3_FK_StaffRace_RaceDescriptor] FOREIGN KEY ([RaceDescriptorId]) REFERENCES [edfiV3].[RaceDescriptor] ([RaceDescriptorId]),
    CONSTRAINT [V3_PK_StaffRace] PRIMARY KEY ([StaffUSI], [RaceDescriptorId], [ApiSchoolYear]), 
    CONSTRAINT [V3_FK_StaffRace_Staff] FOREIGN KEY ([ApiSchoolYear], [StaffUSI]) REFERENCES edfiV3.[Staff]([ApiSchoolYear],[StaffUSI]) ON DELETE CASCADE
)
