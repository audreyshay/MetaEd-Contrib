/**************************************************************************
** Script Name:[integrity].[IsStudentEnrolledInTwoMainSchools] 
** 
**
** Author: Amit Verma
** 
**
** Description: Retrieves a bit indicating whether or not the identified 
**				Student has 2 main school enrollment based on the School Year 
**				and the Date.
**
** Input: @StudentUSI	INT
**		  ,@SchoolYear	INT
**		  ,@CheckDate	DATE
** 
** Output: BIT
**
** Returns: BIT
**
** Implementation:
** 
**
** Revision History: Created - Amit Verma - 12/30/2014
** 
**
**************************************************************************/

CREATE FUNCTION [integrity].[IsStudentEnrolledInTwoMainSchools] 
(
	 @StudentUSI					INT
	,@FiscalYear					INT
	,@CheckDate						DATE
)
RETURNS BIT
AS
	BEGIN

		DECLARE @ISENROLLINTWOMAINSCHOOL	BIT

		IF((SELECT COUNT(*)
		    FROM leadata.StudentSchoolAssociation ssa
            WHERE ssa.StudentUSI = @StudentUSI
				  AND ssa.FiscalYear = @FiscalYear
				   AND ((ssa.EntryDate <= @CheckDate AND ssa.ExitWithdrawDate IS NULL) OR
					    (ssa.EntryDate <= @CheckDate AND ssa.ExitWithdrawDate >= @CheckDate))
				   AND ssa.MembershipTypeDescriptorId = 10217) > 1)
			BEGIN
				SET @ISENROLLINTWOMAINSCHOOL = 1
			END
		ELSE
			BEGIN
				SET @ISENROLLINTWOMAINSCHOOL = 0
			END

		RETURN @ISENROLLINTWOMAINSCHOOL

	END