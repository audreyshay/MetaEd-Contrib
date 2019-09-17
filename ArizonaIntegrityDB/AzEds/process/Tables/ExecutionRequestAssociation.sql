CREATE TABLE process.ExecutionRequestAssociation
(
	ExecutionId INT  NOT NULL ,
	RequestId BIGINT NOT NULL,
	CONSTRAINT [PK_ExecutionIdRequestId] PRIMARY KEY CLUSTERED ([ExecutionId] ASC , [RequestId] ASC),
	CONSTRAINT [FK_ExecutionIdRequestId_Execution] FOREIGN KEY ([ExecutionId]) REFERENCES [process].[Execution] ([ExecutionId]),
	CONSTRAINT [FK_ExecutionIdRequestId_Request] FOREIGN KEY ([RequestId]) REFERENCES [915].[Request] ([RequestId]) 
 )