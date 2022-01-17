
create database sales;

use sales

create table CUSTOMERS
(
customer_id int,
fname varchar(30) not null ,
lname varchar(30) not null,
email varchar(30) not null ,
phone varchar(15) unique,
city varchar(15),
state varchar(15) not null,
street  varchar(15) not null,
zip_code varchar(5),
constraint customer_pk primary key (customer_id)
);

create table orders 
( 
order_id int  primary key,
customer_id int,
order_status varchar(15) , 
order_date date ,
required_date date,
shipped_date date ,
store_id int ,
staff_id int,
constraint order_fk foreign key (customer_id)
references CUSTOMERS (customer_id) 
);
alter table orders
alter column order_status tinyint;

alter table orders
add constraint staffs_orders_fk foreign key (staff_id)
references staffs (staff_id);

alter table orders
add constraint store_orders_fk foreign key (store_id)
references store (store_id);

create table staffs 
( 
staff_id int  primary key,
fname varchar(30) not null ,
lname varchar(30) not null,
email varchar(30) not null ,
phone varchar(15) unique,
activ varchar(30),
store_id int,
manager_id int
);
alter table staffs
alter column activ tinyint not null;

alter table staffs
add constraint staffs_store_fk foreign key (store_id)
references store (store_id);




create table store 
( 
store_id int  primary key,
store_name varchar(30) not null ,
email varchar(30) not null ,
phone varchar(15) unique,
city varchar(15),
state varchar(15) not null,
street  varchar(15) not null,
zip_code varchar(5)
);


create table order_items
( 
order_id int ,
items_id int  primary key,
product_id int,
quantity int ,
list_price int,
discount int
);



create schema sales

 insert order_items, customers, staffs, orders, stores 
 into sales;