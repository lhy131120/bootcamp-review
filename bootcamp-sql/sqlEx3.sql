CREATE DATABASE BOOTCAMP_EXERCISE3;
USE BOOTCAMP_EXERCISE3;

-- Question 1a 
CREATE TABLE city(
  city_id INTEGER NOT NULL PRIMARY KEY,
  city_name VARCHAR(128)
);

INSERT INTO city (city_id, city_name) VALUES 
  ('1', 'Austria'),
  ('2', 'Berlin'),
  ('3', 'Hamburg'),
  ('4', 'London');


CREATE TABLE customer (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(255),
  city_id INTEGER,
  customer_address VARCHAR(255),
  contact_person VARCHAR(255) NULL,
  email VARCHAR(128),
  phone VARCHAR(128),
  FOREIGN KEY (city_id) REFERENCES city(city_id)
);

INSERT INTO customer(customer_name, city_id, customer_address, contact_person, email, phone) VALUES 
  ('Drogerie Wien', '1', 'Dexkergasse 15A', 'Emil Steinbach', 'emil@drogeriewien.com', '094234234'),
  ('Cosmetics Store', '4', 'Watling Street 347', 'Jeremy Corbyn', 'jeremy@c-store.org', '093923923'),
  ('Kosmetikstudio', '3', 'Rothenbaumchaussee', 'Willy Brandt', 'willy@kosmetilstudio.com', '0941562222'),
  ('Neue Kosmetik', '1', 'Karisplatz 2', NULL, 'info@neuekosmetik.com', '094109253'),
  ('Bio Kosmetik', '2', 'MotzstraBe 23', 'Clara Zetkin', 'clara@biokosmetik.org', '093825825'),
  ('K-wien', '1', 'Karntner StraBe 204', 'Maria Rauch-Kallat', 'maria@kwien.org', '093427002'),
  ('Natural Cosmetics', '4', 'Clerkenwell Road 14B', 'Glenda Jackson', 'giena.j@natural-cosmetics.com', '093555123'),
  ('Kosmetik Plus', '2', 'Unter den Linden 1', 'Angela Merkel', 'angela@k.plus.com', '094727727'),
  ('New Line Cosmetics', '4', 'Devonshire Street 92', 'Oliver Cromwell', 'oliver@nic.org', '093202404');


CREATE TABLE product(
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  sku VARCHAR(32),
  product_name VARCHAR(128),
  product_description TEXT,
  current_price DECIMAL(8,2),
  quantity_in_stock INTEGER
);

INSERT INTO product(sku, product_name, product_description, current_price, quantity_in_stock) VALUES 
  ('330120', 'Game Of Thrones - URBAN DECAY', 'Game Of Thrones Eyeshadow Palette', '65', '122'), 
  ('330121', 'Advanced Night Repair - ESTEE LAUDER', 'Advance Night Repair Synchronized Recovery Complex II', '98', '51'),
  ('330122', 'Rose Deep Hydration - FRESH', 'Rose Deep Hydration Facial Toner', '45', '34'),
  ('330123', 'Pore-Perfecting Moisturizer - TATCHA', 'Pore-Perfecting Moisturizer & Cleanser Duo', '25', '393'),
  ('330124', 'Capture Youth - DIOR', 'Capture Youth Serum Collection', '95', '74'),
  ('330125', 'Slice of Glow RECIPE', 'Slice of Glow Set', '45', '40'),
  ('330126', 'Healthy Skin - KIEHL S SINCE 1851', 'Healthy Skin Squad', '68', '154'),
  ('330127', 'Power Pairl - IT COSMETICS', 'IT is Your Skincare Power Pairl! Best-Selling Moisturizer & Eye Cream Duo', '80', '0'),
  ('330128', 'Dewy Skin Mist - TATCHA', 'Limited Edition Dewy Skin Mist Mini', '20', '281'),
  ('330129', 'Silk Pillowcase - SLIP', 'Silk Pillowcase Duo + Scrunchies Kit', '170', '0');


CREATE TABLE invoice(
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  invoice_number VARCHAR(255),
  customer_id INTEGER,
  user_account_id INTEGER,
  total_price DECIMAL(8,2),
  time_issued DATETIME DEFAULT NULL,
  time_due DATETIME DEFAULT NULL,
  time_paid DATETIME DEFAULT NULL,
  time_canceled DATETIME DEFAULT NULL,
  time_refunded DATETIME DEFAULT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(id)
);

INSERT INTO invoice (invoice_number, customer_id, user_account_id, total_price, time_issued, time_due, time_paid, time_canceled, time_refunded) VALUES 
  (REPLACE(UUID(), '-',''), '7', '4', '1436', STR_TO_DATE('7/20/2019 3:05:07 PM', '%m/%d/%Y %h:%i:%s %p'), STR_TO_DATE('7/27/2019 3:05:07 PM', '%m/%d/%Y %h:%i:%s %p'), STR_TO_DATE('7/25/2019 9:24:12 AM', '%m/%d/%Y %h:%i:%s %p'), NULL, NULL),
  (REPLACE(UUID(), '-',''), '9', '2', '1000', STR_TO_DATE('7/20/2019 3:07:11 PM', '%m/%d/%Y %h:%i:%s %p'), STR_TO_DATE('7/27/2019 3:07:11 PM', '%m/%d/%Y %h:%i:%s %p'), STR_TO_DATE('7/20/2019 3:10:32 PM', '%m/%d/%Y %h:%i:%s %p'), NULL, NULL),
  (REPLACE(UUID(), '-',''), '3', '2', '360', STR_TO_DATE('7/20/2019 3:06:15 PM', '%m/%d/%Y %h:%i:%s %p'), STR_TO_DATE('7/27/2019 3:06:15 PM', '%m/%d/%Y %h:%i:%s %p'), STR_TO_DATE('7/31/2019 9:22:11 PM', '%m/%d/%Y %h:%i:%s %p'), NULL, NULL),
  (REPLACE(UUID(), '-',''), '5', '2', '1675', STR_TO_DATE('7/20/2019 3:06:34 PM', '%m/%d/%Y %h:%i:%s %p'), STR_TO_DATE('7/27/2019 3:06:34 PM', '%m/%d/%Y %h:%i:%s %p'), NULL, NULL, NULL),
  (REPLACE(UUID(), '-',''), '6', '2', '9500', STR_TO_DATE('7/20/2019 3:06:42 PM', '%m/%d/%Y %h:%i:%s %p'), STR_TO_DATE('7/27/2019 3:06:42 PM', '%m/%d/%Y %h:%i:%s %p'), NULL, STR_TO_DATE('7/22/2019 11:17:02 AM', '%m/%d/%Y %h:%i:%s %p'), NULL),
  (REPLACE(UUID(), '-',''), '4', '2', '150', STR_TO_DATE('7/20/2019 3:08:15 PM', '%m/%d/%Y %h:%i:%s %p'), STR_TO_DATE('7/27/2019 3:08:15 PM', '%m/%d/%Y %h:%i:%s %p'), STR_TO_DATE('7/27/2019 1:42:42 PM', '%m/%d/%Y %h:%i:%s %p'), NULL, STR_TO_DATE('7/27/2019 2:11:20 PM', '%m/%d/%Y %h:%i:%s %p'));


CREATE TABLE invoice_item(
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  invoice_id INTEGER,
  product_id INTEGER,
  quantity INTEGER,
  price DECIMAL(8,2),
  line_total_price DECIMAL(8,2),
  FOREIGN KEY (invoice_id) REFERENCES invoice(id),
  FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO invoice_item(invoice_id, product_id, quantity, price, line_total_price) VALUES 
  ('1', '1', '20', '65', '1300'),
  ('1', '7', '2', '68', '136'),
  ('1', '5', '10', '100', '1000'),
  ('3', '10', '2', '180', '360'),
  ('4', '1', '5', '65', '325'),
  ('4', '2', '10', '95', '950'),
  ('4', '5', '4', '100', '400'),
  ('5', '10', '100', '95', '9500'),
  ('6', '4', '6', '25', '150');


  -- Qusetion 1C
  -- Ans

SELECT 'customer' As Type, c.id As 'Customer Id', c.customer_name As 'Customer Name'
FROM customer c 
LEFT JOIN invoice i ON c.id = i.customer_id
WHERE i.id IS NULL
UNION
SELECT 'product' As Type, p.id As 'Product Id', p.product_name As 'Product Name' 
FROM product p 
LEFT JOIN invoice_item ii ON p.id = ii.product_id
WHERE ii.id IS NULL;


-- Q2

CREATE TABLE department(
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  dept_code VARCHAR(3) NOT NULL,
  dept_name VARCHAR(200) NOT NULL
);

INSERT INTO department(dept_code, dept_name) VALUES 
  ('HR', 'HUMAN RESOURCES'),
  ('9UP', '9UP DEPARTMENT'),
  ('SA', 'SALES DEPARTMENT'),
  ('IT', "INFORMATION TEXHNOLOGY DEPARTMENT");

CREATE TABLE employee(
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  employee_name VARCHAR(30) NOT NULL,
  salary DECIMAL(8,2),
  phone VARCHAR(20),
  email VARCHAR(50),
  dept_id INTEGER NOT NULL
);

INSERT INTO employee(employee_name, salary, phone, email, dept_id) VALUES
  ('JOHN', '20000', '90234567', 'john@gmail.com', 1),
  ('Mary', '10000', '90234561', 'mary@gmail.com', 1),
  ('Steve', '30000', '90234562', 'steve@gmail.com', 3),
  ('Sunny', '24000', '902234563', 'sunny@gmail.com', 4);


-- 2a
-- The row order should be in number of employees from high to low
-- If the number of employees is same, the order by department code in ascending order
-- Select 2 columns in total: 'Department Code' and 'Number of Employees'
SELECT d.dept_code As 'Department Code',  COUNT(e.id) AS 'Number of Employees'
FROM department d
LEFT JOIN employee e ON d.id = e.dept_id
GROUP BY d.dept_code, d.dept_name
ORDER BY 'Number of Employees' DESC, d.dept_code ASC;

-- 2b) Is your SQL in 2a still working after inserting the following data? If not, why?
-- Please insert the following data into department.  YES, the dept_code 'IT' is duplicated.
-- DELETE FROM DEPARTMENT WHERE ID = 5;
-- INSERT INTO DEPARTMENT VALUES (5, 'IT', 'INFORMATION TECHNOLOGY DEPARTMENT');
INSERT INTO department(dept_code, dept_name) VALUES ('IT', 'INFORMATION TECHNOLOGY DEPARTMENT');
SELECT * FROM department;

-- Ans: 
-- Yes, it can.
-- Technically it is possible to insert into table, but logically it is impossible. 
-- dept_code should be unique to full fit the logical.

-- Fix SQL
DELETE FROM department WHERE id = 5; -- delete duplicate dept_code
ALTER TABLE department ADD CONSTRAINT dept_code UNIQUE (dept_code); -- add unique constraint on dept_code

