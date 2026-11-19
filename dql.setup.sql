SELECT * FROM products;

SELECT 
    product_id,
    product_name AS "p_name",
    stock_quantity
from products;

SELECT * FROM customers;

SELECT DISTINCT country from customers;


SELECT * from products
WHERE price > 200;

-- Give me products having stock qty > 0 and price < 150

SELECT * FROM products
WHERE stock_quantity > 0 
    AND price < 150

-- Give me products having 0 as stock qty or price < 150

SELECT * FROM products
WHERE stock_quantity = 0
    OR price < 150;

-- Give me products which are not active
SELECT * FROM products
WHERE NOT is_active

-- Give me product having price > 120 and price < 200

SELECT * FROM products
WHERE price >= 120 AND price <= 200;

SELECT * FROM products
WHERE price BETWEEN 120 AND 200;

-- Give me product from Electronics as well as books
SELECT * from categories

SELECT * from products
    WHERE category_id = 1
    OR category_id = 3 
    OR category_id = 4

SELECT * from products
    Where category_id IN (1,3,4,5)

-- ! give me product having product name 
-- ! starting with "Wireless"
-- ! Wireless headphones
-- ! Wireless mouse

INSERT INTO products
(product_name, price, stock_quantity, category_id)
VALUES
('Wireless keyboard', 100, 20, 1),
('Wireless light', 200, 0, 1),
('Wireless headphones', 150, 0, 1);

SELECT * from products
Where product_name like '%less%';

-- ! Give me customers who have phone numbers

SELECT * from customers
where phone IS NOT NULL

SELECT 
    first_name,
    last_name,
    COALESCE(phone, 'Phone number unavailable') AS phone_num,
    COALESCE(city, 'No city') AS city_name
FROM customers;


-- ! Give me products from cheapest to expensive order
SELECT * FROm products
ORDER BY price DESC; -- ASC: ascending, DESC: descending


-- ! Give me product from cheap to exp price for each category
SELECT * FROm products
ORDER BY category_id DESC, price ASC;

-- ! Give me top 10 most expensive products
SELECT * FROm products
ORDER by price DESC
LIMIT 10;

--! Pagination

SELECT * from products
ORDER BY product_id
LIMIT 10
OFFSET 0

-- FE: page: 0, 10, 20

-- p: 1: OFFSET: 0
-- p: 2: OFFSET: 10
-- p: 3: OFFSET: 10 + 10: 20 

-- offset = (page - 1) * limit


-- off = (3 - 1) * 10 = 20
