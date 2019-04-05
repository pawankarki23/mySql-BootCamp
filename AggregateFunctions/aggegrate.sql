-- count() function

select count(*) from books; -- count all the books

select count(DISTINCT author_lname) from books; -- count unique lastnames data

select count(DISTINCT author_lname, author_fname) from books; -- count unique combination of lname and fname

select count(*) from books where title like '%the%'; -- count number of books with 'the' in title

-- GROUP BY

select author_lname, count(*) from books GROUP BY author_lname;
select author_lname, author_fname, count(*) from books GROUP BY author_lname, author_fname; -- counting in each group 
select released_year, count(*) from books GROUP BY released_year;
select released_year, count(*) from books GROUP BY released_year ORDER BY released_year DESC;


-- Min and Max

select min(released_year) from books;
select max(pages) from books;
select * from books where pages = (select max(pages) from books); -- subquery

-- min/max with GROUP BY
select author_fname, author_lname, min(released_year) as 'First Publication year', count(*) as 'Number of Publications' from books GROUP BY author_lname, author_fname;

-- sum
SELECT sum(pages) from books; -- sum all the pages
select author_fname, author_lname, sum(pages) from books GROUP BY author_fname, author_lname;-- sum all the pages written by each author

-- avg
select avg(pages) from books; -- avg pages 
select released_year, avg(stock_quantity) as 'avg stock for this year' from books GROUP BY released_year; --avg stock quantity for books released in each year
select author_fname, author_lname, avg(pages) from books GROUP BY author_fname, author_lname;-- avg pages written by each author

-- challenge

SELECT released_year AS year,
    COUNT(*) AS '# of books',
    AVG(pages) AS 'avg pages'
FROM books
    GROUP BY released_year;
