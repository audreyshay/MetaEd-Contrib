CREATE TABLE [xref].[CourseLevelCharacteristicDescriptorType]
(
	[CourseLevelCharacteristicTypeId] int NOT NULL, 	
	[CourseLevelCharacteristicTypeCodeValue] nvarchar(50) NOT NULL,  
	[CourseLevelCharacteristicTypeShortDescription] nvarchar(1024) NOT NULL,
	CONSTRAINT [PK_CourseLevelCharacteristicDescriptorType] PRIMARY KEY CLUSTERED ([CourseLevelCharacteristicTypeId] ASC, [CourseLevelCharacteristicTypeCodeValue] ASC)
);
