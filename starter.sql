-- 1
SELECT employees.first_name,COUNT(orders.order_id) AS number_order
FROM employees INNER JOIN orders
ON employees.employee_id = orders.employee_id
GROUP BY employees.employee_id


-- 2
SELECT categories.category_name,SUM(order_details.unit_price * order_details.quantity *(1-order_details.discount)) AS TotalSales
FROM Categories INNER JOIN Products 
ON Categories.category_id = Products.category_id
INNER JOIN order_details 
ON Products.product_id = order_details.product_id
GROUP BY categories.category_name
ORDER BY TotalSales DESC;

-- 3
SELECT customers.company_name,AVG(order_details.unit_price * order_details.quantity *(1-order_details.discount)) AS AverageOrderPrice
FROM customers INNER JOIN orders 
ON customers.customer_id = orders.customer_id
INNER JOIN order_details 
ON orders.order_id = order_details.order_id
GROUP BY customers.company_name
ORDER BY AverageOrderPrice DESC;

-- 4
SELECT customers.company_name,SUM(order_details.unit_price * order_details.quantity *(1-order_details.discount)) AS AverageOrderPrice
FROM customers INNER JOIN orders 
ON customers.customer_id = orders.customer_id
INNER JOIN order_details 
ON orders.order_id = order_details.order_id
GROUP BY customers.company_name
ORDER BY AverageOrderPrice DESC LIMIT 10;


-- 5
SELECT EXTRACT(YEAR FROM orders.order_date) as year ,SUM(order_details.unit_price * order_details.quantity *(1-order_details.discount)) as TotalOrders,
EXTRACT(MONTH FROM orders.order_date) as month
FROM order_details INNER JOIN orders 
ON order_details.order_id = orders.order_id
GROUP BY month,year
ORDER BY year,month;


-- 6
SELECT  product_name,units_in_stock FROM products
WHERE units_in_stock < 10

-- 7
SELECT MAX(order_details.unit_price * order_details.quantity *(1-order_details.discount)) as maxCustomer
FROM order_details INNER JOIN orders 
ON order_details.order_id = orders.order_id

-- 8
SELECT orders.ship_country ,SUM(order_details.unit_price) AS totalRevenue 
FROM orders INNER JOIN order_details
ON orders. order_id = order_details. order_id
GROUP BY orders.ship_country
ORDER BY totalRevenue DESC

-- 9
SELECT shippers.company_name ,COUNT(orders.ship_via) AS maxShipper
FROM shippers INNER JOIN orders
ON shippers.shipper_id = orders.ship_via
GROUP BY shippers.company_name
ORDER BY maxShipper DESC LIMIT 1

-- 10
SELECT products.product_name, order_details.quantity
FROM products LEFT OUTER JOIN order_details
ON order_details.product_id = products.product_id
WHERE order_details.product_id IS NULL







