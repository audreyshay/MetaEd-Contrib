CREATE TABLE [edfiV3].[Location] (
    [ApiSchoolYear]	   SMALLINT NOT NULL, 
	[ClassroomIdentificationCode] NVARCHAR (60)    NOT NULL,
    [SchoolId]                    INT              NOT NULL,
    [MaximumNumberOfSeats]        INT              NULL,
    [OptimalNumberOfSeats]        INT              NULL,
    [CreateDate]                  DATETIME2 (7)         NOT NULL,
    [LastModifiedDate]            DATETIME2 (7)         NOT NULL,
    [Id]                          UNIQUEIDENTIFIER NOT NULL,
	[IsActive] BIT CONSTRAINT [V3_Location_DF_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [V3_Location_PK] PRIMARY KEY CLUSTERED ([ApiSchoolYear] ASC, [SchoolId] ASC, [ClassroomIdentificationCode] ASC),
    CONSTRAINT [V3_FK_Location_School] FOREIGN KEY ([ApiSchoolYear], [SchoolId]) REFERENCES [edfiV3].[School] ([ApiSchoolYear], [SchoolId])
);

