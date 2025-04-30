CREATE TABLE [wiV3].[StudentSchoolAssociationReceivingService] (
	[ApiSchoolYear]				 SMALLINT		NOT NULL,
	[CountDateNameDescriptorId]             INT      NOT NULL,
    [EntryDate]                             DATE     NOT NULL,
    [SchoolId]                              INT      NOT NULL,
    [StudentUSI]                            INT      NOT NULL,
    [CountDateReceivingServiceDescriptorId] INT      NOT NULL,
    [CreateDate]                            DATETIME2 (7) NOT NULL,
    CONSTRAINT [V3_StudentSchoolAssociationReceivingService_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [CountDateNameDescriptorId] ASC, [EntryDate] ASC, [SchoolId] ASC, [StudentUSI] ASC),
    CONSTRAINT [V3_FK_StudentSchoolAssociationReceivingService_CountDateNameDescriptor] FOREIGN KEY ([CountDateNameDescriptorId]) REFERENCES [wiV3].[CountDateNameDescriptor] ([CountDateNameDescriptorId]),
    CONSTRAINT [V3_FK_StudentSchoolAssociationReceivingService_CountDateReceivingServiceDescriptor] FOREIGN KEY ([CountDateReceivingServiceDescriptorId]) REFERENCES [wiV3].[CountDateReceivingServiceDescriptor] ([CountDateReceivingServiceDescriptorId]),
    CONSTRAINT [V3_FK_StudentSchoolAssociationReceivingService_StudentSchoolAssociation] FOREIGN KEY ([ApiSchoolYear], [SchoolId], [StudentUSI], [EntryDate]) REFERENCES [edfiV3].[StudentSchoolAssociation] ([ApiSchoolYear], [SchoolId], [StudentUSI], [EntryDate]) ON DELETE CASCADE ON UPDATE CASCADE
);



