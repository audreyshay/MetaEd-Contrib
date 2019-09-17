CREATE FUNCTION [util].[Split](@String nvarchar(MAX), @Delimiter nvarchar(1)) 
RETURNS @Tokens table (Id int identity(1, 1), Token nvarchar(max)) 
AS
BEGIN
	WHILE(CHARINDEX(@Delimiter, @String) > 0)
	BEGIN 
		INSERT INTO @Tokens(Token) 
		SELECT LEFT(@String, ISNULL(NULLIF(CHARINDEX(@Delimiter, @String) -1, -1), LEN(@String)))
		
		SELECT @String = CASE WHEN CHARINDEX(@Delimiter, @String) > 0 THEN SUBSTRING(@String, CHARINDEX(@Delimiter, @String) + 1, LEN(@String)) ELSE '' END
	END

	INSERT INTO @Tokens(Token) 
	SELECT @String
	
	UPDATE @Tokens
	SET Token = LTRIM(RTRIM(Token))

	RETURN
END

GO
