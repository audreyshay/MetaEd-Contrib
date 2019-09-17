/************************************************************
**Procedure Name: process.CheckStudent
**
**Author: Viju Viswanathan
**
**Description:  Check if the student is available in AzEDS database
**	
**Revision History:
**	Who			When		What
**	Viju V		04/04/2017	Initial Creation
***************************************************************/

CREATE PROCEDURE process.CheckStudent
	@StudentUniqueId NVARCHAR(32)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StudentExists BIT = 0

	IF EXISTS (SELECT StudentUSI	
				FROM leadata.Student
				WHERE StudentUniqueId = @StudentUniqueId )
		SELECT @StudentExists = 1 

	SELECT @StudentExists
END