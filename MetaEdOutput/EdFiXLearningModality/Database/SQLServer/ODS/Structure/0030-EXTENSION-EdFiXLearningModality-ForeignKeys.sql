ALTER TABLE [edfixlearningmodality].[ModalityTimeTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ModalityTimeTypeDescriptor_Descriptor] FOREIGN KEY ([ModalityTimeTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixlearningmodality].[ModalityTypeDescriptor] WITH CHECK ADD CONSTRAINT [FK_ModalityTypeDescriptor_Descriptor] FOREIGN KEY ([ModalityTypeDescriptorId])
REFERENCES [edfi].[Descriptor] ([DescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixlearningmodality].[ProgramLearningModality] WITH CHECK ADD CONSTRAINT [FK_ProgramLearningModality_ModalityTimeTypeDescriptor] FOREIGN KEY ([ModalityTimeTypeDescriptorId])
REFERENCES [edfixlearningmodality].[ModalityTimeTypeDescriptor] ([ModalityTimeTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProgramLearningModality_ModalityTimeTypeDescriptor]
ON [edfixlearningmodality].[ProgramLearningModality] ([ModalityTimeTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixlearningmodality].[ProgramLearningModality] WITH CHECK ADD CONSTRAINT [FK_ProgramLearningModality_ModalityTypeDescriptor] FOREIGN KEY ([ModalityTypeDescriptorId])
REFERENCES [edfixlearningmodality].[ModalityTypeDescriptor] ([ModalityTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_ProgramLearningModality_ModalityTypeDescriptor]
ON [edfixlearningmodality].[ProgramLearningModality] ([ModalityTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixlearningmodality].[ProgramLearningModality] WITH CHECK ADD CONSTRAINT [FK_ProgramLearningModality_Program] FOREIGN KEY ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
REFERENCES [edfi].[Program] ([EducationOrganizationId], [ProgramName], [ProgramTypeDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_ProgramLearningModality_Program]
ON [edfixlearningmodality].[ProgramLearningModality] ([EducationOrganizationId] ASC, [ProgramName] ASC, [ProgramTypeDescriptorId] ASC)
GO

