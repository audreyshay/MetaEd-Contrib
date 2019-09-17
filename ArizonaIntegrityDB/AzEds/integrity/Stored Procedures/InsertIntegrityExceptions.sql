--========================================================================================== 
--Author: rchinta     
--Create date: 11/18/2014 
--Description:  Insert integrity exceptions into table  
-- to run SP :  exec [integrity].[InsertIntegrityExceptions]  21, '-9016', 'Error'
-- how to handle exception message needs to be re- worked. AT this moment both Exception message and severity code both are SAME
--========================================================================================== 
CREATE PROCEDURE [integrity].[InsertIntegrityExceptions] 
@historyid INT, 
@exceptionMessageCode VARCHAR(50), 
@exceptionSeverityMessage VARCHAR(100) 
AS
BEGIN
    DECLARE @ExceptionSeverityId INT
	SET @ExceptionSeverityId = ( 
								SELECT ExceptionSeverityId 
								FROM   integrity.ExceptionSeverity 
								WHERE  Description = @exceptionSeverityMessage)
	INSERT INTO [integrity].[IntegrityException]
              ( 
                         IntegrityHistoryId,
						 ExceptionMessageCode,
						 ExceptionSeverityId, 
						 CreatedDate
              ) 
              VALUES 
              ( 
                          @historyid , 
                          @exceptionMessageCode , 
                          @exceptionSeverityId ,                          
                          GETUTCDATE() 
              ) 
END