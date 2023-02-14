-- Creating database and table
DROP DATABASE IF EXISTS skypro;
CREATE DATABASE skypro;
DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
       id BIGSERIAL NOT NULL PRIMARY KEY,
       first_name VARCHAR(50) NOT NULL,
       last_name VARCHAR(50) NOT NULL,
       gender VARCHAR(6) NOT NULL,
       age INT NOT NULL
);

-- TASK 1
-- Add 5 records to table
INSERT INTO employee(first_name, last_name, gender, age) VALUES('Anthon', 'Ivanov', 'Male', 33);
INSERT INTO employee(first_name, last_name, gender, age) VALUES('Ivan', 'Samoilov', 'Male', 18);
INSERT INTO employee(first_name, last_name, gender, age) VALUES('Irina', 'Dan', 'Female', 21);
INSERT INTO employee(first_name, last_name, gender, age) VALUES('Ira', 'Frolova', 'Female', 23);
INSERT INTO employee(first_name, last_name, gender, age) VALUES('Sergey', 'Dan', 'Male', 52);

-- Get first name and last name from all records
SELECT first_name AS "Имя", last_name AS "Фамилия" FROM employee;

-- Get  all records where age less 30 or more 50
SELECT * FROM employee e WHERE age < 30 OR age > 50;

-- Get  all records where age from 30 to 50
SELECT * FROM employee e WHERE age BETWEEN 30 AND 50;

-- Get all records sorted by last name
SELECT * FROM employee e ORDER BY last_name DESC;

-- Get all records where name contains more than 5 characters
SELECT * FROM employee e WHERE first_name LIKE '____%';

-- TASK 2
-- Update name
UPDATE employee SET first_name = 'Ira' WHERE first_name LIKE 'Irina';
UPDATE employee SET first_name = 'Anthon' WHERE first_name LIKE 'Sergey';

-- Get total age for each name
SELECT first_name AS "Имя", SUM(age) AS "Возраст" FROM employee e GROUP BY first_name;

-- Get min age for each name
SELECT first_name AS "Имя", MIN(age) AS "Возраст" FROM employee e GROUP BY first_name; 

-- Output the name and maximum age only for non-unique names. Sort the result by age in ascending order.
SELECT first_name AS "Имя", MAX(age) AS "Возраст" FROM employee 
WHERE first_name IN (
	SELECT first_name FROM employee GROUP BY first_name HAVING COUNT(*) > 1
) GROUP BY first_name ORDER BY "Возраст";