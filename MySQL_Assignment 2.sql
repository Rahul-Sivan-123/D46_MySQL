create database Sales;
use Sales;
create table Orders(
Order_id int auto_increment primary key,
Customer_name varchar(50) not null,
Product_Category varchar(50) not null,
Ordered_item varchar(50) not null,
Contact_No varchar(15) unique not null
);
-- ADDING NEW COLUMN 'QUANTITY'
alter table Orders
add column order_quantity int;
-- RENAMING 'ORDERS TABLE' TO 'SALES_ORDERS'
rename table Orders to sales_orders;
-- INSERING 10 ROWS INTO 'SALES_ORDERS TABLE'
insert into sales_orders(Order_id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
values
(1, 'Roy', 'Electronics', 'Laptop', '9236784356', 1),
(2, 'Beena', 'clothing', 'shirt', '2345745668', 4),
(3, 'Jean', 'Electronics', 'Mobile', '7689653421', 2),
(4, 'Lis', 'Food', 'icecream', '9876540989', 5),
(5, 'jamie', 'Books', 'Textbook', '9234564776', 3),
(6, 'David', 'Groceries', 'Orange', '6547874532', 10),
(7, 'Ivin', 'Clothing', 'Trousers' , '9865784354', 6),
(8, 'Steve', 'Groceries', 'Apple', '5643786798', 7),
(9, 'Ram', 'Books', 'Register', '3456234145', 2),
(10, 'Rixie', 'Electronics', 'ipad', '7654907623', 1);
select * from sales_orders;
-- RETRIEVING CUSTOMER_NAME AND ORDERED_ITEM FROM 'SALES_ORDERS TABLE'
select Customer_name, Ordered_item from sales_orders;
-- CHANGING THE NAME OF PRODUCT FOR 5th ROW USING UPDATE COMMAND
update sales_orders
set Ordered_item = 'Novel'
where Order_id = 5;
-- DELETING THE 'SALES_ORDERS' TABLE FROM 'SALES' DATABASE
drop table sales_orders;