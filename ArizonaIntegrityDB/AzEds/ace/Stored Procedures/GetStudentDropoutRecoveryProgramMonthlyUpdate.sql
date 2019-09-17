-- =============================================
--	Author	    : Chris Mullert
--	Create date: 08/09/2016
--	Description: Procedure to extract StudentDropOutRecoveryProgramMonthlyUpdate data for ACE
--	Revision History:
--	Who					When		What
--	CM				08/09/2016	Initial
-- =============================================
CREATE PROCEDURE [ace].[GetStudentDropOutRecoveryProgramMonthlyUpdate]
	-- Add the parameters for the stored procedure here
	@StudentID ace.ISStudentEnrollment READONLY
	, @FY INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 
		SP.[FiscalYear]
		, SP.[StudentUSI]
		, SP.[ProgramTypeId]
		, SP.[ProgramEducationOrganizationId]
		, SP.[BeginDate]
		, SP.[EducationOrganizationId]
		, SP.[RevisedWrittenLearningPlanDate]
		, SP.[MonthDescriptorId]
		, SP.[SatisfactoryProgress]
	FROM [leadata].[StudentDropOutRecoveryProgramMonthlyUpdate] SP
	INNER JOIN @StudentID PM ON SP.StudentUSI = PM.StudentID AND SP.EducationOrganizationId = PM.SchoolId
	WHERE SP.FiscalYear = @FY
END -- SP