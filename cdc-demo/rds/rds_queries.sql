-- Create DB, table and insert some values

drop table if exists sourcedb.products;
drop database if exists sourcedb; 

create database sourcedb;

create table sourcedb.products(
  op varchar(10), 
  product_id int, 
  category varchar(10), 
  product_name varchar(10), 
  quantity_available int, 
  last_update_time varchar(100)
);

insert into sourcedb.products values('I','100','Furniture','Product 1','25','2022-03-01T09:51:39.340396Z');
insert into sourcedb.products values('I','101','Cosmetic','Product 2','20','2022-03-01T10:14:58.597216Z');
insert into sourcedb.products values('I','102','Furniture','Product 3','30','2022-03-01T11:51:40.417052Z');
insert into sourcedb.products values('I','103','Electronics','Product 4','10','2022-03-01T11:51:40.519832Z');
insert into sourcedb.products values('I','104','Electronics','Product 5','50','2022-03-01T11:58:00.512679Z');

-- Make changes to the source table

insert into sourcedb.products values('I','105','Furniture','Product 5','45','2022-03-02T09:51:39.340396Z');

insert into sourcedb.products values('I','106','Electronics','Product 6','10','2022-03-02T09:52:39.340396Z');

update sourcedb.products set quantity_available=28, last_update_time='2022-03-02T11:53:40.417052Z' where product_id=102;

delete from sourcedb.products where product_id=103;
