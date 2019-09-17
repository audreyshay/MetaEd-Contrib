CREATE TABLE [oct1].[StudentProgramNeedAssociation] (
	[FiscalYear]                     INT           NOT NULL,
	[StudentUSI]                     INT           NOT NULL,
	[SchoolId]						 INT           NULL,
    [ProgramEducationOrganizationId] INT           NULL,
    [ProgramTypeId]                  INT           NULL,
    [ProgramName]                    NVARCHAR (60) NULL,
    [ProgramBeginDate]               DATE          NULL,
    [ProgramEndDate]				 DATE          NULL,
	[ExitCode]						 NVARCHAR (50) NULL,
	[ProgramCode]					 NVARCHAR (50) NULL,
	[NeedDescriptorId]				 INT           NULL,
	[NeedCode]						 NVARCHAR (50) NULL,
	[NeedStartDate]					 DATE          NULL,
	[NeedEndDate]					 DATE          NULL,
	[PrimaryStudentNeedIndicator]	 BIT		   NOT NULL,
	[SPASourceId]					 NVARCHAR (50) NULL,
	[SNSourceId]					 NVARCHAR (50) NULL,
	[CreatedDate]					 DATETIME	   NOT NULL CONSTRAINT [StudentProgramNeedAssociation_DF_CreatedDate]  DEFAULT (getutcdate()),
 );

GO
CREATE NONCLUSTERED INDEX [IX_StudentProgramNeedAssociation]
ON [oct1].[StudentProgramNeedAssociation] ([ProgramTypeId],[PrimaryStudentNeedIndicator],[ProgramBeginDate])
INCLUDE ([FiscalYear],[StudentUSI],[SchoolId],[ProgramEducationOrganizationId],[ProgramName],[ProgramEndDate],[ProgramCode])

