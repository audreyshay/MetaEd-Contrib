
/************************************************************
**Procedure Name: 915.UpsertNonStudent915Info
**
**Author: Vinoth
**
**Description:  Inserts selected Non Student 915 resourceids for 915 RequestUd .
**	
**Revision History:
**	Who			When		What
**	Venu		    07/11/2019	Initial Creation
***************************************************************/

CREATE PROCEDURE [915].[UpsertNonStudent915Info] @fiscalYear    INT,
                                                @requestId     INT,
                                                @resourcetypes VARCHAR(50) = NULL
AS
     BEGIN
         IF(@resourcetypes IS NULL)
             BEGIN
                 DELETE FROM [915].NonStudentRequest
                 WHERE [915].NonStudentRequest.RequestId = @requestId;
             END;
         ELSE
             BEGIN
                 DECLARE @Nostudent915Resource TABLE
                 ([RequestId]      INT,
                  [FiscalYear]     INT,
                  [ResourceTypeId] INT
                 );
                 INSERT INTO @Nostudent915Resource
                        SELECT DISTINCT
                               @requestId
                             , @FiscalYear
                             , [Token]
                        FROM [util].[Split](@resourcetypes, ',');
                 ------------------------DELETE EXISTING VALUES --------------------
                 DELETE FROM [915].NonStudentRequest
                 WHERE [915].NonStudentRequest.RequestId = @requestId;
                 --------------------------INSERT NEWLY SELECTED VALUES--------------------

                 INSERT INTO [915].NonStudentRequest
                 (RequestId
                , FiscalYear
                , ResourceTypeId
                 )
                        SELECT RequestId
                             , FiscalYear
                             , ResourceTypeId
                        FROM @Nostudent915Resource;
             END;
     END;