CREATE TABLE [entity].[ProgramNeedCodeMapping](
	[FiscalYear]				[INT]	NOT NULL,
	[ServiceDescriptorId]		[INT]	NOT NULL,
	[NeedDescriptorId]			[INT]	NOT NULL,
	[ProgramTypeId]				[INT]	NOT NULL,
	[StudentNeedCategoryTypeId] [INT]	NOT NULL,
	CONSTRAINT [FK_ProgramNeedCodeMapping_ServiceDescriptorId] FOREIGN KEY ([FiscalYear],[ServiceDescriptorId]) REFERENCES [leadata].[Descriptor] ([FiscalYear],[DescriptorId]),
	CONSTRAINT [FK_ProgramNeedCodeMapping_NeedDescriptorId] FOREIGN KEY ([FiscalYear],NeedDescriptorId) REFERENCES [leadata].[Descriptor] ([FiscalYear],[DescriptorId]),
	CONSTRAINT [FK_ProgramNeedCodeMapping_ProgramTypeId] FOREIGN KEY ([ProgramTypeId]) REFERENCES [entity].[ProgramType] ([ProgramTypeId]),
	CONSTRAINT [FK_ProgramNeedCodeMapping_StudentNeedCategoryTypeId] FOREIGN KEY ([StudentNeedCategoryTypeId]) REFERENCES [leadata].[StudentNeedCategoryType] ([StudentNeedCategoryTypeId])
) 
