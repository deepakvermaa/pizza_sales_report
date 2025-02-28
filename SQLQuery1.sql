USE [Pizza DB];

SELECT * from pizza_sales


SELECT * FROM dbo.pizza_sales;

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;


SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales


SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales


SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales


SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales


SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY total_orders ASC


SELECT DATENAME(MONTH, order_date) AS order_date, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY  DATENAME(MONTH, order_date)
ORDER BY total_orders ASC
	

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST( SUM(total_price) * 100 /(SELECT SUM(total_price) from pizza_sales WHERE MONTH(order_date)=1)AS DECIMAL(10,2)) AS Perccentage_of_total_sales
FROM pizza_sales
WHERE MONTH(order_date)=1             /* january */
GROUP BY pizza_category


SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST( SUM(total_price) * 100 /(SELECT SUM(total_price) from pizza_sales)AS DECIMAL(10,2)) AS Perccentage_of_total_sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Perccentage_of_total_sales DESC

SELECT TOP 5 pizza_name, SUM(total_price) AS toatal_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY toatal_revenue ASC
