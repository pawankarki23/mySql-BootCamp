-- finding the overlapping of tables

-- IMPLICIT INNER JOIN

SELECT first_name, last_name, order_date, amount
FROM customers, orders 
    WHERE customers.id = orders.customer_id;

-- Explicit inner join
SELECT * from customers INNER JOIN orders ON customers.id = orders.customer_id; 
SELECT first_name, last_name, order_date, amount from customers JOIN orders ON customers.id = orders.customer_id; -- inner is optional
SELECT * FROM orders JOIN customers ON customers.id = orders.customer_id; -- order of the table doesnt matter the results but only data presentation

