

create database DBPayment

create table Customer(
    cst_key uniqueidentifier primary key,
	cst_first_name varchar(50),
	cst_last_name varchar(50),
	cst_full_name_cp varchar (100) -- compound name
	 
);
go

alter table Customer drop column cst_full_name_cp
go
alter table Customer add cst_full_name_cp as (cst_first_name + cst_last_name)
    


/* Payment method
    electronic payment
		paypal
		credit card
	credit
		gifcard
		Coupon
	cash
	Check

-- 
 */

create table PaymentMethodType(
	pmt_key uniqueidentifier primary key,
	pmt_name varchar(100)

);


create table PaymentMethod(
	pmd_key uniqueidentifier primary key,
	pmd_type_key  uniqueidentifier,
	pmd_name varchar(100)
)

alter table PaymentMethod 
add foreign key (pmd_type_key) references PaymentMethodType(pmt_key)

create table Payment(
     pay_key uniqueidentifier primary key,
	 pay_cst_key uniqueidentifier,
	 pay_date datetime default GetDate(),
	 pay_inv_key uniqueidentifier,
	 	 
	 foreign key (pay_cst_key) references customer(cst_key) 

	  
);

alter table Payment 
add foreign key (pay_inv_key) references Invoice(inv_key)


create table Invoice (
	inv_key uniqueidentifier,
	inv_reference_number varchar(7),
	inv_balance decimal(19,3)
);

alter table Invoice 
alter column inv_key uniqueidentifier not null
alter table Invoice add constraint PK_inv_key primary key(inv_key) 


create table invoice_detail(
     inv_ivd_key uniqueidentifier,
	 inv_prd_key uniqueidentifier,
	 inv_amount decimal(19,2)  check(inv_amount > -1), 
	 
	 foreign key (inv_ivd_key) references Invoice(inv_key)
)

create table PaymentDetail(
	pyd_key uniqueidentifier primary key,
	pyd_amount fh_decimal,
	pyd_pay_key uniqueidentifier,
	
	 foreign key (pyd_pay_key) references Payment(pay_key)
);

alter table PaymentDetail 



create type fh_decimal
from decimal(19,2) not null


create table Product(
	prd_key  uniqueidentifier primary key,
	prd_price fh_decimal,
	prd_name varchar(100),
	prd_currency_key uniqueidentifier,
	prd_type varchar(20),
);

create table Currency(
    cur_key uniqueidentifier primary key,
	cur_prefix varchar(3),
	cur_name varchar(20)
);
