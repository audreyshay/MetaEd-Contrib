CREATE PROCEDURE [entity].[GetApproved200DayLocalEducationAgency]
AS
BEGIN
	SELECT [FiscalYear], [LocalEducationAgencyId] FROM [entity].Approved200DayLocalEducationAgency
END
