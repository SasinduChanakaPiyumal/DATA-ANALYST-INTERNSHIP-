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
ORDER BY Quantity DESC
LIMIT 10;

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


DESCRIBE pizza_sales;

SELECT * 
FROM pizza_sales 
WHERE STR_TO_DATE(order_date, '%m/%d/%Y') BETWEEN '2015-01-01' AND '2015-01-02';

## Total Price sold within 2015/01/01
SELECT order_date,SUM(total_price) 
FROM pizza_sales 
WHERE STR_TO_DATE(order_date, '%m/%d/%Y') = '2015-01-01';

## Price of products sold by date
SELECT 
  STR_TO_DATE(order_date, '%m/%d/%Y') AS order_day,
  SUM(total_price) AS daily_total
FROM 
  pizza_sales
GROUP BY 
  order_day
ORDER BY 
  order_day;

## Price of Product sold by month
SELECT 
  DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y-%m') AS order_month,
  SUM(total_price) AS monthly_total
FROM 
  pizza_sales
GROUP BY 
  order_month
ORDER BY 
  order_month;
  

## Quantity of Product sold by month
SELECT 
  DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y-%m') AS order_month,
  SUM(quantity) AS monthly_quantity
FROM 
  pizza_sales
GROUP BY 
  order_month
ORDER BY 
  order_month;

## Pizza count sold by month
SELECT 
  DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y-%m') AS order_month,
  COUNT(DISTINCT pizza_id) AS monthly_product_count
FROM 
  pizza_sales
GROUP BY 
  order_month
ORDER BY 
  order_month;