create database books_data;
show databases;
use books_data;

create table books(
book_id int not null auto_increment,
title varchar(100), 
author_fname varchar(100), 
author_lname varchar(100), 
released_year int, 
stock_quantity int, 
pages int, 
primary key(book_id)
);

insert into books(title, author_fname, author_lname, released_year, stock_quantity, pages) values
('the namesake', 'jhumba', 'lahiri', 2003, 32, 291),
('norse mythology', 'neil', 'gaiman', 2016, 43, 304), 
('american gods', 'neil', 'gaiman', 2001, 12, 465), 
('interpreter of malades', 'jhumba', 'lahiri', 1996, 97, 198), 
('a hologram of the king:a novel', 'dave', 'eggers', 2012, 154, 353),
('the circle', 'dave', 'eggers', 2013, 26, 504),
('the amazing adventures of kavalier & clay', 'michael', 'chabon', 2000, 68, 634), 
('just kids', 'patti', 'smith', 2010, 55, 304), 
('a heartbreaking work of staggering genius', 'dave', 'eggers', 2001, 104, 437),
('coraline', 'neil', 'gaiman', 2003, 100, 208), 
('what we talk about when we talk about love:stories', 'raymond', 'carver',2001, 104, 437), 
('where i am calling from:selected stories', 'raymond', 'carver', 1989, 12, 526), 
('white noise', 'don', 'dellilo', 1985, 49, 320), 
('cannery row', 'john', 'steinbeck', 1945, 95, 181), 
('oblivion stories', 'david', 'foster wallace', 2004, 172, 329), 
('consider the lobster', 'david', 'foster wallace', 2005, 92, 343);

/* DISTINCT function */
select distinct author_lname from books;
select distinct released_year from books;

/* Print distinct authors full names */
select distinct concat(
author_fname,
' ',
author_lname
) as 'fullname' 
from books;

/* ORDER BY */
select distinct author_lname from books order by  author_lname;
select author_fname, author_lname from books order by author_lname, author_fname;

insert into books(
title,
author_fname,
author_lname,
released_year, 
stock_quantity,
pages
) values (
'10% happier',
'Dan',
'Harris',
2014,
29,
256
),
(
'fake book',
'freida',
'Harris',
2001,
287,
428
),
(
'lincoln in the bardo',
'george',
'saunders', 
2017,
1000, 
367
);

/* LIMIT 
Print the first 10 titles of the books
*/
select title from books ;
select title from books limit 10;

/* Print everything about the first book */
select * from books limit 1;

/* print the title and released year of the books in descending order and limit them to the first 5 */

select title, released_year from books order by released_year desc limit 5;
select title, released_year from books order by released_year desc limit 0, 5; /* specify the starting and ending point of descending order */
select title, released_year from books order by released_year desc limit 11, 20; /* specify the starting and ending point of descending order */

/* LIKE (useful function) 
this function is more like pattern matching 

print all author first names that has '%da%' in it ?
print all author first names that begins with 'da' in it ?
print all author first names that ends with 'da' in it ?
*/

select title, author_fname from books where author_fname like '%da%';
select title, author_fname from books where author_fname like 'da%';
select title, author_fname from books where author_fname like '%da';

/*
Repeat the same with title column from books table
*/
select title from books where title like '%the%';
select title from books where title like 'the%';
select title from books where title like '%the';

/* select all titles where the stock quantity has 2 digits */
select title, stock_quantity from books where stock_quantity like '__'; /* it uses 2 underscores to indicate only 2 digits */

/* select titles that contain % in it ?
select titles that contain _ in it ? */
select title from books where title like '%\%%';
insert into books(title, author_fname, author_lname, released_year, stock_quantity, pages) values ('ponniyin_selvan',
'k',
'kalki',
1980,
100,
1500
);
select * from books;
select title from books where title like '%\_%';

/* Select all titles that contain the word 'stories' ? */
select title from books where title like '%stories%';

/*Find the longest book (the book with the maximum pages) and print the title and the pages*/
select title, pages from books order by pages desc limit 1;

/* print the summary containing title and year for the 3 most recent books ? */
select concat(title,
' - ',
released_year) as summary from books order by released_year desc limit 3;

/*find all books with the last name of author that contains a space in it ? */
select title, author_lname from books where author_lname like '% %';

/* find 3 books with the lowest stock. Print its title, year and stock */
select title, released_year, stock_quantity from books order by stock_quantity limit 3;

/* Print title, author last name, sorted first by author last name and then by title */
select title, author_lname from books order by author_lname , title ;

/*Print your favourite authors first name and last name sorted by author's last name ?*/
select upper(concat('My favourite author is ', concat(author_fname, ' ', author_lname))) from books order by author_lname;

