CREATE DATABASE employee;

#USING EMPLOYEE TABLE
USE employee;

# CREATING TABLES
#HOBBY TABLE
CREATE TABLE hobby (
  `id` INT PRIMARY KEY,
  `name` varchar(50)
);

#EMPLOYEE TABLE
CREATE TABLE employee (
id INT PRIMARY KEY, 
first_name VARCHAR(50),
last_name VARCHAR(50),
age INT(3),
mobile_number INT(10),
adrress VARCHAR(100)
);

#EMPLOYEE_SALARY TABLE
CREATE TABLE employee_salary (
id INT PRIMARY KEY,
employee_id INT, 
FOREIGN KEY(employee_id) REFERENCES employee(id),
salary INT DEFAULT 20000,
date DATE
);

#EMPLOYEE_HOBBY TABLE
CREATE TABLE employee_hobby (
id INT PRIMARY KEY,
employee_id INT, 
FOREIGN KEY(employee_id) REFERENCES employee(id),
hobby_id INT,
FOREIGN KEY(hobby_id) REFERENCES hobby(id)
);

#INSERTING INTO THE TABLES
-- INSERT INTO hobby VALUES(1, "HAMEED");
-- INSERT INTO hobby VALUES(2, "RAMBO");

SELECT * FROM `EMPLOYEE_HOBBY`;

# INSERT MULTIPLE THE DATA IN ALL THE TABLES
INSERT INTO hobby (id, name)
VALUES
(1, "READING"),
(2, "TRAVEL"),
(3, "MUSIC"),
(4, "FOOTBALL");

INSERT INTO employee (id, first_name, last_name, age, mobile_number,adrress)
VALUES
(1, "RAMBO","SINGH", 21, 1234567890, "MUMBAI"),
(2, "RAMAN", "PATEL", 24, 1234590890, "DELHI"),
(3, "MANAN", "DAS", 26, 99045900, "AHMEDABAD"),
(4, "GAGAN", "RAUT", 23, 98340899, "VADODARA"),
(5, "CHAGAN", "RAUT", 20, 98340899, "PUNJAB");

INSERT INTO employee_salary (id, employee_id, salary, date)
VALUES
(1, 4, 12000, '2021-12-1'),
(2, 3, 30000, '2020-8-4' ),
(3, 1, 9000 ,'2023-9-23' ),
(4, 2, 41000, '2019-1-29' ),
(5, 5, 10000, '2018-1-22' );

INSERT INTO employee_hobby (id, employee_id, hobby_id)
VALUES
(1, 2, 3),
(2, 3, 4),
(3, 2, 1),
(4, 4, 2);

#DELETE TWO RECORDS FROM ALL THE TABLES
DELETE FROM employee_hobby WHERE id LIKE (2) OR id LIKE (3);
SELECT * FROM `employee_hobby`;

DELETE FROM employee_salary WHERE salary = 10000;
SELECT * FROM `employee_salary`;

DELETE FROM hobby WHERE NAME LIKE ('R%') OR NAME LIKE ('FOOTBALL');
SELECT * FROM `hobby`;

DELETE FROM employee WHERE age LIKE 20 OR age LIKE 21;
SELECT * FROM `employee`;

ALTER TABLE employee_salary ADD CONSTRAINT employee_id FOREIGN KEY(employee_id) REFERENCES employee (id) ON DELETE CASCADE;
ALTER TABLE employee_hobby ADD CONSTRAINT hobby_id FOREIGN KEY(hobby_id) REFERENCES hobby (id) ON DELETE CASCADE;

#Selecting all employee name, all hobby_name in single column
SELECT first_name FROM employee UNION SELECT name FROM hobby;

#Selecting columns from different tables (emlpoyee and salary)
SELECT employee.first_name, employee.last_name, employee_salary.salary  FROM employee JOIN  employee_salary 
ON employee.id = employee_salary.employee_id;

#selecting name,salary annually and their hobbies
SELECT employee.first_name, employee.last_name,(employee_salary.salary*12) AS annual_salary,
GROUP_CONCAT(hobby.name)
AS hobbies FROM employee 
JOIN  employee_salary ON employee.id = employee_salary.employee_id
JOIN employee_hobby ON employee.id = employee_hobby.employee_id
JOIN hobby ON employee_hobby.hobby_id = hobby.id
GROUP BY employee.first_name, employee.last_name,(employee_salary.salary*12);


-- #Selecting employee name, salary and hobby
-- SELECT employee.first_name, employee.last_name, (employee_salary.salary*12), hobby.name FROM hobby,employee JOIN  employee_salary 
-- ON employee.id = employee_salary.employee_id WHERE hobby.name 
-- IN (SELECT hobby.name FROM hobby JOIN employee_hobby ON hobby.id = employee_hobby.hobby_id);


-- SELECT hobby.name, id FROM hobby WHERE  (SELECT employee.first_name, employee.last_name, (employee_salary.salary*12), hobby.name FROM hobby,employee JOIN  employee_salary 
-- ON employee.id = employee_salary.employee_id)group by employee_hobby_data;


-- SELECT employee.first_name, employee.last_name, (employee_salary.salary*12), hobby.name FROM hobby,employee JOIN  employee_salary 
-- ON employee.id = employee_salary.employee_id WHERE hobby.name IN 
-- (SELECT GROUP_CONCAT(hobby.name) FROM hobby JOIN employee_hobby ON hobby.id = employee_hobby.hobby_id );


-- #Select hobby as per employee ID
-- SELECT hobby.name, employee_hobby.employee_id FROM hobby JOIN employee_hobby ON hobby.id = employee_hobby.hobby_id;

#DELETE QUERIES
-- DROP TABLE employee_salary;
-- DELETE FROM HOBBY;