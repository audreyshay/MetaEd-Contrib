/************************************************************
**Procedure Name: 915.MapResourceIdToStudentAndSchool
**
**Author: Martez Killens
**
**Description:  Takes a resource id and maps it to it's associated
**				studentUniqueId and schoolId.  This allows us to process
				deletes for 915 authorization.
**	
**Revision History:
**	Who				When		What
**	M Killens		07/03/2017	Initial Creation
**	P Kanyar		12/07/2017	Removed @databaseName, added @FiscalYear as param, 
**								updated the logic using SQLCommand field from ResourceType table
**	P Kanyar		12/11/2017	Added BeginFiscalYear IS NOT NULL as it is made nallable							
**
***********************************************************************************************/
--DECLARE
--	@resource NVARCHAR(255) = 'studentDropOutRecoveryProgramMonthlyUpdates',
--	@resourceId UNIQUEIDENTIFIER = '94E8B75C-5CCF-4601-98CB-A004D12356D0',
--	@FiscalYear INT = 2017

CREATE PROC [915].[MapResourceIdToStudentAndSchool]
	@resource NVARCHAR(255),
	@resourceId UNIQUEIDENTIFIER,
	@FiscalYear INT

AS
BEGIN

	DECLARE @resourceTypeId INT
	DECLARE @studentUniqueId NVARCHAR(50)
	DECLARE @schoolId INT
	DECLARE @sqlcommand NVARCHAR(MAX)
	DECLARE @sql NVARCHAR(MAX)


	SELECT
		@resourceTypeId = rt.ResourceTypeId,
		@sqlcommand = rt.SQLCommand
	FROM config.ResourceType rt
	WHERE [Resource] = @resource 
			AND @FiscalYear BETWEEN [BeginFiscalYear] AND ISNULL([EndFiscalYear], 9999)
			AND [BeginFiscalYear] IS NOT NULL

	IF @resourceTypeId = 24
		BEGIN
			SET @sql = (SELECT FORMATMESSAGE(@sqlcommand , CONVERT(NVARCHAR(4),@FiscalYear))) + ''''+ CONVERT(NVARCHAR(36), @resourceId) +''''

					EXEC sp_executesql @sql, 
									   N'@studentUniqueId nvarchar(50) OUTPUT', 
									   @studentUniqueId = @studentUniqueId OUTPUT

		END
	ELSE
		BEGIN
			SET @sql = (SELECT FORMATMESSAGE(@sqlcommand , CONVERT(NVARCHAR(4),@FiscalYear), CONVERT(NVARCHAR(4),@FiscalYear) )) + ''''+ CONVERT(NVARCHAR(36), @resourceId) +''''

					EXEC sp_executesql @sql, 
									   N'@studentUniqueId nvarchar(50) OUTPUT, @schoolId int OUTPUT', 
									   @studentUniqueId = @studentUniqueId OUTPUT,
									  @schoolId = @schoolId OUTPUT
		END	   

END
