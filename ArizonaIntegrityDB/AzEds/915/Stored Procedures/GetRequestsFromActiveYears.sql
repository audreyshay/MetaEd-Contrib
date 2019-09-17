/*
**	CM			03/21/2017	table changes
**	Vinoth		04/05/2018	Added the Request Type column where this column is used to filter whether it's calendar or 915 request in UI
*/

CREATE PROCEDURE [915].[GetRequestsFromActiveYears] 
AS
BEGIN

SELECT     [RequestId]
		   ,r.[FiscalYear]
           ,[LocalEducationAgencyId]
           ,[CreatedBy]
           ,[AssignedTo]
           ,[LastModifiedBy]
           ,[CreatedDtm]
           ,[LastModifiedDtm]
           ,[EndDtm]
           ,[BeginDtm]
           ,[RequestStatusId]
		   ,[RequestTypeId]
     FROM  [915].[Request] r
	 INNER JOIN [config].[FiscalYear] f ON r.FiscalYear = f.FiscalYear AND f.IsActive = 1
END
