/********************************************************************************************************
**Procedure Name:
**      ace.GetStudentNeed
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Get Student Need Data  
**               
**Input:
**       @ISStudentEnrollment User Defined Table type , Fiscal Year
**
**Output:
**	Returns Student Need Data
**
**Returns:
**
**Implementation:
**	Used by AzEDS ACE Calculation  
**
**Revision History:
**	Who						When		What
**	Viju Viswanathan		07/01/2015	Initial Creation
**********************************************************************************************************/
CREATE PROCEDURE [ace].[GetStudentNeed]
	-- Add the parameters for the stored procedure here
	@StudentID ace.ISStudentEnrollment READONLY
	, @FY INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	SELECT SP.[FiscalYear]
		, SP.[StudentUSI]
		, SP.[ReportingEducationOrganizationID]
		, SP.[StudentNeedDescriptorId]
		, SP.[StudentNeedEntryDate]
		, SP.[StudentNeedExitDate]
		, SP.[PrimaryStudentNeedIndicator]		
	FROM [leadata].[StudentNeed] SP
	INNER JOIN @StudentID PM ON SP.StudentUSI = PM.StudentID 
			AND SP.ReportingEducationOrganizationID = PM.SchoolID
	WHERE SP.[FiscalYear] = @FY
END -- SP