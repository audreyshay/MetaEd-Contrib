CREATE TABLE [edfiV3].[SchoolFoodServiceProgramServiceDescriptor] (
    [SchoolFoodServiceProgramServiceDescriptorId] INT NOT NULL,
	[PriorityOrder]			INT NULL,
	CONSTRAINT [V3_PK_SchoolFoodServiceProgramServiceDescriptor] PRIMARY KEY CLUSTERED ([SchoolFoodServiceProgramServiceDescriptorId] ASC),
    CONSTRAINT [V3_FK_SchoolFoodServiceProgramServiceDescriptor_Descriptor] FOREIGN KEY ([SchoolFoodServiceProgramServiceDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A unique identifier used as Primary Key, not derived from business logic, when acting as Foreign Key, references the parent table.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'SchoolFoodServiceProgramServiceDescriptor', @level2type = N'COLUMN', @level2name = N'SchoolFoodServiceProgramServiceDescriptorId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This descriptor defines the services provided by an education organization to populations of students associated with a school food service program.', @level0type = N'SCHEMA', @level0name = N'edfiV3', @level1type = N'TABLE', @level1name = N'SchoolFoodServiceProgramServiceDescriptor';

