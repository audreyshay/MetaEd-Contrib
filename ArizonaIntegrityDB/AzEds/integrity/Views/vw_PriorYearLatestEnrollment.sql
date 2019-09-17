/**************************************************************************
** Script Name:[[vw_PriorYearLatestEnrollment]
** 
**
** Author: SMahapatra
** 
**
** Description: This view will return Prior year latest Enrollment
** Revision History:
** Who            When                   What
** Sucharita       8/15/2017           Initial Creation         
** Sucharita       04/23/2018           Added FiscalYear in the Partition By Condition. Task#39082 200969.This fix was done back in 12/21/2017. 
**                                      But this got overwritten due to reverse merge from Main DB-Branch to Dev DB-Branch.Since QA was not done, this change was not merged to Main.                                   

***************************************************************************************************************************************************************************************************/

CREATE VIEW [integrity].[vw_PriorYearLatestEnrollment]
AS

SELECT StudentUniqueId, SchoolId, EntryDate, FiscalYear,ExitWithdrawTypeDescriptor,StudentUSI
FROM (SELECT S.StudentUniqueId
                     ,SSA.StudentUSI
                     ,SSA.SchoolId
                     ,SSA.EntryDate
                     ,SSA.FiscalYear
                     ,D.CodeValue AS ExitWithdrawTypeDescriptor
            ,ROW_NUMBER() OVER (Partition By SSA.StudentUSI, SSA.SchoolId, SSA.EntryDate,SSA.FiscalYear ORDER BY EntryDate DESC) Latest 
          FROM leadata.StudentSchoolAssociation SSA with (nolock)
                     JOIN leadata.Student S with (nolock)
                       ON SSA.StudentUSI = S.StudentUSI 
                     LEFT JOIN leadata.Descriptor D with (nolock)
                       ON SSA.ExitWithdrawTypeDescriptorId = D.DescriptorId
                          AND SSA.FiscalYear = D.FiscalYear
         ) StudentLatestEnrollment
WHERE Latest = 1
GO