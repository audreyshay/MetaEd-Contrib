ALTER TABLE [edfixtranscript].[CourseTranscript] WITH CHECK ADD CONSTRAINT [FK_CourseTranscript_CourseAttemptResultDescriptor] FOREIGN KEY ([CourseAttemptResultDescriptorId])
REFERENCES [edfi].[CourseAttemptResultDescriptor] ([CourseAttemptResultDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscript_CourseAttemptResultDescriptor]
ON [edfixtranscript].[CourseTranscript] ([CourseAttemptResultDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscript] WITH CHECK ADD CONSTRAINT [FK_CourseTranscript_CourseIdentificationSystemDescriptor] FOREIGN KEY ([CourseIdentificationSystemDescriptorId])
REFERENCES [edfi].[CourseIdentificationSystemDescriptor] ([CourseIdentificationSystemDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscript_CourseIdentificationSystemDescriptor]
ON [edfixtranscript].[CourseTranscript] ([CourseIdentificationSystemDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscript] WITH CHECK ADD CONSTRAINT [FK_CourseTranscript_CourseRepeatCodeDescriptor] FOREIGN KEY ([CourseRepeatCodeDescriptorId])
REFERENCES [edfi].[CourseRepeatCodeDescriptor] ([CourseRepeatCodeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscript_CourseRepeatCodeDescriptor]
ON [edfixtranscript].[CourseTranscript] ([CourseRepeatCodeDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscript] WITH CHECK ADD CONSTRAINT [FK_CourseTranscript_CreditTypeDescriptor] FOREIGN KEY ([AttemptedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscript_CreditTypeDescriptor]
ON [edfixtranscript].[CourseTranscript] ([AttemptedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscript] WITH CHECK ADD CONSTRAINT [FK_CourseTranscript_CreditTypeDescriptor1] FOREIGN KEY ([EarnedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscript_CreditTypeDescriptor1]
ON [edfixtranscript].[CourseTranscript] ([EarnedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscript] WITH CHECK ADD CONSTRAINT [FK_CourseTranscript_EducationOrganization] FOREIGN KEY ([ExternalEducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscript_EducationOrganization]
ON [edfixtranscript].[CourseTranscript] ([ExternalEducationOrganizationId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscript] WITH CHECK ADD CONSTRAINT [FK_CourseTranscript_GradeLevelDescriptor] FOREIGN KEY ([WhenTakenGradeLevelDescriptorId])
REFERENCES [edfi].[GradeLevelDescriptor] ([GradeLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscript_GradeLevelDescriptor]
ON [edfixtranscript].[CourseTranscript] ([WhenTakenGradeLevelDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscript] WITH CHECK ADD CONSTRAINT [FK_CourseTranscript_MethodCreditEarnedDescriptor] FOREIGN KEY ([MethodCreditEarnedDescriptorId])
REFERENCES [edfi].[MethodCreditEarnedDescriptor] ([MethodCreditEarnedDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscript_MethodCreditEarnedDescriptor]
ON [edfixtranscript].[CourseTranscript] ([MethodCreditEarnedDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscript] WITH CHECK ADD CONSTRAINT [FK_CourseTranscript_StudentAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfixtranscript].[StudentAcademicRecord] ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscript_StudentAcademicRecord]
ON [edfixtranscript].[CourseTranscript] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [StudentUSI] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscriptAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_CourseTranscriptAcademicSubject_AcademicSubjectDescriptor] FOREIGN KEY ([AcademicSubjectDescriptorId])
REFERENCES [edfi].[AcademicSubjectDescriptor] ([AcademicSubjectDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscriptAcademicSubject_AcademicSubjectDescriptor]
ON [edfixtranscript].[CourseTranscriptAcademicSubject] ([AcademicSubjectDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscriptAcademicSubject] WITH CHECK ADD CONSTRAINT [FK_CourseTranscriptAcademicSubject_CourseTranscript] FOREIGN KEY ([CourseAttemptResultDescriptorId], [CourseIdentificationCode], [CourseIdentificationSystemDescriptorId], [EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfixtranscript].[CourseTranscript] ([CourseAttemptResultDescriptorId], [CourseIdentificationCode], [CourseIdentificationSystemDescriptorId], [EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscriptAcademicSubject_CourseTranscript]
ON [edfixtranscript].[CourseTranscriptAcademicSubject] ([CourseAttemptResultDescriptorId] ASC, [CourseIdentificationCode] ASC, [CourseIdentificationSystemDescriptorId] ASC, [EducationOrganizationId] ASC, [SchoolYear] ASC, [StudentUSI] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscriptAlternativeCourseIdentificationCode] WITH CHECK ADD CONSTRAINT [FK_CourseTranscriptAlternativeCourseIdentificationCode_CourseIdentificationSystemDescriptor] FOREIGN KEY ([AlternativeCourseIdentificationSystemDescriptorId])
REFERENCES [edfi].[CourseIdentificationSystemDescriptor] ([CourseIdentificationSystemDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscriptAlternativeCourseIdentificationCode_CourseIdentificationSystemDescriptor]
ON [edfixtranscript].[CourseTranscriptAlternativeCourseIdentificationCode] ([AlternativeCourseIdentificationSystemDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscriptAlternativeCourseIdentificationCode] WITH CHECK ADD CONSTRAINT [FK_CourseTranscriptAlternativeCourseIdentificationCode_CourseTranscript] FOREIGN KEY ([CourseAttemptResultDescriptorId], [CourseIdentificationCode], [CourseIdentificationSystemDescriptorId], [EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfixtranscript].[CourseTranscript] ([CourseAttemptResultDescriptorId], [CourseIdentificationCode], [CourseIdentificationSystemDescriptorId], [EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscriptAlternativeCourseIdentificationCode_CourseTranscript]
ON [edfixtranscript].[CourseTranscriptAlternativeCourseIdentificationCode] ([CourseAttemptResultDescriptorId] ASC, [CourseIdentificationCode] ASC, [CourseIdentificationSystemDescriptorId] ASC, [EducationOrganizationId] ASC, [SchoolYear] ASC, [StudentUSI] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscriptCourse] WITH CHECK ADD CONSTRAINT [FK_CourseTranscriptCourse_Course] FOREIGN KEY ([CourseCode], [CourseEducationOrganizationId])
REFERENCES [edfi].[Course] ([CourseCode], [EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscriptCourse_Course]
ON [edfixtranscript].[CourseTranscriptCourse] ([CourseCode] ASC, [CourseEducationOrganizationId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscriptCourse] WITH CHECK ADD CONSTRAINT [FK_CourseTranscriptCourse_CourseTranscript] FOREIGN KEY ([CourseAttemptResultDescriptorId], [CourseIdentificationCode], [CourseIdentificationSystemDescriptorId], [EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfixtranscript].[CourseTranscript] ([CourseAttemptResultDescriptorId], [CourseIdentificationCode], [CourseIdentificationSystemDescriptorId], [EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscriptCourse_CourseTranscript]
ON [edfixtranscript].[CourseTranscriptCourse] ([CourseAttemptResultDescriptorId] ASC, [CourseIdentificationCode] ASC, [CourseIdentificationSystemDescriptorId] ASC, [EducationOrganizationId] ASC, [SchoolYear] ASC, [StudentUSI] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscriptCreditCategory] WITH CHECK ADD CONSTRAINT [FK_CourseTranscriptCreditCategory_CourseTranscript] FOREIGN KEY ([CourseAttemptResultDescriptorId], [CourseIdentificationCode], [CourseIdentificationSystemDescriptorId], [EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfixtranscript].[CourseTranscript] ([CourseAttemptResultDescriptorId], [CourseIdentificationCode], [CourseIdentificationSystemDescriptorId], [EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscriptCreditCategory_CourseTranscript]
ON [edfixtranscript].[CourseTranscriptCreditCategory] ([CourseAttemptResultDescriptorId] ASC, [CourseIdentificationCode] ASC, [CourseIdentificationSystemDescriptorId] ASC, [EducationOrganizationId] ASC, [SchoolYear] ASC, [StudentUSI] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscriptCreditCategory] WITH CHECK ADD CONSTRAINT [FK_CourseTranscriptCreditCategory_CreditCategoryDescriptor] FOREIGN KEY ([CreditCategoryDescriptorId])
REFERENCES [edfi].[CreditCategoryDescriptor] ([CreditCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscriptCreditCategory_CreditCategoryDescriptor]
ON [edfixtranscript].[CourseTranscriptCreditCategory] ([CreditCategoryDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscriptEarnedAdditionalCredits] WITH CHECK ADD CONSTRAINT [FK_CourseTranscriptEarnedAdditionalCredits_AdditionalCreditTypeDescriptor] FOREIGN KEY ([AdditionalCreditTypeDescriptorId])
REFERENCES [edfi].[AdditionalCreditTypeDescriptor] ([AdditionalCreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscriptEarnedAdditionalCredits_AdditionalCreditTypeDescriptor]
ON [edfixtranscript].[CourseTranscriptEarnedAdditionalCredits] ([AdditionalCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[CourseTranscriptEarnedAdditionalCredits] WITH CHECK ADD CONSTRAINT [FK_CourseTranscriptEarnedAdditionalCredits_CourseTranscript] FOREIGN KEY ([CourseAttemptResultDescriptorId], [CourseIdentificationCode], [CourseIdentificationSystemDescriptorId], [EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfixtranscript].[CourseTranscript] ([CourseAttemptResultDescriptorId], [CourseIdentificationCode], [CourseIdentificationSystemDescriptorId], [EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_CourseTranscriptEarnedAdditionalCredits_CourseTranscript]
ON [edfixtranscript].[CourseTranscriptEarnedAdditionalCredits] ([CourseAttemptResultDescriptorId] ASC, [CourseIdentificationCode] ASC, [CourseIdentificationSystemDescriptorId] ASC, [EducationOrganizationId] ASC, [SchoolYear] ASC, [StudentUSI] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecord_CreditTypeDescriptor] FOREIGN KEY ([CumulativeEarnedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecord_CreditTypeDescriptor]
ON [edfixtranscript].[StudentAcademicRecord] ([CumulativeEarnedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecord_CreditTypeDescriptor1] FOREIGN KEY ([CumulativeAttemptedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecord_CreditTypeDescriptor1]
ON [edfixtranscript].[StudentAcademicRecord] ([CumulativeAttemptedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecord_CreditTypeDescriptor2] FOREIGN KEY ([SessionEarnedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecord_CreditTypeDescriptor2]
ON [edfixtranscript].[StudentAcademicRecord] ([SessionEarnedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecord_CreditTypeDescriptor3] FOREIGN KEY ([SessionAttemptedCreditTypeDescriptorId])
REFERENCES [edfi].[CreditTypeDescriptor] ([CreditTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecord_CreditTypeDescriptor3]
ON [edfixtranscript].[StudentAcademicRecord] ([SessionAttemptedCreditTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecord_EducationOrganization] FOREIGN KEY ([EducationOrganizationId])
REFERENCES [edfi].[EducationOrganization] ([EducationOrganizationId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecord_EducationOrganization]
ON [edfixtranscript].[StudentAcademicRecord] ([EducationOrganizationId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecord_SchoolYearType] FOREIGN KEY ([SchoolYear])
REFERENCES [edfi].[SchoolYearType] ([SchoolYear])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecord_SchoolYearType]
ON [edfixtranscript].[StudentAcademicRecord] ([SchoolYear] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecord_Student] FOREIGN KEY ([StudentUSI])
REFERENCES [edfi].[Student] ([StudentUSI])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecord_Student]
ON [edfixtranscript].[StudentAcademicRecord] ([StudentUSI] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecord] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecord_TermDescriptor] FOREIGN KEY ([TermDescriptorId])
REFERENCES [edfi].[TermDescriptor] ([TermDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecord_TermDescriptor]
ON [edfixtranscript].[StudentAcademicRecord] ([TermDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordAcademicHonor] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordAcademicHonor_AcademicHonorCategoryDescriptor] FOREIGN KEY ([AcademicHonorCategoryDescriptorId])
REFERENCES [edfi].[AcademicHonorCategoryDescriptor] ([AcademicHonorCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordAcademicHonor_AcademicHonorCategoryDescriptor]
ON [edfixtranscript].[StudentAcademicRecordAcademicHonor] ([AcademicHonorCategoryDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordAcademicHonor] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordAcademicHonor_AchievementCategoryDescriptor] FOREIGN KEY ([AchievementCategoryDescriptorId])
REFERENCES [edfi].[AchievementCategoryDescriptor] ([AchievementCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordAcademicHonor_AchievementCategoryDescriptor]
ON [edfixtranscript].[StudentAcademicRecordAcademicHonor] ([AchievementCategoryDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordAcademicHonor] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordAcademicHonor_StudentAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfixtranscript].[StudentAcademicRecord] ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordAcademicHonor_StudentAcademicRecord]
ON [edfixtranscript].[StudentAcademicRecordAcademicHonor] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [StudentUSI] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordClassRanking] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordClassRanking_StudentAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfixtranscript].[StudentAcademicRecord] ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordDiploma] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordDiploma_AchievementCategoryDescriptor] FOREIGN KEY ([AchievementCategoryDescriptorId])
REFERENCES [edfi].[AchievementCategoryDescriptor] ([AchievementCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordDiploma_AchievementCategoryDescriptor]
ON [edfixtranscript].[StudentAcademicRecordDiploma] ([AchievementCategoryDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordDiploma] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordDiploma_DiplomaLevelDescriptor] FOREIGN KEY ([DiplomaLevelDescriptorId])
REFERENCES [edfi].[DiplomaLevelDescriptor] ([DiplomaLevelDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordDiploma_DiplomaLevelDescriptor]
ON [edfixtranscript].[StudentAcademicRecordDiploma] ([DiplomaLevelDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordDiploma] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordDiploma_DiplomaTypeDescriptor] FOREIGN KEY ([DiplomaTypeDescriptorId])
REFERENCES [edfi].[DiplomaTypeDescriptor] ([DiplomaTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordDiploma_DiplomaTypeDescriptor]
ON [edfixtranscript].[StudentAcademicRecordDiploma] ([DiplomaTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordDiploma] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordDiploma_StudentAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfixtranscript].[StudentAcademicRecord] ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordDiploma_StudentAcademicRecord]
ON [edfixtranscript].[StudentAcademicRecordDiploma] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [StudentUSI] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordGradePointAverage_GradePointAverageTypeDescriptor] FOREIGN KEY ([GradePointAverageTypeDescriptorId])
REFERENCES [edfi].[GradePointAverageTypeDescriptor] ([GradePointAverageTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordGradePointAverage_GradePointAverageTypeDescriptor]
ON [edfixtranscript].[StudentAcademicRecordGradePointAverage] ([GradePointAverageTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordGradePointAverage] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordGradePointAverage_StudentAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfixtranscript].[StudentAcademicRecord] ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordGradePointAverage_StudentAcademicRecord]
ON [edfixtranscript].[StudentAcademicRecordGradePointAverage] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [StudentUSI] ASC, [TermDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordRecognition] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordRecognition_AchievementCategoryDescriptor] FOREIGN KEY ([AchievementCategoryDescriptorId])
REFERENCES [edfi].[AchievementCategoryDescriptor] ([AchievementCategoryDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordRecognition_AchievementCategoryDescriptor]
ON [edfixtranscript].[StudentAcademicRecordRecognition] ([AchievementCategoryDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordRecognition] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordRecognition_RecognitionTypeDescriptor] FOREIGN KEY ([RecognitionTypeDescriptorId])
REFERENCES [edfi].[RecognitionTypeDescriptor] ([RecognitionTypeDescriptorId])
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordRecognition_RecognitionTypeDescriptor]
ON [edfixtranscript].[StudentAcademicRecordRecognition] ([RecognitionTypeDescriptorId] ASC)
GO

ALTER TABLE [edfixtranscript].[StudentAcademicRecordRecognition] WITH CHECK ADD CONSTRAINT [FK_StudentAcademicRecordRecognition_StudentAcademicRecord] FOREIGN KEY ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
REFERENCES [edfixtranscript].[StudentAcademicRecord] ([EducationOrganizationId], [SchoolYear], [StudentUSI], [TermDescriptorId])
ON DELETE CASCADE
GO

CREATE NONCLUSTERED INDEX [FK_StudentAcademicRecordRecognition_StudentAcademicRecord]
ON [edfixtranscript].[StudentAcademicRecordRecognition] ([EducationOrganizationId] ASC, [SchoolYear] ASC, [StudentUSI] ASC, [TermDescriptorId] ASC)
GO

