-- Active: 1695105331548@@127.0.0.1@5432@northwind @public

--1
SELECT customers.company_name
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.customer_id IS NULL

--2
SELECT customers.company_name
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.company_name
HAVING COUNT(orders.customer_id) > 10



--3
SELECT product_name FROM products WHERE unit_price > (
SELECT AVG(unit_price)
FROM products
);

--4
SELECT products.product_name
FROM products LEFT OUTER JOIN order_details
ON products.product_id = order_details. product_id
WHERE order_details.product_id IS NULL

--5
SELECT customers.country,COUNT(customers.customer_id) AS NumOfCustomers FROM customers
GROUP BY customers.country
HAVING COUNT(customers.customer_id) >= 5

--6
SELECT customers.customer_id
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
AND EXTRACT(YEAR FROM orders.order_date) = 1998 
WHERE orders.order_id IS NULL

--7
SELECT customers.customer_id, customers.company_name,orders.order_date
FROM customers LEFT OUTER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country = 'Germany'
AND (orders.order_id IS NULL OR orders.order_date <= '1998-01-01');



--8
SELECT customers.customer_id, customers.company_name,COUNT(orders.customer_id)
FROM customers INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id
HAVING COUNT(orders.customer_id) = 3


-- 9
SELECT product_name
FROM products INNER JOIN order_details
ON products.product_id = order_details.product_id
INNER JOIN orders 
ON order_details.order_id = orders.order_id
ORDER BY orders.order_date DESC
LIMIT 1;


-- 10
SELECT suppliers.supplier_id, suppliers.company_name, suppliers.country, COUNT(products.product_id) AS numOfSupplied
FROM suppliers
INNER JOIN products ON suppliers.supplier_id = products.supplier_id
WHERE suppliers.country = 'USA'
GROUP BY suppliers.supplier_id, suppliers.company_name, suppliers.country
HAVING COUNT(products.product_id) > 1;
