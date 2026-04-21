create database project_1;
use project_1;

-- create table name column as per dataset column
create table retail_sales(
transactions_id int primary key,
sale_date date,
sale_time time,
customer_id int,
gender varchar(20),
age int,
category varchar(50),
quantiy int,
price_per_unit float,
cogs float,
total_sale int
);

-- import data (Right click on retail_sales table and import the data)
select * from retail_sales;
-- to check the data is imported properly

-- count the data to check all the data is exported sucessfully
select count(*) from retail_sales;

-- Data cleaning

-- checking the null values
select * from retail_sales
where 
transactions_id is null
or 
sale_date is null
or 
sale_time is null
or
customer_id is null
or
gender is null
or 
age is null
or
category is null
or 
quantiy is null
or
price_per_unit is null
or 
cogs is null
or total_sale is null; 

-- Deleating the null values
SET SQL_SAFE_UPDATES = 0;
delete from retail_sales
where 
transactions_id is null
or 
sale_date is null
or 
sale_time is null
or
customer_id is null
or
gender is null
or 
age is null
or
category is null
or 
quantiy is null
or
price_per_unit is null
or 
cogs is null
or total_sale is null;

-- Data Exploration
