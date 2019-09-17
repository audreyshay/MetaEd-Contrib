CREATE TABLE [ace].[UnitOfWorkArchive]
(
	UnitOfWorkId INT		NOT NULL, 
	ExecutionId INT			NOT NULL,
	FiscalYear	INT			NOT NULL,
    StudentUSI INT			NOT NULL,
	SchoolId INT			NOT NULL,
	MessageId NVARCHAR(36)	NULL,
	ADM BIT					NULL,
	SPED BIT				NULL,
	ELL BIT					NULL
    CONSTRAINT [PK_UnitOfWorkArchive] PRIMARY KEY CLUSTERED (UnitOfWorkId ASC)
);
