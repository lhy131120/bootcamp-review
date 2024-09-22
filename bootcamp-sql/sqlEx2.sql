CREATE DATABASE BOOTCAMP_EXERCISE2;
USE BOOTCAMP_EXERCISE2;

-- Active: 1726117160826@@127.0.0.1@3306@bootcamp_exercise2
CREATE TABLE WORKER(
	WORKER_ID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  FIRST_NAME VARCHAR(25),
  LAST_NAME VARCHAR(25),
  SALARY DECIMAL(10, 2),
  JOINING_DATE DATETIME,
  DEPARTMENT VARCHAR(25)
);

INSERT INTO WORKER (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
('Monika', 'Arora', 100000, '21-02-20 09:00:00', 'HR'),
('Niharika', 'Verma', 80000, '21-06-11 09:00:00', 'Admin'),
('Vishal', 'Singhal', 300000, '21-02-20 09:00:00', 'HR'),
('Mohan', 'Sarah', 300000, '12-03-19 09:00:00', 'Admin'),
('Amitabh', 'Singh', 500000, '21-02-20 09:00:00', 'Admin'),
('Vivek', 'Bhati', 490000, '21-06-11 09:00:00', 'Admin'),
('Vipul', 'Diwan', 200000, '21-06-11 09:00:00', 'Account'),
('Satish', 'Kumar', 75000, '21-01-20 09:00:00', 'Account'),
('Geetika', 'Chauhan', 90000, '21-04-11 09:00:00', 'Admin');

SELECT * FROM worker;

CREATE TABLE BONUS(
	WORKER_REF_ID INTEGER,
  BONUS_AMOUNT DECIMAL(10,2),
  BOUNS_DATE DATETIME,
  FOREIGN KEY (WORKER_REF_ID) REFERENCES WORKER(WORKER_ID)
);

-- Find the target worker id because of the worker info is exist
SELECT WORKER_ID FROM worker Where FIRST_NAME = 'Vivek' AND LAST_NAME = 'Bhati';

SELECT * FROM BONUS;  -- Should be no column and row

-- Task 1:
-- Insert data into table BONUS

INSERT INTO BONUS (WORKER_REF_ID, BONUS_AMOUNT, BOUNS_DATE) VALUES 
  ((SELECT WORKER_ID FROM worker Where FIRST_NAME = 'Vivek' AND LAST_NAME = 'Bhati'), 32000, '21-11-02'),
  ((SELECT WORKER_ID FROM worker Where FIRST_NAME = 'Vivek' AND LAST_NAME = 'Bhati'), 20000, '22-11-02'),
  ((SELECT WORKER_ID FROM worker Where FIRST_NAME = 'Amitabh' AND LAST_NAME = 'Singh'), 21000, '21-11-02'),
  ((SELECT WORKER_ID FROM worker Where FIRST_NAME = 'Geetika' AND LAST_NAME = 'Chauhan'), 30000, '21-11-02'),
  ((SELECT WORKER_ID FROM worker Where FIRST_NAME = 'Satish' AND LAST_NAME = 'Kumar'), 4500, '22-11-02');

-- Task 2: 
-- Write an SQL query to show the second highest salary among all workers

SELECT DISTINCT SALARY As 'Second Higest Salary'
FROM WORKER 
ORDER BY SALARY DESC
LIMIT 1 OFFSET 1;

-- Task 3: 
-- Write an SQL query to print the name of employees having the higest salary in each department

SELECT CONCAT(w.FIRST_NAME, ' ' ,w.LAST_NAME) as 'Worker Name', w.DEPARTMENT as 'Department', w.SALARY as 'Higest Salary' 
FROM WORKER w JOIN (select DEPARTMENT, MAX(SALARY) as max_salary FROM worker group by DEPARTMENT) as dept_max_sal 
ON w.DEPARTMENT = dept_max_sal.DEPARTMENT AND w.SALARY = dept_max_sal.max_salary 
ORDER BY w.DEPARTMENT ASC; -- 6ms - 26ms / 10 times

SELECT CONCAT(w.FIRST_NAME, ' ' ,w.LAST_NAME) , w.DEPARTMENT, w.SALARY
FROM WORKER w JOIN (select DEPARTMENT, MAX(SALARY) as max_salary FROM worker group by DEPARTMENT) as dept_max_sal 
ON w.DEPARTMENT = dept_max_sal.DEPARTMENT AND w.SALARY = dept_max_sal.max_salary 
ORDER BY w.DEPARTMENT ASC; --7ms - 24ms / 10 times
-- Each department Highest salary record

-- Task 4:
-- Write an SQL query to fetch the list of employees with the same salary
SELECT CONCAT(w1.FIRST_NAME, ' ', w1.LAST_NAME) , w1.SALARY 
FROM WORKER w1 JOIN WORKER w2 ON w1.SALARY = w2.SALARY AND  w1.WORKER_ID <> w2.WORKER_ID
ORDER BY w1.SALARY;  -- 4ms - 14ms

-- Task 5:
--  Write an SQL query to find the worker names with salaries + bonus in 2021
SELECT CONCAT(w.FIRST_NAME, ' ' ,w.LAST_NAME), CONCAT('$', (w.SALARY + IFNULL(b.BONUS_AMOUNT, 0)))AS 'Amount'
FROM WORKER w
LEFT JOIN BONUS b
ON w.WORKER_ID = b.WORKER_REF_ID
AND YEAR(b.BOUNS_DATE) = 2021;

-- Task 6:
-- Try to delete all the records in table WORKER
-- Study the reason why the data canot be deleted

-- Ans: 
-- Table WORKER's WORKER_ID is the FK of Table BONUS's called WORKER_REF_ID
-- 1. DELECT The FK on Table BONUS 
-- 2. NO FK connect, it can clean all the table records
DELETE FROM BONUS WHERE WORKER_REF_ID IN (SELECT WORKER_ID FROM WORKER); 
DELETE FROM WORKER;
SELECT * FROM WORKER;


-- Task 7:
-- Try to drop table WORKER
-- Study the reason why the table cannot be deleted 

-- Ans:  
-- The reason for deleting the BONUS table before deleting the WORKER table is due to the foreign key constraint.
-- In this case, the BONUS table references the WORKER table through the WORKER_REF_ID column, 
-- which is a foreign key connecting to WORKER_ID in the WORKER table.
-- 1. 
DROP TABLE BONUS;
DROP TABLE WORKER;
