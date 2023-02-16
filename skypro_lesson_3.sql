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

INSERT INTO employee(first_name, last_name, gender, age) VALUES('Anthon', 'Ivanov', 'Male', 33);
INSERT INTO employee(first_name, last_name, gender, age) VALUES('Ivan', 'Samoilov', 'Male', 18);
INSERT INTO employee(first_name, last_name, gender, age) VALUES('Irina', 'Dan', 'Female', 21);
INSERT INTO employee(first_name, last_name, gender, age) VALUES('Ira', 'Frolova', 'Female', 23);
INSERT INTO employee(first_name, last_name, gender, age) VALUES('Sergey', 'Dan', 'Male', 52);

-- TASK 1
-- Create table City
DROP TABLE IF EXISTS city;
CREATE TABLE city(
       city_id BIGSERIAL NOT NULL PRIMARY KEY,
       city_name VARCHAR(50) NOT NULL
)

-- Add column in employee table
ALTER TABLE employee ADD city_id BIGINT;

-- Add foreign key
ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES city(city_id); 

-- Add data in table city
INSERT INTO city(city_name) VALUES ('Москва');
INSERT INTO city(city_name) VALUES ('Новосибирск');
INSERT INTO city(city_name) VALUES ('Минск');
INSERT INTO city(city_name) VALUES ('Благовещенск');
INSERT INTO city(city_name) VALUES ('Иркутск');

-- Assign employees the appropriate cities
UPDATE employee SET city_id = 1 WHERE id IN (2,3);
UPDATE employee SET city_id = 2 WHERE id IN (1,4);
UPDATE employee SET city_id = 4 WHERE id = 5;

-- TASK 2
-- 1. Get the names and surnames of employees, as well as the cities in which they live.
SELECT e.first_name, e.last_name, c.city_name FROM employee e
INNER JOIN city c ON e.city_id = c.city_id;

-- 2. Get the cities, as well as the names and surnames of the employees who live in them. If none of the employees lives in the city, then null should be used instead of the name.
SELECT e.first_name, e.last_name, c.city_name FROM employee e
RIGHT JOIN city c ON e.city_id = c.city_id;

-- 3. Get the names of all employees and the names of all cities. If none of the employees live in the city, then null should be used instead of the name. Similarly, if the city for some of the employees is not in the list, null should also be obtained.
SELECT e.first_name, e.last_name, c.city_name FROM employee e
FULL JOIN city c ON e.city_id = c.city_id;

-- 4. Get a table in which each name should correspond to each city.
SELECT e.first_name, e.last_name, c.city_name FROM employee e
CROSS JOIN city c;