
CREATE FUNCTION [config].[SystemDateOverrideConstraint]
(
)
RETURNS int
-- This is used in the check constraint ck_CountSystemDateOverride to make sure only one record is inserted 
AS
BEGIN

	DECLARE @COUNT INT
	SELECT  @count = COUNT(*) 
	FROM [config].[SystemDateOverride] 
	RETURN @COUNT

END
GO