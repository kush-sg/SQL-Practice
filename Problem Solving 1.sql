--DATA-SET USED
--tutorial.oscar_nominees

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

--Q1 Display all the records in the table
SELECT * FROM tutorial.oscar_nominees;


--Q2 Find the Distinct value in the year Column
SELECT DISTINCT year AS unique_years
FROm tutorial.oscar_nominees;

-- Q3 Filter the Records from the Year 1999 to 2006
SELECT * FROM tutorial.oscar_nominees
WHERE year BETWEEN 1999 AND 2006;


-- Q4 Filter the Records for either year 1991 Or 1998
SELECT * FROM tutorial.oscar_nominees
WHERE year = 1991 OR year = 1998;

--Think different
SELECT * FROM tutorial.oscar_nominees
WHERE year IN(1991,1998);


-- Q5 WAQ to return the winner movie name for the year 1997
SELECT movie FROM tutorial.oscar_nominees
WHERE winner = True AND year = 1997;


-- Q6 WAQ to return the winner in the "actor in a leading role" and "actress in a leading role"
for the year 1994, 1980 and 2008.
SELECt nominee FROM tutorial.oscar_nominees
WHERE winner = true 
AND year IN(1994,1980,2008)
AND category IN ('actress in a leading role', 'actor in a leading role');


-- Q7 WAQ to return the name of the movie starting from letter ‘a’.
SELECT movie
FROM tutorial.oscar_nominees
WHERE lower(movie) LIKE ('a%');


-- Q8 WAQ to return the name of the movie contains (the)
SELECT movie
FROM tutorial.oscar_nominees
WHERE lower(movie) LIKE ('%the%');


--Q9 WAQ to return all the records where nominee name starts with 'c' and ends with 'r'
SELECT * FROm tutorial.oscar_nominees
WHERE lower(nominee) LIKE 'c%' AND nominee LIKE '%r';

--Think different
SELECT * FROm tutorial.oscar_nominees
WHERE lower(nominee) LIKE 'c%r';


--Q10 WAQ to return all the records where the movie was released in '2005' and movie name does not 
start with 'a' and 'c' and nominee was a 'winner'
SELECT * FROM tutorial.oscar_nominees
WHERE year = 2005
AND winner = true
AND lower(movie) NOT LIKE ('a%') AND lower(movie) NOT LIKE ('c%');

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
