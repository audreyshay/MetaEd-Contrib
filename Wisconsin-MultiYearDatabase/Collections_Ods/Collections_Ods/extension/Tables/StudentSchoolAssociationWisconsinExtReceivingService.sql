CREATE TABLE [extension].[StudentSchoolAssociationWisconsinExtReceivingService] (
    [Id]                              UNIQUEIDENTIFIER CONSTRAINT [StudentSchoolAssociationWisconsinExtReceivingService_DF_Id] DEFAULT (newid()) NOT NULL,
    [SchoolId]                        INT              NOT NULL,
    [StudentUSI]                      INT              NOT NULL,
    [SchoolYear]                      SMALLINT         NOT NULL,
    [EntryDate]                       DATE             NOT NULL,
    [CountDateNameTypeId]             INT              NOT NULL,
    [CountDateReceivingServiceTypeId] INT              NOT NULL,
    [CreateDate]                      DATETIME         CONSTRAINT [StudentSchoolAssociationWisconsinExtReceivingService_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_StudentSchoolAssociationWisconsinExtReceivingService] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [SchoolId] ASC, [EntryDate] ASC, [CountDateNameTypeId] ASC),
    CONSTRAINT [FK_StudentSchoolAssociationWisconsinExtReceivingService_CountDateNameTypeId] 
		FOREIGN KEY ([CountDateNameTypeId]) 
		REFERENCES [extension].[CountDateNameType] ([CountDateNameTypeId]),
    CONSTRAINT [FK_StudentSchoolAssociationWisconsinExtReceivingService_CountDateReceivingServiceTypeId] 
		FOREIGN KEY ([CountDateReceivingServiceTypeId]) 
		REFERENCES [extension].[CountDateReceivingServiceType] ([CountDateReceivingServiceTypeId]),
    CONSTRAINT [FK_StudentSchoolAssociationWisconsinExtReceivingService_StudentUSI_SchoolId_SchoolYear_EntryDate] 
		FOREIGN KEY ([SchoolYear], [StudentUSI], [SchoolId], [EntryDate]) 
		REFERENCES [extension].[StudentSchoolAssociationWisconsinExt] ([SchoolYear],[StudentUSI], [SchoolId],  [EntryDate]) 
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

GO
CREATE NONCLUSTERED INDEX IX_StudentSchoolAssociationWisconsinExtReceivingService_Id 
	ON [extension].[StudentSchoolAssociationWisconsinExtReceivingService] ([Id]) 
	INCLUDE ( [SchoolId], [StudentUSI], [EntryDate], [CountDateNameTypeId]);


GO

CREATE NONCLUSTERED INDEX [<IX_StudentSchoolAssociationWisconsinExtReceivingService_CountDateReceivingServiceTypeId>]
ON [extension].[StudentSchoolAssociationWisconsinExtReceivingService] ([CountDateNameTypeId],[CountDateReceivingServiceTypeId])
INCLUDE ([SchoolId],[StudentUSI],[SchoolYear],[EntryDate])
GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The status of a student during a specific count date', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExtReceivingService';

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'School enrolling the Student.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExtReceivingService', @level2type = N'COLUMN', @level2name = N'SchoolId';

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'Student enrolled in the School.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExtReceivingService', @level2type = N'COLUMN', @level2name = N'StudentUSI';

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The entry date associated with the student''s enrolLment.', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExtReceivingService', @level2type = N'COLUMN', @level2name = N'EntryDate';

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The count date name for the student status (e.g 3rd Fri Sept)', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExtReceivingService', @level2type = N'COLUMN', @level2name = N'CountDateNameTypeId';

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'The status of the student during the specific count date (e.g. Present)', @level0type = N'SCHEMA', @level0name = N'extension', @level1type = N'TABLE', @level1name = N'StudentSchoolAssociationWisconsinExtReceivingService', @level2type = N'COLUMN', @level2name = N'CountDateReceivingServiceTypeId';


