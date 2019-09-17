/************************************************************************************************************************
**Procedure Name: [dashboard].[LEADataCount]
**
**Author: Britto Augustine
**
**Description: View to get the LEAData db student count and record count by DOR, DOA and School. 
**             View is used by reconcilaition reports and dashboard
**	
**Revision History:
**	Who						When		What
**	Britto Augustine		08/19/2016	Initial Creation
**  
***************************************************************************************************************************/
CREATE VIEW [dashboard].[LEADataCount]
AS
    
	select EventDateId, ExecutionId, FiscalYear, AsOfDate, AttendingLocalEducationAgencyId, ResidentLocalEducationAgencyId, SchoolId, 
		isnull([200], 0) as EnrollmentStudentCount, 
		isnull([201], 0) as FTEStudentCount,
		isnull([202], 0) as TuitionPayerStudentCount, 
		isnull([203], 0) as SpecialEnrollmentStudentCount,
		isnull([204], 0) as DistrictOfResidenceStudentCount,
		isnull([205], 0) as SummerWithdrawalStudentCount,
		isnull([206], 0) as ProgramOnlyEnrollmentStudentCount,
		isnull([250], 0) as ELLStudentCount,
		isnull([251], 0) as SPEDStudentCount,
		isnull([252], 0) as SupportProgramStudentCount,
		isnull([253], 0) as DRPStudentCount,
		isnull([254], 0) as GCDStudentCount,
		isnull([300], 0) as EnrollmentRecordCount, 
		isnull([301], 0) as FTERecordCount,
		isnull([302], 0) as TuitionPayerRecordCount, 
		isnull([303], 0) as SpecialEnrollmentRecordCount,
		isnull([304], 0) as DistrictOfResidenceRecordCount,
		isnull([305], 0) as SummerWithdrawalRecordCount,
		isnull([306], 0) as ProgramOnlyEnrollmentRecordCount,
		isnull([350], 0) as ELLRecordCount,
		isnull([351], 0) as SPEDRecordCount,
		isnull([352], 0) as SupportProgramRecordCount,
		isnull([353], 0) as DRPRecordCount,
		isnull([354], 0) as GCDRecordCount
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
						[200], [201], [202], [203], [204], [205], [206], [250], [251], [252], [253], [254],
						[300], [301], [302], [303], [304], [305], [306], [350], [351], [352], [353], [354])
	) as pvt
	where   [200] is not null or [201] is not null or 
			[202] is not null or [203] is not null or
			[204] is not null or [205] is not null or
			[206] is not null or 
			[250] is not null or [251] is not null or 
			[252] is not null or [253] is not null or
			[254] is not null or
			[300] is not null or [301] is not null or 
			[302] is not null or [303] is not null or
			[304] is not null or [305] is not null or
			[306] is not null or 
			[350] is not null or [351] is not null or 
			[352] is not null or [353] is not null or
			[354] is not null

GO