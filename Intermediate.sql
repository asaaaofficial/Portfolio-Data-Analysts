-- Intermediate
-- Joins

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON parks_and_recreation.dem.employee_id = parks_and_recreation.sal.employee_id
;

SELECT *
FROM parks_and_recreation.employee_demographics AS dem
RIGHT JOIN parks_and_recreation.employee_salary AS sal
	ON parks_and_recreation.dem.employee_id = parks_and_recreation.sal.employee_id
;

-- Self Join
SELECT *
FROM parks_and_recreation.employee_salary emp1
JOIN parks_and_recreation.employee_salary emp2
ON emp1.employee_id = emp2.employee_id
;

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_santa,
emp2.first_name AS first_name_santa,
emp2.last_name AS last_name_santa
FROM parks_and_recreation.employee_salary emp1
JOIN parks_and_recreation.employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- Joining multiple tables together
SELECT *
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN parks_and_recreation.employee_salary AS sal
	ON parks_and_recreation.dem.employee_id = parks_and_recreation.sal.employee_id
    INNER JOIN parks_and_recreation.parks_departments pd
    ON sal.dept_id = pd.department_id
;

SELECT *
FROM parks_and_recreation.parks_departments;

-- Unions
SELECT age, gender
FROM parks_and_recreation.employee_demographics
UNION ALL
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;

SELECT first_name, last_name, 'Old Man' AS Label
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM parks_and_recreation.employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name

-- String Functions
-- Length
SELECT LENGTH('sky');

SELECT first_name, LENGTH(first_name)
FROM parks_and_recreation.employee_demographics
ORDER BY 2;

-- UPPER dan LOWER
SELECT UPPER('sky');
SELECT LOWER('SKY');

SELECT first_name, UPPER(first_name)
FROM parks_and_recreation.employee_demographics
ORDER BY 2;

-- Trim
SELECT LTRIM (      '      sky        ' );

-- Substring
SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 3, 2)
FROM parks_and_recreation.employee_demographics;

-- Replace
SELECT first_name, REPLACE (first_name, 'a', 'z')
FROM parks_and_recreation.employee_demographics;

-- Locate
SELECT LOCATE('x', 'Alexander');

SELECT first_name, LOCATE('An', first_name)
FROM parks_and_recreation.employee_demographics;

-- Concatenation
SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) AS full_name
FROM parks_and_recreation.employee_demographics;

-- Case statements
SELECT first_name, 
last_name,
CASE
	WHEN age <= 30 THEN 'Young'
END  
FROM parks_and_recreation.employee_demographics;  

SELECT first_name, 
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN 'On Death`s Door'
END AS Age_Bracket
FROM parks_and_recreation.employee_demographics;

-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

SELECT first_name, last_name, salary,
CASE 
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary * 1.07
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM parks_and_recreation.employee_salary;