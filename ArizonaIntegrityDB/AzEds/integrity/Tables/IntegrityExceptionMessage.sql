CREATE TABLE [integrity].[IntegrityExceptionMessage] (
    [ExceptionMessageCode] NVARCHAR (50)  NOT NULL,
    [Description]          VARCHAR (1024) NOT NULL,
    [EffectiveBeginDate]   DATE           NOT NULL,
    [EffectiveEndDate]     DATE           NULL,
    CONSTRAINT [PK_MessageCode] PRIMARY KEY CLUSTERED ([ExceptionMessageCode] ASC)
);

