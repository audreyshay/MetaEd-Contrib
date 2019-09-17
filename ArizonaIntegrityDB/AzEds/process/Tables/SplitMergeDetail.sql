CREATE TABLE [process].[SplitMergeDetail]
(
    [SplitMergeDetailId] [int] IDENTITY(1,1) NOT NULL,
    [Ticket] [varchar](50) NOT NULL,
    [ContactFirstName] [varchar](50) NOT NULL,
    [ContactLastName] [varchar](50) NOT NULL,
    [AdditionalNotes] [varchar](max) NULL,
    [EducationOrganizationId] [int] NOT NULL,
    [SplitMergeTypeId] INT NOT NULL,
    [SplitMergeStageId] INT NOT NULL DEFAULT(1),
    [CreatedBy] [varchar](100) NOT NULL DEFAULT('System'),
    [CreatedDate] [datetime] NOT NULL,
    CONSTRAINT [PK_SplitMergeDetail] PRIMARY KEY CLUSTERED ([SplitMergeDetailId] ASC),
    CONSTRAINT [FK_SplitMergeData_SplitlMergeType] FOREIGN KEY ([SplitMergeTypeId]) REFERENCES [process].[SplitMergeType]([SplitMergeTypeId]),
    CONSTRAINT [FK_SplitMergeData_SplitlMergeStage] FOREIGN KEY ([SplitMergeStageId]) REFERENCES [process].[SplitMergeStage]([SplitMergeStageId]),
);