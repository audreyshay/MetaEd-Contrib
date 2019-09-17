/************************************************************************************************************************
**Procedure Name: [dashboard].[AzEDSCount]
**
**Author: Britto Augustine
**
**Description: View to get the AzEDS db student count and record count by DOR, DOA and School. 
**             View is used by reconcilaition reports and dashboard
**	
**Revision History:
**	Who						When		What
**	Britto Augustine		08/19/2016	Initial Creation
**  
***************************************************************************************************************************/
CREATE VIEW [dashboard].[AzEDSCount]
AS
    
	select EventDateId, ExecutionId, FiscalYear, AsOfDate, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, 
		isnull([400], 0) as EnrollmentStudentCount, 
		isnull([401], 0) as FTEStudentCount,
		isnull([402], 0) as TuitionPayerStudentCount, 
		isnull([403], 0) as SpecialEnrollmentStudentCount,
		isnull([404], 0) as DistrictOfResidenceStudentCount,
		isnull([405], 0) as SummerWithdrawalStudentCount,
		isnull([406], 0) as ProgramOnlyEnrollmentStudentCount,
		isnull([450], 0) as ELLStudentCount,
		isnull([451], 0) as SPEDStudentCount,
		isnull([452], 0) as SupportProgramStudentCount,
		isnull([453], 0) as DRPStudentCount,
		isnull([454], 0) as GCDStudentCount,
		isnull([500], 0) as EnrollmentRecordCount, 
		isnull([501], 0) as FTERecordCount,
		isnull([502], 0) as TuitionPayerRecordCount, 
		isnull([503], 0) as SpecialEnrollmentRecordCount,
		isnull([504], 0) as DistrictOfResidenceRecordCount,
		isnull([505], 0) as SummerWithdrawalRecordCount,
		isnull([506], 0) as ProgramOnlyEnrollmentRecordCount,
		isnull([550], 0) as ELLRecordCount,
		isnull([551], 0) as SPEDRecordCount,
		isnull([552], 0) as SupportProgramRecordCount,
		isnull([553], 0) as DRPRecordCount,
		isnull([554], 0) as GCDRecordCount
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
		sum (RecordCount)
		for RecordCountTypeId in (
						[400], [401], [402], [403], [404], [405], [406], [450], [451], [452], [453], [454],
						[500], [501], [502], [503], [504], [505], [506], [550], [551], [552], [553], [554])
	) as pvt
	where   [400] is not null or [401] is not null or 
			[402] is not null or [403] is not null or
			[404] is not null or [405] is not null or
			[406] is not null or  
			[450] is not null or [451] is not null or 
			[452] is not null or [453] is not null or
			[454] is not null or
			[500] is not null or [501] is not null or 
			[502] is not null or [503] is not null or
			[504] is not null or [505] is not null or
			[506] is not null or  
			[550] is not null or [551] is not null or 
			[552] is not null or [553] is not null or
			[554] is not null

GO
