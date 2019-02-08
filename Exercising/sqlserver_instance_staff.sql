



select sid, name, loginname, * from sys.syslogins
update sys.syslogins 
set name = 'FHF-WS\Administrator',
loginname = 'FHF-WS\Administrator'
where sid = '0x010500000000000515000000EF64E66D996BF494BE99545BF4010000'

select * from sys.sysusers
where sid = '0x010500000000000515000000EF64E66D996BF494BE99545BF4010000'


EXEC sp_configure 'DBPayment', 1;
GO
RECONFIGURE --WITH OVERRIDE;
GO


EXEC sp_configure 'DBPayment'
GO


SELECT * FROM  [master].[dbo].[sysservers]
select * from sys.servers

SELECT @@SERVERNAME AS 'Server Name';  


exec sp_helpserver
select @@servername

sp_dropserver 'WIN-H4AP1V6T1P0\FHFWSSQLSERVER'  
go  
sp_addserver 'FHF-WS\Administrator','local'  
go