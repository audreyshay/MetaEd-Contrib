CREATE TABLE [extension].[StateEndorsedRegionalCareerPathwayStatusType]
(
	[StateEndorsedRegionalCareerPathwayStatusTypeId] [INT] IDENTITY(1,1) NOT NULL,
    [CodeValue] [NVARCHAR](50) NOT NULL,
    [Description] [NVARCHAR](1024) NOT NULL,
    [ShortDescription] [NVARCHAR](450) NOT NULL,
    [CreateDate] [DATETIME] NOT NULL, 
    [LastModifiedDate] [DATETIME] NOT NULL,
    [Id] [UNIQUEIDENTIFIER] NOT NULL, 
	CONSTRAINT [StateEndorsedRegionalCareerPathwayStatusType_PK] PRIMARY KEY CLUSTERED (
        [StateEndorsedRegionalCareerPathwayStatusTypeId] ASC
    )
)
