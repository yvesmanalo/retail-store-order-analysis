--What is the total number of orders placed?
SELECT COUNT(order_id) AS total_num_orders
FROM orders;

--How many orders were made in each region?
SELECT region, COUNT(order_id) AS num_orders
FROM orders
GROUP BY region;

--Which product category had the highest number of orders?
SELECT product_category, COUNT(order_id) AS number_orders
FROM orders
GROUP BY product_category
ORDER BY number_orders DESC;

--How many total units were sold for each product?
SELECT product_name, COUNT(order_id) AS number_units_sold
FROM orders
GROUP BY product_name;

--Which day had the highest number of orders placed?
SELECT order_date, COUNT(order_id) AS num_orders
FROM orders
GROUP BY order_date
ORDER BY num_orders DESC;

--What is the total revenue per region? (Revenue = quantity × price_per_unit)
SELECT region, SUM(revenue) AS revenue_per_region
FROM (
	SELECT region, quantity * price_per_unit AS revenue
	FROM orders
)
GROUP BY region;

--List the top 5 highest revenue-generating products.
SELECT product_name, SUM(revenue) AS revenue_per_product
FROM (
	SELECT product_name,quantity * price_per_unit AS revenue
	FROM orders
)
GROUP BY product_name
ORDER BY revenue_per_product
LIMIT 5;

--What is the average order quantity per product category?
SELECT product_category, ROUND(AVG(quantity),2) AS avg_order_quantity_per_product_category
FROM orders
GROUP BY product_category;

--How many unique customers placed orders?
SELECT COUNT(DISTINCT customer_id) AS num_unique_customer_orders
FROM orders;

--Which region had the highest average order revenue?
SELECT region, ROUND(AVG(revenue),2) AS avg_revenue_per_region
FROM (
	SELECT region, quantity * price_per_unit AS revenue
	FROM orders
)
GROUP BY region
ORDER BY avg_revenue_per_region DESC
LIMIT 1;
	


