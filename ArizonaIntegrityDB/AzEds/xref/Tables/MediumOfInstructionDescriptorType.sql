CREATE TABLE [xref].[MediumOfInstructionDescriptorType]
(
	MediumOfInstructionTypeId int NOT NULL, 
	MediumOfInstructionTypeCodeValue nvarchar(50) NOT NULL,  
	MediumOfInstructionTypeDescription nvarchar(1024) NOT NULL,
	CONSTRAINT [PK_MediumOfInstructionDescriptorType] PRIMARY KEY CLUSTERED ([MediumOfInstructionTypeId] ASC, [MediumOfInstructionTypeCodeValue] ASC)
);
