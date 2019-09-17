/************************************************************
**Procedure Name: process.InsertStudent
**
**Author: Viju Viswanathan
**
**Description:  Create a new Student record
**	
**Revision History:
**	Who			When		What
**	Viju V		02/03/2017	Initial Creation
**	M Killens	02/10/2017	Added Middle Name
***************************************************************/
CREATE PROCEDURE [process].[InsertStudent]
	 @FirstName					NVARCHAR(75)
    ,@MiddleName				NVARCHAR(75)
	,@LastSurname				NVARCHAR(75)
	,@SexTypeId					INT
	,@BirthDate					DATE
	,@HispanicLatinoEthnicity	BIT
	,@StudentUniqueId			NVARCHAR(32)
AS
BEGIN

	INSERT INTO [leadata].[Student]
           ([FirstName]
		   ,[MiddleName]
           ,[LastSurname]
           ,[SexTypeId]
           ,[BirthDate]
           ,[HispanicLatinoEthnicity]
           ,[StudentUniqueId])
     VALUES
           (@FirstName
		   ,@MiddleName
           ,@LastSurname
           ,@SexTypeId
           ,@BirthDate
           ,@HispanicLatinoEthnicity
           ,@StudentUniqueId)
END


