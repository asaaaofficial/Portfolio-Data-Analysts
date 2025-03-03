-- Temporary Table

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorit_movie varchar(100)
);

INSERT INTO temp_table
VALUES('Aura', 'Shauma', 'Tukang bubur naik Haji');

SELECT *
FROM temp_table;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT *
FROM salary_over_50k;
