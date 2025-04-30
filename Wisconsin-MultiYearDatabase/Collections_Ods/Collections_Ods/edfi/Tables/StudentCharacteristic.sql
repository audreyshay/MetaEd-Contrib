CREATE TABLE [edfi].[StudentCharacteristic] (
	[StudentUSI]                        INT           NOT NULL,
	[StudentCharacteristicDescriptorId] INT           NOT NULL,
	[BeginDate]                         DATE          NULL,
	[EndDate]                           DATE          NULL,
	[DesignatedBy]                      NVARCHAR (60) NULL,
	[CreateDate]                        DATETIME      CONSTRAINT [StudentCharacteristic_DF_CreateDate] DEFAULT (getdate()) NOT NULL,
	[SchoolYear]                        SMALLINT      DEFAULT (datepart(year,getdate())) NOT NULL,
	CONSTRAINT [PK_StudentCharacteristics] PRIMARY KEY CLUSTERED 
		([SchoolYear] ASC, [StudentUSI] ASC, [StudentCharacteristicDescriptorId] ASC),
	CONSTRAINT [FK_StudentCharacteristic_Student_StudentUSI_SchoolYear]
		FOREIGN KEY ([SchoolYear],[StudentUSI]) 
		REFERENCES [edfi].[Student] ([SchoolYear],[StudentUSI]) 
		ON DELETE CASCADE,
	CONSTRAINT [FK_StudentCharacteristic_StudentCharacteristicDescriptorId] 
		FOREIGN KEY ([StudentCharacteristicDescriptorId]) 
		REFERENCES [edfi].[StudentCharacteristicDescriptor] ([StudentCharacteristicDescriptorId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Important characteristics of the student''s home situation: Displaced Homemaker, Homeless, Immigrant, Migratory, Military Parent, Pregnant Teen, Single Parent and Unaccompanied Youth.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCharacteristic';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique number or alphanumeric code assigned to a student by a state education agency.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCharacteristic', @level2type = N'COLUMN', @level2name = N'StudentUSI';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The characteristic designated for the student.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCharacteristic', @level2type = N'COLUMN', @level2name = N'StudentCharacteristicDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the characteristic was designated.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCharacteristic', @level2type = N'COLUMN', @level2name = N'BeginDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date the characteristic was removed.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCharacteristic', @level2type = N'COLUMN', @level2name = N'EndDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The person, organization, or department that designated the characteristic.', @level0type = N'SCHEMA', @level0name = N'edfi', @level1type = N'TABLE', @level1name = N'StudentCharacteristic', @level2type = N'COLUMN', @level2name = N'DesignatedBy';

