-- =============================================
--	Author	    : Abhi Gopalpuria
--	Create date: 06/23/2015
--	Description: Procedure to extract StudentEdOrgAssociation
--			 data for ACE
--	Revision History:
--	Who					When		What
--	Viju				09/11/2015	Fixed bug that returns duplicate records
-- Britto Augustine     05/02/2017  Removed the where condition ResponsibilityDescriptorId = 236, becuase the integrity load procs takes care of that.
--                                   The ResposibilityDescriptorId changed for FY18 also, so the condtion would not work for FY18.
-- =============================================
CREATE PROCEDURE [ace].[GetStudentEdOrgAssociation]
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
		, SP.[EducationOrganizationId]
		, SP.[ResponsibilityDescriptorId]
		--, SEA.Code (This columnis not available)
		, SP.[SchoolId]
		, SP.[StartDate]
		, SP.[EndDate]
		, PM.ELL
		, PM.SPED
	FROM [leadata].[StudentSchoolAssociationLocalEducationAgency] SP
	INNER JOIN @StudentID PM ON SP.StudentUSI = PM.StudentID AND SP.SchoolId = PM.SchoolId
	--INNER JOIN [leadata].[Descriptor] DIS1 ON SP.[ResponsibilityDescriptorId] = DIS1.DescriptorId
	WHERE SP.FiscalYear = @FY 
END -- SP