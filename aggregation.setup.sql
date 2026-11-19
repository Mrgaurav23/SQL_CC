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

-- ! Give me total number of products in each category

SELECT 
    category_id,COUNT(*) FROM products
    GROUP BY category_id

-- ! Give me total number of active and inactive
-- ! products in each category

SELECT * from products

SELECT 
   category_id,is_active, COUNT(*) from products
   GROUP BY category_id,is_active

-- ! Give me total number of products in each category
-- ! include category name in the results

SELECT * from categories

SELECT 
    p.category_id, 
    c.category_name,
    COUNT(*) 
FROM products as p
LEFT JOIN categories as c on c.category_id = p.category_id
GROUP BY p.category_id, c.category_name;

-- ! Give me total number of products in each category
-- ! and give me categories having > 5 products

SELECT 
   category_id,COUNT(*) from products
   GROUP BY category_id
   HAVING count(*) > 5;

-- ! Find departments having more than one managed employee,
-- ! where their combined salary of whole department exceeds 200000 rupees.

SELECT 
    department_id,
    COUNT(*),
    SUM(salary) as total_dep_salary
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY department_id
HAVING COUNT(*) > 1;