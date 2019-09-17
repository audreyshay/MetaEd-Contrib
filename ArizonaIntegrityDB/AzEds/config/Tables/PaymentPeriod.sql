CREATE TABLE [config].[PaymentPeriod] (
    [FiscalYear]          INT             NOT NULL,
    [PaymentPeriodNumber] INT             NOT NULL,
    [Description]         NVARCHAR (1024) NOT NULL,
    CONSTRAINT [PK_PaymentPeriod] PRIMARY KEY CLUSTERED ([FiscalYear] ASC, [PaymentPeriodNumber] ASC),
    CONSTRAINT [FK_PaymentPeriod_FiscalYear] FOREIGN KEY ([FiscalYear]) REFERENCES [config].[FiscalYear] ([FiscalYear])
);



