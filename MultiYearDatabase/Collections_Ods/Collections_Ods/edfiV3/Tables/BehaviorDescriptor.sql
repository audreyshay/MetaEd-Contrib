CREATE TABLE [edfiV3].[BehaviorDescriptor] (
    [BehaviorDescriptorId]	INT NOT NULL,
	[PriorityOrder]			INT NULL,
	[FirearmRelated]		BIT NULL,
    CONSTRAINT [V3_BehaviorDescriptor_PK] PRIMARY KEY CLUSTERED ([BehaviorDescriptorId] ASC),
    CONSTRAINT [V3_FK_BehaviorDescriptor_Descriptor] FOREIGN KEY ([BehaviorDescriptorId]) REFERENCES [edfiV3].[Descriptor] ([DescriptorId]) ON DELETE CASCADE
);
