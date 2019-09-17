/**************************************************************************************
**Procedure Name:
**      [leadata].[GetLeaDataDescriptor]
**
**Author:
**      Vinoth K
**
**Description:  
**     Get all the Lea Data Descriptor 
**               
**Implementation:
**     Used to Cache all the Lea Data Descriptor and process in Rest API
**
**Revision History:
**     Who                               When          What
**     Vinothk       01/05/2018    Initial Creation
***************************************************************************************/
CREATE PROCEDURE [leadata].[GetLeaDataDescriptor]
AS 
  BEGIN 
       SELECT  
       FiscalYear,
       DescriptorId,
       Namespace,
       CodeValue,
       Description

       FROM [leadata].[Descriptor] 
  END
GO

