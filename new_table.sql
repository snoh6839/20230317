-- CREATE DATABASE new_employees;
--  AUTO_INCREMENT

-- CREATE TABLE customers (
--     cus_no INT(5)
-- 	 ,customer_name VARCHAR(50)
-- 	 ,customer_age INT(3)
-- 	 ,customer_gender CHAR(1)
-- 	 ,customer_name VARCHAR(50) NOT NULL
-- 	 ,customer_age INT(3) NOT NULL
-- -- 	 ,customer_gender CHAR(1)
-- 	 ,customer_gender ENUM('F','M')
-- 	 ,signup_date DATE NOT NULL
-- 	 ,withdrawal_date DATE
--     ,CONSTRAINT pk_customers PRIMARY KEY (cus_no)
-- );


-- CREATE TABLE employees (
--   emp_no INT(11)
--   ,birth_date DATE
--   ,first_name VARCHAR(14) NOT NULL
--   ,last_name VARCHAR(16) NOT NULL
--   ,gender ENUM('M','F')
--   ,hire_date DATE 
--   ,PRIMARY KEY (emp_no)
-- );

-- SHOW FULL COLUMNS FROM employees;

-- CREATE TABLE salaries (
--   emp_no INT(11),
--   salary INT(11),
--   from_date DATE,
--   to_date DATE,
--   PRIMARY KEY (emp_no, from_date),
--   FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
-- );

-- SHOW FULL COLUMNS FROM salaries;

-- COMMIT;

-- CREATE TABLE titles (
--   emp_no INT(11),
--   title VARCHAR(50),
--   from_date DATE,
--   to_date DATE,
--   PRIMARY KEY (emp_no, title, from_date),
--   FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
-- );

-- SHOW FULL COLUMNS FROM titles;

-- COMMIT;

