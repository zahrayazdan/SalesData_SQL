
# Retail Sales Data Analysis Using SQL

## Project Overview

This project focuses on analyzing a retail sales dataset using SQL queries. It includes a series of SQL commands that perform data retrieval, aggregation, window functions, subqueries, and more. The goal is to provide a comprehensive analysis of store performance, customer behavior, and sales trends.

## Project Structure

The repository contains the following files:
- `Retail_Sales_Data_Analysis.sql`: SQL script with all the queries for data analysis.
- `README.md`: Detailed explanation of the project and the SQL queries used.

## Dataset

The analysis uses a fictional `sales` table with the following schema:

| Column Name          | Data Type   | Description                          |
|----------------------|-------------|--------------------------------------|
| `sale_id`            | INTEGER     | Unique identifier for each sale      |
| `store_id`           | INTEGER     | Identifier for the store             |
| `product_id`         | INTEGER     | Identifier for the product           |
| `customer_id`        | INTEGER     | Identifier for the customer          |
| `sale_date`          | DATE        | Date of the sale                     |
| `quantity`           | INTEGER     | Number of units sold                 |
| `unit_price`         | DECIMAL     | Price per unit sold                  |
| `total_sales`        | DECIMAL     | Total sales amount                   |
| `discount`           | DECIMAL     | Discount applied (as a percentage)   |
| `store_region`       | TEXT        | Region of the store (East, West, etc.) |

## How to Use

1. Load the `sales` table in your SQL database.
2. Run the queries in the `Retail_Sales_Data_Analysis.sql` file to explore and analyze the data.

## Key Analysis

- Data retrieval and filtering based on specific criteria.
- Aggregation of sales data by region and time period.
- Calculation of total sales, discounts, and cumulative metrics.
- Advanced analysis using window functions, subqueries, and CTEs.
- Pivot table creation for sales analysis by month.

## Conclusion

This project demonstrates a wide range of SQL skills for data analysis, from basic data manipulation to complex queries. It provides insights into sales performance and customer behavior, making it a valuable resource for showcasing SQL proficiency.
