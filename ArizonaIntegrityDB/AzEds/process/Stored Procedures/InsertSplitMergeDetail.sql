/**************************************************************************
** Procedure Name:
**		dbo.InsertSplitMergeDetail
**
** Author:
**		"The" Martez Killens
**
** Description:
**		Simply Inserts split/merge detail records
**
** Output:
**		None
** Returns:
**		Split Merge Detail			
**
**
** Revision History:
**		Who					When			What
**		Martez Killens		5/29/2015		Initial Creation
**		Martez Killens		01/19/2016		Pulling Ed Org data from entity table.
**		Martez Killens		06/08/2016		Changing Parms
**      Martez Killens      06/27/2017      Ensuring a unique list is returned by looking at current fiscal year
**************************************************************************/

CREATE PROCEDURE [process].[InsertSplitMergeDetail]
	@AdditionalNotes			 VARCHAR(MAX) = NULL
	, @EducationOrganizationId	 INT
	, @FirstName				 VARCHAR(50) = NULL
	, @LastName					 VARCHAR(50) = NULL
	, @Ticket					 VARCHAR(50)
	, @CreatedDate				 DATETIME
	, @CreatedBy				 VARCHAR(100) = NULL
	, @SplitMergeType			 VARCHAR(50)
	, @SplitMergeStage			 VARCHAR(50)
AS
BEGIN

	DECLARE @splitMergeTypeId int
	DECLARE @splitMergeStageId int

	SELECT @splitMergeTypeId = SplitMergeTypeId
	  FROM process.SplitMergeType
	 WHERE CodeValue = @SplitMergeType

	 SELECT @splitMergeStageId = SplitMergeStageId
	  FROM process.SplitMergeStage
	 WHERE CodeValue = @SplitMergeStage

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

	/* Poor code design led me to this logic think about refactoring this immediately*/
	/* Since we are no longer using Ed Org List procedure, we pull back the first (distinct) ed org that
	** matches on id.*/
	SELECT DISTINCT
		smd.[SplitMergeDetailId]
		,[Ticket]
		,[ContactFirstName]
		,[ContactLastName]
		,[AdditionalNotes]
		,[CreatedBy]
		,[CreatedDate]
		,[Description]
		,NULL AS CompletedDate
		,NULL AS NewPersonID
		,NULL AS OldPersonID
		,eo.EducationOrganizationId
		,eo.NameOfInstitution
		,eo.CTDS
		FROM [process].[SplitMergeDetail] smd
		JOIN [entity].[EducationOrganization] eo ON smd.EducationOrganizationId = eo.EducationOrganizationId
		JOIN [process].[SplitMergeType] smt ON smt.SplitMergeTypeId = smd.SplitMergeTypeId
		JOIN [config].[FiscalYear] fy ON fy.FiscalYear = eo.FiscalYear
        WHERE smd.SplitMergeDetailId = SCOPE_IDENTITY() AND fy.IsCurrent = 1

END