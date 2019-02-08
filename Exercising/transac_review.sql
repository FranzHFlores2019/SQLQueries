SET STATISTICS IO ON

-- ACID

BEGIN TRANSACTION
-- batch a new records
insert Customer values(NEWID(), 'Jim', 'Rhon')
COMMIT TRANSACTION 

BEGIN TRAN
insert Customer values(NEWID(), 'Brian-1', 'Tracy')
save tran C
insert Customer values(NEWID(), 'Axel-1', 'Kaiser')
save tran B

rollback tran C
rollback tran B

SET STATISTICS IO OFF

select * from Customer

alter table customer 
add cst_add_date datetime default getdate()



