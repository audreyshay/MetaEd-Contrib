/**************************************************************************
** Procedure Name:
**               dbo.GetSplitMergeDetailById
**
** Author:
**               "The" Martez Killens
**
** Description:
**               Simply retrieves split/merge detail records
**
** Output:
**               None
** Returns:
**               Split Merge Detail                          
**
**
** Revision History:
**		Who					When		What
**		Martez Killens		5/29/2015	Initial Creation
**		Martez Killens      01/20/2016  Removing dependency on procedure entity.GetEducationOrganizationList
**		Martez Killens		06/23/2016  Adding created date and making changes to fall in line with dapper
**		Martez Killens		06/28/2017  Reducing Ed org list by fiscal year only
**************************************************************************/
CREATE PROCEDURE [process].[GetSplitMergeDetailById]
         @Id AS INT
AS
BEGIN

	SELECT DISTINCT smDetail.[SplitMergeDetailId]
		  ,[Ticket]
		  ,[ContactFirstName]
		  ,[ContactLastName]
		  ,[AdditionalNotes]
		  ,[CreatedBy]
		  ,[CreatedDate]
		  ,[NewPersonID]
		  ,[OldPersonID]
		  ,[SplitMergeTypeId]
		  ,[SplitMergeStageId]
		  ,[CompletedDate]
		  ,eo.[EducationOrganizationId]
		  ,[CTDS]
		  ,[NameOfInstitution]
	  FROM [process].[SplitMergeDetail] smDetail
	  LEFT JOIN [process].[SplitMergeData] smData
	  ON smDetail.SplitMergeDetailId = smData.SplitMergeDetailId
	  JOIN entity.EducationOrganization eo
	  ON smDetail.EducationOrganizationId = eo.EducationOrganizationId
	  JOIN config.FiscalYear fy ON eo.FiscalYear = fy.FiscalYear
	  WHERE smDetail.SplitMergeDetailId = @Id AND fy.IsCurrent = 1
END