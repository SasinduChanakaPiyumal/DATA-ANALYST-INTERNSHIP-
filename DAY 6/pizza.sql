USE pizza_sales;

SELECT * FROM pizza_sales;

## Number of orders for each pizza
SELECT pizza_name_id , count(pizza_name_id) AS count
FROM pizza_sales 
GROUP BY pizza_name_id
ORDER BY count DESC;

## Number of quantity of each pizza
SELECT pizza_name_id , SUM(quantity) AS Quantity
FROM pizza_sales 
GROUP BY pizza_name_id
ORDER BY Quantity DESC;

## Total price for each pizza
SELECT pizza_name_id , SUM(total_price) AS Total_price
FROM pizza_sales 
GROUP BY pizza_name_id
ORDER BY Total_price DESC;

## Sold quantity of pizzas by sizes
SELECT pizza_size, SUM(quantity) AS Quantity
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Quantity DESC;

## Amount earned according to pizza_size
SELECT pizza_size, SUM(total_price) AS Price
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Price DESC;

## Price of each category
SELECT pizza_category, SUM(total_price) AS Price
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Price DESC;

## Number of orders for each category
SELECT pizza_category, COUNT(DISTINCT order_id) AS orders
FROM pizza_sales
GROUP BY pizza_category
ORDER BY orders DESC;

SELECT * 
FROM pizza_sales 
WHERE CAST(order_date AS DATE) BETWEEN '2015-01-01' AND '2015-03-31';

SELECT * 
FROM pizza_sales 
WHERE order_date >= '01/01/2015' AND order_date < '01/31/2015';

SELECT *
FROM pizza_sales
WHERE YEAR(order_date) = 2015 AND MONTH(order_date) = 2;


DESCRIBE pizza_sales;

SELECT STR_TO_DATE(order_date, '%d-%m-%Y') AS order_date_converted
FROM pizza_sales;

STR_TO_DATE(order_date, '%d-%m-%Y')

