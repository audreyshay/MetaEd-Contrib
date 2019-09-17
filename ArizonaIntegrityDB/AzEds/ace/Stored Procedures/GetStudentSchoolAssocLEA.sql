-- =============================================
--	Author	    : Chris Mullert
--	Create date: 03/20/2019
--			 for ACE
--	Revision History:
--	Who					When		What
-- =============================================
CREATE PROCEDURE [ace].[GetStudentSchoolAssocLEA]
	@StudentID ace.ISStudentEnrollment READONLY
	, @FY INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT SP.[FiscalYear]
		, SP.[StudentUSI]
		, SP.[EducationOrganizationId]
		, SP.[ResponsibilityDescriptorId]
		, SP.[SchoolId]
		, SP.[EntryDate]
		, SP.[StartDate]
		, SP.[EndDate]
		, PM.ELL
		, PM.SPED
	FROM [leadata].[StudentSchoolAssociationLocalEducationAgency] SP
	INNER JOIN @StudentID PM ON SP.StudentUSI = PM.StudentID AND SP.SchoolId = PM.SchoolId
	WHERE SP.FiscalYear = @FY 
END 
GO
