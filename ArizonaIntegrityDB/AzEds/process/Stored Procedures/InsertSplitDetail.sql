/**************************************************************************
** Procedure Name:
**      [process].[InsertSplitDetail]
**
** Author: Viju Viswanathan
**      
**
** Description:
**      Inserts Split meta data  which is used to split student records.
**
** Output:
**		None
** Returns:
**
** Revision History:
**	Who				When		What
**	Viju V			01/17/2017	Initial Creation
**	Viju V			01/27/2017  Modified to match the table schema
**	M Killens		01/31/2017  Testing out changes to coincide with UI changes
**************************************************************************/

CREATE PROCEDURE [process].[InsertSplitDetail]

		@AdditionalNotes			VARCHAR(MAX) = NULL
		,@EducationOrganizationId	INT
		,@FirstName					VARCHAR(50) = NULL
		,@LastName					VARCHAR(50) = NULL
		,@Ticket					VARCHAR(50)
		,@CreatedDate				DATETIME
		,@CreatedBy					VARCHAR(100) = NULL
		,@SplitMergeType			VARCHAR(50)
		,@SplitMergeStage			VARCHAR(50)
		,@IsStaged					BIT = NULL
		,@SourceSplitID				INT
		--,@TargetSplitID				INT
AS
BEGIN
	SET NOCOUNT ON;

	--Declare local variables

	DECLARE @splitMergeTypeId int
	DECLARE @splitMergeStageId int
	DECLARE @SplitMergeDetailId INT

	SELECT @splitMergeTypeId = SplitMergeTypeId
	 FROM process.SplitMergeType
	WHERE CodeValue = @SplitMergeType

	SELECT @splitMergeStageId = SplitMergeStageId
	 FROM process.SplitMergeStage
	WHERE CodeValue = @SplitMergeStage

	--Insert split merge details
	INSERT INTO [process].[SplitMergeDetail]
	(
		[Ticket]
		,[ContactFirstName]
		,[ContactLastName]
		,[AdditionalNotes]
		,[EducationOrganizationId]
		,[CreatedDate]
		,[CreatedBy]
		,[SplitMergeTypeId]
		,[SplitMergeStageId]
	)
	VALUES
	(
		@Ticket
		,@FirstName
		,@LastName
		,@AdditionalNotes
		,@EducationOrganizationId
		,@CreatedDate
		,@CreatedBy
		,@splitMergeTypeId
		,@splitMergeStageId
	)

	--Get the SplitMergeDetailId just inserted
	SELECT @SplitMergeDetailId = SCOPE_IDENTITY()

	--Insert Split meta data
	INSERT INTO [process].[SplitDetail]
           ([SplitMergeDetailId]
           ,[SourceSplitID])
           --,[TargetSplitID]
     VALUES
           (@SplitMergeDetailId
           ,@SourceSplitID)
           --,@TargetSplitID


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
	  WHERE smDetail.SplitMergeDetailId = @SplitMergeDetailId
	  AND fy.IsCurrent = 1 


END
GO
