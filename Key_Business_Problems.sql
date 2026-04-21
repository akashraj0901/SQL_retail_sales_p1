use project_1;

-- Data Analysis or main business key problems

-- 1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:
select * from retail_sales
where sale_date = '2022-11-05';

-- 2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity 
-- sold is more than 4 in the month of Nov-2022:
select * from retail_sales
where category = 'Clothing'
and quantiy > 4
and sale_date >= '2022-11-01'
and sale_date < '2022-12-01';				



-- 3. Write a SQL query to calculate the total sales (total_sale) for each category.:
select category, sum(total_sale) as net_total, COUNT(*) 
    from retail_sales
group by category;

-- 4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select round(avg(age),2) as avg_age 
    from retail_sales
where 
    category = 'Beauty';									

-- 5.Write a SQL query to find all transactions where the total_sale is greater than 1000.:
select * from retail_sales
where 
    total_sale > 1000 order by total_sale desc;

-- 6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
select 
    category, gender, count(transactions_id) as total_transaction 
    from retail_sales
group by 
    category, gender order by category asc;

-- 7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date) order by month asc;

SELECT *
FROM (
    SELECT 
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        SUM(total_sale) AS total_sales,
        RANK() OVER (
            PARTITION BY YEAR(sale_date)
            ORDER BY SUM(total_sale) DESC
        ) AS rnk
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) t
WHERE rnk = 1;


-- 8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
select customer_id, sum(total_sale) as net_sales 
    from retail_sales
group by 
    customer_id order by net_sales desc limit 5;

-- 9. Write a SQL query to find the number of unique customers who purchased items from each category.:
select category, count(distinct customer_id) as unique_customer from retail_sales
group by category;

-- 10. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
SELECT 
    CASE 
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY shift;
