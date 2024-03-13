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
age INT,
mobile_number INT,
address VARCHAR(100)
);

#EMPLOYEE_SALARY TABLE
CREATE TABLE employee_salary (
id INT PRIMARY KEY,
employee_id INT, 
FOREIGN KEY(employee_id) REFERENCES employee(id) ON DELETE CASCADE,
salary INT DEFAULT 20000,
date DATE
);

#EMPLOYEE_HOBBY TABLE
CREATE TABLE employee_hobby (
id INT PRIMARY KEY,
employee_id INT, 
FOREIGN KEY(employee_id) REFERENCES employee(id) ON DELETE CASCADE,
hobby_id INT,
FOREIGN KEY(hobby_id) REFERENCES hobby(id) ON DELETE CASCADE
);

#DISPLAY DATA
SELECT * FROM `HOBBY`;
SELECT * FROM `EMPLOYEE`;
SELECT * FROM `EMPLOYEE_SALARY`;
SELECT * FROM `EMPLOYEE_HOBBY`;

# INSERT MULTIPLE THE DATA IN ALL THE TABLES
INSERT INTO hobby (id, name)
VALUES
(1, "READING"),
(2, "TRAVEL"),
(3, "MUSIC"),
(4, "FOOTBALL"),
(5, "BIKES");

INSERT INTO employee (id, first_name, last_name, age, mobile_number,address)
VALUES
(1, "RAMBO","SINGH", 21, 1234567890, "MUMBAI"),
(2, "RAMAN", "PATEL", 24, 1234590890, "DELHI"),
(3, "MANAN", "DAS", 26, 99045900, "AHMEDABAD"),
(4, "GAGAN", "RAUT", 23, 98340899, "VADODARA"),
(5, "CHAGAN", "RAUT", 20, 98333399, "PUNJAB");

INSERT INTO employee_salary (id, employee_id, salary, date)
VALUES
(1, 5, 5000 ,'2023-9-23' ),
(2, 4, 6000 ,'2023-9-23' ),
(3, 3, 7000 ,'2023-9-23' ),
(4, 2, 8000 ,'2023-9-23' ),
(5, 1, 9000 ,'2023-9-23' ),
(6, 5, 10000 ,'2023-9-23' ),
(7, 4, 90 ,'2023-9-23' ),
(8, 2, 100 ,'2023-9-23' );

INSERT INTO employee_hobby (id, employee_id, hobby_id)
VALUES
(1, 1, 5),
(2, 2, 4),
(3, 3, 2),
(4, 4, 3),
(5, 5, 1),
(6, 3, 1),
(7, 3, 4),
(8, 2, 1),
(9, 1, 4);

#Update data of all tables
#employee table
UPDATE employee SET first_name = "Kavi" WHERE id = 2;

#hobby table
UPDATE hobby SET name = "SINGING" WHERE name = "READING";

#employee_salary table
UPDATE employee_salary SET salary = 900 WHERE employee_id = 2;

#employee_hobby table
UPDATE employee_hobby SET hobby_id = 2 WHERE hobby_id = 3;

#DELETE TWO RECORDS FROM ALL THE TABLES
DELETE FROM employee_hobby WHERE id LIKE (2) OR id LIKE (3);
SELECT * FROM `employee_hobby`;

DELETE FROM employee_salary WHERE salary = 10000;
SELECT * FROM `employee_salary`;

DELETE FROM hobby WHERE NAME LIKE ('R%') OR NAME LIKE ('FOOTBALL');
SELECT * FROM `hobby`;

DELETE FROM employee WHERE age LIKE 20 OR age LIKE 21;
SELECT * FROM `employee`;

#Create a select single query to get all employee name, all hobby_name in single column
SELECT first_name FROM employee UNION SELECT name FROM hobby;

#Create a select query to get employee name, his/her employee_salary
SELECT employee.first_name, employee.last_name, employee_salary.salary  FROM employee JOIN  employee_salary 
ON employee.id = employee_salary.employee_id;

#Create a select query to get employee name, total salary of employee, hobby name 
SELECT CONCAT(employee.first_name, '  ', employee.last_name) AS employee_name,
SUM(employee_salary.salary) AS total_salary,
(SELECT GROUP_CONCAT(DISTINCT hobby.name) FROM hobby WHERE hobby.id IN 
(SELECT hobby_id FROM employee_hobby WHERE employee_hobby.employee_id = employee.id)) AS hobbies FROM employee
JOIN  employee_salary ON employee.id = employee_salary.employee_id
GROUP BY employee_name;

#DELETE QUERIES
DROP TABLE hobby;
DELETE FROM HOBBY;