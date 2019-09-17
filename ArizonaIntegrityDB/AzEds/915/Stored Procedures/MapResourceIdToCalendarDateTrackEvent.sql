/************************************************************
**Procedure Name: 915.[MapResourceIdToCalendarDateTrackEvent]
**
**Author: Vinoth K
**
**Description:  Takes a resource id and maps it to it's associated
**				schoolId and TrackLocalEducationAgencyId.  This allows us to process
				deletes for 915 authorization.
**	
**Revision History:
**	Who				When		What
**	Vinoth K		02/23/2018	Initial Creation
**  Vinoth K        02/27/2018  Removed the Begin Date condition, now it looks for the year
**  Vinoth K        03/01/2018  Added the track Number
**  Vinoth K        05/08/2018  Added the few more parameter on Formatmessage to get the fiscalyear
**  Vinoth K        04/26/2019  Changes are made related to Ed.Fi 3.0
***********************************************************************************************/
--DECLARE
	--@resource NVARCHAR(255) = 'calendardatetrackevents',
	--@resourceId UNIQUEIDENTIFIER = 'DE445637-546C-410F-9707-C4798BC43ABC',
	--@FiscalYear INT = 2019

CREATE PROC [915].[MapResourceIdToCalendarDateTrackEvent]
	@resource NVARCHAR(255),
	@resourceId UNIQUEIDENTIFIER,
	@FiscalYear INT

AS
BEGIN

    DECLARE @TrackLocalEducationAgencyId NVARCHAR(50)
	DECLARE @schoolId INT
	DECLARE @sqlcommand NVARCHAR(MAX)
	DECLARE @sql NVARCHAR(MAX)
	DECLARE @EventType NVARCHAR(50)
	DECLARE @TrackNumber NVARCHAR(50)
	DECLARE @CalendarCode NVARCHAR(60)
	DECLARE @resourceTypeId INT

	SELECT
			@resourceTypeId = rt.ResourceTypeId,
			@sqlcommand = rt.SQLCommand
	FROM config.ResourceType rt
	WHERE [Resource] = @resource 
	AND @FiscalYear BETWEEN [BeginFiscalYear] AND ISNULL([EndFiscalYear], 9999)
			AND [BeginFiscalYear] IS NOT NULL
		BEGIN
			
			IF @FiscalYear <=2019
				BEGIN
				SET @sql = (SELECT FORMATMESSAGE(@sqlcommand , CONVERT(NVARCHAR(4),@FiscalYear), CONVERT(NVARCHAR(4),@FiscalYear), CONVERT(NVARCHAR(4),@FiscalYear))) + ''''+ CONVERT(NVARCHAR(36), @resourceId) +''''
					EXEC sp_executesql @sql, 
									   N'@schoolId int OUTPUT,@TrackLocalEducationAgencyId int OUTPUT,@EventType varchar OUTPUT,@TrackNumber varchar OUTPUT', 
									   @schoolId = @schoolId OUTPUT,
									   @TrackLocalEducationAgencyId =@TrackLocalEducationAgencyId OUTPUT,
									   @EventType=@EventType OUTPUT,
									   @TrackNumber=@TrackNumber OUTPUT
				END
			ELSE
				BEGIN
					IF @resourceTypeId =35
						BEGIN
							SET @sql = (SELECT FORMATMESSAGE(@sqlcommand , CONVERT(NVARCHAR(4),@FiscalYear),CONVERT(NVARCHAR(4),@FiscalYear),CONVERT(NVARCHAR(4),@FiscalYear), CONVERT(NVARCHAR(4),@FiscalYear))) + ''''+ CONVERT(NVARCHAR(36), @resourceId) +''''
						END
					ELSE
						BEGIN
							SET @sql = (SELECT FORMATMESSAGE(@sqlcommand , CONVERT(NVARCHAR(4),@FiscalYear), CONVERT(NVARCHAR(4),@FiscalYear), CONVERT(NVARCHAR(4),@FiscalYear))) + ''''+ CONVERT(NVARCHAR(36), @resourceId) +''''
						END
					EXEC sp_executesql @sql, 
									   N'@schoolId int OUTPUT,@TrackLocalEducationAgencyId int OUTPUT,@TrackNumber varchar OUTPUT,@CalendarCode varchar OUTPUT', 
									   @schoolId = @schoolId OUTPUT,
									   @TrackLocalEducationAgencyId =@TrackLocalEducationAgencyId OUTPUT,
									   @CalendarCode =@CalendarCode OUTPUT,
									   @TrackNumber=@TrackNumber OUTPUT
				END

		END
	
END

