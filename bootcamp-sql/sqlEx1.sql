CREATE DATABASE BOOTCAMP_EXERCISE1;
USE BOOTCAMP_EXERCISE1;

CREATE TABLE regions(
	region_id int PRIMARY KEY,
    region_name varchar(25)
);

CREATE TABLE countries(
	country_id varchar(2) PRIMARY KEY,
    country_name varchar(40),
    region_id int,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

CREATE TABLE locations(
	location_id int PRIMARY KEY,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12),
    country_id varchar(5),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

CREATE TABLE departments(
	department_id int PRIMARY KEY,
    department_name varchar(30),
    manager_id int,
    location_id int,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE jobs(
	job_id varchar(10) PRIMARY KEY,
    job_title varchar(35),
    min_salary decimal(10, 2),
    max_salary decimal(10, 2)
);

CREATE TABLE employees(
	employee_id int PRIMARY KEY,
    first_name varchar(20),
    last_name varchar(25),
    email varchar(50),
    phone_number varchar(20),
    hire_date date,
	job_id varchar(20),
    salary decimal(10, 2),
    comission_pct int,
    manager_id int,
    department_id int,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE job_history(
	employee_id int,
    start_date date,
    end_date date,
    job_id varchar(10),
    department_id int,
    PRIMARY KEY(employee_id, start_date),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- INSERT DATE

INSERT INTO regions (region_id, region_name) VALUES
(1, 'Europe'),
(2, 'Americas'),
(3, 'Asia'),
(4, 'Middle East and Africa'),
(5, 'Oceania');
select * from regions;

INSERT INTO countries (country_id, country_name, region_id) VALUES
('US', 'United States', 2),
('CA', 'Canada', 2),
('UK', 'United Kingdom', 1),
('DE', 'Germany', 1),
('FR', 'France', 1),
('JP', 'Japan', 3),
('CN', 'China', 3),
('IN', 'India', 3),
('AU', 'Australia', 5),
('NZ', 'New Zealand', 5);
select* from countries;

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES
(100, '123 Main St', '12345', 'New York', 'NY', 'US'),
(101, '456 Maple Ave', '54321', 'Los Angeles', 'CA', 'US'),
(102, '789 Oak Dr', '67890', 'Chicago', 'IL', 'US'),
(103, '101 Pine St', '13579', 'Toronto', 'ON', 'CA'),
(104, '202 Elm St', '97531', 'Vancouver', 'BC', 'CA'),
(105, '303 Birch St', '24680', 'London', '', 'UK'),
(106, '404 Cedar St', '86420', 'Berlin', '', 'DE'),
(107, '505 Aspen St', '13524', 'Paris', '', 'FR'),
(108, '606 Redwood St', '97568', 'Tokyo', '', 'JP'),
(109, '707 Fir St', '24653', 'Beijing', '', 'CN');
select * from locations;

INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES
(10, 'Administration', 100, 100),
(20, 'Marketing', 101, 101),
(30, 'Purchasing', 102, 102),
(40, 'Human Resources', 103, 103),
(50, 'Shipping', 104, 104),
(60, 'IT', 105, 105),
(70, 'Public Relations', 106, 106),
(80, 'Sales', 107, 107),
(90, 'Executive', 108, 108),
(100, 'Finance', 109, 109);
select * from departments;

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES
('J01', 'President', 20000, 40000),
('J02', 'Administration Vice President', 15000, 30000),
('J03', 'Administration Assistant', 3000, 6000),
('J04', 'Finance Manager', 12000, 24000),
('J05', 'Accountant', 8000, 16000),
('J06', 'Marketing Manager', 10000, 20000),
('J07', 'Marketing Representative', 6000, 12000),
('J08', 'Purchasing Manager', 9000, 18000),
('J09', 'Human Resources Manager', 11000, 22000),
('J10', 'Public Relations Representative', 7000, 14000);
select * from jobs;

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, comission_pct, manager_id, department_id) VALUES
(100, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '2019-01-15', 'J01', 25000, NULL, NULL, 10),
(101, 'Jane', 'Smith', 'jane.smith@example.com', '223-456-7891', '2003-02-20', 'J02', 18000, NULL, 100, 20),
(102, 'Michael', 'Johnson', 'michael.johnson@example.com', '323-456-7892', '1993-03-25', 'J03', 4000, NULL, 101, 30),
(103, 'Emily', 'Davis', 'emily.davis@example.com', '423-456-7893', '1993-04-10', 'J04', 15000, NULL, 101, 40),
(104, 'David', 'Wilson', 'david.wilson@example.com', '523-456-7894', '1998-05-05', 'J05', 10000, NULL, 101, 50),
(105, 'Lex', 'De Haan', 'sarah.brown@example.com', '623-456-7895', '2018-06-15', 'J06', 15000, NULL, 101, 60),
(106, 'Chris', 'Taylor', 'chris.taylor@example.com', '723-456-7896', '2022-07-25', 'J07', 9000, NULL, 101, 70),
(107, 'Amanda', 'Anderson', 'amanda.anderson@example.com', '823-456-7897', '2023-08-10', 'J08', 12000, NULL, 101, 80),
(108, 'Matthew', 'Thomas', 'matthew.thomas@example.com', '923-456-7898', '2023-09-05', 'J09', 14000, NULL, 101, 90),
(109, 'Jessica', 'Moore', 'jessica.moore@example.com', '123-555-7899', '2023-10-15', 'J10', 11000, NULL, 101, 100),
(110, 'Daniel', 'Miller', 'daniel.miller@example.com', '223-555-1234', '2023-11-20', 'J01', 26000, NULL, 100, 10),
(111, 'Nancy', 'Garcia', 'nancy.garcia@example.com', '323-555-1235', '2023-12-25', 'J02', 19000, NULL, 101, 20),
(112, 'Robert', 'Martinez', 'robert.martinez@example.com', '423-555-1236', '2024-01-10', 'J03', 4200, NULL, 102, 30),
(113, 'Lisa', 'Hernandez', 'lisa.hernandez@example.com', '523-555-1237', '2024-02-15', 'J04', 16000, NULL, 102, 40),
(114, 'Steven', 'Lopez', 'steven.lopez@example.com', '623-555-1238', '2024-03-20', 'J05', 10500, NULL, 102, 50),
(115, 'Barbara', 'Gonzalez', 'barbara.gonzalez@example.com', '723-555-1239', '2024-04-10', 'J06', 16000, NULL, 102, 60),
(116, 'William', 'Perez', 'william.perez@example.com', '823-555-1240', '2024-05-25', 'J07', 9500, NULL, 102, 70),
(117, 'Susan', 'Rodriguez', 'susan.rodriguez@example.com', '923-555-1241', '2024-06-15', 'J08', 12500, NULL, 102, 80),
(118, 'Charles', 'Walker', 'charles.walker@example.com', '123-666-1242', '2024-07-20', 'J09', 14500, NULL, 102, 90),
(119, 'Karen', 'Hall', 'karen.hall@example.com', '223-666-1243', '2021-08-05', 'J10', 11500, NULL, 102, 100),
(120, 'Joseph', 'Allen', 'joseph.allen@example.com', '323-666-1244', '2024-09-10', 'J01', 27000, NULL, 100, 10),
(121, 'Linda', 'Young', 'linda.young@example.com', '423-666-1245', '2022-10-25', 'J02', 20000, NULL, 110, 20),
(122, 'Edward', 'King', 'edward.king@example.com', '523-666-1246', '2022-11-15', 'J03', 4400, NULL, 111, 30),
(123, 'Betty', 'Wright', 'betty.wright@example.com', '623-666-1247', '2022-12-05', 'J04', 17000, NULL, 111, 40),
(124, 'Mark', 'Scott', 'mark.scott@example.com', '723-666-1248', '2020-01-15', 'J05', 11000, NULL, 111, 50),
(125, 'Patricia', 'Green', 'patricia.green@example.com', '823-666-1249', '2020-02-25', 'J06', 17000, NULL, 111, 60),
(126, 'Donald', 'Adams', 'donald.adams@example.com', '923-666-1250', '2024-03-10', 'J07', 10000, NULL, 111, 70),
(127, 'Dorothy', 'Baker', 'dorothy.baker@example.com', '123-777-1251', '2020-04-20', 'J08', 13000, NULL, 111, 80),
(128, 'Paul', 'Clark', 'paul.clark@example.com', '223-777-1252', '2024-05-05', 'J09', 15000, NULL, 111, 90),
(129, 'Helen', 'Turner', 'helen.turner@example.com', '323-777-1253', '2024-06-15', 'J10', 12000, NULL, 111, 100);
select * from employees;

INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id) VALUES
(100, '2020-01-01', '2024-01-01', 'J01', 10),
(101, '2020-01-01', '2024-01-01', 'J02', 20),
(102, '2020-01-01', '2024-01-01', 'J03', 30),
(103, '2020-01-01', '2024-01-01', 'J04', 40),
(104, '2020-01-01', '2024-01-01', 'J05', 50),
(105, '2020-01-01', '2024-01-01', 'J06', 60),
(106, '2020-01-01', '2024-01-01', 'J07', 70),
(107, '2020-01-01', '2024-01-01', 'J08', 80),
(108, '2020-01-01', '2024-01-01', 'J09', 90),
(109, '2020-01-01', '2024-01-01', 'J10', 100),
(110, '2020-01-02', '2024-01-02', 'J01', 10),
(111, '2020-01-02', '2024-01-02', 'J02', 20),
(112, '2020-01-02', '2024-01-02', 'J03', 30),
(113, '2020-01-02', '2024-01-02', 'J04', 40),
(114, '2020-01-02', '2024-01-02', 'J05', 50),
(115, '2020-01-02', '2024-01-02', 'J06', 60),
(116, '2020-01-02', '2024-01-02', 'J07', 70),
(117, '2020-01-02', '2024-01-02', 'J08', 80),
(118, '2020-01-02', '2024-01-02', 'J09', 90),
(119, '2020-01-02', '2024-01-02', 'J10', 100),
(120, '2020-01-03', '2024-01-03', 'J01', 10),
(121, '2020-01-03', '2024-01-03', 'J02', 20),
(122, '2020-01-03', '2024-01-03', 'J03', 30),
(123, '2020-01-03', '2024-01-03', 'J04', 40),
(124, '2020-01-03', '2024-01-03', 'J05', 50),
(125, '2020-01-03', '2024-01-03', 'J06', 60),
(126, '2020-01-03', '2024-01-03', 'J07', 70),
(127, '2020-01-03', '2024-01-03', 'J08', 80),
(128, '2020-01-03', '2024-01-03', 'J09', 90),
(129, '2020-01-03', '2024-01-03', 'J10', 100);
select * from job_history;

-- 3. query to find the location_id, street_address, city, state_province, country_name of locations.
SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name  
FROM countries c INNER JOIN locations l  ON c.country_id = l.country_id;

-- 4. query to find the first_name, last_name department ID of all the employees.
SELECT e.first_name, e.last_name, e.department_id
FROM employees e; 

-- 5. query to find the first_name, last_name, job_id, department ID of the employees who works in Japan.
SELECT e.first_name, e.last_name, e.job_id, e.department_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
WHERE c.country_name = 'Japan';

-- 6. query to find the employee id, last_name along with their manager_id and last_name.
SELECT e.employee_id as 'Empolyee ID', 
	   e.last_name as 'Employee Last Name', 
       e.manager_id as 'Manager ID', 
       m.last_name
FROM employees e LEFT JOIN employees m ON e.manager_id = m.employee_id;

-- 7. query to find the first_name, last_name and hire date of the employess who was hired after employee 'Lex De Haan'.
-- Result: Lex De Haan 2018-06-15
-- SELECT e1.first_name as 'First Name', e1.last_name as 'Last Name', e1.hire_date as 'Hire Date' 
-- FROM employees e1 
-- WHERE (e1.first_name = 'Lex' and e1.last_name ='De Haan') OR (e1.first_name = 'Lex De' and e1.last_name ='Haan');

SELECT e1.first_name as 'First Name', e1.last_name as 'Last Name', e1.hire_date as 'Hire Date' 
FROM employees e1 
JOIN employees e2 ON (e2.first_name = 'Lex' and e2.last_name ='De Haan') OR (e2.first_name = 'Lex De' and e2.last_name ='Haan') 
WHERE e1.hire_date > e2.hire_date;

-- 8. query to get the department name and number of employees of each the department.
SELECT d.department_name as 'Department Name', COUNT(d.department_name) as 'No of Member'
FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
GROUP BY d.department_name;

-- 9. query to find the employee ID, job title, 
--    number of days between ending date and starting date 
--    for all jobs in department ID 30.
SELECT jh.employee_id as 'Employee ID', 
	   j.job_title as 'Job Title', 
       datediff(jh.end_date, jh.start_date) as 'Number of days between' 
FROM job_history jh 
JOIN jobs j ON jh.job_id = j.job_id 
WHERE jh.department_id = 30;

-- 10. query to display all department name, manager name, city and country name.
SELECT d.department_name, concat(' ', e.first_name, e.last_name) as 'Manager Name', l.city, c.country_name
FROM departments d 
JOIN employees e ON d.department_id = e.department_id 
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;

-- 11. query to display the average salary of each department.
SELECT d.department_name as 'Department Name', AVG(e.salary) 
FROM departments d 
JOIN employees e ON d.department_id = e.department_id 
GROUP BY d.department_name;

-- 12. try to perform normalization on table 'jobs'.alter; 
--     How do re-design the table 'jobs' and adding table 'job_grades'.

-- 12.1. Create Table 
CREATE TABLE job_grades(
	grade_level varchar(5) PRIMARY KEY,
    lowest_sal decimal(10.2),
    highest_sal decimal(10.2)
);

-- 12.2. insert data
INSERT INTO job_grades (grade_level, lowest_sal, highest_sal) VALUES
('R1', 20000, 40000),
('R2', 15000, 30000),
('R3', 3000, 6000),
('R4', 12000, 24000),
('R5', 8000, 16000),
('R6', 10000, 20000),
('R7', 6000, 12000),
('R8', 9000, 18000),
('R9', 11000, 22000),
('R10', 7000, 14000);

SELECT * FROM job_grades ;

-- 12.3 ALTER Jobs Table
ALTER TABLE jobs
ADD COLUMN jobs_rank varchar(5);
SELECT * FROM jobs;

-- 12.4 update column jobs_rank
UPDATE jobs
SET jobs_rank = CASE
    WHEN min_salary >= 20000 AND max_salary <= 40000 THEN 'R1'
    WHEN min_salary >= 15000 AND max_salary <= 30000 THEN 'R2'
    WHEN min_salary >= 3000 AND max_salary <= 6000 THEN 'R3'
    WHEN min_salary >= 12000 AND max_salary <= 24000 THEN 'R4'
    WHEN min_salary >= 8000 AND max_salary <= 16000 THEN 'R5'
    WHEN min_salary >= 10000 AND max_salary <= 20000 THEN 'R6'
    WHEN min_salary >= 6000 AND max_salary <= 12000 THEN 'R7'
    WHEN min_salary >= 9000 AND max_salary <= 18000 THEN 'R8'
    WHEN min_salary >= 11000 AND max_salary <= 22000 THEN 'R9'
    WHEN min_salary >= 7000 AND max_salary <= 14000 THEN 'R10'
    ELSE NULL -- OUT OF RANGE
END
WHERE job_id IS NOT NULL;

-- 12.5 
ALTER TABLE jobs
DROP COLUMN min_salary;

ALTER TABLE jobs
DROP COLUMN max_salary;
