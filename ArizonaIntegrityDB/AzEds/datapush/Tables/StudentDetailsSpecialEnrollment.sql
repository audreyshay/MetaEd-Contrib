CREATE TABLE [datapush].[StudentDetailsSpecialEnrollment]
(
	[ID]  INT NOT NULL,
	[SpecialEnrollmentDescriptorId] INT NOT NULL,
	[XSDID] [varchar](50) NULL,
    CONSTRAINT [PK_StudentDetailsSpecialEnrollment] PRIMARY KEY CLUSTERED ([ID] ASC,[SpecialEnrollmentDescriptorId] ASC)
)