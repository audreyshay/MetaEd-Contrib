/******************************************************************************************
** Script Name:[report].[AgeOctober1]
**
** Author: P Kanyar
**
** Description: Function to calculate Age of student as of Oct-1 of @FiscsalYear
** returns age int  
** 
**
** Revision History: Created - P Kanyar - 05/10/2019
**
********************************************************************************************/
CREATE FUNCTION [report].[AgeOctober1] 
(
    @FiscalYear    INT
   ,@BirthDate     DATE
)
RETURNS INT
AS
BEGIN

		-- Test Data -------------------------------
		--DECLARE @FiscalYear           INT	 = 2019
		--DECLARE @BirthDate            DATE = '05/09/07' 
		--------------------------------------------

	DECLARE @AgeOctober1	INT
	SELECT @AgeOctober1 = DATEDIFF(yy, @BirthDate, CONVERT(DATE, 
					(CONVERT(VARCHAR(4),@FiscalYear-1) + '-10-01'))) - 
					CASE 
					WHEN ( 
						MONTH(@BirthDate) > MONTH(CONVERT(DATE, 
							(CONVERT(VARCHAR(4),@FiscalYear-1) + '-10-01'))) 
						) 
						OR 
						( 
						MONTH(@BirthDate) = MONTH(CONVERT(DATE, 
							(CONVERT(VARCHAR(4),@FiscalYear-1) + '-10-01'))) 
						AND 
						DAY(@BirthDate) > DAY(CONVERT(DATE,
							(CONVERT(VARCHAR(4),@FiscalYear-1) + '-10-01'))) 
						) 
						THEN 1 ELSE 0 END							

	RETURN @AgeOctober1
END
