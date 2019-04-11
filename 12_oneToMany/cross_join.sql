-- Finding Orders Placed By George: Using a subquery

SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name='George'
    );

-- cross join

SELECT * from customers, orders;