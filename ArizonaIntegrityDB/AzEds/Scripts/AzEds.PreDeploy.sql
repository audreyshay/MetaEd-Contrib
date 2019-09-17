/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

-- entity.ServiceDescriptor had an extra column (SelfContainedEligible) in its primary key. Remove it.

DECLARE @ServiceDescriptorKeyCount int
SELECT @ServiceDescriptorKeyCount = COUNT(*)
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
    INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS ccu
        ON tc.CONSTRAINT_NAME = ccu.CONSTRAINT_NAME
WHERE tc.TABLE_CATALOG = 'AzEDS'
    AND tc.TABLE_SCHEMA = 'entity'
    AND tc.TABLE_NAME = 'ServiceDescriptor'
    AND tc.CONSTRAINT_TYPE = 'PRIMARY KEY'

IF (@ServiceDescriptorKeyCount = 3)
BEGIN
    ALTER TABLE [entity].[ServiceDescriptor] DROP CONSTRAINT [PK_ServiceDescriptor]
	ALTER TABLE [entity].[ServiceDescriptor] ADD CONSTRAINT [PK_ServiceDescriptor] PRIMARY KEY ([FiscalYear], [ServiceDescriptorId])
END

------------------------------

DECLARE @srv SYSNAME = N'STUDENTDETAILS_LS';

BEGIN TRY
  EXEC master.sys.sp_executesql 
      N'EXEC master.sys.sp_testlinkedserver @srv;',
      N'@srv SYSNAME', @srv;
  PRINT 'Linked server ''' + @srv + ''' found.'
END TRY
BEGIN CATCH
	/****** Object:  LinkedServer [STUDENTDETAILS_LS]    Script Date: 5/14/2018 4:58:55 PM ******/
	BEGIN TRY 
		EXEC master.dbo.sp_addlinkedserver @server = N'STUDENTDETAILS_LS', @srvproduct=N'Linked server to Student Details', @provider=N'SQLNCLI11', @datasrc=N'TESTDATA7'
	END TRY
	BEGIN CATCH
	END CATCH
	 /* For security reasons the linked server remote logins password is changed with ######## */
	EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'STUDENTDETAILS_LS',@useself=N'True',@locallogin=NULL

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'collation compatible', @optvalue=N'false'

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'data access', @optvalue=N'true'

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'dist', @optvalue=N'false'

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'pub', @optvalue=N'false'

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'rpc', @optvalue=N'false'

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'rpc out', @optvalue=N'false'

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'sub', @optvalue=N'false'

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'connect timeout', @optvalue=N'0'

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'collation name', @optvalue=null

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'lazy schema validation', @optvalue=N'false'

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'query timeout', @optvalue=N'0'

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'use remote collation', @optvalue=N'true'

	EXEC master.dbo.sp_serveroption @server=N'STUDENTDETAILS_LS', @optname=N'remote proc transaction promotion', @optvalue=N'true'
	
END CATCH