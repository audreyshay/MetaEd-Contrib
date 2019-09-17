CREATE FUNCTION config.FiscalYearConstraint (@FiscalYear int)
RETURNS BIT
-- This is used in the check constraint CK_FiscalYear_IsCurrent to make sure there is only one fiscal year set to IsCurrent
BEGIN
	RETURN
		CASE 
			WHEN EXISTS
				(
					SELECT 
						1
					FROM
						[config].[FiscalYear]
					WHERE
						[IsCurrent] = 1 AND
						[FiscalYear] <> @FiscalYear
				) THEN 1
			ELSE 0
		END
END

GO