SELECT * FROM employee_salary
WHERE first_name = 'Leslie'
;

SELECT * FROM employee_salary
WHERE salary > 50000
;

SELECT * FROM employee_salary
WHERE salary >= 50000
;

SELECT * FROM employee_salary
WHERE salary <= 50000
;

SELECT * FROM employee_demographics
WHERE gender = 'Female'
;

-- AND OR NOT -- Logical Operations
SELECT * FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'Male'
;

SELECT * FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'Male'
;

SELECT * FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'Male'
;

SELECT * FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'Male'
;

SELECT * FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;

-- LIKE STATEMENT

SELECT * FROM employee_demographics
WHERE first_name LIKE 'Jer'
;

-- % and _

SELECT * FROM employee_demographics
WHERE birth_date LIKE '1989%'
;

SELECT * FROM employee_demographics
WHERE first_name LIKE 'Jer%'
;

SELECT * FROM employee_demographics
WHERE first_name LIKE 'A__'
;

SELECT * FROM employee_demographics
WHERE first_name LIKE 'a__%'
;

-- GROUP BY
SELECT gender
FROM employee_demographics
GROUP BY gender
;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY first_name DESC
;

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC
;

-- Having vs WHERE
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
;

-- Limit & Aliasing
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

-- Aliasing
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40
;
