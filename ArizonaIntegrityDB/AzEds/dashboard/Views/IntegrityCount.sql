/************************************************************************************************************************
**Procedure Name: [dashboard].[IntegrityCount]
**
**Author: Britto Augustine
**
**Description: View to get the ADM, State ELL and State SPED Integrity Pass/Fail counts by DOR, DOA and School. 
**             View is used by reconcilaition reports and dashboard
**	
**Revision History:
**	Who						When		What
**	Britto Augustine		08/19/2016	Initial Creation
**  
***************************************************************************************************************************/
CREATE VIEW [dashboard].[IntegrityCount]
	AS 

	select EventDateId, ExecutionId, FiscalYear, AsOfDate, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, 
		isnull([600], 0) as ADMIntegrityPassedCount, 
		isnull([601], 0) as ADMIntegrityFailedCount,
		isnull([602], 0) as StateSPEDIntegrityPassedCount, 
		isnull([603], 0) as StateSPEDIntegrityFailedCount,
		isnull([604], 0) as StateELLIntegrityPassedCount,
		isnull([605], 0) as StateELLIntegrityFailedCount
	from
	(
		select ed.EventDateId, ede.ExecutionId, rc.FiscalYear, ed.EventDate as AsOfDate, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, RecordCountTypeId, RecordCount	
		from dashboard.RecordCount rc
		join dashboard.EventDate ed
			on ed.EventDateId = rc.EventDateId
		join dashboard.EventDateExecution ede
			on ede.EventDateId = ed.EventDateId
		join process.Execution e
			on e.ExecutionId = ede.ExecutionId
			and e.ProcessTypeId = 1		--ADM Integrity

	) p
	pivot 
	(
		SUM (RecordCount)
		FOR RecordCountTypeId in ([600], [601], [602], [603], [604], [605])
	) AS pvt
	where   [600] is not null or [601] is not null or 
			[602] is not null or [603] is not null or
			[604] is not null or [605] is not null

GO