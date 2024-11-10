
-- 1. Basic Data Retrieval
SELECT * FROM sales;

-- 2. Filter Sales by Date
SELECT * 
FROM sales 
WHERE sale_date >= '2024-01-01' AND sale_date <= '2024-12-31';

-- 3. Calculate Total Sales Revenue
SELECT SUM(total_sales) AS total_revenue
FROM sales;

-- 4. Count Number of Sales in Each Region
SELECT store_region, COUNT(*) AS number_of_sales
FROM sales
GROUP BY store_region;

-- 5. Calculate Total Discounted Sales
SELECT SUM(total_sales * (1 - discount / 100)) AS total_discounted_sales
FROM sales;

-- 6. Find the Top 5 Best-Selling Products
SELECT product_id, SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product_id
ORDER BY total_quantity_sold DESC
LIMIT 5;

-- 7. Analyze Monthly Sales Trends
SELECT DATE_TRUNC('month', sale_date) AS month, 
       SUM(total_sales) AS monthly_sales
FROM sales
GROUP BY month
ORDER BY month;

-- 8. Identify Stores with Sales Below Average
SELECT store_id, SUM(total_sales) AS store_sales
FROM sales
GROUP BY store_id
HAVING SUM(total_sales) < (
    SELECT AVG(total_sales) 
    FROM sales
);

-- 9. Rank Stores by Sales Performance Using Window Function
SELECT store_id, 
       store_region,
       SUM(total_sales) AS total_sales,
       RANK() OVER (PARTITION BY store_region ORDER BY SUM(total_sales) DESC) AS sales_rank
FROM sales
GROUP BY store_id, store_region;

-- 10. Calculate Cumulative Sales Over Time
SELECT sale_date,
       SUM(total_sales) OVER (ORDER BY sale_date) AS cumulative_sales
FROM sales
ORDER BY sale_date;

-- 11. Identify Products with Consistently High Sales Using Subquery
SELECT product_id, AVG(total_sales) AS average_sales
FROM sales
WHERE product_id IN (
    SELECT product_id
    FROM sales
    GROUP BY product_id
    HAVING AVG(quantity) > (
        SELECT AVG(quantity) FROM sales
    )
)
GROUP BY product_id
ORDER BY average_sales DESC;

-- 12. Analyze Sales Growth Using CTE
WITH sales_growth AS (
    SELECT sale_date,
           SUM(total_sales) AS daily_sales,
           LAG(SUM(total_sales), 1) OVER (ORDER BY sale_date) AS previous_day_sales
    FROM sales
    GROUP BY sale_date
)
SELECT sale_date,
       daily_sales,
       previous_day_sales,
       ROUND((daily_sales - previous_day_sales) / previous_day_sales * 100, 2) AS growth_percentage
FROM sales_growth
WHERE previous_day_sales IS NOT NULL;

-- 13. Create a Pivot Table Using CASE Statements
SELECT store_region,
       SUM(CASE WHEN DATE_TRUNC('month', sale_date) = '2024-01-01' THEN total_sales ELSE 0 END) AS january_sales,
       SUM(CASE WHEN DATE_TRUNC('month', sale_date) = '2024-02-01' THEN total_sales ELSE 0 END) AS february_sales,
       SUM(CASE WHEN DATE_TRUNC('month', sale_date) = '2024-03-01' THEN total_sales ELSE 0 END) AS march_sales
FROM sales
GROUP BY store_region;
