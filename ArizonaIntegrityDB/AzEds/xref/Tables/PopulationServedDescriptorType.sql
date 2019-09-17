CREATE TABLE [xref].[PopulationServedDescriptorType]
(
	[PopulationServedTypeId] int NOT NULL, 
	[PopulationServedTypeCodeValue] nvarchar(50) NOT NULL, 
	[PopulationServedTypeDescription] nvarchar(1024) NOT NULL,
	CONSTRAINT [PK_PopulationServedDescriptorType] PRIMARY KEY CLUSTERED ([PopulationServedTypeId] ASC, [PopulationServedTypeCodeValue] ASC)
);
