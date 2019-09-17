/************************************************************
**Procedure Name: oct1.RunOctFEDSPED
**
**Author: Amit Verma
**
**Description:  Returns Integer to Run Oct FED SPED .
**	
**Revision History:
**	Who					When			What
**	Amit Verma			11/21/2016		created
**
***************************************************************/
CREATE PROCEDURE [oct1].[RunOctFEDSPED]
@FiscalYear INT
AS 
BEGIN

DECLARE @StartDate DATE,
        @EndDate   DATE,
		@RunTheJob BIT


SELECT  @StartDate = ExtractStartDate, 
		@EndDate = ExtractEndDate
FROM oct1.Config 
WHERE FiscalYear = @FiscalYear

IF GETDATE() BETWEEN @StartDate AND @EndDate
	SET @RunTheJob = 1
ELSE 
	SET @RunTheJob = 0

SELECT @RunTheJob AS RunOCTFEDSPED

END
