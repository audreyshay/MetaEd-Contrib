CREATE TABLE [Config].[CalendarTypeOverride](
	[CalendarTypeOverrideId] [bigint] IDENTITY(1,1) NOT NULL,
	[FiscalYear] [int] NOT NULL,
	[LocalEducationAgencyId] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[CalendarType] [nchar](100) NOT NULL,
	[Counts] [int] NOT NULL,
	[CreatedBy] [nchar](100) NOT NULL,
	[LastModifiedBy] [nchar](100) NOT NULL,
	[CreatedDtm] [datetime] NOT NULL,
	[LastModifiedDtm] [datetime] NOT NULL,
	
 CONSTRAINT [PK_CalendarTypeOverride] PRIMARY KEY CLUSTERED 
(
	[CalendarTypeOverrideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Config].[CalendarTypeOverride]  WITH CHECK ADD  CONSTRAINT [FK_CalendarTypeOverride_FiscalYear] FOREIGN KEY([FiscalYear])
REFERENCES [config].[FiscalYear] ([FiscalYear])
GO

ALTER TABLE [Config].[CalendarTypeOverride] CHECK CONSTRAINT [FK_CalendarTypeOverride_FiscalYear]
GO

CREATE TRIGGER [config].[CalendarTypeOverrideAudit] ON [config].[CalendarTypeOverride]
AFTER INSERT, UPDATE, DELETE
AS
     BEGIN
         SET NOCOUNT ON;
         DECLARE @ActionTypeCode AS CHAR(1);
         SET @ActionTypeCode = (CASE
                                    WHEN EXISTS
                               (
                                   SELECT 1
                                   FROM INSERTED
                               )
                                         AND EXISTS
                               (
                                   SELECT 1
                                   FROM DELETED
                               )
                                    THEN 'U'
                                    WHEN EXISTS
                               (
                                   SELECT 1
                                   FROM INSERTED
                               )
                                    THEN 'I'
                                    WHEN EXISTS
                               (
                                   SELECT 1
                                   FROM DELETED
                               )
                                    THEN 'D'
                                    ELSE NULL -- Skip. It may have been a delete that did not delete anything
                                END);
         IF(@ActionTypeCode = 'I'
            OR @ActionTypeCode = 'U')
             BEGIN
                 INSERT INTO azedaudit.CalendarTypeOverride
                 ([CalendarTypeOverrideId]
                , [FiscalYear]
                , [LocalEducationAgencyId]
                , [SchoolId]
                , [CalendarType]
                , [Counts]
                , [CreatedBy]
                , [LastModifiedBy]
                , [CreatedDtm]
                , [LastModifiedDtm]
                , [ActionTypeCode]
                 )
                        SELECT [CalendarTypeOverrideId]
                             , [FiscalYear]
                             , [LocalEducationAgencyId]
                             , [SchoolId]
                             , [CalendarType]
                             , [Counts]
                             , [CreatedBy]
                             , [LastModifiedBy]
                             , [CreatedDtm]
                             , [LastModifiedDtm]
                             , @ActionTypeCode
                        FROM INSERTED;
             END;
         ELSE
         IF(@ActionTypeCode = 'D')
             BEGIN
                 INSERT INTO azedaudit.CalendarTypeOverride
                 ([CalendarTypeOverrideId]
                , [FiscalYear]
                , [LocalEducationAgencyId]
                , [SchoolId]
                , [CalendarType]
                , [Counts]
                , [CreatedBy]
                , [LastModifiedBy]
                , [CreatedDtm]
                , [LastModifiedDtm]
                , [ActionTypeCode]
                 )
                        SELECT [CalendarTypeOverrideId]
                             , [FiscalYear]
                             , [LocalEducationAgencyId]
                             , [SchoolId]
                             , [CalendarType]
                             , [Counts]
                             , [CreatedBy]
                             , [LastModifiedBy]
                             , [CreatedDtm]
                             , [LastModifiedDtm]
                             , @ActionTypeCode
                        FROM DELETED;
             END;
     END

	 GO