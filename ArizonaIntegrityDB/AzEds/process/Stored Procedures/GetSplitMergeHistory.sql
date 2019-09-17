/**************************************************************************
** Procedure Name:
**		dbo.GetSplitMergeHistory
**
** Author:
**		"The" Martez Killens
**
** Description:
**		Simply retrieves  a historical record of all split/merge transactions
**
** Output:
**		None
** Returns:
**		Split Merge History	
**
**
** Revision History:
**		Who					When		What
**		Martez Killens		10/08/2015	Initial Creation
**		Martez Killens      01/20/2016  Removing dependency on procedure entity.GetEducationOrganizationList
**		Martez Killens		06/23/2016  Slight change to align with Dapper conventions
**		Martez Killens		03/27/2017  Adding Split Results
**************************************************************************/
CREATE PROCEDURE [process].[GetSplitMergeHistory]
	@limit AS INT = NULL,
	@completedOnly AS BIT = 0x0
AS
BEGIN

	SET @limit = COALESCE(@limit, 4000);

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
	  INTO #HistoryTable
	  FROM [process].[SplitMergeDetail] smDetail
	  LEFT JOIN [process].[SplitMergeData] smData
	  ON smDetail.SplitMergeDetailId = smData.SplitMergeDetailId
	  JOIN entity.EducationOrganization eo
	  ON smDetail.EducationOrganizationId = eo.EducationOrganizationId 

	  INSERT INTO #HistoryTable
	  SELECT DISTINCT smDetail.[SplitMergeDetailId]
		  ,[Ticket]
		  ,[ContactFirstName]
		  ,[ContactLastName]
		  ,[AdditionalNotes]
		  ,[CreatedBy]
		  ,[CreatedDate]
		  ,sDetail.SourceSplitId
		  ,sDetail.TargetSplitId
		  ,[SplitMergeTypeId]
		  ,1 --there is no split stage
		  ,sDetail.ProcessCompleteDate
		  ,eo.[EducationOrganizationId]
		  ,[CTDS]
		  ,[NameOfInstitution]
	  FROM [process].[SplitMergeDetail] smDetail
	  LEFT JOIN [process].[SplitDetail] sDetail
	  ON smDetail.SplitMergeDetailId = sDetail.SplitMergeDetailId
	  JOIN entity.EducationOrganization eo
	  ON smDetail.EducationOrganizationId = eo.EducationOrganizationId

	  SELECT *
	  FROM #HistoryTable
	  WHERE (@completedOnly = 0x1 AND CompletedDate IS NOT NULL) OR (@completedOnly = 0x0)
	  ORDER BY CreatedDate DESC
	  OFFSET 0 ROWS
	  FETCH NEXT @limit ROWS ONLY 
END
