CREATE TABLE [oct1].[StudentProgramOct1SpedEligibility]
(   
    [ID]		[int]  IDENTITY(1,1) NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[StudentUSI] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[ProgramTypeId] [int] NOT NULL,
	[ProgramEducationOrganizationId] [int] NOT NULL,
	[ProgramName] nvarchar(60) NOT NULL,
	[ProgramBeginDate] [date] NOT NULL,
	[ProgramEndDate] [date] NULL,
	[ProgramCode]  nvarchar(50) NULL,
	[IsOCT1Instructional] [bit] NOT NULL,
	[Last_InstructionalDate_beforeOct1] [date] NULL,
	[First_InstructionalDate_afterOct1] [date] NULL,
	[IsOct1SpedEligible] [bit] NOT NULL,
	[Oct1SpedReasonId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_StudentProgramOct1SpedEligibility_CreatedDate]  DEFAULT (getdate()),
	CONSTRAINT [PK_StudentProgramOct1SpedEligibility_ID] PRIMARY KEY CLUSTERED ([ID] ASC ),
	CONSTRAINT [FK_StudentProgramOct1SpedEligibility_Oct1SpedReason] FOREIGN KEY ([Oct1SpedReasonId]) REFERENCES [oct1].[Oct1SpedReason] ([Oct1SpedReasonId])
)
	GO
CREATE NONCLUSTERED INDEX [IX_StudentProgramOct1SpedEligibility_Programs] ON [oct1].[StudentProgramOct1SpedEligibility]
(   [FiscalYear] ASC,
	[StudentUSI] ASC,
	[SchoolId] ASC,
	[ProgramTypeId] ASC,
	[ProgramEducationOrganizationId] ASC,
	[ProgramName] ASC,
	[ProgramBeginDate] ASC,
	[ProgramEndDate] ASC,
	[ProgramCode]  ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
