/**************************************************************************
** Procedure Name:
**		process.GetSplitDetail
**
** Author:
**		Viju Viswanathan
**
** Description:
**		Simply retrieves split/merge detail records
**
** Output:
**		None
** Returns:
**		Split meta data			
**
**
** Revision History:
**		Who					When		What
**		Viju V				1/17/2017	Initial Creation
**		Viju V				01/27/2017  Modified to match the table schema
**		M Killens			02/01/2017	Modified to get data by split detail id
**		M Killens			01/03/2018	Adding fiscal year current year to get distinct list
**************************************************************************/
CREATE PROCEDURE [process].[GetSplitDetail]
	@SplitDetailId AS INT
AS
BEGIN

	SELECT DISTINCT smDetail.[SplitMergeDetailId]
		  ,[Ticket]
		  ,[ContactFirstName]
		  ,[ContactLastName]
		  ,[AdditionalNotes]
		  ,[CreatedBy]
		  ,[CreatedDate]
		  ,[SplitMergeTypeId]
		  ,eo.[EducationOrganizationId]
		  ,[CTDS]
		  ,[NameOfInstitution]
		  ,sDetail.SplitDetailId 
		  ,sDetail.IsStaged
		  ,sDetail.SourceSplitID 
		  ,sDetail.TargetSplitID 
	  FROM [process].[SplitMergeDetail] smDetail
	  LEFT JOIN [process].[SplitDetail] sDetail
	  ON smDetail.SplitMergeDetailId = sDetail.SplitMergeDetailId
	  JOIN entity.EducationOrganization eo
	  ON smDetail.EducationOrganizationId = eo.EducationOrganizationId
	  JOIN [config].[FiscalYear] fy 
	  ON fy.FiscalYear = eo.FiscalYear
	  WHERE sDetail.SplitDetailId = @SplitDetailId
	  AND fy.IsCurrent = 1
END
GO


