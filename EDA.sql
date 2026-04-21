use project_1;

-- Data exploration (EDA):

-- How many sales we have
select count(*) from retail_sales;

-- How many customer we have
select count(distinct customer_id) from retail_sales;  

-- How many catogries we have
select count(distinct category) from retail_sales;

-- Which are the categories present (Name of category)\
select distinct category from retail_sales;
