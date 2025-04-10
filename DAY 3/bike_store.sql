USE bike_store;

SELECT * FROM brands;
SELECT * FROM categories;
SELECT * FROM customers;
SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM staffs;
SELECT * FROM stocks;

## 1
SELECT SUM(list_price * quantity) AS total_sale FROM order_items;
## 2
SELECT COUNT(order_id) AS total_orders FROM orders;
## 3
SELECT
	customers.first_name,
    customers.last_name,
    SUM(order_items.quantity * order_items.list_price) AS amount
FROM 
	customers
JOIN
	orders ON customers.customer_id = orders.customer_id
JOIN
	order_items ON orders.order_id = order_items.order_id
GROUP BY
	customers.customer_id,customers.first_name, customers.last_name
ORDER BY
	amount DESC
LIMIT 5;

##4 
SELECT state , count(customer_id) AS Num_Of_customers
FROM customers
GROUP BY state
ORDER BY Num_Of_customers DESC;

##5
SELECT orders.store_id , COUNT(order_items.quantity) AS count
FROM orders
JOIN order_items ON order_items.order_id = orders.order_id
ORDER BY count DESC;

## 6
SELECT 
	customers.first_name,
    customers.last_name
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE  orders.order_id IS NULL;

## 7
SELECT avg(quantity)
FROM order_items;

## 8
SELECT products.product_name, products.list_price
FROM stocks
RIGHT JOIN products ON products.product_id = stocks.product_id;
	
## 9
SELECT products.product_name, products.list_price
FROM products
ORDER BY products.list_price DESC
LIMIT 10;