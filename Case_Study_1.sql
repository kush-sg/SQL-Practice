CASE STUDY 1

--DATA-SET USED
--Employee


-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- Q1 Write a query to create a column Employee_ID_Last two digits of Year to identify which year data we are referring to for
-- particular employee if we want to compare it with next year. Store this information in a tables called employee_v1

CREATE TABLE Employee_v1
SELECT *, concat(Employee_ID, "-", RIGHT(YEAR(CURDATE()),2)) as Merger
FROM Employee;
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Q2 There is a rumor in the organization that the attrition rate for the third highest paid employee is the highest since they feel that
-- their increment or their salary should be higher in comparison to the first and second highest paid employee as they
-- performed at par or even better. To support this claim with data write a query to find the third highest paid employee on
-- department level

SELECT * FROM
(SELECT *,
RANK() OVER ( PARTITION BY Dept ORDER BY Salary) as sal_rank
FROM employee) sub
WHERE sub.sal_rank = 3;
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Q3 Also, Write a query to find the third highest paid employee on organization level using window function to further validate the
-- claim.

SELECt * FROM
(SELECT *,
RANK() OVER (ORDER BY salary) as sal_rank
FROM Employee) sub
WHERE sub.sal_rank = 3;
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Q4 The claim turned out to be true.To further validate the organization wants to compensate the fourth highest paid employee to
-- avoid further attrition .Write a query to find the fourth highest paid employee on organisation level without using window
-- function

SELECT * FROM
(SELECT * FROM Employee
ORDER BY salary asc
LIMIT 4) sub
ORDER BY salary desc
LIMIT 1;
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Q5 There were some changes in the organization in terms of salary to avoid attrition and bandwidth related crunch but the
-- organization wants to reflect back and see if the employees in all the teams are fairly compensated .Therefore wants to
-- compare the average salary of dept with the average salary of organization. Write a query to create an additional column
-- called flag. If the average salary of the department is greater than the average salary of the organisation then the flag is 1 else 0

SELECT *,
CASE WHEN dept_avg_salary > org_avg_salary then 1
else 0 end as flag
FROM
(
-- this query is to get avg of salary group by dept
(SELECT *, avg(Salary) as dept_avg_salary
FROM Employee
GROUP BY Dept) A
JOIN
-- this query is to get avg salary of organisation
(SELECT  AVG(Salary) as org_avg_salary
FROM Employee) B);

-- to compare 2 queries we need to join them 
-- and then tream them as a sub queries 
-- then we use case statement to full fill the condition
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
