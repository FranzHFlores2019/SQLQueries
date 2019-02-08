USE [master]
GO

/****** Object:  Login [WIN-H4AP1V6T1P0\Administrator]    Script Date: 1/29/2019 11:45:12 AM ******/
DROP LOGIN [WIN-H4AP1V6T1P0\Administrator]
GO

/****** Object:  Login [WIN-H4AP1V6T1P0\Administrator]    Script Date: 1/29/2019 11:45:12 AM ******/
CREATE LOGIN [WIN-H4AP1V6T1P0\Administrator] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [WIN-H4AP1V6T1P0\Administrator]
GO

select name, loginname, * from syslogins
where name like '%admin%'

RECONFIGURE

update syslogins set loginname = 'FHF-WS\Administrator',
name = 'FHF-WS\Administrator'
GO

SELECT * from sysusers
where name like 'FHF-WS\Administrator'

WIN-H4AP1V6T1P0\Administrator
SELECT sid FROM dbo.sysusers WHERE name = 'test'
0xE5EFF2DB1688C246855B013148882E75