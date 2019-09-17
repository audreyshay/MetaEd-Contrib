CREATE TABLE [azedaudit].[CalendarTypeOverride] (
    [CalendarTypeOverrideId] BIGINT      NOT NULL,
    [FiscalYear]             INT         NOT NULL,
    [LocalEducationAgencyId] INT         NOT NULL,
    [SchoolId]               INT         NOT NULL,
    [CalendarType]           NCHAR (100) NOT NULL,
    [Counts]                 INT         NOT NULL,
    [CreatedBy]              NCHAR (100) NOT NULL,
    [LastModifiedBy]         NCHAR (100) NOT NULL,
    [CreatedDtm]             DATETIME    NOT NULL,
    [LastModifiedDtm]        DATETIME    NOT NULL,
    [ActionTypeCode]         CHAR (1)    NOT NULL
);

