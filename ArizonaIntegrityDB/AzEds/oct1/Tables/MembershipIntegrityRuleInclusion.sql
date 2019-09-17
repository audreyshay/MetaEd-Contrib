CREATE TABLE [oct1].[MembershipIntegrityRuleInclusion]
(
	[ExceptionMessageCode] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_MembershipIntegrityRuleInclusion_CreatedDate]  DEFAULT (getdate()),
) 