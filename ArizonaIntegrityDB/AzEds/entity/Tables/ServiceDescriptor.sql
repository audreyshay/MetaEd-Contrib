CREATE TABLE [entity].[ServiceDescriptor](
	[FiscalYear] [INT] NOT NULL,
	[ServiceDescriptorId] [int] NOT NULL,
	[SelfContainedEligible] BIT NOT NULL,
	[ServiceCategory] [nvarchar](50) NULL, 
    CONSTRAINT [PK_ServiceDescriptor] PRIMARY KEY ([FiscalYear], [ServiceDescriptorId])	
 );