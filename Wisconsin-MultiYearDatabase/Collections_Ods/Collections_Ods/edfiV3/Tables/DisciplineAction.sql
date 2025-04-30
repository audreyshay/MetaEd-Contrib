CREATE TABLE [edfiV3].[DisciplineAction] (
	[ApiSchoolYear]	   SMALLINT NOT NULL, 
	[DisciplineActionIdentifier]                         NVARCHAR (20)    NOT NULL,
    [DisciplineDate]                                     DATE             NOT NULL,
    [StudentUSI]                                         INT              NOT NULL,
    [DisciplineActionLength]                             DECIMAL (5, 2)   NULL,
    [ActualDisciplineActionLength]                       DECIMAL (5, 2)   NULL,
    [DisciplineActionLengthDifferenceReasonDescriptorId] INT              NULL,
    [RelatedToZeroTolerancePolicy]                       BIT              NULL,
    [ResponsibilitySchoolId]                             INT              NOT NULL,
    [AssignmentSchoolId]                                 INT              NULL,
    [ReceivedEducationServicesDuringExpulsion]           BIT              NULL,
    [IEPPlacementMeetingIndicator]                       BIT              NULL,
    [CreateDate]                                         DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]                                   DATETIME2 (7)         NOT NULL,
    [Id]                                                 UNIQUEIDENTIFIER NOT NULL,
	[IsActive]											 BIT			CONSTRAINT [V3_DisciplineAction_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [V3_DisciplineAction_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [StudentUSI] ASC ,[DisciplineActionIdentifier] ASC, [DisciplineDate] ASC),
    CONSTRAINT [V3_FK_DisciplineAction_DisciplineActionLengthDifferenceReasonDescriptor] FOREIGN KEY ([DisciplineActionLengthDifferenceReasonDescriptorId]) REFERENCES [edfiV3].[DisciplineActionLengthDifferenceReasonDescriptor] ([DisciplineActionLengthDifferenceReasonDescriptorId]),
    CONSTRAINT [V3_FK_DisciplineAction_School] FOREIGN KEY ([ApiSchoolYear],[ResponsibilitySchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear],[SchoolId]),
    CONSTRAINT [V3_FK_DisciplineAction_School1] FOREIGN KEY ([ApiSchoolYear],[AssignmentSchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear],[SchoolId]),
    CONSTRAINT [V3_FK_DisciplineAction_Student] FOREIGN KEY ([ApiSchoolYear],[StudentUSI]) REFERENCES [edfiV3].[Student] ([ApiSchoolYear],[StudentUSI])
);

GO