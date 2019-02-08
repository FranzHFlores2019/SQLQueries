-- CTE

--- DEAL WITH INVOICE
BEGIN  -- mixing operation
	select * from Invoice

	insert into Invoice values(NEWID(), 'ABCDE89', 0, null)
	insert into Invoice values(NEWID(), 'ABCDE20', 0, null)

	select * from INFORMATION_SCHEMA.COLUMNS
	where TABLE_NAME = 'invoice'

	alter table invoice
	add constraint reference_number_CK check (LEN(inv_reference_number) = 7)

	update Invoice
	set inv_reference_number = null

	;with INV (reference_number, parent_key)
	  as
	(    
		select inv_reference_number, inv_key 
		from Invoice 
			where inv_inv_parent_key is null  -- initialization
		union all
		select inv_reference_number, inv_inv_parent_key   -- recursive execution
		from Invoice
		join INV on inv_key = INV.parent_key		
		where inv_inv_parent_key is  null
	) 

	select * from INV

	-- ADD A add_date column
	alter table invoice 
	add inv_add_date datetime default getdate()


	select * from invoice_detail
	ALTER TABLE invoice_detail
	add ivd_key uniqueidentifier primary key

	alter table invoice_detail 
	drop column inv_ivd_key 

	alter table dbo.invoice_detail
	drop constraint FK__invoice_d__inv_i__35BCFE0A

	EXEC sp_rename 'dbo.invoice_detail.inv_amount', 'ivd_amount', 'column'; 

	select * from INFORMATION_SCHEMA.COLUMNS
	where TABLE_NAME = 'invoice_detail'

	select * from Product

	insert into invoice_detail values('F49D7450-E271-4BDF-B757-0446EEDDD9FD', '3FDDDDF3-B64D-4002-926F-FA745604A8F8', 300, NEWID())
	insert into invoice_detail values('2D59C37D-4A51-4B3B-B30E-07D554CFDCBA', '1B9FB462-A92C-482A-BA9A-D880031C37F4', 100, NEWID())
	insert into invoice_detail values('786F0C0F-DCA3-4B45-A677-57BB9FA55053', 'A9283B59-4229-453B-846E-A59F6E2B7903', 400, NEWID())
	insert into invoice_detail values('9E439730-36E4-468C-92E3-643531FBCAE3', 'A1CA8E0D-1E9B-41BA-BE9B-A3D4BFCB20CC', 300, NEWID())
	insert into invoice_detail values('74CFF3C9-BD17-4FB0-A323-9C63F00AD5E3', '01FA790A-65A9-4D51-B90B-94A450EB7315', 500, NEWID())
	insert into invoice_detail values('FA3C9A19-FDB3-4D3C-9447-9FB92A4B3BE4', '2A23D5F8-8F05-4DD9-9B33-8682E4F613E6', 600, NEWID())
	insert into invoice_detail values('62FE2088-3FD6-46B0-BD2C-C311EE6A493B', '132EC821-1B2C-408E-934D-6F497A278AA1', 500, NEWID())
	insert into invoice_detail values('B5668F93-D65E-4F01-92E7-DC1EE559305C', 'B153172D-7328-4540-94B0-5E34A4764DA4', 700, NEWID())





END
GO

-- DEAL WITH SOME CUSTOMER OPERATION
BEGIN

END
GO

-- customer which dont have any products
select top 100 * from customer
where not exists( select 1 from Payment
    where pay_cst_key = cst_key
)
and cst_first_name != 'adam'

-- show customers who purchase products and raking then by amount
--cte for group purpose

-- solution 1
;with cst_payments
as
(   
	select cst_full_name_cp, sum(pyd_amount) as amount
	from Customer
	join Payment on pay_cst_key = cst_key
	join PaymentDetail on pyd_pay_key = pay_key
	group by cst_full_name_cp
) 
select cst_full_name_cp, amount, RANK() OVER  (ORDER BY amount DESC) AS Rank  
from cst_payments

-- solution 2    -- no working
select cst_full_name_cp, sum(pyd_amount) as amount, RANK() OVER  (ORDER BY pyd_amount DESC) AS Rank  
	from Customer
	join Payment on pay_cst_key = cst_key
	join PaymentDetail on pyd_pay_key = pay_key
	group by cst_full_name_cp, pyd_amount


-- partion by type of product
select cst_full_name_cp, prd_name,  RANK() OVER  (partition by prd_name ORDER BY pyd_amount DESC) AS Rank  
	from Customer
	join Payment on pay_cst_key = cst_key
	join PaymentDetail on pyd_pay_key = pay_key
	join invoice on  inv_key = pay_inv_key
	join invoice_detail on ivd_inv_key = inv_key
	join Product on prd_key = ivd_prd_key


select * from Customer
join Payment on cst_key = pay_cst_key

-- DEAL WITH PAYMENT
BEGIN -- mixing operation
	select * from Payment


	


	insert into Payment values(NEWID(), '398E54B4-D072-49A1-A3CF-9B961D6D4CAF',null, 'F49D7450-E271-4BDF-B757-0446EEDDD9FD')
	insert into Payment values(NEWID(), '4FE094B4-08B5-4D51-B217-09A9C52A2CA0',null, '62FE2088-3FD6-46B0-BD2C-C311EE6A493B')


	select * from INFORMATION_SCHEMA.COLUMNS
	where TABLE_NAME = 'Payment'

	select * from PaymentDetail

	insert into PaymentDetail values(NEWID(), 400, 'F0BF12B3-6C7F-4FE1-8F05-2B6B15CD3F4D')
	insert into PaymentDetail values(NEWID(), 600, 'C6C8AF18-A0E7-4DFA-A1D4-96DBA2FD6BA8')


END
GO



