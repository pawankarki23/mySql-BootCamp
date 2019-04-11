-- refining the select query

-- using distinct
SELECT DISTINCT author_lname from books;

-- combining two or more fields and applying disticnt 
SELECT DISTINCT CONCAT(author_fname,'  ',author_lname) from books; -- select unique full names
SELECT DISTINCT author_fname, author_lname from books; -- same as above

-- sorting our results

SELECT author_lname from books ORDER BY author_lname DESC; -- ASC is default
SELECT title, released_year from books ORDER BY released_year DESC; -- ASC is default
SELECT title, released_year from books ORDER BY 2 ;  -- ordering by release_year
SELECT author_fname, author_lname from books ORDER BY author_fname, author_lname; -- sorted using the combination of fname and lname

-- limiting results

SELECT title, released_year from books ORDER BY released_year DESC LIMIT 5; -- select top 5 sorted LIMIT 0,5 will give same results

-- like in search
SELECT title, author_fname from books where author_fname LIKE '%da%';

SELECT * from books where stock_quantity LIKE '____';-- _ specifies exactly one character

SELECT * from books where title LIKE '%\%%';-- _ specifies exactly one character