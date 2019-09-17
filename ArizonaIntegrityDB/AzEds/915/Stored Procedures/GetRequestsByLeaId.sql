/************************************************************
**Procedure Name: process.GetRequestsByLeaId
**
**Author: Vinoth
**
**Description:  Gets list of Request which are open for given fiscal year and LEA ID
**	
**Revision History:
**	Who			When		What
**	Vinoth		10/04/2017	Initial Creation
**	CM			03/21/2017	table changes
**	Vinoth		07/02/2018	Added the Request Type to filter Student or Calendar Request
***************************************************************/
CREATE PROCEDURE [915].[GetRequestsByLeaId] 
@fiscalYear int =null,
@leaId int =null
AS
BEGIN

		declare @fy as int
		set @fy = config.CurrentFiscalYear()
SELECT     [RequestId]
		   ,r.[FiscalYear]
           ,[LocalEducationAgencyId]
           ,[RequestStatusId]
		   ,[RequestTypeId]
     FROM  [915].[Request] r
	 where r.Fiscalyear =  COALESCE(@fiscalYear, @fy) AND r.LocalEducationAgencyId = @leaId AND r.RequestStatusId=1
END