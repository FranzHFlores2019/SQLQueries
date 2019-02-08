select * from Customer(nolock)


---- 
customer
cst_name   

product
prd_name  prd_cst_key   prd_price
iphone          01          100
ipad            02          100
cp              02          500   
iphone          03          100


--show the capital invesment per product
iphone    ipad   cp
200       100    500


select *from  product 
insert into Product values(newid(),100, 'iPhone', null, 'Electronic')
insert into Product values(newid(),100, 'iPhone', null, 'Electronic')
insert into Product values(newid(),100, 'iPad', null, 'Electronic')
insert into Product values(newid(),100, 'cp', null, 'Electronic')
insert into Product values(newid(),500, 'iPad', null, 'Electronic')



select iPhone, iPad , cp
from
(
   select prd_name, prd_price from Product  -- select the rows that you need
) src
pivot 
(
   sum(prd_price)
   for prd_name in (iPhone, iPad, cp)  -- convert rows selected to a columns
) piv;
    




SELECT
*
FROM
  	INFORMATION_SCHEMA.COLUMNS
	where TABLE_NAME = 'product'

