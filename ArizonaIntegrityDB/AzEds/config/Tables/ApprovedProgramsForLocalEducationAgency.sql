CREATE TABLE [config].[ApprovedProgramsForLocalEducationAgency](
	[FiscalYear] [INT] NOT NULL,
	[ProgramTypeId] [INT] NOT NULL,
	[LocalEducationAgencyId] [INT] NOT NULL,
 CONSTRAINT [PK_ApprovedProgramsForLocalEducationAgency_FiscalYear_ProgramTypeId_LocalEducationAgencyId] PRIMARY KEY CLUSTERED 
(
	[FiscalYear] ASC,
    [ProgramTypeId] ASC,
	[LocalEducationAgencyId] ASC
)
) 

GO

ALTER TABLE [config].[ApprovedProgramsForLocalEducationAgency]  WITH CHECK ADD  CONSTRAINT [FK_ApprovedProgramsForLocalEducationAgency_ProgramTypeId] FOREIGN KEY([ProgramTypeId])
REFERENCES [entity].[ProgramType] ([ProgramTypeId])
GO

ALTER TABLE [config].[ApprovedProgramsForLocalEducationAgency]  WITH CHECK ADD  CONSTRAINT [FK_ApprovedProgramsForLocalEducationAgency_LocalEducationAgencyId] FOREIGN KEY([LocalEducationAgencyId],[FiscalYear])
REFERENCES [entity].[LocalEducationAgency] ([LocalEducationAgencyId],[FiscalYear])
GO