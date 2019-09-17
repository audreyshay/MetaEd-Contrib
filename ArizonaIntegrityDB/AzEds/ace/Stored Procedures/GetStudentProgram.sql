/********************************************************************************************************
**Procedure Name:
**      ace.GetStudentProgram
**
**Author:
**      Viju Viswanathan
**
**Description:  
**	Get the student program data for ACE calculation
**               
**Input:
**       ace.ISStudentEnrollment User Defined Table type
**		 Fiscal Year : Currently not being used inside the sproc.
**Output:
**	This procedure returns two sets of data for the ACE Publisher
**
**Returns:
**
**Implementation:
**	Used to get publisher data for ACE calculation
**
**Revision History:
**	Who					When		What
**	Viju Viswanathan	08/27/2015	Initial Creation
**  Chris M.			04/10/2019	correcting lack of FY join and where stmt
**********************************************************************************************************/
CREATE PROCEDURE [ace].[GetStudentProgram]
	-- Add the parameters for the stored procedure here
	@StudentID ace.ISStudentEnrollment READONLY
	, @FY INT
AS
BEGIN

	SET NOCOUNT ON;

	SELECT spa.[StudentUSI]
	,spa.[ProgramTypeId]
	,spa.[BeginDate]
	,spa.[EndDate]
	,spa.[EducationOrganizationId]  
	,ps.[ServiceDescriptorId]	
	,ps.[FiscalYear]
	FROM leadata.StudentProgramAssociation spa

	JOIN entity.ProgramService ps
		ON	spa.ProgramName = ps.ProgramName 
		AND	spa.ProgramTypeId = ps.ProgramTypeId 
		AND	spa.ProgramEducationOrganizationId = ps.EducationOrganizationId
		AND spa.FiscalYear = ps.FiscalYear

	JOIN @StudentID s
		ON spa.StudentUSI = s.StudentId
		AND spa.EducationOrganizationId = s.SchoolId

	WHERE ps.ProgramTypeId in ( 	
		IIF (s.ELL = 1, 1,0), 
		IIF(s.SPED =1, 6, 0)
		) -- 1 = ELL, 6 = SPED
		AND spa.FiscalYear = @FY
	ORDER BY spa.[StudentUSI]

END