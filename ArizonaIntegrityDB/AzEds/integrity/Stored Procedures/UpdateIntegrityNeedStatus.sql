/*----========================================================================================== 
**Procedure Name: Integrity.UpdateIntegrityNeedStatus
**
**Author: Rohith Chintamaneni
**
**Description:  Updates the Integrity Needs Status
**	
**Revision History:
**	Who			When		What
**	RC			07/01/2015	Initial Creation
**	RC			11/09/2015  Updating based on Messageid and executionid
**	Britto		03/22/2015  Updating based on executionid
----==========================================================================================*/
Create PROCEDURE [integrity].[UpdateIntegrityNeedStatus]
@executionid int
WITH EXECUTE AS OWNER
AS 
  BEGIN 
      SET NOCOUNT ON; 

       
	   Update [integrity].[IntegrityNeed] 
	   set IsIntegrityNeeded = 0
	   from [integrity].[IntegrityNeed] T1
	   inner join [integrity].[Integrityhistory] T2
			on t1.integrityneedid = t2.integrityneedid
	   where t2.executionid = @executionid

  END

GO
