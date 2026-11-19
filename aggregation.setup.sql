-- ! Aggregation start
-- ! Give me total count customers on our platform

SELECT 
   COUNT(*) AS cust_count,
   COUNT(phone) AS cust_with_phone_num
FROM customers

SELECT COUNT(DISTINCT country) from customers;

-- ! Give me total revenue across all orders till now

SELECT 
    order_item_id,
    quantity,
    unit_price,
    quantity * unit_price AS total_selling
from order_items;

SELECT SUM(quantity * unit_price) as total_revenue FROM order_items;

-- ! give average price of product across all products

SELECT * FROM products;

SELECT 
    ROUND(AVG(price), 2) as avg_price
FROM products;


-- ! Give me min price and max price across all products
SELECT price FROM products ORDER BY price ASC LIMIT 1;

SELECT MIN(price) AS minimum_price, MAX(price) AS max_price FROM products;

SELECT 
    COUNT(*) as total_product,
    ROUND(AVG(price), 2) as average_price,
    MIN(price) as min_price,
    MAX(price) as max_price,
    SUM(stock_quantity) as total_stock
FROM products;

