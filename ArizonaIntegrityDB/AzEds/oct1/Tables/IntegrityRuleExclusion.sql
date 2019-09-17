CREATE TABLE [oct1].[IntegrityRuleExclusion](
	[ExceptionMessageCode] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] CONSTRAINT [DF_IntegrityRuleExclusion_CreatedDate] DEFAULT (getdate()) NOT NULL,
	 CONSTRAINT [ExceptionMessageCode_PK] PRIMARY KEY ([ExceptionMessageCode] ASC)
) 