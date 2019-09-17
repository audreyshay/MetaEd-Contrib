/*****************************************************************************************        
/  Name				:datapush.uspGetLEAList
/        
/  Description      : Proc used by SSIS packages to indetify LEAs 
/                       select for data push.  Used in LogResults
/                       Data Flows in all packages that log counts 
/                       by LEA. Used to identify LEAs select, but 
/                       no records found 
/
/  Author			: Jim jelic       
/  Date				: 2013-07-08        
/              
/  Revision History:
/  Who				When		What		
/ Amit Verma		2016-04-05
/ Pratibha Kanyar	2018-01-25  Added distinct in the select - the duplicates were causing 
/								the record counts to multiply in SFP SystemProcessEntry table 
/
/
/ EXEC Payments.uspGetLEAList
*****************************************************************************************/
CREATE PROC [datapush].[uspGetLEAList]

AS 
    SELECT DISTINCT
         LEAID  AS 'EntityID'
        ,CASE
            WHEN ReportingPeriod IS NULL THEN 1
            ELSE ReportingPeriod 
         END     AS 'ReportingPeriod'
    FROM datapush.LEAList