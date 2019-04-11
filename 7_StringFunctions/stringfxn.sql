-- /* */ or CMD SLASH
/* get first name and last name and concat */
SELECT CONCAT(author_fname, ' ', author_lname) as 'Full Name' from books;

SELECT CONCAT_WS('-',author_fname, author_lname) as 'Full Name' from books;


SELECT SUBSTRING('Hello World',1, 4);
SELECT SUBSTRING('Hello World',7);/* start from position 7 */ 
SELECT SUBSTRING('Hello World',-3);/* count from last */

SELECT SUBSTRING(title, 1,10) from books; /* first ten characters of all the title */

SELECT CONCAT(
    SUBSTRING(title, 1, 10), '...') as short_title
    from books;

SELECT REPLACE('Hello World', 'Hell', '08er');
SELECT REPLACE('Hello World', 'l', '9');

SELECT REPLACE(title,'e', '3') from books;

SELECT REVERSE('Hello World');

SELECT CHAR_LENGTH('Hello World');

SELECT author_fname, CHAR_LENGTH(author_fname) as 'length' from books;

SELECT UPPER('Hello World');
SELECT LOWER('Hello World');