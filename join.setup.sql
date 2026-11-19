-- ! Joins Start

-- ! Give me all orders including employee details of the employee who processed
-- ! that order 
-- ! only include orders punched by employees

SELECt * from orders


SELECT o.status,
    o.order_id,
    e.first_name,
    e.email
    from orders AS o
    INNER JOIN employees AS e ON o.employee_id = e.employee_id;

-- ! give me all orders and include employee details of employee who processed
-- ! that order and if it is directly coming from customer keep employee
-- ! details empty

SELECT o.status,
   o.order_id,
   e.first_name,
   e.email
   from orders AS o
   LEFT JOIN employees AS e ON o.employee_id = e.employee_id;

SELECT o.status,
   o.order_id,
   e.first_name,
   e.email
   from orders AS o
   RIGHT JOIN employees AS e ON o.employee_id = e.employee_id;


SELECT o.status,
   o.order_id,
   e.first_name,
   e.email 
   from orders AS o
   FULL OUTER JOIN employees AS e ON o.employee_id = e.employee_id;


SELECT * 
   from departments
   CROSS JOIN categories

-- ! Joins examples

-- ! Give me all customers who did not place any order

SELECT  c.first_name,
    c.email,
    o.order_id,
    o.status
   from customers AS c
   LEFT JOIN orders AS o  ON o.customer_id = c.customer_id
   WHERE o.status IS NULL

-- ! Give me orders which have not been paid

SELECT *
   from orders AS o
   LEFT JOIN payments AS p ON p.order_id = o.order_id
   WHERE p.payment_id is NULL


-- ! Give information about all orders that are there in the DB
-- ! Include info about order_items, product, customer and 
-- ! category the product belongs to

SELECT 
    o.order_id,
    o.status,
    oi.product_id,
    oi.unit_price,
    p.product_name,
    p.price,
    c.category_name,
    cu.first_name,
    cu.last_name
   from orders AS o
   LEFT JOIN order_items AS oi ON oi.order_id = o.order_id
   LEFT JOIN products AS p ON p.product_id = oi.product_id
   LEFT JOIN categories AS c ON c.category_id = p.category_id
   LEFT JOIN customers AS cu ON cu.customer_id = o.customer_id;

-- ! Give me info about employees including their manager's info

SELECT 
    emp.first_name as "Employee First Name",
    emp.last_name as "Employee Last Name",
    manager_tbl.first_name as "Manager First Name",
    manager_tbl.last_name as "Manager Last Name"
FROM employees as emp
LEFT JOIN employees as manager_tbl ON emp.manager_id = manager_tbl.employee_id;