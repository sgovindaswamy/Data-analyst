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

select author_fname, author_lname from books; 

/* Select the first name and last name to combine them as full name */
select concat(author_fname, ' ', author_lname) as 'full name' from books;
select author_fname as first, author_lname as last, concat(author_fname, ' ', author_lname) as full from books;

/* Concat with separator */
select concat(title, ' - ', author_fname, ' - ', author_lname) from books; 
select concat_ws(' - ', title, author_fname, author_lname) as 'title plus authorname' from books;


/* substrings */
select substring('hello world', 1, 4) as output_substring1;
select substring('hello world', 7) as output_substring2;
select substring('hello world', -3) as output_substring3;
select substring('hello world', 0) as output_substring4;

select substring("where I'm calling from : selected stories", 1, 10) as output;
select substring(title, 1, 10) as 'substring_of_title' from books;

/* combine CONCAT  and SUBSTRING function */
select concat(substring(title, 1, 10)) as 'short_title_name' from books;

/* Replace parts of strings */
select replace('hello world', 'hell', '@#$%') as replaced_output1;
select replace('hello wOrld', 'O', '*') as replaced_output2;
select replace('cheese bread coffee milk', ' ', ' and ');

select replace(title, 'e', 'E') as new_title from books;

/* Replace the 'e' from the first 10 characters of the 'title' column with 'E' ? */

select substring(
replace(title, 'e', 'E'),
1, 
10
)
as 'short1-10_title' from books;

/* Reverse strings */
select reverse(title) as 'reversed_title' from books;

/* combine the reversed string with the original string ? */
select concat(
reverse(title),
' ',
title
)
as 'weird_title' from books;

/* Counts the characters from the strings */
select char_length(author_fname) as 'length of firstname' from books;
select concat(author_fname, ' ' , char_length(author_lname)) as 'first name plus char length' from books;

/* Measure the length of first names and print it in the form of sentence ? */
select concat(author_fname, ' is ' , char_length(author_fname), ' characters ', ' long ') as 'measure first names' from books;

/* Upper case and lower case of strings */
select upper(author_lname) as 'upper_lastname' from books; 

/* Print the name of all your favourite books in upper case ? */
select concat(' My favourite book is ', 
upper(title)
)
from books;

/* Exercises */
/* 1) Reverse and upper case the following sentence */
/* 2) replace the spaces in title with -> */
/* 3) Create two columns with name forward and backward using the authors first name */
/* 4) Print full author's name in upper case */
/* 5) Print the release of the books */
/* 6) Print book titles and length of each titles */

select(upper(reverse(' why does my cat look at me with such hatred '))
) as result;

select(replace(title, ' ', ' -> ')
) as 'replaced title' from books;

select author_fname as 'forwards' , reverse(author_fname) as backwards from books;

select upper(concat(author_fname, ' ' , author_lname)
) as 'full caps name' from books;

select concat(
title, ' is released in ', released_year) as 'release of books' from books;

select title, char_length(title) as 'length of titles' from books;

select concat(
substring(title, 1, 10), 
' ... '
) as 'meaningless title',
concat(author_lname, ' ', author_fname) as 'author', 
concat(stock_quantity , ' is in stock ') as 'count of stocks'
from books;
