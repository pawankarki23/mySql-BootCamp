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


