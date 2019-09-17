/************************************************************
**Procedure Name: 915.GetNonStudentResourcedetail
**
**Author: Venu
**
**Description:  Gets 915 resourceids for 915 RequestUd .
**	
**Revision History:
**	Who			When		What
**	Venu		    07/11/2019	Initial Creation
***************************************************************/
CREATE PROCEDURE [915].[GetNonStudentResourcedetail] @RequestId INT
AS
      BEGIN
         SET NOCOUNT ON;
         SELECT r.FiscalYear
              , r.RequestId
              , nsr.ResourceTypeId
              , rt.Resource
              , nsr.CreateDate
         FROM [915].Request r
              JOIN [915].NonStudentRequest nsr
                    ON r.RequestId = nsr.RequestId
              JOIN config.ResourceType rt
                    ON nsr.ResourceTypeId = rt.ResourceTypeId
         WHERE r.RequestId = @RequestId;
     END;